local CosmicLibrary = {}

local Players = game:GetService('Players')
local UserInputService = game:GetService('UserInputService')
local RunService = game:GetService('RunService')

local LPlayer = Players.LocalPlayer
local Mouse = LPlayer:GetMouse()
local Viewport = game:GetService('Workspace').CurrentCamera.ViewportSize

local Connections = {}

local function Validate(default, options)
	for i,v in pairs(default) do
		if not options[i] or options[i] == '' or options[i] == Color3.fromRGB() or options[i] == UDim2.new() or options[i] == 'nil' or options[i] == nil then
			options[i] = v
		end
	end
	return options
end

local function DisconnectConnections()
	for i,v in pairs(Connections) do
		v:Disconnect()
	end
end

local MainObjects = {
	['_ScreenGui'] = Instance.new('ScreenGui');
}

function CosmicLibrary:DestroyUI()
	DisconnectConnections()
	for i,v in pairs(MainObjects) do
		v:Destroy()
		v = nil
	end
end

function CosmicLibrary:CreateWindow(WindowOptions)
	WindowOptions = Validate({Name = 'Cosmic', Note = 'Have fun and enjoy the great scripts to your disposal.', Theme = 'Light'}, WindowOptions or {})
	
	if game:GetService('CoreGui'):FindFirstChild('Cosmic') then
		DisconnectConnections()
		game:GetService('CoreGui'):FindFirstChild('Cosmic'):Destroy()
	end
	
	local WindowObjects = {
		['_Cosmic'] = MainObjects['_ScreenGui'];
		['_Main'] = Instance.new('Frame');
		['_TabsHolder'] = Instance.new('Frame');
		['_Home'] = Instance.new('Frame');
		['_Thanks'] = Instance.new('TextLabel');
		['_Description'] = Instance.new('TextLabel');
		['_Topbar'] = Instance.new('Frame');
		['_Title'] = Instance.new('TextLabel');
		['_MenuBtn'] = Instance.new('TextButton');
		['_Icon'] = Instance.new('ImageLabel');
		['_HomeBtn'] = Instance.new('TextButton');
		['_Icon1'] = Instance.new('ImageLabel');
		['_DropShadowHolder'] = Instance.new('Frame');
		['_DropShadow'] = Instance.new('ImageLabel');
		['_Explorer'] = Instance.new('Frame');
		['_ButtonsHolder'] = Instance.new('ScrollingFrame');
		['_ButtonsHolderPadding'] = Instance.new('UIPadding');
		['_ButtonsUIListLayout'] = Instance.new('UIListLayout');
		['_ExplorerShadow'] = Instance.new('Frame');
	}
	
	local WindowStates = {
		['_MenuOpened'] = false;
	}
	
	WindowObjects['_Cosmic'].IgnoreGuiInset = true
	WindowObjects['_Cosmic'].ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
	WindowObjects['_Cosmic'].Name = 'Cosmic'
	WindowObjects['_Cosmic'].Parent = game:GetService('CoreGui')

	WindowObjects['_Main'].AnchorPoint = Vector2.new(0.5, 0.5)
	WindowObjects['_Main'].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	WindowObjects['_Main'].BorderSizePixel = 0
	WindowObjects['_Main'].Position = UDim2.new(0.5, 0, 0.5, 0)
	WindowObjects['_Main'].Size = UDim2.new(0, 550, 0, 300)
	WindowObjects['_Main'].Name = 'Main'
	WindowObjects['_Main'].Parent = WindowObjects['_Cosmic']

	WindowObjects['_TabsHolder'].AnchorPoint = Vector2.new(0.5, 0.5)
	WindowObjects['_TabsHolder'].BackgroundColor3 = Color3.fromRGB(66.00000366568565, 66.00000366568565, 66.00000366568565)
	WindowObjects['_TabsHolder'].BackgroundTransparency = 1
	WindowObjects['_TabsHolder'].BorderSizePixel = 0
	WindowObjects['_TabsHolder'].ClipsDescendants = true
	WindowObjects['_TabsHolder'].Position = UDim2.new(0.5, 0, 0.5, 30)
	WindowObjects['_TabsHolder'].Size = UDim2.new(1, 0, 1, -60)
	WindowObjects['_TabsHolder'].Name = 'TabsHolder'
	WindowObjects['_TabsHolder'].Parent = WindowObjects['_Main']

	WindowObjects['_Home'].AnchorPoint = Vector2.new(0.5, 0.5)
	WindowObjects['_Home'].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	WindowObjects['_Home'].BackgroundTransparency = 1
	WindowObjects['_Home'].BorderSizePixel = 0
	WindowObjects['_Home'].ClipsDescendants = true
	WindowObjects['_Home'].Position = UDim2.new(0.5, 0, 0.5, 0)
	WindowObjects['_Home'].Size = UDim2.new(1, 0, 1, 0)
	WindowObjects['_Home'].Name = 'Home'
	WindowObjects['_Home'].Parent = WindowObjects['_TabsHolder']

	WindowObjects['_Thanks'].Font = Enum.Font.Ubuntu
	WindowObjects['_Thanks'].Text = 'Thanks for using ' .. WindowOptions['Name'] .. '!'
	WindowObjects['_Thanks'].TextColor3 = Color3.fromRGB(74.0000031888485, 74.0000031888485, 74.0000031888485)
	WindowObjects['_Thanks'].TextSize = 30
	WindowObjects['_Thanks'].AnchorPoint = Vector2.new(0.5, 0.5)
	WindowObjects['_Thanks'].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	WindowObjects['_Thanks'].BackgroundTransparency = 1
	WindowObjects['_Thanks'].BorderSizePixel = 0
	WindowObjects['_Thanks'].Position = UDim2.new(0.5, 0, 0.5, -80)
	WindowObjects['_Thanks'].Size = UDim2.new(0, 200, 0, 50)
	WindowObjects['_Thanks'].ZIndex = 2
	WindowObjects['_Thanks'].Name = 'Thanks'
	WindowObjects['_Thanks'].Parent = WindowObjects['_Home']

	WindowObjects['_Description'].Font = Enum.Font.Ubuntu
	WindowObjects['_Description'].Text = WindowOptions['Note']
	WindowObjects['_Description'].TextColor3 = Color3.fromRGB(122.00000792741776, 122.00000792741776, 122.00000792741776)
	WindowObjects['_Description'].TextScaled = false
	WindowObjects['_Description'].TextSize = 20
	WindowObjects['_Description'].TextWrapped = true
	WindowObjects['_Description'].AnchorPoint = Vector2.new(0.5, 0.5)
	WindowObjects['_Description'].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	WindowObjects['_Description'].BackgroundTransparency = 1
	WindowObjects['_Description'].BorderSizePixel = 0
	WindowObjects['_Description'].Position = UDim2.new(0.5, 0, 0.5, 0)
	WindowObjects['_Description'].Size = UDim2.new(0, 314,0, 150)
	WindowObjects['_Description'].ZIndex = 2
	WindowObjects['_Description'].Name = 'Description'
	WindowObjects['_Description'].Parent = WindowObjects['_Home']
	
	WindowObjects['_Topbar'].BackgroundColor3 = Color3.fromRGB(74.0000031888485, 74.0000031888485, 74.0000031888485)
	WindowObjects['_Topbar'].BorderSizePixel = 0
	WindowObjects['_Topbar'].Size = UDim2.new(1, 0, 0, 60)
	WindowObjects['_Topbar'].Name = 'Topbar'
	WindowObjects['_Topbar'].Parent = WindowObjects['_Main']

	WindowObjects['_Title'].Font = Enum.Font.Ubuntu
	WindowObjects['_Title'].Text = 'Home'
	WindowObjects['_Title'].TextColor3 = Color3.fromRGB(255, 255, 255)
	WindowObjects['_Title'].TextSize = 20
	WindowObjects['_Title'].TextXAlignment = Enum.TextXAlignment.Left
	WindowObjects['_Title'].AnchorPoint = Vector2.new(0, 0.5)
	WindowObjects['_Title'].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	WindowObjects['_Title'].BackgroundTransparency = 1
	WindowObjects['_Title'].BorderSizePixel = 0
	WindowObjects['_Title'].Position = UDim2.new(0, 70, 0.5, 0)
	WindowObjects['_Title'].Size = UDim2.new(0, 200, 1, -20)
	WindowObjects['_Title'].Name = 'Title'
	WindowObjects['_Title'].Parent = WindowObjects['_Topbar']

	WindowObjects['_MenuBtn'].Font = Enum.Font.SourceSans
	WindowObjects['_MenuBtn'].Text = ''
	WindowObjects['_MenuBtn'].TextColor3 = Color3.fromRGB(0, 0, 0)
	WindowObjects['_MenuBtn'].TextSize = 14
	WindowObjects['_MenuBtn'].AnchorPoint = Vector2.new(0, 0.5)
	WindowObjects['_MenuBtn'].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	WindowObjects['_MenuBtn'].BackgroundTransparency = 1
	WindowObjects['_MenuBtn'].BorderColor3 = Color3.fromRGB(27.000000290572643, 42.000001296401024, 53.00000064074993)
	WindowObjects['_MenuBtn'].BorderSizePixel = 0
	WindowObjects['_MenuBtn'].Position = UDim2.new(0, 10, 0.5, 0)
	WindowObjects['_MenuBtn'].Size = UDim2.new(0, 45, 0, 45)
	WindowObjects['_MenuBtn'].ZIndex = 4
	WindowObjects['_MenuBtn'].Name = 'MenuBtn'
	WindowObjects['_MenuBtn'].Parent = WindowObjects['_Topbar']

	WindowObjects['_Icon'].Image = 'rbxassetid://12094415857'
	WindowObjects['_Icon'].AnchorPoint = Vector2.new(0.5, 0.5)
	WindowObjects['_Icon'].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	WindowObjects['_Icon'].BackgroundTransparency = 1
	WindowObjects['_Icon'].BorderSizePixel = 0
	WindowObjects['_Icon'].Position = UDim2.new(0.5, 0, 0.5, 0)
	WindowObjects['_Icon'].Size = UDim2.new(0, 35, 0, 35)
	WindowObjects['_Icon'].ZIndex = 4
	WindowObjects['_Icon'].Name = 'Icon'
	WindowObjects['_Icon'].Parent = WindowObjects['_MenuBtn']

	WindowObjects['_HomeBtn'].Font = Enum.Font.SourceSans
	WindowObjects['_HomeBtn'].Text = ''
	WindowObjects['_HomeBtn'].TextColor3 = Color3.fromRGB(0, 0, 0)
	WindowObjects['_HomeBtn'].TextSize = 14
	WindowObjects['_HomeBtn'].AnchorPoint = Vector2.new(1, 0.5)
	WindowObjects['_HomeBtn'].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	WindowObjects['_HomeBtn'].BackgroundTransparency = 1
	WindowObjects['_HomeBtn'].BorderColor3 = Color3.fromRGB(27.000000290572643, 42.000001296401024, 53.00000064074993)
	WindowObjects['_HomeBtn'].BorderSizePixel = 0
	WindowObjects['_HomeBtn'].Position = UDim2.new(1, -10, 0.5, 0)
	WindowObjects['_HomeBtn'].Size = UDim2.new(0, 45, 0, 45)
	WindowObjects['_HomeBtn'].ZIndex = 2
	WindowObjects['_HomeBtn'].Name = 'HomeBtn'
	WindowObjects['_HomeBtn'].Parent = WindowObjects['_Topbar']

	WindowObjects['_Icon1'].Image = 'rbxassetid://12096187515'
	WindowObjects['_Icon1'].AnchorPoint = Vector2.new(0.5, 0.5)
	WindowObjects['_Icon1'].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	WindowObjects['_Icon1'].BackgroundTransparency = 1
	WindowObjects['_Icon1'].BorderSizePixel = 0
	WindowObjects['_Icon1'].Position = UDim2.new(0.5, 0, 0.5, 0)
	WindowObjects['_Icon1'].Size = UDim2.new(0, 35, 0, 35)
	WindowObjects['_Icon1'].ZIndex = 2
	WindowObjects['_Icon1'].Name = 'Icon'
	WindowObjects['_Icon1'].Parent = WindowObjects['_HomeBtn']

	WindowObjects['_DropShadowHolder'].BackgroundTransparency = 1
	WindowObjects['_DropShadowHolder'].BorderSizePixel = 0
	WindowObjects['_DropShadowHolder'].Size = UDim2.new(1, 0, 1, 0)
	WindowObjects['_DropShadowHolder'].ZIndex = 0
	WindowObjects['_DropShadowHolder'].Name = 'DropShadowHolder'
	WindowObjects['_DropShadowHolder'].Parent = WindowObjects['_Main']

	WindowObjects['_DropShadow'].Image = 'rbxassetid://6015897843'
	WindowObjects['_DropShadow'].ImageTransparency = 0.5
	WindowObjects['_DropShadow'].ScaleType = Enum.ScaleType.Slice
	WindowObjects['_DropShadow'].SliceCenter = Rect.new(49, 49, 450, 450)
	WindowObjects['_DropShadow'].AnchorPoint = Vector2.new(0.5, 0.5)
	WindowObjects['_DropShadow'].BackgroundTransparency = 1
	WindowObjects['_DropShadow'].BorderSizePixel = 0
	WindowObjects['_DropShadow'].Position = UDim2.new(0.5, 0, 0.5, 0)
	WindowObjects['_DropShadow'].Size = UDim2.new(1, 47, 1, 47)
	WindowObjects['_DropShadow'].ZIndex = 0
	WindowObjects['_DropShadow'].Name = 'DropShadow'
	WindowObjects['_DropShadow'].Parent = WindowObjects['_DropShadowHolder']

	WindowObjects['_Explorer'].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	WindowObjects['_Explorer'].BackgroundTransparency = 1
	WindowObjects['_Explorer'].BorderSizePixel = 0
	WindowObjects['_Explorer'].ClipsDescendants = true
	WindowObjects['_Explorer'].Size = UDim2.new(0, 150, 1, 0)
	WindowObjects['_Explorer'].ZIndex = 5
	WindowObjects['_Explorer'].Name = 'Explorer'
	WindowObjects['_Explorer'].Parent = WindowObjects['_Main']

	WindowObjects['_ButtonsHolder'].ScrollBarThickness = 0
	WindowObjects['_ButtonsHolder'].AnchorPoint = Vector2.new(0.5, 0.5)
	WindowObjects['_ButtonsHolder'].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	WindowObjects['_ButtonsHolder'].BorderSizePixel = 0
	WindowObjects['_ButtonsHolder'].ClipsDescendants = false
	WindowObjects['_ButtonsHolder'].Position = UDim2.new(-1, 0, 0.5, 0)
	WindowObjects['_ButtonsHolder'].Selectable = false
	WindowObjects['_ButtonsHolder'].Size = UDim2.new(1, 0, 1, 0)
	WindowObjects['_ButtonsHolder'].ZIndex = 5
	WindowObjects['_ButtonsHolder'].SelectionGroup = false
	WindowObjects['_ButtonsHolder'].Name = 'ButtonsHolder'
	WindowObjects['_ButtonsHolder'].CanvasSize = UDim2.new(0, 0, 0, 0)
	WindowObjects['_ButtonsHolder'].Parent = WindowObjects['_Explorer']
	
	WindowObjects['_ButtonsHolderPadding'].PaddingBottom = UDim.new(0, 5)
	WindowObjects['_ButtonsHolderPadding'].PaddingLeft = UDim.new(0, 8)
	WindowObjects['_ButtonsHolderPadding'].PaddingRight = UDim.new(0, 8)
	WindowObjects['_ButtonsHolderPadding'].PaddingTop = UDim.new(0, 5)
	WindowObjects['_ButtonsHolderPadding'].Name = 'ButtonsHolderPadding'
	WindowObjects['_ButtonsHolderPadding'].Parent = WindowObjects['_ButtonsHolder']

	WindowObjects['_ButtonsUIListLayout'].Padding = UDim.new(0, 8)
	WindowObjects['_ButtonsUIListLayout'].SortOrder = Enum.SortOrder.LayoutOrder
	WindowObjects['_ButtonsUIListLayout'].Name = 'ButtonsUIListLayout'
	WindowObjects['_ButtonsUIListLayout'].Parent = WindowObjects['_ButtonsHolder']

	WindowObjects['_ExplorerShadow'].BackgroundColor3 = Color3.fromRGB(194.00000363588333, 194.00000363588333, 194.00000363588333)
	WindowObjects['_ExplorerShadow'].BackgroundTransparency = 1
	WindowObjects['_ExplorerShadow'].BorderSizePixel = 0
	WindowObjects['_ExplorerShadow'].Size = UDim2.new(1, 0, 1, 0)
	WindowObjects['_ExplorerShadow'].ZIndex = 2
	WindowObjects['_ExplorerShadow'].Name = 'ExplorerShadow'
	WindowObjects['_ExplorerShadow'].Parent = WindowObjects['_Main']
	
	WindowObjects['_Main'].Selectable = true
	WindowObjects['_Main'].Active = true
	WindowObjects['_Main'].Draggable = true

	if WindowOptions['Theme'] == 'Dark' then
		WindowObjects['_Main'].BackgroundColor3 = Color3.fromRGB(47, 47, 47)
		WindowObjects['_DropShadow'].ImageColor3 = Color3.fromRGB(20, 20, 20)
		WindowObjects['_Topbar'].BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		WindowObjects['_Thanks'].TextColor3 = Color3.fromRGB(225, 225, 225)
		WindowObjects['_Description'].TextColor3 = Color3.fromRGB(202, 202, 202)
		WindowObjects['_ButtonsHolder'].BackgroundColor3 = Color3.fromRGB(47, 47, 47)
		WindowObjects['_ExplorerShadow'].BackgroundColor3 = Color3.fromRGB(66, 66, 66)
	end
	
	table.insert(Connections, WindowObjects['_MenuBtn'].MouseButton1Down:Connect(function()
		if WindowStates['_MenuOpened'] == false then
			WindowStates['_MenuOpened'] = true
			game:GetService('TweenService'):Create(
				WindowObjects['_MenuBtn'],
				TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{Position = UDim2.new(0, 160,0.5, 0)}
			):Play()
			game:GetService('TweenService'):Create(
				WindowObjects['_ButtonsHolder'],
				TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{Position = UDim2.new(0.5, 0,0.5, 0)}
			):Play()
			game:GetService('TweenService'):Create(
				WindowObjects['_ExplorerShadow'],
				TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 0.3}
			):Play()
		elseif WindowStates['_MenuOpened'] == true then
			WindowStates['_MenuOpened'] = false
			game:GetService('TweenService'):Create(
				WindowObjects['_MenuBtn'],
				TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{Position = UDim2.new(0, 10,0.5, 0)}
			):Play()
			game:GetService('TweenService'):Create(
				WindowObjects['_ButtonsHolder'],
				TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{Position = UDim2.new(-1, 0,0.5, 0)}
			):Play()
			game:GetService('TweenService'):Create(
				WindowObjects['_ExplorerShadow'],
				TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
		end
	end))
	
	table.insert(Connections, WindowObjects['_HomeBtn'].MouseButton1Down:Connect(function()
		if WindowStates['_MenuOpened'] == true then
			return
		end
		for i,v in pairs(WindowObjects['_TabsHolder']:GetChildren()) do
			if v:IsA('ScrollingFrame') then
				v.Visible = false
			end
		end
		WindowObjects['_Home'].Visible = true
		WindowObjects['_Title'].Text = 'Home'
		if WindowOptions['Theme'] == 'Light' then
			game:GetService('TweenService'):Create(
				WindowObjects['_Topbar'],
				TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(74.0000031888485, 74.0000031888485, 74.0000031888485)}
			):Play()
			game:GetService('TweenService'):Create(
				WindowObjects['_DropShadow'],
				TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ImageColor3 = Color3.fromRGB(255, 255, 255)}
			):Play()
		elseif WindowOptions['Theme'] == 'Dark' then
			game:GetService('TweenService'):Create(
				WindowObjects['_Topbar'],
				TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(40, 40, 40)}
			):Play()
			game:GetService('TweenService'):Create(
				WindowObjects['_DropShadow'],
				TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ImageColor3 = Color3.fromRGB(20, 20, 20)}
			):Play()
		end
	end))
	
	local Tabs = {}
	
	function Tabs:CreateTab(TabOptions)
		TabOptions = Validate({Name = 'Tab', CustomColor = false, Color = Color3.fromRGB(227, 69, 54)}, TabOptions or {})
		
		local TabObjects = {
			['_TabButton'] = Instance.new('TextButton');
			['_Tab'] = Instance.new('ScrollingFrame');
			['_TabUIPadding'] = Instance.new('UIPadding');
			['_TabUIListLayout'] = Instance.new('UIListLayout');
		}
		
		local TabStates = {
			['_DefaultTabColor'] = false;
		}
		
		if TabOptions['CustomColor'] == false then
			if WindowOptions['Theme'] == 'Light' then
				TabStates['_DefaultTabColor'] = true
				TabOptions['Color'] = Color3.fromRGB(74.0000031888485, 74.0000031888485, 74.0000031888485)
			elseif WindowOptions['Theme'] == 'Dark' then
				TabStates['_DefaultTabColor'] = true
				TabOptions['Color'] = Color3.fromRGB(40, 40, 40)
			else
				TabOptions['Color'] = Color3.fromRGB(227, 69, 54)
			end
		end
		
		TabObjects['_TabButton'].Font = Enum.Font.Ubuntu
		TabObjects['_TabButton'].Text = TabOptions['Name']
		TabObjects['_TabButton'].TextColor3 = Color3.fromRGB(255, 255, 255)
		TabObjects['_TabButton'].TextSize = 14
		TabObjects['_TabButton'].BackgroundColor3 = TabOptions['Color']
		TabObjects['_TabButton'].BorderSizePixel = 0
		TabObjects['_TabButton'].Size = UDim2.new(1, 0, 0, 30)
		TabObjects['_TabButton'].ZIndex = 5
		TabObjects['_TabButton'].Name = 'TabButton'
		TabObjects['_TabButton'].Parent = WindowObjects['_ButtonsHolder']
		
		TabObjects['_Tab'].CanvasSize = UDim2.new(0, 0, 0, 0)
		TabObjects['_Tab'].ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
		TabObjects['_Tab'].ScrollBarThickness = 0
		TabObjects['_Tab'].Active = true
		TabObjects['_Tab'].AnchorPoint = Vector2.new(0.5, 0.5)
		TabObjects['_Tab'].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabObjects['_Tab'].BackgroundTransparency = 1
		TabObjects['_Tab'].BorderSizePixel = 0
		TabObjects['_Tab'].Position = UDim2.new(0.5, 0, 0.5, 0)
		TabObjects['_Tab'].Size = UDim2.new(1, 0, 1, 0)
		TabObjects['_Tab'].Visible = false
		TabObjects['_Tab'].Name = 'Tab'
		TabObjects['_Tab'].Parent = WindowObjects['_TabsHolder']
		
		TabObjects['_TabUIPadding'].PaddingBottom = UDim.new(0, 8)
		TabObjects['_TabUIPadding'].PaddingLeft = UDim.new(0, 10)
		TabObjects['_TabUIPadding'].PaddingRight = UDim.new(0, 10)
		TabObjects['_TabUIPadding'].PaddingTop = UDim.new(0, 8)
		TabObjects['_TabUIPadding'].Name = 'TabUIPadding'
		TabObjects['_TabUIPadding'].Parent = TabObjects['_Tab']

		TabObjects['_TabUIListLayout'].Padding = UDim.new(0, 8)
		TabObjects['_TabUIListLayout'].SortOrder = Enum.SortOrder.LayoutOrder
		TabObjects['_TabUIListLayout'].Name = 'TabUIListLayout'
		TabObjects['_TabUIListLayout'].Parent = TabObjects['_Tab']
		
		WindowObjects['_ButtonsHolder'].CanvasSize = UDim2.new(0, 0, 0, WindowObjects['_ButtonsUIListLayout'].AbsoluteContentSize.Y + 16)

		table.insert(Connections, TabObjects['_TabButton'].MouseButton1Down:Connect(function()
			for i,v in pairs(WindowObjects['_TabsHolder']:GetChildren()) do
				if v:IsA('ScrollingFrame') or v.Name == 'Home' then
					v.Visible = false
				end
			end
			TabObjects['_Tab'].Visible = true
			WindowObjects['_Title'].Text = TabOptions['Name']
			game:GetService('TweenService'):Create(
				WindowObjects['_Topbar'],
				TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = TabOptions['Color']}
			):Play()
			if TabStates['_DefaultTabColor'] == true then
				if WindowOptions['Theme'] == 'Light' then
					game:GetService('TweenService'):Create(
						WindowObjects['_DropShadow'],
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageColor3 = Color3.fromRGB(255, 255,255)}
					):Play()
				elseif WindowOptions['Theme'] == 'Dark' then
					game:GetService('TweenService'):Create(
						WindowObjects['_DropShadow'],
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageColor3 = Color3.fromRGB(20, 20, 20)}
					):Play()
				end
			elseif TabStates['_DefaultTabColor'] == false then
				game:GetService('TweenService'):Create(
					WindowObjects['_DropShadow'],
					TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{ImageColor3 = TabOptions['Color']}
				):Play()
			end
		end))
		
		local Components = {}
		
		function Components:CreateButton(ButtonOptions)
			ButtonOptions = Validate({Name = 'Button', CustomColor = false, Color = Color3.fromRGB(227, 69, 54), Callback = function() end}, ButtonOptions or {})
			
			local ButtonObjects = {
				['_Button'] = Instance.new('TextButton');
				['_ButtonIcon'] = Instance.new('ImageLabel');
				['_ButtonTitle'] = Instance.new('TextLabel');
				['_ButtonUIPadding'] = Instance.new('UIPadding');
			}
			
			local ButtonStates = {
				['_Hovered'] = false
			}
			
			ButtonObjects['_Button'].Font = Enum.Font.Ubuntu
			ButtonObjects['_Button'].Text = ''
			ButtonObjects['_Button'].TextColor3 = Color3.fromRGB(255, 255, 255)
			ButtonObjects['_Button'].TextSize = 16
			ButtonObjects['_Button'].TextXAlignment = Enum.TextXAlignment.Left
			ButtonObjects['_Button'].AutoButtonColor = false
			ButtonObjects['_Button'].BackgroundColor3 = Color3.fromRGB(74.0000031888485, 74.0000031888485, 74.0000031888485)
			ButtonObjects['_Button'].BorderSizePixel = 0
			ButtonObjects['_Button'].Size = UDim2.new(1, 0, 0, 40)
			ButtonObjects['_Button'].Name = 'Button'
			ButtonObjects['_Button'].Parent = TabObjects['_Tab']

			ButtonObjects['_ButtonIcon'].Image = 'rbxassetid://12107682470'
			ButtonObjects['_ButtonIcon'].AnchorPoint = Vector2.new(1, 0.5)
			ButtonObjects['_ButtonIcon'].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonObjects['_ButtonIcon'].BackgroundTransparency = 1
			ButtonObjects['_ButtonIcon'].BorderSizePixel = 0
			ButtonObjects['_ButtonIcon'].Position = UDim2.new(1, -8, 0.5, 0)
			ButtonObjects['_ButtonIcon'].Size = UDim2.new(0, 20, 0, 20)
			ButtonObjects['_ButtonIcon'].Name = 'ButtonIcon'
			ButtonObjects['_ButtonIcon'].Parent = ButtonObjects['_Button']

			ButtonObjects['_ButtonTitle'].Font = Enum.Font.Ubuntu
			ButtonObjects['_ButtonTitle'].Text = ButtonOptions['Name']
			ButtonObjects['_ButtonTitle'].TextColor3 = Color3.fromRGB(255, 255, 255)
			ButtonObjects['_ButtonTitle'].TextSize = 16
			ButtonObjects['_ButtonTitle'].TextWrapped = true
			ButtonObjects['_ButtonTitle'].TextXAlignment = Enum.TextXAlignment.Left
			ButtonObjects['_ButtonTitle'].AnchorPoint = Vector2.new(0, 0.5)
			ButtonObjects['_ButtonTitle'].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonObjects['_ButtonTitle'].BackgroundTransparency = 1
			ButtonObjects['_ButtonTitle'].BorderSizePixel = 0
			ButtonObjects['_ButtonTitle'].Position = UDim2.new(0, 0, 0.5, 0)
			ButtonObjects['_ButtonTitle'].Size = UDim2.new(0.75, 0, 1, -10)
			ButtonObjects['_ButtonTitle'].Name = ButtonOptions['Name']
			ButtonObjects['_ButtonTitle'].Parent = ButtonObjects['_Button']

			ButtonObjects['_ButtonUIPadding'].PaddingLeft = UDim.new(0, 12)
			ButtonObjects['_ButtonUIPadding'].Name = 'ButtonUIPadding'
			ButtonObjects['_ButtonUIPadding'].Parent = ButtonObjects['_ButtonTitle']
			
			if WindowOptions['Theme'] == 'Dark' then
				ButtonObjects['_Button'].BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			end
			
			TabObjects['_Tab'].CanvasSize = UDim2.new(0, 0, 0, TabObjects['_TabUIListLayout'].AbsoluteContentSize.Y + 16)
			
			table.insert(Connections, ButtonObjects['_Button'].MouseEnter:Connect(function()
				if ButtonStates['_Hovered'] == false then
					ButtonStates['_Hovered'] = true
					if ButtonOptions['CustomColor'] == true then
						game:GetService('TweenService'):Create(
							ButtonObjects['_Button'],
							TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = ButtonOptions['Color']}
						):Play()
					elseif ButtonOptions['CustomColor'] == false then
						game:GetService('TweenService'):Create(
							ButtonObjects['_Button'],
							TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = TabOptions['Color']}
						):Play()
					end
				end
			end))
			
			table.insert(Connections, ButtonObjects['_Button'].MouseLeave:Connect(function()
				if ButtonStates['_Hovered'] == true then
					ButtonStates['_Hovered'] = false
					if WindowOptions['Theme'] == 'Light' then
						game:GetService('TweenService'):Create(
							ButtonObjects['_Button'],
							TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(74.0000031888485, 74.0000031888485, 74.0000031888485)}
						):Play()
					elseif WindowOptions['Theme'] == 'Dark' then
						game:GetService('TweenService'):Create(
							ButtonObjects['_Button'],
							TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(40, 40, 40)}
						):Play()
					end
				end
			end))

			table.insert(Connections, ButtonObjects['_Button'].MouseButton1Down:Connect(function()
				pcall(ButtonOptions['Callback'])
			end))

			return ButtonObjects
		end

		function Components:CreateTextbox(TextboxOptions)
			TextboxOptions = Validate({Name = 'Textbox', DefaultText = '', AutoClear = false, CustomColor = false, Color = Color3.fromRGB(227, 69, 54), Callback = function(inputText) print(inputText) end}, TextboxOptions or {})

			local TextboxObjects = {
				['_Textbox'] = Instance.new('TextButton');
				['_InputBox'] = Instance.new('TextBox');
				['_TextboxPaddin'] = Instance.new('UIPadding');
				['_Title'] = Instance.new('TextLabel');
				['_ButtonUIPadding'] = Instance.new('UIPadding');
			}

			local TextboxStates = {
				['_Hovered'] = false;
			}

			TextboxObjects['_Textbox'].Font = Enum.Font.Ubuntu
			TextboxObjects['_Textbox'].Text = ''
			TextboxObjects['_Textbox'].TextColor3 = Color3.fromRGB(255, 255, 255)
			TextboxObjects['_Textbox'].TextSize = 16
			TextboxObjects['_Textbox'].TextXAlignment = Enum.TextXAlignment.Left
			TextboxObjects['_Textbox'].AutoButtonColor = false
			TextboxObjects['_Textbox'].BackgroundColor3 = Color3.fromRGB(74.0000031888485, 74.0000031888485, 74.0000031888485)
			TextboxObjects['_Textbox'].BorderSizePixel = 0
			TextboxObjects['_Textbox'].Size = UDim2.new(1, 0, 0, 40)
			TextboxObjects['_Textbox'].Name = 'Textbox'
			TextboxObjects['_Textbox'].Parent = TabObjects['_Tab']

			TextboxObjects['_InputBox'].CursorPosition = -1
			TextboxObjects['_InputBox'].Font = Enum.Font.Ubuntu
			TextboxObjects['_InputBox'].PlaceholderText = 'Input'
			TextboxObjects['_InputBox'].Text = TextboxOptions['DefaultText']
			TextboxObjects['_InputBox'].TextColor3 = Color3.fromRGB(166.00000530481339, 166.00000530481339, 166.00000530481339)
			TextboxObjects['_InputBox'].TextSize = 14
			TextboxObjects['_InputBox'].TextWrapped = true
			TextboxObjects['_InputBox'].TextXAlignment = Enum.TextXAlignment.Right
			TextboxObjects['_InputBox'].AnchorPoint = Vector2.new(1, 0.5)
			TextboxObjects['_InputBox'].BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			TextboxObjects['_InputBox'].BorderSizePixel = 0
			TextboxObjects['_InputBox'].Position = UDim2.new(1, -8, 0.5, 0)
			TextboxObjects['_InputBox'].Size = UDim2.new(0, 160, 0, 30)
			TextboxObjects['_InputBox'].Name = 'InputBox'
			TextboxObjects['_InputBox'].Parent = TextboxObjects['_Textbox']

			TextboxObjects['_TextboxPaddin'].PaddingLeft = UDim.new(0, 8)
			TextboxObjects['_TextboxPaddin'].PaddingRight = UDim.new(0, 8)
			TextboxObjects['_TextboxPaddin'].Name = 'TextboxPaddin'
			TextboxObjects['_TextboxPaddin'].Parent = TextboxObjects['_InputBox']

			TextboxObjects['_Title'].Font = Enum.Font.Ubuntu
			TextboxObjects['_Title'].Text = TextboxOptions['Name']
			TextboxObjects['_Title'].TextColor3 = Color3.fromRGB(255, 255, 255)
			TextboxObjects['_Title'].TextSize = 16
			TextboxObjects['_Title'].TextWrapped = true
			TextboxObjects['_Title'].TextXAlignment = Enum.TextXAlignment.Left
			TextboxObjects['_Title'].AnchorPoint = Vector2.new(0, 0.5)
			TextboxObjects['_Title'].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextboxObjects['_Title'].BackgroundTransparency = 1
			TextboxObjects['_Title'].BorderSizePixel = 0
			TextboxObjects['_Title'].Position = UDim2.new(0, 0, 0, 20)
			TextboxObjects['_Title'].Size = UDim2.new(0.649999976, 0, 0, 30)
			TextboxObjects['_Title'].Name = 'Title'
			TextboxObjects['_Title'].Parent = TextboxObjects['_Textbox']

			TextboxObjects['_ButtonUIPadding'].PaddingLeft = UDim.new(0, 12)
			TextboxObjects['_ButtonUIPadding'].Name = 'ButtonUIPadding'
			TextboxObjects['_ButtonUIPadding'].Parent = TextboxObjects['_Title']

			if WindowOptions['Theme'] == 'Dark' then
				TextboxObjects['_Textbox'].BackgroundColor3 = Color3.fromRGB(40, 40, 40)
				TextboxObjects['_InputBox'].BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			end

			table.insert(Connections, TextboxObjects['_Textbox'].MouseEnter:Connect(function()
				if TextboxStates['_Hovered'] == false then
					TextboxStates['_Hovered'] = true
					if TextboxOptions['CustomColor'] == true then
						game:GetService('TweenService'):Create(
							TextboxObjects['_Textbox'],
							TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = TextboxOptions['Color']}
						):Play()
					elseif TextboxOptions['CustomColor'] == false then
						game:GetService('TweenService'):Create(
							TextboxObjects['_Textbox'],
							TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = TabOptions['Color']}
						):Play()
					end
				end
			end))
			
			table.insert(Connections, TextboxObjects['_Textbox'].MouseLeave:Connect(function()
				if TextboxStates['_Hovered'] == true then
					TextboxStates['_Hovered'] = false
					if WindowOptions['Theme'] == 'Light' then
						game:GetService('TweenService'):Create(
							TextboxObjects['_Textbox'],
							TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(74.0000031888485, 74.0000031888485, 74.0000031888485)}
						):Play()
					elseif WindowOptions['Theme'] == 'Dark' then
						game:GetService('TweenService'):Create(
							TextboxObjects['_Textbox'],
							TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(40, 40, 40)}
						):Play()
					end
				end
			end))

			table.insert(Connections, TextboxObjects['_InputBox']:GetPropertyChangedSignal('Text'):Connect(function()
				TextboxObjects['_InputBox'].Size = UDim2.new(TextboxObjects['_InputBox'].Size.X.Scale, TextboxObjects['_InputBox'].Size.X.Offset, 0, math.huge)
				TextboxObjects['_InputBox'].Size = UDim2.new(TextboxObjects['_InputBox'].Size.X.Scale, TextboxObjects['_InputBox'].Size.X.Offset, 0, TextboxObjects['_InputBox'].TextBounds.Y + 16)
				TextboxObjects['_Textbox'].Size = UDim2.new(TextboxObjects['_Textbox'].Size.X.Scale, TextboxObjects['_Textbox'].Size.X.Offset, 0, TextboxObjects['_InputBox'].TextBounds.Y + 26)
			end))
			
			table.insert(Connections, TextboxObjects['_InputBox'].FocusLost:Connect(function()
				if TextboxObjects['_InputBox'].Text ~= '' then
					pcall(TextboxOptions['Callback'], TextboxObjects['_InputBox'].Text)
					if TextboxOptions['AutoClear'] == true then
						repeat
							TextboxObjects['_InputBox'].Text = ''
							task.wait()
						until TextboxObjects['_InputBox'].Text == ''
					end
				end
			end))

			return TextboxObjects
		end
		
		function Components:CreateToggle(ToggleOptions)
			ToggleOptions = Validate({Name = 'Toggle', State = false, CustomColor = false, Color = Color3.fromRGB(227, 69, 54), Callback = function(state) print(state) end}, ToggleOptions or {})
			
			local ToggleObjects = {
				['_Toggle'] = Instance.new('TextButton');
				['_Title'] = Instance.new('TextLabel');
				['_ToggleUIPadding'] = Instance.new('UIPadding');
				['_ToggleBack'] = Instance.new('Frame');
				['_TickIcon'] = Instance.new('ImageLabel');
			}
			
			local ToggleStates = {
				['_Hovered'] = false;
				['_Toggled'] = false;
			}

			ToggleObjects['_Toggle'].Font = Enum.Font.Ubuntu
			ToggleObjects['_Toggle'].Text = ''
			ToggleObjects['_Toggle'].TextColor3 = Color3.fromRGB(255, 255, 255)
			ToggleObjects['_Toggle'].TextSize = 16
			ToggleObjects['_Toggle'].TextXAlignment = Enum.TextXAlignment.Left
			ToggleObjects['_Toggle'].AutoButtonColor = false
			ToggleObjects['_Toggle'].BackgroundColor3 = Color3.fromRGB(74.0000031888485, 74.0000031888485, 74.0000031888485)
			ToggleObjects['_Toggle'].BorderSizePixel = 0
			ToggleObjects['_Toggle'].Size = UDim2.new(1, 0, 0, 40)
			ToggleObjects['_Toggle'].Name = 'Toggle'
			ToggleObjects['_Toggle'].Parent = TabObjects['_Tab']

			ToggleObjects['_Title'].Font = Enum.Font.Ubuntu
			ToggleObjects['_Title'].Text = ToggleOptions['Name']
			ToggleObjects['_Title'].TextColor3 = Color3.fromRGB(255, 255, 255)
			ToggleObjects['_Title'].TextSize = 16
			ToggleObjects['_Title'].TextWrapped = true
			ToggleObjects['_Title'].TextXAlignment = Enum.TextXAlignment.Left
			ToggleObjects['_Title'].AnchorPoint = Vector2.new(0, 0.5)
			ToggleObjects['_Title'].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleObjects['_Title'].BackgroundTransparency = 1
			ToggleObjects['_Title'].BorderSizePixel = 0
			ToggleObjects['_Title'].Position = UDim2.new(0, 0, 0.5, 0)
			ToggleObjects['_Title'].Size = UDim2.new(0.75, 0, 1, -10)
			ToggleObjects['_Title'].Name = 'Title'
			ToggleObjects['_Title'].Parent = ToggleObjects['_Toggle']

			ToggleObjects['_ToggleUIPadding'].PaddingLeft = UDim.new(0, 12)
			ToggleObjects['_ToggleUIPadding'].Name = 'ToggleUIPadding'
			ToggleObjects['_ToggleUIPadding'].Parent = ToggleObjects['_Title']

			ToggleObjects['_ToggleBack'].AnchorPoint = Vector2.new(1, 0.5)
			ToggleObjects['_ToggleBack'].BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			ToggleObjects['_ToggleBack'].BorderSizePixel = 0
			ToggleObjects['_ToggleBack'].Position = UDim2.new(1, -8, 0.5, 0)
			ToggleObjects['_ToggleBack'].Size = UDim2.new(0, 21, 0, 21)
			ToggleObjects['_ToggleBack'].Name = 'ToggleBack'
			ToggleObjects['_ToggleBack'].Parent = ToggleObjects['_Toggle']

			ToggleObjects['_TickIcon'].Image = 'rbxassetid://12197300985'
			ToggleObjects['_TickIcon'].ImageTransparency = 1
			ToggleObjects['_TickIcon'].AnchorPoint = Vector2.new(0.5, 0.5)
			ToggleObjects['_TickIcon'].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleObjects['_TickIcon'].BackgroundTransparency = 1
			ToggleObjects['_TickIcon'].BorderSizePixel = 0
			ToggleObjects['_TickIcon'].Position = UDim2.new(0.5, 0, 0.5, 0)
			ToggleObjects['_TickIcon'].Size = UDim2.new(1, -5, 1, -5)
			ToggleObjects['_TickIcon'].Name = 'TickIcon'
			ToggleObjects['_TickIcon'].Parent = ToggleObjects['_ToggleBack']
			
			if WindowOptions['Theme'] == 'Dark' then
				ToggleObjects['_Toggle'].BackgroundColor3 = Color3.fromRGB(40, 40, 40)
				ToggleObjects['_ToggleBack'].BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			end
			
			TabObjects['_Tab'].CanvasSize = UDim2.new(0, 0, 0, TabObjects['_TabUIListLayout'].AbsoluteContentSize.Y + 16)
			
			if ToggleOptions['State'] == true then
				ToggleStates['_Toggled'] = true
				pcall(ToggleOptions['Callback'], ToggleStates['_Toggled'])
				game:GetService('TweenService'):Create(
					ToggleObjects['_TickIcon'],
					TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{ImageTransparency = 0}
				):Play()
			end
			
			table.insert(Connections, ToggleObjects['_Toggle'].MouseEnter:Connect(function()
				if ToggleStates['_Hovered'] == false then
					ToggleStates['_Hovered'] = true
					if ToggleOptions['CustomColor'] == true then
						game:GetService('TweenService'):Create(
							ToggleObjects['_Toggle'],
							TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = ToggleOptions['Color']}
						):Play()
					elseif ToggleOptions['CustomColor'] == false then
						game:GetService('TweenService'):Create(
							ToggleObjects['_Toggle'],
							TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = TabOptions['Color']}
						):Play()
					end
				end
			end))
			
			table.insert(Connections, ToggleObjects['_Toggle'].MouseLeave:Connect(function()
				if ToggleStates['_Hovered'] == true then
					ToggleStates['_Hovered'] = false
					if WindowOptions['Theme'] == 'Light' then
						game:GetService('TweenService'):Create(
							ToggleObjects['_Toggle'],
							TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(74.0000031888485, 74.0000031888485, 74.0000031888485)}
						):Play()
					elseif WindowOptions['Theme'] == 'Dark' then
						game:GetService('TweenService'):Create(
							ToggleObjects['_Toggle'],
							TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(40, 40, 40)}
						):Play()
					end
				end
			end))
			
			table.insert(Connections, ToggleObjects['_Toggle'].MouseButton1Down:Connect(function()
				ToggleStates['_Toggled'] = not ToggleStates['_Toggled']
				pcall(ToggleOptions['Callback'], ToggleStates['_Toggled'])
				if ToggleStates['_Toggled'] == true then
					game:GetService('TweenService'):Create(
						ToggleObjects['_TickIcon'],
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageTransparency = 0}
					):Play()
				elseif ToggleStates['_Toggled'] == false then
					game:GetService('TweenService'):Create(
						ToggleObjects['_TickIcon'],
						TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageTransparency = 1}
					):Play()
				end
			end))

			return ToggleObjects
		end

		function Components:CreateSlider(SliderOptions)
			SliderOptions = Validate({Name = 'Slider', Min = 0, Max = 100, Default = 50, CustomColor = false, Color = Color3.fromRGB(227, 69, 54), Callback = function(value) print(value) end}, SliderOptions or {})

			if tonumber(SliderOptions['Default']) > tonumber(SliderOptions['Max']) then
				DisconnectConnections()
				CosmicLibrary:DestroyUI()
				return print('[Cosmic][Slider]: Default value cannot be bigger than the Max value.')
			end

			if tonumber(SliderOptions['Default']) < tonumber(SliderOptions['Min']) then
				DisconnectConnections()
				CosmicLibrary:DestroyUI()
				return print('[Cosmic][Slider]: Default value cannot be smaller than the Min value.')
			end

			if tonumber(SliderOptions['Max']) < tonumber(SliderOptions['Min']) then
				DisconnectConnections()
				CosmicLibrary:DestroyUI()
				return print('[Cosmic][Slider]: Max value cannot be smaller than Min value.')
			end

			if tonumber(SliderOptions['Min']) > tonumber(SliderOptions['Max']) then
				DisconnectConnections()
				CosmicLibrary:DestroyUI()
				return print('[Cosmic][Slider]: Min value cannot be bigger than Max value.')
			end

			local SliderObjects = {
				['_Slider'] = Instance.new('TextButton');
				['_Title'] = Instance.new('TextLabel');
				['_ButtonUIPadding'] = Instance.new('UIPadding');
				['_Number'] = Instance.new('TextLabel');
				['_ButtonUIPadding1'] = Instance.new('UIPadding');
				['_SliderBack'] = Instance.new('Frame');
				['_SliderMain'] = Instance.new('Frame');
			}

			local SliderStates = {
				['_Hovered'] = false;
				['_Dragging'] = false;
				['_Connection'] = nil;
			}
			
			local SliderFunctions = {
			}

			SliderObjects['_Slider'].Font = Enum.Font.Ubuntu
			SliderObjects['_Slider'].Text = ''
			SliderObjects['_Slider'].TextColor3 = Color3.fromRGB(255, 255, 255)
			SliderObjects['_Slider'].TextSize = 16
			SliderObjects['_Slider'].TextXAlignment = Enum.TextXAlignment.Left
			SliderObjects['_Slider'].AutoButtonColor = false
			SliderObjects['_Slider'].BackgroundColor3 = Color3.fromRGB(74.0000031888485, 74.0000031888485, 74.0000031888485)
			SliderObjects['_Slider'].BorderSizePixel = 0
			SliderObjects['_Slider'].Size = UDim2.new(1, 0, 0, 60)
			SliderObjects['_Slider'].Name = 'Slider'
			SliderObjects['_Slider'].Parent = TabObjects['_Tab']

			SliderObjects['_Title'].Font = Enum.Font.Ubuntu
			SliderObjects['_Title'].Text = SliderOptions['Name']
			SliderObjects['_Title'].TextColor3 = Color3.fromRGB(255, 255, 255)
			SliderObjects['_Title'].TextSize = 16
			SliderObjects['_Title'].TextWrapped = true
			SliderObjects['_Title'].TextXAlignment = Enum.TextXAlignment.Left
			SliderObjects['_Title'].AnchorPoint = Vector2.new(0, 0.5)
			SliderObjects['_Title'].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderObjects['_Title'].BackgroundTransparency = 1
			SliderObjects['_Title'].BorderSizePixel = 0
			SliderObjects['_Title'].Position = UDim2.new(0, 0, 0, 20)
			SliderObjects['_Title'].Size = UDim2.new(0.600000024, 0, 0, 30)
			SliderObjects['_Title'].Name = 'Title'
			SliderObjects['_Title'].Parent = SliderObjects['_Slider']

			SliderObjects['_ButtonUIPadding'].PaddingLeft = UDim.new(0, 12)
			SliderObjects['_ButtonUIPadding'].Name = 'ButtonUIPadding'
			SliderObjects['_ButtonUIPadding'].Parent = SliderObjects['_Title']

			SliderObjects['_Number'].Font = Enum.Font.Ubuntu
			SliderObjects['_Number'].Text = tostring(SliderOptions['Default'])
			SliderObjects['_Number'].TextColor3 = Color3.fromRGB(255, 255, 255)
			SliderObjects['_Number'].TextSize = 16
			SliderObjects['_Number'].TextWrapped = true
			SliderObjects['_Number'].TextXAlignment = Enum.TextXAlignment.Right
			SliderObjects['_Number'].AnchorPoint = Vector2.new(1, 0.5)
			SliderObjects['_Number'].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderObjects['_Number'].BackgroundTransparency = 1
			SliderObjects['_Number'].BorderSizePixel = 0
			SliderObjects['_Number'].Position = UDim2.new(1, -8, 0, 20)
			SliderObjects['_Number'].Size = UDim2.new(0.25, 0, 0, 30)
			SliderObjects['_Number'].Name = 'Number'
			SliderObjects['_Number'].Parent = SliderObjects['_Slider']

			SliderObjects['_ButtonUIPadding1'].PaddingLeft = UDim.new(0, 12)
			SliderObjects['_ButtonUIPadding1'].Name = 'ButtonUIPadding'
			SliderObjects['_ButtonUIPadding1'].Parent = SliderObjects['_Number']

			SliderObjects['_SliderBack'].AnchorPoint = Vector2.new(0.5, 1)
			SliderObjects['_SliderBack'].BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			SliderObjects['_SliderBack'].BorderSizePixel = 0
			SliderObjects['_SliderBack'].Position = UDim2.new(0.5, 0, 1, -10)
			SliderObjects['_SliderBack'].Size = UDim2.new(1, -20, 0, 7)
			SliderObjects['_SliderBack'].Name = 'SliderBack'
			SliderObjects['_SliderBack'].Parent = SliderObjects['_Slider']

			SliderObjects['_SliderMain'].AnchorPoint = Vector2.new(0, 0.5)
			SliderObjects['_SliderMain'].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderObjects['_SliderMain'].BorderSizePixel = 0
			SliderObjects['_SliderMain'].Position = UDim2.new(0, 0, 0.5, 0)
			SliderObjects['_SliderMain'].Size = UDim2.new(0.5, 0, 1, 0)
			SliderObjects['_SliderMain'].Name = 'SliderMain'
			SliderObjects['_SliderMain'].Parent = SliderObjects['_SliderBack']

			if WindowOptions['Theme'] == 'Dark' then
				SliderObjects['_Slider'].BackgroundColor3 = Color3.fromRGB(40, 40, 40)
				SliderObjects['_SliderBack'].BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				SliderObjects['_SliderMain'].BackgroundColor3 = Color3.fromRGB(100, 100, 100)
			end

			TabObjects['_Tab'].CanvasSize = UDim2.new(0, 0, 0, TabObjects['_TabUIListLayout'].AbsoluteContentSize.Y + 16)

			function SliderFunctions:SetValue(input)
				if input == nil then
					local percentage = math.clamp((Mouse.X - SliderObjects['_SliderBack'].AbsolutePosition.X) / (SliderObjects['_SliderBack'].AbsoluteSize.X), 0, 1)
					local value = math.floor(((SliderOptions['Max'] - SliderOptions['Min']) * percentage) + SliderOptions['Min'])
					
					SliderObjects['_Number'].Text = tostring(value)
					SliderObjects['_SliderMain'].Size = UDim2.fromScale(percentage, 1)
				else
					SliderObjects['_Number'].Text = tostring(v)
					SliderObjects['_SliderMain'].Size = UDim2.fromScale(((v - SliderOptions['Min']) / (SliderOptions['Max'] - SliderOptions['Min'])), 1)
				end
				pcall(SliderOptions['Callback'], SliderFunctions:GetValue())
			end

			function SliderFunctions:GetValue()
				return tonumber(SliderObjects['_Number'].Text)
			end

			table.insert(Connections, SliderObjects['_Slider'].MouseEnter:Connect(function()
				if SliderStates['_Hovered'] == false then
					SliderStates['_Hovered'] = true
					if SliderOptions['CustomColor'] == true then
						game:GetService('TweenService'):Create(
							SliderObjects['_Slider'],
							TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = SliderOptions['Color']}
						):Play()
					elseif SliderOptions['CustomColor'] == false then
						game:GetService('TweenService'):Create(
							SliderObjects['_Slider'],
							TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = TabOptions['Color']}
						):Play()
					end
				end
			end))

			table.insert(Connections, SliderObjects['_Slider'].MouseLeave:Connect(function()
				if SliderStates['_Hovered'] == true then
					SliderStates['_Hovered'] = false
					if WindowOptions['Theme'] == 'Light' then
						game:GetService('TweenService'):Create(
							SliderObjects['_Slider'],
							TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(74.0000031888485, 74.0000031888485, 74.0000031888485)}
						):Play()
					elseif WindowOptions['Theme'] == 'Dark' then
						game:GetService('TweenService'):Create(
							SliderObjects['_Slider'],
							TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(40, 40, 40)}
						):Play()
					end
				end
			end))

			table.insert(Connections, UserInputService.InputBegan:Connect(function(input, gpe)
				if not gpe then
					return
				end
				
				if input.UserInputType == Enum.UserInputType.MouseButton1 and SliderStates['_Hovered'] == true then
					SliderStates['_Dragging'] = true

					if SliderStates['_Connection'] == nil then
						SliderStates['_Connection'] = RunService.RenderStepped:Connect(function()
							SliderFunctions:SetValue()
						end)
					end
				end
			end))

			table.insert(Connections, UserInputService.InputEnded:Connect(function(input, gpe)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					SliderStates['_Dragging'] = false

					if SliderStates['_Connection'] ~= nil then
						SliderStates['_Connection']:Disconnect()
					end
					SliderStates['_Connection'] = nil
				end
			end))

			return SliderObjects
		end
		
		return Components
	end
	
	return Tabs
end

return CosmicLibrary
