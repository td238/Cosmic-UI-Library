# Cosmic Library
Cosmic library was something i worked on for one of my hub's

# Initiate Library
```lua
local Cosmic = loadstring(game:HttpGet("https://raw.githubusercontent.com/TeddyBear-Official/Cosmic/main/Gui%20Library.lua"))()
```

# Creating Window
```lua
local Window = Cosmic:CreateWindow({
  Name = "Cosmic" --[[ STRING ]];
  Note = "Have fun and enjoy the great scripts to your disposal." --[[ STRING ]];
  Theme = "Light" --[[ STRING <Light | Dark> ]];
})
```

# Creating Tab
```lua
local Tab = Window:CreateTab({
  Name = "Tab" --[[ STRING ]];
  CustomColor = false --[[ BOOLEAN <Optional>]];
  Color = Color3.fromRGB(227, 69, 54) --[[ COLOR3 <Only if custom color is true>]];
})
```

# Creating Button
```lua
local Button = Tab:CreateButton({
  Name = "Button" --[[ STRING ]];
  CustomColor = false --[[ BOOLEAN <Optional>]];
  Color = Color3.fromRGB(227, 69, 54) --[[ COLOR3 <Only if custom color is true>]];
  Callback = function()
    print("Pressed")
  end;
})
```

# Creating Toggle
```lua
local Toggle = Tab:CreateToggle({
  Name = "Toggle" --[[ STRING ]];
  State = false --[[ BOOLEAN ]];
  CustomColor = false --[[ BOOLEAN <Optional>]];
  Color = Color3.fromRGB(227, 69, 54) --[[ COLOR3 <Only if custom color is true>]];
  Callback = function(state)
    print(tostring(state))
  end;
})
```

# Creating Textbox
```lua
local Textbox = Tab:CreateTextbox({
  Name = "Textbox" --[[ STRING ]];
  DefaultText = "" --[[ STRING ]];
  AutoClear = false --[[ BOOLEAN <Optional>]];
  CustomColor = false --[[ BOOLEAN <Optional>]];
  Color = Color3.fromRGB(227, 69, 54) --[[ COLOR3 <Only if custom color is true>]];
  Callback = function(input)
    print(tostring(input))
  end;
})
```

# Creating Slider
```lua
local Slider = Tab:CreateSlider({
  Name = "Slider" --[[ SLIDER ]];
  Min = 0 --[[ NUMBER ]];
  Max = 100 --[[ NUMBER ]];
  Default = 50 --[[ NUMBER ]];
  CustomColor = false --[[ BOOLEAN <Optional>]];
  Color = Color3.fromRGB(227, 69, 54) --[[ COLOR3 <Only if custom color is true>]];
  Callback = function(value)
    print(tostring(value))
  end;
})
```
