--[[----------------------------------------------------------
	FCL Menu Settings
 ]]-----------------------------------------------------------
 function FCL.InitMenu()
	FCL.SettingsHidden = false
	FCL.Menu = FCL.LAM:CreateControlPanel("CLS_SETTINGS_PANEL", "|cB22222CLS|r Settings") --|cE73E01
	FCL.LAM:AddHeader(FCL.Menu, "CLS_Menu_Header_Infos", "|cF0C300Version:|r ".. "1.11")
	FCL.LAM:AddHeader(FCL.Menu, "CLS_Menu_Header_Display", "|cF0C300Display Options")
	
	-- Show Main Window
	FCL.LAM:AddCheckbox(FCL.Menu, "SHOW_Main", "Hide Main Window", "Toggle Show/Hide the Main Window", 
			function() return FCL.CText.HiddenM end, 
			function(val) 
			FCL.CText.HiddenM = val
			_G["CombatLog"]:SetHidden(false)
			if FCL.CText.HiddenM == false then
			_G["CombatLog"]:SetHidden(false)
			else
			_G["CombatLog"]:SetHidden(true)
			end
			end)
	-- Show DPS Window
	FCL.LAM:AddCheckbox(FCL.Menu, "SHOW_DPS", "Hide DPS Window", "Toggle Show/Hide the DPS Window", 
			function() return FCL.CText.HiddenD end, 
			function(val) 
			FCL.CText.HiddenD = val
			if FCL.CText.HiddenD == false then
			_G["DPS"]:SetHidden(false)
			else
			_G["DPS"]:SetHidden(true)
			end
			end)
	
	-- Show in Chat
	FCL.LAM:AddCheckbox(FCL.Menu, "SHOW_InChat", "Display Combat in Chat", "To Show/Hide Combat Log Data with Chat", 
			function() return FCL.CText.Chat end, 
			function(val) 
			FCL.CText.Chat = val
			end)
	
	-- Toggle TimeStamp
	FCL.LAM:AddCheckbox(FCL.Menu, "SHOW_TimeStamp", "Display TimeStamp", "To Toggle the TimeStamp in the Combat Log", 
			function() return FCL.CText.Time end, 
			function(val) 
			FCL.CText.Time = val
			end)
			
	-- Up or Down
	FCL.LAM:AddDropdown(FCL.Menu, "CLS_BarFont", "Text Direction", "Which Direction the text pops up in Main Window", {"UP","DOWN"},
		function() return FCL.CText.Direction end,
		function(direction)
			if FCL.CText.Direction ~= direction then
				FCL.CText.Direction = direction
				ReloadUI()
			end
		end,
		true,
		"Must Reload UI")
		
		-- Max Lines
	FCL.LAM:AddSlider(FCL.Menu, "CLS_MaxLines", "Max Lines Shown", "Maximum number of lines shown in the main window", 0, 30, 1,
		function() return FCL.CText.MaxLines end,
		function(value)
			FCL.CText.MaxLines = value
			ReloadUI()
		end,
		true,
		"Must Reload UI")
	
	-- Max Saved Lines
	FCL.LAM:AddSlider(FCL.Menu, "CLS_MaxLinesSaved", "Max Saved Lines", "Maximum number of lines saved for scrolling (0 = unlimited)", 0, 1000, 1,
		function() return FCL.CText.MaxLinesSaved end,
		function(value)
			FCL.CText.MaxLinesSaved = value
		end)
	
	-- Fades with chat
	FCL.LAM:AddCheckbox(FCL.Menu, "SHOW_FadesChat", "Fade CLS when not in Combat", "Toggle CLS to Fade", 
		function() return FCL.CText.FadesWithChat end, 
		function(val) 
			FCL.CText.FadesWithChat = val
		end)
	
	FCL.LAM:AddSlider(FCL.Menu, "CLS_FadeTimer", "Fade Timer", "How much time to stay visible after combat ends", 1, 60, 1,
		function() return FCL.CText.FadeTimer end,
		function(value)
			FCL.CText.FadeTimer = value
		end)
	
	-- Toggle Buffer
	FCL.LAM:AddCheckbox(FCL.Menu, "Toggle_Buffer", "User Buffer for DPS Update", "Will Decrease Performance if Off", 
			function() return FCL.CText.Buffer end, 
			function(val) 
			FCL.CText.Buffer = val
			end)
		
	-- Buffer Speed
	FCL.LAM:AddSlider(FCL.Menu, "CLS_BufferSpeed", "Buffer Update", "Sets how long the buffer to update DPS window should be Value*0.1", 1, 30, 1,
		function() return FCL.CText.BufferSpeed*10 end,
		function(value)
			FCL.CText.BufferSpeed = value*0.1
		end)
		
	FCL.LAM:AddHeader(FCL.Menu, "CLS_Menu_Header_Cosmetics", "|cF0C300Cosmetics")
	
	-- Colors Menu
	FCL.LAM:AddCheckbox(FCL.Menu, "SHOW_COLORS", "Colors Menu", "To Show/Hide The Colors Menu", 
			function() return FCL.SettingsHidden end, 
			function(val) 
			FCL.SettingsHidden = val
			if (val == false) then
				_G["FCLSettings"]:SetHidden(true)
			else
				_G["FCLSettings"]:SetHidden(false)
				--d("False")
			end
			end)
			
	-- Font Slider
	FCL.LAM:AddSlider(FCL.Menu, "CLS_FontSize", "Font Size", "Move to Change Font Size", 10, 40, 1,
		function() return FCL.CText.FontSize end,
		function(value)
			FCL.CText.FontSize = value
	
			for i = 1, #FCL.textbox , 1 do 
				FCL.textbox[i]:SetFont(FCL.Font .. "|" .. FCL.CText.FontSize .. "|" .. FCL.FontStyle)
				FCL.textbox[i]:SetDimensions(1000, FCL.CText.FontSize+1)
				FCL.textbutton[i]:SetDimensions(20, FCL.CText.FontSize+1)
				FCL.textbutton[i]:SetFont(FCL.Font .. "|" .. FCL.CText.FontSize .. "|" .. FCL.FontStyle)
			end	
			
			DPS_LabelTex:SetFont(FCL.Font .. "|" .. FCL.CText.FontSize .. "|" .. FCL.FontStyle)
			DPS_LabelVal:SetFont(FCL.Font .. "|" .. FCL.CText.FontSize .. "|" .. FCL.FontStyle)
			_G["AbilityFrame_Label"]:SetFont(FCL.Font .. "|" .. FCL.CText.FontSize .. "|" .. FCL.FontStyle)
		end)
			
	-- Name Color
	FCL.LAM:AddCheckbox(FCL.Menu, "SHOW_NameCOLORS", "Toggle Name Colors", "Toggles the colors of Names", 
			function() return FCL.CText.NameColor end, 
			function(val) 
			FCL.CText.NameColor = val
			end)
	
	-- Ability Color
	FCL.LAM:AddCheckbox(FCL.Menu, "SHOW_AbilityCOLORS", "Toggle Ability Colors", "Toggles the colors of Abilities", 
			function() return FCL.CText.AbilityColor end, 
			function(val) 
			FCL.CText.AbilityColor = val
			end)
			
	-- Buff Color
	FCL.LAM:AddCheckbox(FCL.Menu, "SHOW_BuffCOLORS", "Toggle Buff Colors", "Toggles the colors of Buffs",
			function() return FCL.CText.BuffColor end, 
			function(val) 
			FCL.CText.BuffColor = val
			end)
	
	FCL.LAM:AddHeader(FCL.Menu, "CLS_Menu_Header_Tracking", "|cF0C300Various Tracking")
	
	-- Track Damage
	FCL.LAM:AddCheckbox(FCL.Menu, "SHOW_Damage", "Show Damage in Log", "Toggles Damage in Combat Log",
			function() return FCL.CText.ShowDamage end,
			function(val) 
			FCL.CText.ShowDamage = val
			end)
	
	-- Track Healing
	FCL.LAM:AddCheckbox(FCL.Menu, "SHOW_Heals", "Show Healing in Log", "Toggles Healing in Combat Log",
			function() return FCL.CText.ShowHeals end,
			function(val) 
			FCL.CText.ShowHeals = val
			end)	
	
	-- Track Buffs
	FCL.LAM:AddCheckbox(FCL.Menu, "SHOW_Buffs", "Show Buffs/Debuffs in Log", "Toggles Buff/Debuff in Combat Log",
			function() return FCL.CText.Buffs end,
			function(val) 
			FCL.CText.Buffs = val
			end)
			
	-- Track AP
	FCL.LAM:AddCheckbox(FCL.Menu, "SHOW_APGains", "Show AP Gains", "Toggles Alliance Points Gains in Combat Log",
			function() return FCL.CText.AP end,
			function(val) 
			FCL.CText.AP = val
			end)
			
	-- Track Power Gains
	FCL.LAM:AddCheckbox(FCL.Menu, "SHOW_PowerGains", "Show Mag/Stam/Ult Gains", "Toggles Stam/Magicka/Ult Gains in Combat Log",
			function() return FCL.CText.ShowPower end,
			function(val) 
			FCL.CText.ShowPower = val
			end)
				
	--------Skills----------
	
	for Category, Ntable in pairs(FCL.SkillXPNames) do
		for k, v in pairs(Ntable) do
			FCL.LAM:AddCheckbox(FCL.Menu, "SHOW_Skill" .. Category .. k, "Show |cc8ff3a" .. FCL.SkillXPNames[Category][k] .. "|r Skill Gains", "Toggles " .. FCL.SkillXPNames[Category][k] .. " in Combat Log",
			function() return FCL.CText.Skills[Category][k] end,
			function(val) 
			FCL.CText.Skills[Category][k] = val
			end)
		end
	end 
	
			
	-- Reset Defaults
	FCL.LAM:AddHeader(FCL.Menu, "CLS_Menu_Default", "|cF0C300RESET TO DEFAULT|r ")

	FCL.LAM:AddButton(FCL.Menu, "CLS_ResetAllPos", "Reset Everything", "Will reset everything back to defaluts and Reload UI",
		function() 
			for key, value in pairs(FCL.Default) do
				FCL.CText[key] = value
			end
			ReloadUI()
		end,
		true,
		"Must Reload UI")
	
 end
 
 