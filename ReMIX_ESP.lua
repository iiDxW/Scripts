function getteam(plr)
	local thang = nil
	if plr.TeamColor then
		for i,v in pairs(game:GetService('Teams'):GetChildren()) do
			if v.TeamColor == plr.TeamColor then
				thang = v
			end
		end
	end
	return thang
end

local plr = game:GetService('Players').LocalPlayer
if plr:FindFirstChild('Zz1pF800p8lDrsOQgGiqa') ==nil then
	
local thingy = Instance.new('IntValue',plr)
thingy.Name="Zz1pF800p8lDrsOQgGiqa"
thingy.AncestryChanged:connect(function()
	wait()
	thingy.Parent = plr
end)
local mou = plr:GetMouse()
local active = false

function invert(Color)
	return Color3.new((255 - Color.r * 255)/255, (255 - Color.g * 255)/255, (255 - Color.b * 255)/255)
end

function heil()
	for i,v in pairs(game:GetService('CoreGui'):GetChildren()) do
		if v:IsA('Folder') and (game:GetService('Players'):FindFirstChild(v.Name) or v:FindFirstChildOfClass("BillboardGui") or v:FindFirstChildOfClass("BoxHandleAdornment")) then
			v:Destroy()
		end
	end
	if active == true then
		for i,v in pairs(game:GetService('Players'):GetChildren()) do
			if v.Character and v~=plr then
				if game:GetService('CoreGui'):FindFirstChild(v.Name) == nil then
					local folder = Instance.new('Folder',game:GetService('CoreGui'))
					folder.Name = v.Name
					if v.Character:FindFirstChild('Head') then
						local gui = Instance.new('BillboardGui',folder)
						gui.Adornee = v.Character.Head
						gui.AlwaysOnTop = true
						gui.LightInfluence = 0
						gui.Size = UDim2.new(10,0,2,0)
						gui.StudsOffset=Vector3.new(1.5,3,0)
						local text = Instance.new('TextLabel',gui)
						if getteam(v) then
						    text.BackgroundTransparency = 1
							text.TextColor3 = v.TeamColor.Color
							text.TextStrokeColor3 = Color3.fromRGB(6, 6, 6) 
							text.TextStrokeTransparency = 0.7
						else
						    text.BackgroundTransparency = 1
							text.TextColor3 = Color3.new(1,1,1)
							text.TextStrokeColor3 = Color3.fromRGB(6, 6, 6)
							text.TextStrokeTransparency = 0.7
						end
						text.Size = UDim2.new(0.7,0,0.7,0)
						text.TextScaled = true
						text.Text = [[Health: ]]..math.floor(v.Character.Humanoid.Health + 0.5)
						text.TextYAlignment = Enum.TextYAlignment.Top
						text.Font = Enum.Font.SourceSansBold
					end
					if (v.Character:FindFirstChild('Head')) then
					for _,part in pairs(v.Character:GetChildren()) do
						if part:IsA('BasePart') then
							local coru=coroutine.wrap(function()
							local endtransparency = part.Transparency
							local adorn = Instance.new('BoxHandleAdornment',folder)
							adorn.Name = v.Name
							if part.Name ~= "Head" then
								adorn.Size = part.Size
							else
								adorn.Size = (part.Size)-Vector3.new(part.Size.X/2,0,0)
							end
							adorn.Adornee = part
							adorn.AlwaysOnTop = true
							adorn.ZIndex = 5
							adorn.Transparency = endtransparency
							adorn.Color3 = v.TeamColor.Color
							local adorn2 = Instance.new('BoxHandleAdornment',folder)
							adorn2.Name = v.Name
							if part.Name ~= "Head" then
								adorn2.Size = part.Size*1.1
							else
								adorn2.Size = (part.Size*1.1)-Vector3.new(part.Size.X/2,0,0)
							end
							adorn2.Adornee = part
							adorn2.AlwaysOnTop = true
							adorn2.ZIndex = 2
							adorn2.Transparency = endtransparency+0.1
							adorn2.Color3 = Color3.fromRGB(255, 44, 17) 
							local adorn3 = Instance.new('BoxHandleAdornment',folder)
							adorn3.Name = v.Name
							if part.Name ~= "Head" then
								adorn3.Size = part.Size*1.15
							else
								adorn3.Size = (part.Size*1.15)-Vector3.new(part.Size.X/2,0,0)
							end
							adorn3.Adornee = part
							adorn3.AlwaysOnTop = true
							adorn3.ZIndex = 1
							adorn3.Transparency = endtransparency+0.2
							adorn3.Color3 = Color3.fromRGB(255, 44, 17) 
							end)
							coru()
						end
					end
					end
				end
			end
		end
	end
end

mou.KeyDown:connect(function(key)
	if key==setkey then
		active = not active
	end
end)

while true do
	heil()
	wait(waitduration)
end

end
