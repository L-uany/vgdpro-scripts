--天枪的骑士 勒克斯
local cm,m,o=GetID()
function cm.initial_effect(c)
    VgF.VgCard(c)
    vgd.BeRidedByCard(c,m,10103001,cm.operation,cm.cost)
    local e1=Effect.CreateEffect(c)
    e1:SetType(EFFECT_TYPE_SINGLE)
    e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
    e1:SetCode(EFFECT_UPDATE_ATTACK)
    e1:SetRange(LOCATION_MZONE)
    e1:SetCondition(cm.condition)
    e1:SetValue(5000)
    c:RegisterEffect(e1)
    local e2=Effect.CreateEffect(c)
    e2:SetType(EFFECT_TYPE_SINGLE)
    e2:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
    e2:SetCode(EFFECT_ADD_ATTRIBUTE)
    e2:SetRange(LOCATION_MZONE)
    e2:SetValue(SKILL_SUPPORT)
    e2:SetCondition(cm.condition)
    c:RegisterEffect(e2)
end
function cm.operation(e,tp,eg,ep,ev,re,r,rp)
    Duel.Draw(tp,1,REASON_EFFECT)
end
function cm.cost(e,tp,eg,ep,ev,re,r,rp,chk)
    if chk==0 then Duel.IsExistingMatchingCard(vgf.IsLevel,tp,LOCATION_HAND,0,3,nil,3) end
    Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_CONFIRM)
    local g=Duel.SelectMatchingCard(tp,vgf.IsLevel,tp,LOCATION_HAND,0,3,3,nil,3)
    Duel.ConfirmCards(1-tp,g)
end
function cm.condition(e,tp,eg,ep,ev,re,r,rp)
    return vgf.VMonsterCondition(e) and Duel.IsExistingMatchingCard(vgf.IsLevel,tp,LOCATION_MZONE,0,3,nil,3)
end