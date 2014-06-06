--[[----------------------------------------------------------
	INITILIZE Chat Tab
	*All Credit for this code goes to thelegendaryof <thelegendaryof@gmail.com>
	*Thank You
 ]]-----------------------------------------------------------
function FCL.InitChatTab()
			CETA:Tab("CLSTab", "|cff0000CLS|r", true)
			
			local tab = _G["CLSTab"]
			local CL =  _G["CombatLog"]
			local CLTopBar = _G["CombatText"]
			local CLClose = _G["CombatLog_Close"]
			
			
			CL:SetParent(tab)
			tab:SetDrawTier(1)
			tab:SetDrawLevel(3)
			tab:SetDrawLayer(1)
			
			CL:SetAnchor(TOPLEFT, tab, TOPLEFT, 0, 0)
			CL:SetAnchor(BOTTOMRIGHT, tab, BOTTOMRIGHT, 0, -22)
			CL:SetMovable(false)
			CL:SetResizeHandleSize(nil)
			
			CLTopBar:SetParent(tab)
			CLTopBar:SetAnchor(BOTTOMLEFT, CL, TOPLEFT, 0, 0)
			
			CLClose:SetHidden(true)
			
			FCL.Starter = true
end


--CALLBACK_MANAGER:RegisterCallback("CETA_ADD_TABS", FCL.ChatTab)
