--https://github.com/FreakyYield/misc/raw/refs/heads/main/assets/Sledgehammer.rbxm
local a=writefile("sledge.rbxm",game:HttpGet("https://github.com/FreakyYield/misc/raw/refs/heads/main/assets/Sledgehammer.rbxm"))
local b=game:GetObjects(getcustomasset("sledge.rbxm"))[1]:Clone()
b.Parent=workspace
local a2=writefile("sclient.rbxm",game:HttpGet("https://github.com/FreakyYield/misc/raw/refs/heads/main/assets/SClient.rbxm"))
local b2=game:GetObjects(getcustomasset("sclient.rbxm"))[1]:Clone()
local char=game.Players.LocalPlayer.Character
local humanoid = char:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
game:GetService("RunService").RenderStepped:Connect(function()
	local tracks = animator:GetPlayingAnimationTracks()
	for i,v in pairs(tracks) do
		v:Stop()
	end
end)
script=b
script.Name="Sledgehammer2"
b2.Parent=script.Data.Scripts
b.Parent=game.Players.LocalPlayer.Character
local math=setmetatable({random=function(Arg1,Arg2,DIV) DIV=DIV or 1 return math.random(Arg1*DIV,Arg2*DIV)/DIV end,CosSin=function(Arg) return (math.sin(Arg/2)*math.cos(Arg/2)) end,},{__index=math,})
local CFrame=setmetatable({Angles=function(Arg1,Arg2,Arg3,Angles) if not Angles then return CFrame.Angles(Arg1,Arg2,Arg3) else return CFrame.Angles(math.rad(Arg1),math.rad(Arg2),math.rad(Arg3)) end end,},{__index=CFrame,})
local Instance=setmetatable({new=function(type,args) local instance=Instance.new(type) if args then if string.lower(typeof(args)) == "instance" then instance.Parent=args elseif string.lower(typeof(args))=="table" then for i,v in pairs(args) do pcall(function() instance[i]=v end) end end end return instance end,Remove=function(Instance_,Time) if string.lower(typeof(Instance_))=="instance" then game:GetService("Debris"):AddItem(Instance_,Time or 0) elseif string.lower(typeof(Instance_))=="table" then table.foreach(Instance_,function(_,v) game:GetService("Debris"):AddItem(v,Time or 0) end) end end},{__index=Instance,})
Player,UIS,Mouse,CrossClient=script.Parent.ClassName=="PlayerGui" and game:GetService("Players")[script.Parent.Parent.Name] or script.Parent.ClassName=="Model" and game:GetService("Players")[script.Parent.Name],nil,nil,nil
do
	local Client=script.Data.Scripts.SClient
	local Rem=Client:WaitForChild("Input",5)
	local InfoRef=Rem:WaitForChild("InfoRef",5)
	local function NewEv(MultipleFuncs)
		local Table={FE=true}
		if MultipleFuncs then
			Table.Funcs={}
		end
		Table.Connect=function(self,Name,Func) -- t:Connect(nil,...) nil - skip indexing and keep it as a rewritable function
			local T={}
			local TableFuncs=Name~=nil
			if not TableFuncs then
				self.Function=Func
			else
				self.Funcs[Name]=Func
			end
			T.Disconnect=function(self)
				if not TableFuncs then
					self.Function=nil
				else
					self.Funcs[Name]=nil
				end
			end
			T.disconnect=T.Disconnect
			return T
		end
		Table.connect=Table.Connect
		return Table
	end
	CrossClient={Events=NewEv(true),Functions=NewEv(true)}
	UIS={InputBegan=NewEv(),InputEnded=NewEv()}
	Mouse={Hit=CFrame.new(),Target=CFrame.new(),Origin=CFrame.new()}
	local function FireEUIS(self,Name,...)
		local F=UIS[Name]
		if F and F.FE then
			if F.Function then
				F.Function(...)
			elseif F.Funcs then
				for i,v in pairs(F.Funcs) do
					v(...)
				end
			end
		end
	end
	CrossClient.AddFunction=function(self,Type,Name,Function)
		if not self then return end
		if type(Name)=="function" then Function=Name Name=nil end
		assert(CrossClient[Type.."s"],"unsupported event type")
		if Name then
			CrossClient[Type.."s"][Name]=Function
		else
			table.insert(CrossClient[Type.."s"],Function)
		end
	end
	CrossClient.RemoveFunction=function(self,Type,Name)
		if not self then return end
		assert(CrossClient[Type.."s"],"unsupported event type")
		assert(Name,"no event name given")
		CrossClient[Type.."s"][Name]=nil
	end
	CrossClient.RemoveFunction=function(self,Type,Name)
		if not self then return end
		assert(CrossClient[Type.."s"],"unsupported event type")
		assert(Name,"no event name given")
		CrossClient[Type.."s"][Name]=nil
	end
	CrossClient.FireClient=function(self,Type,Name,...)
		if not self then return end
		assert(CrossClient[Type.."s"],"unsupported event type")
		assert(Name,"no event name given")
		if Type=="Event" then
			return Rem:FireServer(Player,Name,...)
		elseif Type=="Function" then
			return InfoRef:InvokeServer(Player,Name,...)
		end
	end
	UIS.FireEv=FireEUIS
	InfoRef.OnClientInvoke=function(PLR,...)
		if PLR~=Player then return end
		local Args={...}
		if Args[1]=="R" then
			return CrossClient.Functions[Args[2]](Args[3])
		end
	end
	Rem.OnClientEvent:Connect(function(PLR,IO,L,...)
		if PLR~=Player then return end
		local Args={...}
		if #Args>0 then
			if Args[1]=="S" then
				return CrossClient.Events[Args[2]](Args[3])
			end
		end
		if IO.Mouse then
			Mouse.Hit=IO.Hit
			Mouse.Target=IO.Target
			Mouse.Origin=IO.Origin
		else
			if IO.UserInputState==Enum.UserInputState.Begin then
				UIS:FireEv("InputBegan",IO,L)
			else
				UIS:FireEv("InputEnded",IO,L)
			end
		end
	end)
	Client.Parent=Player.PlayerGui
	Client.Disabled=false
end
--// Shortcuts
local ins=Instance.new
local v3=Vector3.new
local v2=Vector2.new
local cf=CFrame.new
local angles=CFrame.Angles
local ud=UDim.new
local ud2=UDim2.new
local c3=Color3.new
local rgb=Color3.fromRGB
local hsv=Color3.fromHSV
local bc=BrickColor.new
local bcRandom=BrickColor.Random
local palette=BrickColor.palette
local cs=ColorSequence.new
local ns=NumberSequence.new
local nsk=NumberSequenceKeypoint.new
local nr=NumberRange.new
local random=math.random
local rad=math.rad
local sin=math.sin
local cos=math.cos
local tan=math.tan
local cotan=math.CosSin
local floor=math.floor
local pi=math.floor
local abs=math.abs
local sqrt=math.sqrt
local clamp=math.clamp
local ray=Ray.new
local huge=math.huge
--// Basic functions
function Tween(Object,Args,Info)
	if Object and Args then
		Info = Info or TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,0)
		if typeof(Info) == "table" then Info = TweenInfo.new(unpack(Info)) end
		game:GetService("TweenService"):Create(Object,Info,Args):Play()
	end
end
function Sound(Id,Volume,Pitch,Parent,MaxDistance,EmitterSize,Looped)
	local S=ins("Sound",{Volume=Volume or 1,Pitch=Pitch or 1,MaxDistance=MaxDistance or 500,EmitterSize=EmitterSize or 5,Looped=Looped or false,SoundId="rbxassetid://"..Id,Parent=Parent})
	S:Play()
	coroutine.wrap(function()
		if S.Looped then return end
		if S.IsLoaded then
			Instance.Remove(S,S.TimeLength/S.Pitch)
		else
			S.Loaded:Connect(function()
				Instance.Remove(S,S.TimeLength/S.Pitch)
			end)
		end
	end)()
	return S
end
function Raycast(Origin,Direction,Blacklist,MaxDistance,IgnoreWater)
	return workspace:FindPartOnRayWithIgnoreList(ray(Origin,Direction.Unit*MaxDistance),Blacklist or {},false,IgnoreWater)
end
--// Setup 1
for i,v in pairs(Player.Character:GetDescendants()) do
	if (v.Name=="Animate" and v:IsA("LocalScript")) or v:IsA("Animator") then
		Instance.Remove(v)
	end
end
--// Character indexing
local LockWS,LockJP=false,false
local Type="R6"
Char,char=Player.Character,Player.Character
local Hum,hum=Char:FindFirstChildOfClass("Humanoid"),Char:FindFirstChildOfClass("Humanoid")
local hrp,HRP=Char.HumanoidRootPart,Char.HumanoidRootPart
local h,t,rs,ls,rl,ll
local nec,rs,ls,rh,lh,rutj
local necC0,necC1=cf(),cf()
local rutjC0,rutjC1=cf(),cf()
local rsC0,rsC1=cf(),cf()
local lsC0,lsC1=cf(),cf()
local rhC0,rhC1=cf(),cf()
local lhC0,lhC1=cf(),cf()
local h,ut,lt,rua,rla,rh,lua,lla,lh,ral,rll,rf,lul,lll,lf
local CFs={}
local Joints={}
if Type=="R6" then
	h,t,ra,la,rl,ll=char.Head,char.Torso,char["Right Arm"],char["Left Arm"],char["Right Leg"],char["Left Leg"]
	nec,rutj,rs,ls,rh,lh=t.Neck,hrp.RootJoint,t["Right Shoulder"],t["Left Shoulder"],t["Right Hip"],t["Left Hip"]
	necC0,necC1=cf(0,t.Size.Y/2,0),cf(0,-h.Size.Y/2,0)
	rutjC0,rutjC1=cf(0,0,0),cf(0,0,0)
	rsC0,rsC1=cf(t.Size.X/2,t.Size.Y/4,0),cf(-ra.Size.X/2,ra.Size.Y/4,0)
	lsC0,lsC1=cf(-t.Size.X/2,t.Size.Y/4,0),cf(la.Size.X/2,la.Size.Y/4,0)
	rhC0,rhC1=cf(t.Size.X/4,-t.Size.Y/2,0),cf(0,rl.Size.Y/2,0)
	lhC0,lhC1=cf(-t.Size.X/4,-t.Size.Y/2,0),cf(0,ll.Size.Y/2,0)
	Instance.Remove({nec,rutj,rs,ls,rh,lh})
	nec=ins("Motor6D",{Name="Neck",Part0=t,Part1=h,C0=necC0,C1=necC1,Parent=t,})
	rutj=ins("Motor6D",{Name="RootJoint",Part0=hrp,Part1=t,C0=rutjC0,C1=rutjC1,Parent=hrp,})
	rs=ins("Motor6D",{Name="Right Shoulder",Part0=t,Part1=ra,C0=rsC0,C1=rsC1,Parent=t,})
	ls=ins("Motor6D",{Name="Left Shoulder",Part0=t,Part1=la,C0=lsC0,C1=lsC1,Parent=t,})
	rh=ins("Motor6D",{Name="Right Hip",Part0=t,Part1=rl,C0=rhC0,C1=rhC1,Parent=t,})
	lh=ins("Motor6D",{Name="Left Hip",Part0=t,Part1=ll,C0=lhC0,C1=lhC1,Parent=t,})
elseif Type=="R15" then
	h,hrp=Char.Head,Char.HumanoidRootPart
	ut,lt=Char.UpperTorso,Char.LowerTorso
	rua,rla,rh=Char.RightUpperArm,Char.RightLowerArm,Char.RightHand
	lua,lla,lh=Char.LeftUpperArm,Char.LeftLowerArm,Char.LeftHand
	rul,rll,rf=Char.RightUpperLeg,Char.RightLowerLeg,Char.RightFoot
	lul,lll,lf=Char.LeftUpperLeg,Char.LeftLowerLeg,Char.LeftFoot
	for i,v in pairs(Char:GetDescendants()) do
		if v:IsA("Motor6D") then
			local CFData={C0=cf(v.C0.Position),C1=cf(v.C1.Position),Part0=v.Part0,Part1=v.Part1,Parent=v.Parent}
			local Joint=ins("Motor6D",{C0=CFData.C0,C1=CFData.C1,Part0=CFData.Part0,Part1=CFData.Part1,Name=v.Name,Parent=CFData.Parent,})
			CFs[v.Name]=CFData
			Joints[v.Name]=setmetatable({Object=Joint,Link=CFData,Remove=function(Time) Instance.Remove(Joint,Time) end},{__index=Joint,__newindex=function(self,k,v) Joint[k]=v end})
			v.Parent=nil
			Instance.Remove(v)
		end
	end
end
BLOODPARENT=workspace.Terrain
--// Variables
local Using,Muted,Holding=false,true,false
local Sine=0
local Change=1
local TimePos
local WS,JP=16,50
local MPos,BloodTrans=1,1
local LastTick,LastHitTick=tick(),tick()
local Step="R"
local StepSounds={Glass=4085889170,Plastic=2812418291,SmoothPlastic=2812418291,Neon=2812418291,ForceField=2812418291,Metal=2812417769,DiamondPlate=2812417769,CorrodedMetal=2812417769,Foil=2812417769,Sand=4085867669,Grass=619188333,Slate=2812418291,Concrete=2812418291,Granite=2812418291,Pebble=2812418291,Marble=2812418291,Cobblestone=2812418291,Brick=2812418291,Water=1110489303,Wood=2812419402,WoodPlanks=2812419402,Fabric=133705377,Snow=619083295}
local HitSounds={Metal=295837588,Foil=295837588,CorrodedMetal=295837588,DiamondPlate=295837588,Slate={3744400428,3744401196,3744400845},Concrete={3744400428,3744401196,3744400845},Granite={3744400428,3744401196,3744400845},Pebble={3744400428,3744401196,3744400845},Marble={3744400428,3744401196,3744400845},Cobblestone={3744400428,3744401196,3744400845},Brick={3744400428,3744401196,3744400845},Grass=1055286841,Fabric=1055286841,Glass=144884907,Plastic={3744398212,3748241006,3744397949,3744397627},SmoothPlastic={3744398212,3748241006,3744397949,3744397627},Neon={3744398212,3748241006,3744397949,3744397627},ForceField=4458751694,Wood={3744398212,3748241006,3744397949,3744397627},WoodPlanks={3744398212,3748241006,3744397949,3744397627}}
local Music={1838706740}
local BN, Anims, Ragdoll, Blood = 
    (function() -- BoxNegation
local math=setmetatable({random=function(Arg1,Arg2,DIV) DIV=DIV or 1 return math.random(Arg1*DIV,Arg2*DIV)/DIV end,CosSin=function(Arg) return (math.sin(Arg/2)*math.cos(Arg/2)) end,},{__index=math,})
local CFrame=setmetatable({Angles=function(Arg1,Arg2,Arg3,Angles) if not Angles then return CFrame.Angles(Arg1,Arg2,Arg3) else return CFrame.Angles(math.rad(Arg1),math.rad(Arg2),math.rad(Arg3)) end end,},{__index=CFrame,})
local Instance=setmetatable({new=function(type,args) local instance=Instance.new(type) if args then if string.lower(typeof(args)) == "instance" then instance.Parent=args elseif string.lower(typeof(args))=="table" then for i,v in pairs(args) do pcall(function() instance[i]=v end) end end end return instance end,Remove=function(Instance_,Time) if string.lower(typeof(Instance_))=="instance" then game:GetService("Debris"):AddItem(Instance_,Time or 0) elseif string.lower(typeof(Instance_))=="table" then table.foreach(Instance_,function(_,v) game:GetService("Debris"):AddItem(v,Time or 0) end) end end},{__index=Instance,})
local ins=Instance.new
local v3=Vector3.new
local v2=Vector2.new
local cf=CFrame.new
local angles=CFrame.Angles
local ud=UDim.new
local ud2=UDim2.new
local c3=Color3.new
local rgb=Color3.fromRGB
local hsv=Color3.fromHSV
local bc=BrickColor.new
local bcRandom=BrickColor.Random
local palette=BrickColor.palette
local cs=ColorSequence.new
local ns=NumberSequence.new
local nsk=NumberSequenceKeypoint.new
local nr=NumberRange.new
local random=math.random
local rad=math.rad
local sin=math.sin
local cos=math.cos
local tan=math.tan
local cotan=math.CosSin
local floor=math.floor
local pi=math.pi
local abs=math.abs
local sqrt=math.sqrt
local clamp=math.clamp
local ray=Ray.new
local huge=math.huge
return function(P,Point,Size,Parent)
	if typeof(Point)=="Vector3" then Point=cf(Point) end
	local E1,E2,E3,E4,E5,E6=cf(Point.X,P.Size.Y/2,Point.Z),cf(-P.Size.X/2,Point.Y,Point.Z),cf(Point.X,-P.Size.Y/2,Point.Z),cf(P.Size.X/2,Point.Y,Point.Z),cf(Point.X,Point.Y,-P.Size.Z/2),cf(Point.X,Point.Y,P.Size.Z/2)
	--
	local Size1=v3(clamp((Point.Position-E4.Position).Magnitude-Size.X/2,0,P.Size.X),P.Size.Y,P.Size.Z)
	local Size2=v3(clamp((Point.Position-E2.Position).Magnitude-Size.X/2,0,P.Size.X),P.Size.Y,P.Size.Z)
	local B,L=math.max(Size1.X,Size2.X),math.min(Size1.X,Size2.X)
	local Size3=v3(clamp(Size.X,0,P.Size.X-B),clamp((Point.Position-E1.Position).Magnitude-Size.Y/2,0,P.Size.Y),P.Size.Z)
	local Size4=v3(clamp(Size.X,0,P.Size.X-B),clamp((Point.Position-E3.Position).Magnitude-Size.Y/2,0,P.Size.Y),P.Size.Z)
	local B1,L1=math.max(Size3.Y,Size4.Y),math.min(Size3.Y,Size4.Y)
	local Size5=v3(abs(Point.X)+Size.X>=P.Size.X/2 and P.Size.X-B or Size.X,abs(Point.Y)+Size.Y>=P.Size.Y/2 and P.Size.Y-B1 or Size.Y,clamp((Point.Position-E5.Position).Magnitude-Size.Z/2,0,P.Size.Z))
	local Size6=v3(abs(Point.X)+Size.X>=P.Size.X/2 and P.Size.X-B or Size.X,abs(Point.Y)+Size.Y>=P.Size.Y/2 and P.Size.Y-B1 or Size.Y,clamp((Point.Position-E6.Position).Magnitude-Size.Z/2,0,P.Size.Z))
	local BZ,BY=math.max(Size5.Z,Size6.Z),math.max(Size5.Y,Size6.Y)
	--
	local CF1=P.CFrame*cf(P.Size.X/2-Size1.X/2,0,0)
	local CF2=P.CFrame*cf(-P.Size.X/2+Size2.X/2,0,0)
	local CF3=P.CFrame*cf(Size.X+B>P.Size.X and (P.Size.X/2-Size3.X/2)*(Point.X<0 and -1 or 1) or Point.X,P.Size.Y/2-Size3.Y/2,0)
	local CF4=P.CFrame*cf(Size.X+B>P.Size.X and (P.Size.X/2-Size4.X/2)*(Point.X<0 and -1 or 1) or Point.X,-P.Size.Y/2+Size4.Y/2,0)
	local CF5=P.CFrame*cf(abs(Point.X)+Size.X>=P.Size.X/2 and (Point.X>0 and P.Size.X/2-Size5.X/2 or -P.Size.X/2+Size5.X/2) or Point.X,abs(Point.Y)+Size.Y>=P.Size.Y/2 and (Point.Y>0 and P.Size.Y/2-Size5.Y/2 or -P.Size.Y/2+Size5.Y/2) or Point.Y,-P.Size.Z/2+Size5.Z/2)
	local CF6=P.CFrame*cf(abs(Point.X)+Size.X>=P.Size.X/2 and (Point.X>0 and P.Size.X/2-Size6.X/2 or -P.Size.X/2+Size5.X/2) or Point.X,abs(Point.Y)+Size.Y>=P.Size.Y/2 and (Point.Y>0 and P.Size.Y/2-Size5.Y/2 or -P.Size.Y/2+Size5.Y/2) or Point.Y,P.Size.Z/2-Size6.Z/2)
	--
	local Images,Welds={},{}
	for i,v in pairs(P:GetChildren()) do
		if v:IsA("Decal") or v:IsA("Texture") then
			table.insert(Images,v:Clone())
		elseif v:IsA("Weld") or v:IsA("WeldConstraint") then
			table.insert(Welds,{v,v.Parent==P,v.Part0==P,v.Part1==P})
		end
	end
	local Parts={}
	if Size1.X>.04 then local P1=ins("Part",{Anchored=P.Anchored,Locked=P.Locked,TopSurface=P.TopSurface,BottomSurface=P.BottomSurface,RightSurface=P.RightSurface,FrontSurface=P.FrontSurface,LeftSurface=P.LeftSurface,BackSurface=P.BackSurface,Transparency=P.Transparency,Material=P.Material,Color=P.Color,Size=Size1,CFrame=CF1,Parent=Parent}) for i,v in pairs(Images) do v:Clone().Parent=P1 end table.insert(Parts,P1) end
	if Size2.X>.04 then local P2=ins("Part",{Anchored=P.Anchored,Locked=P.Locked,TopSurface=P.TopSurface,BottomSurface=P.BottomSurface,RightSurface=P.RightSurface,FrontSurface=P.FrontSurface,LeftSurface=P.LeftSurface,BackSurface=P.BackSurface,Transparency=P.Transparency,Material=P.Material,Color=P.Color,Size=Size2,CFrame=CF2,Parent=Parent}) for i,v in pairs(Images) do v:Clone().Parent=P2 end table.insert(Parts,P2) end
	if Size3.Y>.04 and Size3.X>.04 or B>=P.Size.X then local P3=ins("Part",{Anchored=P.Anchored,Locked=P.Locked,TopSurface=P.TopSurface,BottomSurface=P.BottomSurface,RightSurface=P.RightSurface,FrontSurface=P.FrontSurface,LeftSurface=P.LeftSurface,BackSurface=P.BackSurface,Transparency=P.Transparency,Material=P.Material,Color=P.Color,Size=Size3,CFrame=CF3,Parent=Parent}) for i,v in pairs(Images) do v:Clone().Parent=P3 end table.insert(Parts,P3) end
	if Size4.Y>.04 and Size4.X>.04 or B>=P.Size.X then local P4=ins("Part",{Anchored=P.Anchored,Locked=P.Locked,TopSurface=P.TopSurface,BottomSurface=P.BottomSurface,RightSurface=P.RightSurface,FrontSurface=P.FrontSurface,LeftSurface=P.LeftSurface,BackSurface=P.BackSurface,Transparency=P.Transparency,Material=P.Material,Color=P.Color,Size=Size4,CFrame=CF4,Parent=Parent}) for i,v in pairs(Images) do v:Clone().Parent=P4 end table.insert(Parts,P4) end
	if Size5.Y>.04 and Size5.X>.04 and Size5.Z>.04 then local P5=ins("Part",{Anchored=P.Anchored,Locked=P.Locked,TopSurface=P.TopSurface,BottomSurface=P.BottomSurface,RightSurface=P.RightSurface,FrontSurface=P.FrontSurface,LeftSurface=P.LeftSurface,BackSurface=P.BackSurface,Transparency=P.Transparency,Material=P.Material,Color=P.Color,Size=Size5,CFrame=CF5,Parent=Parent}) for i,v in pairs(Images) do v:Clone().Parent=P5 end table.insert(Parts,P5) end
	if Size6.Y>.04 and Size6.X>.04 and Size6.Z>.04 then local P6=ins("Part",{Anchored=P.Anchored,Locked=P.Locked,TopSurface=P.TopSurface,BottomSurface=P.BottomSurface,RightSurface=P.RightSurface,FrontSurface=P.FrontSurface,LeftSurface=P.LeftSurface,BackSurface=P.BackSurface,Transparency=P.Transparency,Material=P.Material,Color=P.Color,Size=Size6,CFrame=CF6,Parent=Parent}) for i,v in pairs(Images) do v:Clone().Parent=P6 end table.insert(Parts,P6) end
	if not P.Anchored then
		for i,v in pairs(Parts) do
			if P.Material~=Enum.Material.Glass then
				for _i,q in pairs(Parts) do
					if i~=_i then
						local CF=v.CFrame
						ins("Weld",{Part0=v,Part1=q,C0=q.CFrame:ToObjectSpace(CF),Parent=v})
					end
				end
			end
		end
	elseif P.Material==Enum.Material.Glass then
		for i,v in pairs(Parts) do
			v.Anchored=false
		end
	end
	local OP=P.Parent
	P.Parent=nil
	return P,OP,Images
end
    end)(),
    
    (function() -- Animations
local math=setmetatable({random=function(Arg1,Arg2,DIV) DIV=DIV or 1 return math.random(Arg1*DIV,Arg2*DIV)/DIV end,CosSin=function(Arg) return (math.sin(Arg/2)*math.cos(Arg/2)) end,},{__index=math,})
local CFrame=setmetatable({Angles=function(Arg1,Arg2,Arg3,Angles) if not Angles then return CFrame.Angles(Arg1,Arg2,Arg3) else return CFrame.Angles(math.rad(Arg1),math.rad(Arg2),math.rad(Arg3)) end end,},{__index=CFrame,})
local Instance=setmetatable({new=function(type,args) local instance=Instance.new(type) if args then if string.lower(typeof(args)) == "instance" then instance.Parent=args elseif string.lower(typeof(args))=="table" then for i,v in pairs(args) do pcall(function() instance[i]=v end) end end end return instance end,Remove=function(Instance_,Time) if string.lower(typeof(Instance_))=="instance" then game:GetService("Debris"):AddItem(Instance_,Time or 0) elseif string.lower(typeof(Instance_))=="table" then table.foreach(Instance_,function(_,v) game:GetService("Debris"):AddItem(v,Time or 0) end) end end},{__index=Instance,})
local ins=Instance.new
local v3=Vector3.new
local v2=Vector2.new
local cf=CFrame.new
local angles=CFrame.Angles
local ud=UDim.new
local ud2=UDim2.new
local c3=Color3.new
local rgb=Color3.fromRGB
local hsv=Color3.fromHSV
local bc=BrickColor.new
local bcRandom=BrickColor.Random
local palette=BrickColor.palette
local cs=ColorSequence.new
local ns=NumberSequence.new
local nsk=NumberSequenceKeypoint.new
local nr=NumberRange.new
local random=math.random
local rad=math.rad
local sin=math.sin
local cos=math.cos
local tan=math.tan
local CosSin=math.CosSin
local floor=math.floor
local pi=math.floor
local abs=math.abs
local sqrt=math.sqrt
local clamp=math.clamp
local ray=Ray.new
local huge=math.huge
return {
	Swing={
		Waits={
			[1]=.25,
			[2]=.15
		},
		[1]={
			{"nec",{C1=CFrame.Angles(math.rad(0),math.rad(0),math.rad(-20))},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1= CFrame.new(0,-0.1,0.2)*CFrame.Angles(math.rad(5),math.rad(-15),math.rad(0))},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C0=CFrame.new(0.85,0.25,-0.65)*CFrame.Angles(math.rad(150),math.rad(-10),math.rad(20))},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rh",{C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"lh",{C1=CFrame.new(0,0,-0.2)*CFrame.Angles(math.rad(-12.5),math.rad(15),math.rad(0))},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
		},
		[2]={
			{"nec",{C1=CFrame.Angles(math.rad(0),math.rad(0),math.rad(-5))},{.15,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0}},
			{"rutj",{C1=CFrame.new(0,-0.1,-0.2)*CFrame.Angles(math.rad(-5),math.rad(5),math.rad(0))},{.15,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0}},
			{"ls",{C0=CFrame.new(0.35,-0.15,-0.5)*CFrame.Angles(math.rad(40),math.rad(-30),math.rad(0))},{.15,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0}},
			{"rh",{C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))},{.15,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0}},
			{"lh",{C1=CFrame.new(0,0.25,-0.3)*CFrame.Angles(math.rad(-15),math.rad(10),math.rad(0))},{.15,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0}},
			{"ham",{C0=CFrame.Angles(math.rad(-30),math.rad(0),math.rad(0))},{.15,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0}},
		},
	},
	NoHit={
		{"nec",{C1=CFrame.Angles(math.rad(-5),math.rad(0),math.rad(-5))},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0}},
		{"rutj",{C1=CFrame.new(0,-0.1,-0.3)*CFrame.Angles(math.rad(-7.5),math.rad(5),math.rad(0))},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0}},
		{"ls",{C0=CFrame.new(0.35,-0.15,-0.5)*CFrame.Angles(math.rad(40),math.rad(-35),math.rad(0))},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0}},
		{"rh",{C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0}},
		{"lh",{C1=CFrame.new(0,0,-0.3)*CFrame.Angles(math.rad(5),math.rad(10),math.rad(0))},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0}},
	},
	Hit={
		{"nec",{C1=CFrame.Angles(math.rad(2.5),math.rad(0),math.rad(-5))},{.3,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
		{"rutj",{C1=CFrame.new(0,-0.1,0.3)*CFrame.Angles(math.rad(2.5),math.rad(5),math.rad(0))},{.3,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
		{"ls",{C0=CFrame.new(0.35,-0.05,-0.25)*CFrame.Angles(math.rad(90),math.rad(0),math.rad(0))*CFrame.Angles(math.rad(0),math.rad(-30),math.rad(0))},{.3,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
		{"rh",{C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))},{.3,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
		{"lh",{C1=CFrame.new(0,0,-0.2)*CFrame.Angles(math.rad(-12),math.rad(10),math.rad(0))},{.3,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
	}
}
--[[
Left Shoulder: 
	C0: CFrame.new(-1,.5,0)*CFrame.new(0.35,-0.05,-0.25)*CFrame.Angles(math.rad(100),math.rad(0),math.rad(-30))*CFrame.Angles(math.rad(0),math.rad(-30),math.rad(0))
	C1: CFrame.new(.5,.5,0)
Right Shoulder: 
	C0: CFrame.new(1,.5,0)*CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
	C1: CFrame.new(-.5,.5,0)
Neck: 
	C0: CFrame.new(0,1,0)*CFrame.Angles(math.rad(2.5),math.rad(0),math.rad(-5))
	C1: CFrame.new(0,-.5,0)
Right Hip: 
	C0: CFrame.new(0.5,-1,0)*CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
	C1: CFrame.new(0,1,0)
Left Hip: 
	C0: CFrame.new(-0.5,-1,0)*CFrame.new(0,0,-0.2)*CFrame.Angles(math.rad(-12),math.rad(10),math.rad(0))
	C1: CFrame.new(0,1,0)
RootJoint: 
	C0: CFrame.new(0,-0.1,0.3)*CFrame.Angles(math.rad(2.5),math.rad(5),math.rad(0))
	C1: CFrame.new(0,0,0)
]]--
--[[
	000={
		Waits={
			[1]=.1,
		},
		[1]={
			{"nec",{C1=000},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=000},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rs",{C0=000},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C0=000},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rh",{C1=000},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"lh",{C1=000},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
		}
	}
]]
    end)(),
    
    (function() -- Ragdoll
local math=setmetatable({random=function(Arg1,Arg2,DIV) DIV=DIV or 1 return math.random(Arg1*DIV,Arg2*DIV)/DIV end,CosSin=function(Arg) return (math.sin(Arg/2)*math.cos(Arg/2)) end,},{__index=math,})
local CFrame=setmetatable({Angles=function(Arg1,Arg2,Arg3,Angles) if not Angles then return CFrame.Angles(Arg1,Arg2,Arg3) else return CFrame.Angles(math.rad(Arg1),math.rad(Arg2),math.rad(Arg3)) end end,},{__index=CFrame,})
local Instance=setmetatable({new=function(type,args) local instance=Instance.new(type) if args then if string.lower(typeof(args)) == "instance" then instance.Parent=args elseif string.lower(typeof(args))=="table" then for i,v in pairs(args) do pcall(function() instance[i]=v end) end end end return instance end,Remove=function(Instance_,Time) if string.lower(typeof(Instance_))=="instance" then game:GetService("Debris"):AddItem(Instance_,Time or 0) elseif string.lower(typeof(Instance_))=="table" then table.foreach(Instance_,function(_,v) game:GetService("Debris"):AddItem(v,Time or 0) end) end end},{__index=Instance,})
local ins=Instance.new
local v3=Vector3.new
local v2=Vector2.new
local cf=CFrame.new
local angles=CFrame.Angles
local ud=UDim.new
local ud2=UDim2.new
local c3=Color3.new
local rgb=Color3.fromRGB
local hsv=Color3.fromHSV
local bc=BrickColor.new
local bcRandom=BrickColor.Random
local palette=BrickColor.palette
local cs=ColorSequence.new
local ns=NumberSequence.new
local nsk=NumberSequenceKeypoint.new
local nr=NumberRange.new
local random=math.random
local rad=math.rad
local sin=math.sin
local cos=math.cos
local tan=math.tan
local CosSin=math.CosSin
local floor=math.floor
local pi=math.floor
local abs=math.abs
local sqrt=math.sqrt
local clamp=math.clamp
local ray=Ray.new
local huge=math.huge
return {
	Swing={
		Waits={
			[1]=.25,
			[2]=.15
		},
		[1]={
			{"nec",{C1=CFrame.Angles(math.rad(0),math.rad(0),math.rad(-20))},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1= CFrame.new(0,-0.1,0.2)*CFrame.Angles(math.rad(5),math.rad(-15),math.rad(0))},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C0=CFrame.new(0.85,0.25,-0.65)*CFrame.Angles(math.rad(150),math.rad(-10),math.rad(20))},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rh",{C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"lh",{C1=CFrame.new(0,0,-0.2)*CFrame.Angles(math.rad(-12.5),math.rad(15),math.rad(0))},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
		},
		[2]={
			{"nec",{C1=CFrame.Angles(math.rad(0),math.rad(0),math.rad(-5))},{.15,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0}},
			{"rutj",{C1=CFrame.new(0,-0.1,-0.2)*CFrame.Angles(math.rad(-5),math.rad(5),math.rad(0))},{.15,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0}},
			{"ls",{C0=CFrame.new(0.35,-0.15,-0.5)*CFrame.Angles(math.rad(40),math.rad(-30),math.rad(0))},{.15,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0}},
			{"rh",{C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))},{.15,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0}},
			{"lh",{C1=CFrame.new(0,0.25,-0.3)*CFrame.Angles(math.rad(-15),math.rad(10),math.rad(0))},{.15,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0}},
			{"ham",{C0=CFrame.Angles(math.rad(-30),math.rad(0),math.rad(0))},{.15,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0}},
		},
	},
	NoHit={
		{"nec",{C1=CFrame.Angles(math.rad(-5),math.rad(0),math.rad(-5))},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0}},
		{"rutj",{C1=CFrame.new(0,-0.1,-0.3)*CFrame.Angles(math.rad(-7.5),math.rad(5),math.rad(0))},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0}},
		{"ls",{C0=CFrame.new(0.35,-0.15,-0.5)*CFrame.Angles(math.rad(40),math.rad(-35),math.rad(0))},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0}},
		{"rh",{C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0}},
		{"lh",{C1=CFrame.new(0,0,-0.3)*CFrame.Angles(math.rad(5),math.rad(10),math.rad(0))},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0}},
	},
	Hit={
		{"nec",{C1=CFrame.Angles(math.rad(2.5),math.rad(0),math.rad(-5))},{.3,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
		{"rutj",{C1=CFrame.new(0,-0.1,0.3)*CFrame.Angles(math.rad(2.5),math.rad(5),math.rad(0))},{.3,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
		{"ls",{C0=CFrame.new(0.35,-0.05,-0.25)*CFrame.Angles(math.rad(90),math.rad(0),math.rad(0))*CFrame.Angles(math.rad(0),math.rad(-30),math.rad(0))},{.3,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
		{"rh",{C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))},{.3,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
		{"lh",{C1=CFrame.new(0,0,-0.2)*CFrame.Angles(math.rad(-12),math.rad(10),math.rad(0))},{.3,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
	}
}
--[[
Left Shoulder: 
	C0: CFrame.new(-1,.5,0)*CFrame.new(0.35,-0.05,-0.25)*CFrame.Angles(math.rad(100),math.rad(0),math.rad(-30))*CFrame.Angles(math.rad(0),math.rad(-30),math.rad(0))
	C1: CFrame.new(.5,.5,0)
Right Shoulder: 
	C0: CFrame.new(1,.5,0)*CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
	C1: CFrame.new(-.5,.5,0)
Neck: 
	C0: CFrame.new(0,1,0)*CFrame.Angles(math.rad(2.5),math.rad(0),math.rad(-5))
	C1: CFrame.new(0,-.5,0)
Right Hip: 
	C0: CFrame.new(0.5,-1,0)*CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
	C1: CFrame.new(0,1,0)
Left Hip: 
	C0: CFrame.new(-0.5,-1,0)*CFrame.new(0,0,-0.2)*CFrame.Angles(math.rad(-12),math.rad(10),math.rad(0))
	C1: CFrame.new(0,1,0)
RootJoint: 
	C0: CFrame.new(0,-0.1,0.3)*CFrame.Angles(math.rad(2.5),math.rad(5),math.rad(0))
	C1: CFrame.new(0,0,0)
]]--
--[[
	000={
		Waits={
			[1]=.1,
		},
		[1]={
			{"nec",{C1=000},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=000},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rs",{C0=000},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C0=000},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rh",{C1=000},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"lh",{C1=000},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
		}
	}
]]
    end)(),
    
    (function() -- Blood
        local ORIGCF=CFrame.new
local math=setmetatable({random=function(Arg1,Arg2,DIV) DIV=DIV or 1 return math.random(Arg1*DIV,Arg2*DIV)/DIV end;CosSin=function(Arg) return (math.sin(Arg/2)*math.cos(Arg/2)) end;},{__index=math;})
local CFrame=setmetatable({new=function(Arg1,Arg2,Arg3,Angles) if not Angles then return CFrame.new(Arg1,Arg2,Arg3) else return CFrame.Angles(math.rad(Arg1),math.rad(Arg2),math.rad(Arg3)) end end;},{__index=CFrame;})
local Instance=setmetatable({new = function(type,args) local instance = Instance.new(type) if args then if string.lower(typeof(args)) == "instance" then instance.Parent = args elseif string.lower(typeof(args)) == "table" then for i,v in pairs(args) do pcall(function() instance[i] = v end) end end end return instance end;Remove=function(Instance_,Time) if string.lower(typeof(Instance_))=="instance" then game:GetService("Debris"):AddItem(Instance_,Time or 0) elseif string.lower(typeof(Instance_))=="table" then table.foreach(Instance_,function(_,v) game:GetService("Debris"):AddItem(v,Time or 0) end) end end},{__index=Instance;})
--}{		Default Functions	   }{--
local ins=Instance.new
local v3=Vector3.new
local v2=Vector2.new
local cf=CFrame.new
local angles=CFrame.Angles
local ud=UDim.new
local ud2=UDim2.new
local c3=Color3.new
local rgb=Color3.fromRGB
local hsv=Color3.fromHSV
local bc=BrickColor.new
local bcRandom=BrickColor.Random
local palette=BrickColor.palatte
local cs=ColorSequence.new
local ns=NumberSequence.new
local nsk=NumberSequenceKeypoint.new
local nr=NumberRange.new
local random=math.random
local rad=math.rad
local sin=math.sin
local cos=math.cos
local tan=math.tan
local floor=math.floor
local pi=math.floor
local abs=math.abs
local sqrt=math.sqrt
local clamp=math.clamp
local ray=Ray.new
local huge=math.huge
--
function Tween(Object,Args,Info)
	if Object and Args then
		Info = Info or TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,0)
		if typeof(Info) == "table" then Info = TweenInfo.new(unpack(Info)) end
		game:GetService("TweenService"):Create(Object,Info,Args):Play()
	end
end
function Sound(Id,Volume,Pitch,Parent,MaxDistance,EmitterSize,Looped)
	local S=ins("Sound",{Volume=Volume or 1;Pitch=Pitch or 1;MaxDistance=MaxDistance or 500;EmitterSize=EmitterSize or 5;Looped=Looped or true;SoundId="rbxassetid://"..Id,Parent=Parent})
	S:Play()
	coroutine.wrap(function()
		if S.IsLoaded then
			Instance.Remove(S,S.TimeLength/S.Pitch)
		else
			S.Loaded:Connect(function()
				Instance.Remove(S,S.TimeLength/S.Pitch)
			end)
		end
	end)()
	return S
end
function Raycast(Origin,Direction,Blacklist,MaxDistance,IgnoreWater)
	return workspace:FindPartOnRayWithIgnoreList(ray(Origin,Direction.Unit*MaxDistance),Blacklist or {},false,IgnoreWater)
end
--
local Ignore={}
local Effects,Char,Player
local Blood=setmetatable({},{__call=function(self) Effects=getfenv(2)["BLOODPARENT"] Char=getfenv(2)["char"] or getfenv(2)["Char"] Player=getfenv(2)["owner"] or getfenv(2)["Player"] table.insert(Ignore,Char) table.insert(Ignore,Effects) end})
--
local RaySides={v3(0,100,0);v3(0,-100,0);v3(0,0,100);v3(0,0,-100);v3(100,0,0);v3(-100,0,0);v3(100,100,0);v3(-100,100,0);v3(100,-100,0);v3(-100,-100,0);v3(0,100,100);v3(0,100,-100);v3(0,-100,100);v3(0,-100,-100);v3(100,100,100);v3(100,-100,100);v3(100,100,-100);v3(100,-100,-100);v3(-100,100,100);v3(-100,-100,100);v3(-100,100,-100);v3(-100,-100,-100);v3(100,100,-100);v3(-100,-100,100);v3(-100,100,-100);v3(100,-100,100);}
local Drop=script.Data.Scripts.Modules.Blood:WaitForChild("Drop")
local MPiece=script.Data.Scripts.Modules.Blood:WaitForChild("MeatPiece")
--
Blood.new=setmetatable({},{
	__call=function(self,Pos,Dir,Scale,Ignore_)
		Scale=Scale or 1
		local Drop=Drop:Clone()
		if Player then pcall(function() Drop:SetNetworkOwner(Player) end) end
		Drop.CFrame=Pos
		Drop.Hitbox.CFrame=Pos*cf(0,random(-180,180),0,true)
		Drop.Parent=Effects
		local Velocity=ins("BodyVelocity",{Velocity=Dir;Parent=Drop})
		local Stats={Drop=Drop;CenterAtt=Drop.CenterAtt;BloodTrail=Drop.BloodTrail;SingleAtt1=Drop.SingleAtt1;SingleAtt2=Drop.SingleAtt2;Hitbox=Drop.Hitbox;PairedWith={};}
		Instance.Remove(Velocity,random(.1,.25,100))
		Instance.Remove(Drop,random(3,5,10))
		Stats.SingleAtt1.Position,Stats.SingleAtt2.Position=v3(-.2*Scale,0,0),v3(.2*Scale,0,0)
		local Connection;
		Connection=Stats.Hitbox.Touched:Connect(function(Hit)
			if Hit:IsDescendantOf(Char) or Hit:IsDescendantOf(Effects) or (Ignore_ and Hit:IsDescendantOf(Ignore_)) then return end
			if random(0,1,3)==1 or Hit.Material==Enum.Material.Water then
				Connection:Disconnect()
				Instance.Remove(Stats.Hitbox)
				Instance.Remove(Stats.Drop,1)
				Stats.Drop.Anchored=true
				Stats.Drop.CanCollide=false
				Stats.Drop.BloodDrops.Enabled=false
				local Position=Stats.Drop.Position
				for i,v in pairs(RaySides) do
					local RHit,RPos,RNID=Raycast(Position,(Position+v)-Position,Ignore,3.5,true)
					if RHit then
						local Size=random(.1,.2,100)*Scale
						local LifeTime=random(5,12.5,10)
						local FadeTime=Size/random(3,5,10)
						local Puddle=ins("Part",{CFrame=ORIGCF(RPos,RPos+RNID)*cf(90,0,0,true);FormFactor=Enum.FormFactor.Custom;Size=v3(Size/10,0,Size/10);Material=Enum.Material.Glass;Color=bc("Maroon").Color;Transparency=.2;Massless=true;Locked=true;CanCollide=false;Name="BloodPuddle";Parent=Effects})
						local Mesh=ins("SpecialMesh",{MeshType="Sphere";Parent=Puddle})
						Sound(685857471,.02,random(.9,1.2,100),Puddle,50,1,false)
						Puddle.Parent=ins("WeldConstraint",{Part0=RHit;Part1=Puddle;Parent=Effects})
						table.insert(Ignore,Puddle)
						local W=Puddle.Parent
						local CON
						CON=W.Part0:GetPropertyChangedSignal("Parent"):Connect(function()
							if not W.Part0.Parent then
								CON:Disconnect()
								Instance.Remove(W)
							end
						end)
						Instance.Remove(Puddle,LifeTime+FadeTime)
						Tween(Puddle,{Size=v3(Size,0,Size)},{Size/random(5,7,10);Enum.EasingStyle.Exponential;Enum.EasingDirection.InOut;0;false;0})
						Tween(Mesh,{Scale=v3()},{FadeTime;Enum.EasingStyle.Exponential;Enum.EasingDirection.InOut;0;false;LifeTime})
						break
					end
				end
				return
			end
			local Position=Stats.Drop.Position
			for i,v in pairs(workspace:FindPartsInRegion3WithIgnoreList(Region3.new(Position-v3(1.5,1.5,1.5)*Scale,Position+v3(1.5,1.5,1.5)*Scale),{},40)) do
				if v.Name=="BloodPuddle" then
					local Size=random(.05,.25,100)*Scale
					Tween(v,{Size=v.Size+v3(Size,0,Size)},{random(.1,.2,10);Enum.EasingStyle.Exponential;Enum.EasingDirection.InOut;0;false;0})
				end
			end
			for i,v in pairs(RaySides) do
				local RHit,RPos,RNID=Raycast(Position,(Position+v)-Position,Ignore,3.5*Scale,true)
				if RHit and not (RHit:IsDescendantOf(Char) or RHit:IsDescendantOf(Effects)) and RHit.Name~="BloodPuddle" then
					local Size=random(.5,1,100)*Scale
					local LifeTime=random(5,10,10)
					local FadeTime=Size/random(1.5,2.5,10)
					local Puddle=ins("Part",{CFrame=ORIGCF(RPos,RPos+RNID)*cf(90,0,0,true);FormFactor=Enum.FormFactor.Custom;Size=v3(Size/10,0,Size/10);Material=Enum.Material.Glass;Color=bc("Maroon").Color;Transparency=.2;Massless=true;Locked=true;CanCollide=false;Name="BloodPuddle";Parent=Effects})
					local Mesh=ins("SpecialMesh",{MeshType="Sphere";Parent=Puddle})
					Sound(685857471,.02,random(.9,1.2,100),Puddle,50,1,false)
					local WE=ins("WeldConstraint",{Part0=RHit;Part1=Puddle;Parent=Effects}) Puddle.Parent=WE
					table.insert(Ignore,Puddle)
					local CON
					CON=WE.Part0:GetPropertyChangedSignal("Parent"):Connect(function()
						if not WE.Part0.Parent then
							Instance.Remove(WE)
						end
					end)
					Instance.Remove(Puddle,LifeTime+FadeTime)
					Tween(Puddle,{Size=v3(Size,0,Size)},{Size/random(9,11,10);Enum.EasingStyle.Exponential;Enum.EasingDirection.InOut;0;false;0})
					Tween(Mesh,{Scale=v3()},{FadeTime;Enum.EasingStyle.Exponential;Enum.EasingDirection.InOut;0;false;LifeTime})
					return
				end
			end
		end)
	end,
	__metatable=false
})
Blood.new.MeatPiece=function(Pos,Dir,Scale)
    local P=MPiece:Clone() P.Size=v3(random(.7,1.2,100),random(.7,1.2,100),random(.7,1.2,100))*Scale P.CFrame=Pos P.Parent=Effects
	local Deb,DebTime=false,.25
	Instance.Remove(ins("BodyVelocity",{Velocity=Dir;Parent=Drop}),.1) Instance.Remove(P,random(5,15))
	P.Touched:Connect(function(Hit)
		if Deb then return end
		local Vel=Hit.Velocity.Magnitude>15 or P.Velocity.Magnitude>15
		if Vel then
			Deb=true
			Sound(2053476174,.2,random(.9,1.1,100),P,100,5).TimePosition=1.39
			wait(DebTime)
			Deb=false
		end
	end)
end
return Blood
    end)()
local Ignore={char,BLOODPARENT}
local Poses={
	{
		angles(math.rad(-15),math.rad(-20),math.rad(0)),
		cf(0.05,-.075,-0.1)*angles(math.rad(-2.5),math.rad(0),math.rad(-2.5)),
		cf(-0.1,-0.1,0)*angles(math.rad(3.5),math.rad(5),math.rad(2.5)),
		cf(0,-0.25,0.5)*angles(math.rad(40),math.rad(-50),math.rad(25)),
		cf(0.1,0.1,-0.2)*angles(math.rad(-5),math.rad(-30),math.rad(0)),
		cf(0,0,0)*angles(math.rad(0),math.rad(2.5),math.rad(0))
	}
}
--// Setup 2
Blood()
local Effects=ins("Model",{Name="Effects",Parent=Char})
ins("ForceField",{Parent=char,Visible=false})
local Ham=script.Data.Models.Sledgehammer Ham.Parent=char
local H1,H2,HE,HA,DR=Ham.Handle1,Ham.Handle2,Ham.Head,Ham.Handle,Ham.Dripper
local HamW=ins("Motor6D",{Part0=la,Part1=H1,C1=cf(-.1,.1,.85)*angles(90,0,0,true),Parent=ra})
if Player.UserId~=90745958 then Ham.CharmRing:Destroy() else Ham.CharmRing.Charm.CFrame=Ham.Handle.CFrame*cf(0,-Ham.Handle.Size.Y/2,0) Ham.CharmRing.Charm:SetNetworkOwner(Player) end
local Dust=script.Data.Models.Dust
local Theme=Sound(1370830572,.5,1,t,125,6.5,true)
--// Functions
function PlayAnimSingle(...)
	local Joints_={nec=nec,rutj=rutj,rs=rs,ls=ls,rh=rh,lh=lh,ham=HamW}
	local CFs_={necC0=necC0,necC1=necC1,rutjC0=rutjC0,rutjC1=rutjC1,rsC0=rsC0,rsC1=rsC1,lsC0=lsC0,lsC1=lsC1,rhC0=rhC0,rhC1=rhC1,lhC0=lhC0,lhC1=lhC1,hamC0=cf(),hamC1=cf(-.1,.1,.85)*angles(90,0,0,true)}
	for i,v in pairs({...}) do
		if Joints_[v[1]] then
			local T={}
			table.foreach(v[2],function(i,v) T[i]=v end)
			local C0=((CFs_[v[1].."C0"] or cf(0,0,0))*(T.C0 or cf(0,0,0))) or CFs_[v[1].."C0"]
			local C1=((CFs_[v[1].."C1"] or cf(0,0,0))*((T.C1 or cf(0,0,0))):Inverse())
			for i,v in pairs(T) do if i=="C0" then T.C0=C0 elseif i=="C1" then T.C1=C1 end end
			Tween(Joints_[v[1]],T,v[3])
		end
	end
end
function PlayAnim(Table,AddFuncs)
	AddFuncs=AddFuncs or {}
	local Waits=Table.Waits
	for i=1,#Table do
		local v=Table[i]
		if Waits[i] then
			local WaitTime=Waits[i]
			PlayAnimSingle(unpack(v))
			wait(WaitTime)
			if AddFuncs[i] then AddFuncs[i]() end
		end
	end
end
--// Moves
local function Hold()
	Holding=true
	Using=true
	CrossClient:FireClient("Event","ToggleTTM",true)
	Sound(({3929467655,3929467888})[random(1,2)],.4,random(.9,1.1,100),ra,35,5)
	PlayAnimSingle(unpack(Anims.Swing[1]))
	wait(Anims.Swing.Waits[1])
	Using=false
end
local function Swing()
	Using=true
	Holding=false
	Sound(2235655773,.275,random(.8,.9,100),HE,50,5).TimePosition=.35
	PlayAnimSingle(unpack(Anims.Swing[2]))
	wait(Anims.Swing.Waits[2])
	for i,v in pairs(workspace:GetDescendants()) do
		if (v:IsA("Accessory") or v:IsA("Hat")) and not v:IsDescendantOf(char) then
			table.insert(Ignore,v)
		end
	end
	local Hit,Pos,NID=Raycast(t.Position,Mouse.Hit.Position-t.Position,Ignore,6,true)
	if Hit then
		CrossClient:FireClient("Event","ToggleTTM",false)
		local P=ins("Part",{Anchored=true,CanCollide=false,Transparency=1,Size=v3(),CFrame=cf(Pos),Parent=Effects})
		local DPE=Dust:Clone() DPE.Parent=P DPE.Color=cs(Hit.Color)
		local Size=v3(1,1,1)*random(2,3.5,10)
		local H=Hit.Parent and Hit.Parent:FindFirstChildOfClass("Humanoid")
		if H then
			LastHitTick,BloodTrans=tick(),0
			DPE.Color=cs(bc("Crimson").Color) DPE.Lifetime=nr(.75,1.65)
			if Hit.Name=="Head" and random(0,1,3)==1 then Sound(4164190231,.75,random(.9,1.1,100),HE,100,5) Sound(({3848987400,4086174260})[random(1,2)],.5,random(.9,1.1,100),HE,65,5) end
			if H.Health>0 then Sound(4516612539,1.5,random(.9,1.1,100),HE,65,5) end
			Sound(({3784888301,3784889529})[random(1,2)],.5,random(.9,1.1,100),HE,75,6)
			Sound(4306991691,.2,random(.9,1.1,100),HE,65,6)
			Ragdoll:Ragdollify(H.Parent,true)
			for i,v in pairs({"Top","Bottom","Front","Back","Right","Left"}) do
				ins("Texture",{Texture="rbxassetid://2887707",Transparency=random(.35,.75,100),OffsetStudsU=random(-.75,.75,100),OffsetStudsV=random(-.75,.75,100),StudsPerTileU=random(.5,1.5,10),StudsPerTileV=random(.5,1.5,10),Face=v,Parent=Hit})
			end
			for i=1,random(4,15) do
				Blood.new(cf(Pos),v3(random(-7.5,7.5,100),random(-1.25,10,100),random(-7.5,7.5,100)),random(.35,1.5,100),H.Parent)
			end
			for i,v in pairs(Hit:GetTouchingParts()) do
				if v:IsDescendantOf(H.Parent) then
					Instance.Remove(ins("BodyVelocity",{Velocity=cf(HE.Position,Pos).LookVector*random(10,35,10),Parent=v}),.15)
				end
			end
		end
		PlayAnimSingle(unpack(Anims.Hit))
		Sound(3417831369,.25,random(.9,1.1,100),HE,50,6.5)
		if HitSounds[Hit.Material.Name] and not H then local SID=HitSounds[Hit.Material.Name] if type(SID)=="table" then SID=SID[random(1,#SID)] end Sound(SID,.75,random(.75,.9,100),HE,50,6.5) end
		DPE:Emit(random(5,12))
		for i,Hit in pairs(workspace:FindPartsInRegion3WithIgnoreList(Region3.new(Pos-Size/2,Pos+Size/2),Ignore,35)) do
			local P_,PA,IM=BN(Hit,Hit.CFrame:ToObjectSpace(cf(Pos)),Size,Hit.Parent)
			Instance.Remove(P,3)
			if i~=1 then continue end
			for i=1,random(4,12) do
				if H then
					local P=ins("Part",{Anchored=false,CanCollide=true,Size=(v3(random(.2,.5,100),random(.2,.5,100),random(.2,.5,100))*random(.75,1.25,100))/2,Locked=true,Material="Granite",Color=bc("Really red").Color,TopSurface=Hit.TopSurface,BottomSurface=Hit.BottomSurface,RightSurface=Hit.RightSurface,FrontSurface=Hit.FrontSurface,LeftSurface=Hit.LeftSurface,BackSurface=Hit.BackSurface,Transparency=Hit.Transparency,CFrame=cf(Pos)*angles(random(-180,180,10),random(-180,180,10),random(-180,180,10),true),Parent=PA})
					ins("SpecialMesh",{MeshType="Sphere",Scale=v3(2,2,2),Parent=P})
					Instance.Remove({ins("BodyVelocity",{Velocity=v3(random(-15,15,100),random(-15,15,100),random(-15,15,100)),Parent=P}),ins("BodyAngularVelocity",{AngularVelocity=v3(random(-15,15,100),random(-15,15,100),random(-15,15,100)),Parent=P})},.1)
					Instance.Remove(P,3.5)
					table.insert(Ignore,P)
					if random(0,1)==1 and Hit.Name=="Head" then
						local P=ins("WedgePart",{Anchored=false,CanCollide=true,Size=v3(random(.05,.125,1000),random(.15,.45,100),random(.25,.65,100))*random(.85,1.5,100),Locked=true,Material="Slate",Color=bc("White").Color,TopSurface=Hit.TopSurface,BottomSurface=Hit.BottomSurface,RightSurface=Hit.RightSurface,FrontSurface=Hit.FrontSurface,LeftSurface=Hit.LeftSurface,BackSurface=Hit.BackSurface,Transparency=Hit.Transparency,CFrame=cf(Pos)*angles(random(-180,180,10),random(-180,180,10),random(-180,180,10),true),Parent=PA})
						Instance.Remove({ins("BodyVelocity",{Velocity=v3(random(-15,15,100),random(-15,15,100),random(-15,15,100)),Parent=P}),ins("BodyAngularVelocity",{AngularVelocity=v3(random(-15,15,100),random(-15,15,100),random(-15,15,100)),Parent=P})},.1)
						Instance.Remove(P,3.5)
						table.insert(Ignore,P)
						for i,v in pairs(IM) do
							local C=v:Clone() C.Transparency=C.Transparency+.275 C.Parent=P
						end
					elseif random(0,1)==1 and (Hit.Name=="Torso" or Hit.Name=="UpperTorso") then
						for i=1,random(1,3) do
							local P=ins("Part",{Anchored=false,CanCollide=true,Size=(v3(random(.2,.65,100),random(.2,.65,100),random(.35,.85,100))*random(.75,1.25,100))/2,Locked=true,Material=({"Pebble","Granite"})[random(1,2)],Color=({bc("Dusty Rose").Color,bc("Br. yellowish orange").Color,bc("Sunrise").Color})[random(1,3)],TopSurface=Hit.TopSurface,BottomSurface=Hit.BottomSurface,RightSurface=Hit.RightSurface,FrontSurface=Hit.FrontSurface,LeftSurface=Hit.LeftSurface,BackSurface=Hit.BackSurface,Transparency=Hit.Transparency,CFrame=cf(Pos)*angles(random(-180,180,10),random(-180,180,10),random(-180,180,10),true),Parent=PA})
							ins("SpecialMesh",{MeshType="Sphere",Scale=v3(2,2,2),Parent=P})
							Instance.Remove({ins("BodyVelocity",{Velocity=v3(random(-15,15,100),random(-15,15,100),random(-15,15,100)),Parent=P}),ins("BodyAngularVelocity",{AngularVelocity=v3(random(-15,15,100),random(-15,15,100),random(-15,15,100)),Parent=P})},.1)
							Instance.Remove(P,3.5)
							table.insert(Ignore,P)
							for i,v in pairs({"Top","Bottom","Front","Back","Right","Left"}) do
								ins("Texture",{Texture="rbxassetid://1882220622",Transparency=random(.25,.65,100),OffsetStudsU=random(-.75,.75,100),OffsetStudsV=random(-.75,.75,100),StudsPerTileU=random(.5,1.5,10),StudsPerTileV=random(.5,1.5,10),Face=v,Parent=P})
							end
						end
					end
				else
					local P=ins("WedgePart",{Anchored=false,CanCollide=true,Size=v3(random(.05,.125,1000),random(.1,.3,100),random(.5,1,100))*random(1,2.5,100),Locked=true,Material=Hit.Material,Color=Hit.Color,TopSurface=Hit.TopSurface,BottomSurface=Hit.BottomSurface,RightSurface=Hit.RightSurface,FrontSurface=Hit.FrontSurface,LeftSurface=Hit.LeftSurface,BackSurface=Hit.BackSurface,Transparency=Hit.Transparency,CFrame=cf(Pos)*angles(random(-180,180,10),random(-180,180,10),random(-180,180,10),true),Parent=PA})
					Instance.Remove({ins("BodyVelocity",{Velocity=v3(random(-15,15,100),random(-15,15,100),random(-15,15,100)),Parent=P}),ins("BodyAngularVelocity",{AngularVelocity=v3(random(-15,15,100),random(-15,15,100),random(-15,15,100)),Parent=P})},.1)
					Instance.Remove(P,3.5)
					table.insert(Ignore,P)
					for i,v in pairs(IM) do
						v:Clone().Parent=P
					end
				end
			end
		end
		wait(.3)
	else
		CrossClient:FireClient("Event","ToggleTTM",false)
		PlayAnimSingle(unpack(Anims.NoHit))
		wait(.15)
	end
	Using=false
end
--[[local function Swing()
	Using=true
	CrossClient:FireClient("Event","ToggleTTM",true)
	Sound(({3929467655,3929467888})[random(1,2)],.4,random(.9,1.1,100),ra,35,5)
	PlayAnim(Anims.Swing,{
		[1]=function()
			Sound(2235655773,.275,random(.8,.9,100),HE,50,5).TimePosition=.25
		end,
		[2]=function()
			local Hit,Pos,NID=Raycast(t.Position,Mouse.Hit.Position-t.Position,Ignore,6,true)
			if Hit then
				CrossClient:FireClient("Event","ToggleTTM",false)
				local P=ins("Part",{Anchored=true,CanCollide=false,Transparency=1,Size=v3(),CFrame=cf(Pos),Parent=Effects})
				local DPE=Dust:Clone() DPE.Parent=P DPE.Color=cs(Hit.Color)
				local H=Hit.Parent:FindFirstChildOfClass("Humanoid")
				if H then
					DPE.Color=cs(bc("Crimson").Color) DPE.Lifetime=nr(.75,1.65)
					Sound(({3784888301,3784889529})[random(1,2)],.5,random(.9,1.1,100),HE,75,6)
					Sound(4306991691,.2,random(.9,1.1,100),HE,65,6)
					Ragdoll:Ragdollify(H.Parent,true)
					for i,v in pairs({"Top","Bottom","Front","Back","Right","Left"}) do
						print()
						ins("Texture",{Texture="rbxassetid://2887707",Transparency=random(.35,.75,100),OffsetStudsU=random(-.75,.75,100),OffsetStudsV=random(-.75,.75,100),StudsPerTileU=random(.5,1.5,10),StudsPerTileV=random(.5,1.5,10),Face=v,Parent=Hit})
					end
					for i=1,random(4,15) do
						Blood.new(cf(Pos),v3(random(-7.5,7.5,100),random(-1.25,10,100),random(-7.5,7.5,100)),random(.35,1.5,100),H.Parent)
					end
					for i,v in pairs(Hit:GetTouchingParts()) do
						if v:IsDescendantOf(H.Parent) then
							Instance.Remove(ins("BodyVelocity",{Velocity=cf(HE.Position,Pos).LookVector*random(10,35,10),Parent=v}),.15)
						end
					end
				end
				PlayAnimSingle(unpack(Anims.Hit))
				Sound(3417831369,.25,random(.9,1.1,100),HE,50,6.5)
				if HitSounds[Hit.Material.Name] and not H then local SID=HitSounds[Hit.Material.Name] if type(SID)=="table" then SID=SID[random(1,#SID)] end Sound(SID,.75,random(.75,.9,100),HE,50,6.5) end
				local P_,PA,IM=BN(Hit,Hit.CFrame:ToObjectSpace(cf(Pos)),v3(1,1,1)*random(2,3.5,10),Hit.Parent)
				DPE:Emit(random(5,12))
				Instance.Remove(P,3)
				for i=1,random(4,12) do
					local P=ins("WedgePart",{Anchored=false,CanCollide=true,Size=v3(random(.05,.125,1000),random(.1,.3,100),random(.5,1,100))*random(1,2.5,100),Locked=true,Material=Hit.Material,Color=Hit.Color,TopSurface=Hit.TopSurface,BottomSurface=Hit.BottomSurface,RightSurface=Hit.RightSurface,FrontSurface=Hit.FrontSurface,LeftSurface=Hit.LeftSurface,BackSurface=Hit.BackSurface,Transparency=Hit.Transparency,CFrame=cf(Pos)*angles(random(-180,180,10),random(-180,180,10),random(-180,180,10),true),Parent=PA})
					Instance.Remove({ins("BodyVelocity",{Velocity=v3(random(-15,15,100),random(-15,15,100),random(-15,15,100)),Parent=P}),ins("BodyAngularVelocity",{AngularVelocity=v3(random(-15,15,100),random(-15,15,100),random(-15,15,100)),Parent=P})},.1)
					Instance.Remove(P,3.5)
					table.insert(Ignore,P)
					if H then
						P.Color=bc("Maroon").Color
						P.Material="Granite"
						P.Size=P.Size*random(.5,.75,100)
					end
					for i,v in pairs(IM) do
						v:Clone().Parent=P
					end
				end
				wait(.3)
			else
				CrossClient:FireClient("Event","ToggleTTM",false)
				PlayAnimSingle(unpack(Anims.NoHit))
				wait(.15)
			end
		end
	})
	Using=false
end]]
--// Connections
UIS.InputBegan:Connect(nil,function(IO,L)
	if IO.UserInputType==Enum.UserInputType.MouseButton1 and not L then
		if Using then return end
		Hold()
	elseif IO.UserInputType==Enum.UserInputType.Keyboard then
		if L then return end
		if IO.KeyCode==Enum.KeyCode.M then
			Muted=not Muted
		elseif IO.KeyCode==Enum.KeyCode.N then
			MPos=MPos+1
		elseif IO.KeyCode==Enum.KeyCode.B then
			MPos=MPos-1
		end
		if MPos==0 then MPos=#Music elseif MPos==#Music+1 then MPos=1 end
	end
end)
UIS.InputEnded:Connect(nil,function(IO,L)
	if IO.UserInputType==Enum.UserInputType.MouseButton1 and Holding then
		if Using then repeat game:GetService("RunService").Heartbeat:Wait() until not Using end
		Swing()
	end
end)
game:GetService("RunService").Heartbeat:Connect(function()
	if Theme.Parent~=t then
		Instance.Remove(Theme)
		Theme=Sound(656478412,.5,1,t,125,6.5,true)
		Theme.TimePosition=TimePos
	end
	if Holding and tick()-LastTick>.15 then
		PlayAnimSingle(unpack(Anims.Swing[1]))
	end
	Theme.SoundId,Theme.Volume,Theme.Pitch,Theme.Looped,Theme.Playing,TimePos="rbxassetid://"..Music[MPos],Muted and 0 or .5,1,true,true,Theme.TimePosition
	Sine=Sine+Change
	local Direction=hum.MoveDirection
	if Direction.Magnitude==0 then Direction=t.Velocity/7.5 end
	local MoveZ=clamp((Direction*t.CFrame.LookVector).X+(Direction*t.CFrame.LookVector).Z,-1,1)
	local MoveX=clamp((Direction*t.CFrame.RightVector).X+(Direction*t.CFrame.RightVector).Z,-1,1)
	local Moving=(t.Velocity*v3(1,0,1)).Magnitude>.01
	local VerY=t.Velocity.Y
	local StandR,RPos,RNID=Raycast(t.CFrame*cf(t.Size.X/4,-t.Size.Y/2,0).Position,-HRP.CFrame.UpVector,{char},4,false)
	local StandL,LPos,LNID=Raycast(t.CFrame*cf(-t.Size.X/4,-t.Size.Y/2,0).Position,-HRP.CFrame.UpVector,{char},4,false)
	local Stand=StandR or StandL
	local Ang=cf(t.Position,Mouse.Hit.Position).LookVector
	hum.WalkSpeed,hum.JumpPower=(LockWS and WS or hum.WalkSpeed),(LockJP and JP or hum.JumpPower)
	DR.PE.Enabled=BloodTrans<=.5
	for i,v in pairs(HE:GetChildren()) do if v:IsA("Texture") then v.Transparency=BloodTrans end end
	BloodTrans=tick()-LastHitTick>3 and BloodTrans+.002 or BloodTrans
	if BloodTrans<.5 and random(0,1,25)==1 then Blood.new(DR.CFrame,v3(0,0,0),random(.1,.175,1000)) end
	if not Moving and Stand then
		Change=1
		local IdleVal=20
		local CF=(t.CFrame*rsC0*cf(-.25,-.65,0)):ToObjectSpace(cf(t.CFrame*rsC0*cf(0,-.65,0).Position,H2.Position))
		local X,Y,Z=(CF-CF.Position):ToOrientation()
		nec.C0=nec.C0:Lerp(necC0*cf(0,0,0)*angles(sin(Sine/IdleVal)*2,cotan(Sine/(IdleVal*3))*7.5,0,true)*Poses[1][1],.1)
		rutj.C0=rutj.C0:Lerp(rutjC0*cf(0,-1,0)*angles(Ang.Y/2,0,0)*cf(0,1,0)*cf(0,.05*cos(Sine/IdleVal),.05*cotan(Sine/IdleVal))*angles(cotan(Sine/IdleVal)*2,sin(Sine/(IdleVal*3.5))*2.5,cotan(Sine/(IdleVal*2))*-4,true)*Poses[1][2],.1)
		--rs.C0=rs.C0:Lerp(rsC0*cf(0,-.05*cos(Sine/IdleVal),0)*angles(sin(Sine/IdleVal)*2.25,-sin(Sine/(IdleVal*3.5))*2.5,sin(Sine/IdleVal)*1.5,true)*Poses[1][3],.1)
		rs.C0=rs.C0:Lerp(rsC0*cf(-.25,-.65,0)*angles(X,0,Z)*angles(90,0,-20,true)*cf(0,1.5,0)*cf(0,-((t.CFrame*rsC0*cf(-.25,-.65,0)).Position-H2.Position).Magnitude,0),.65)
		ls.C0=ls.C0:Lerp(lsC0*cf(0,-.05*cos(Sine/IdleVal),0)*angles(sin(Sine/IdleVal)*2.25,-sin(Sine/(IdleVal*3.5))*2.5,sin(Sine/IdleVal)*-1.5,true)*Poses[1][4],.1)
		rh.C0=rh.C0:Lerp(rhC0*angles(-Ang.Y/2,0,0)*cf(0,-.05*cos(Sine/IdleVal)+.025*cotan(Sine/(IdleVal*2)),0)*angles(cotan(Sine/IdleVal)*-2+sin(Sine/(IdleVal*3.5))*-1.25,0,cotan(Sine/(IdleVal*2))*6.5,true)*Poses[1][5],.1)
		lh.C0=lh.C0:Lerp(lhC0*angles(-Ang.Y/2,0,0)*cf(0,-.05*cos(Sine/IdleVal)-.025*cotan(Sine/(IdleVal*2)),0)*angles(cotan(Sine/IdleVal)*-2+sin(Sine/(IdleVal*3.5))*1.25,0,cotan(Sine/(IdleVal*2))*6.5,true)*Poses[1][6],.1)
	elseif Moving and Stand then
		local WSVal=6/clamp(hum.WalkSpeed/16,.25,2)*t.Size.Y/2
		local CF=(t.CFrame*rsC0*cf(-.25,-.65,0)):ToObjectSpace(cf(t.CFrame*rsC0*cf(0,-.65,0).Position,H2.Position))
		local X,Y,Z=(CF-CF.Position):ToOrientation()
		Change=1
		nec.C0=nec.C0:Lerp(necC0*cf(0,0,0)*angles(sin(Sine/(WSVal/2))*2.5,0,0,true)*cf(0,0,0)*angles(5*MoveZ,-60*MoveX,0,true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3) --*cf((VerY/7.5)*MoveX,1*clamp(abs(VerY),0,1),(-VerY/7.5)*MoveZ)
		rutj.C0=rutj.C0:Lerp(rutjC0*cf(0,-1,0)*angles(Ang.Y/2,0,0)*cf(0,1,0)*cf(0,-2,0)*angles(VerY*2.5*MoveZ,0,VerY*2.5*MoveX,true)*cf(0,2,0)*cf(0,1*cos(Sine/(WSVal/2)),0)*angles(cotan(Sine/(WSVal/2))*22.5,sin(Sine/WSVal)*10,0,true)*cf(0,0,0)*angles(-10*MoveZ,0,-10*MoveX,true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		--rs.C0=rs.C0:Lerp(rsC0*cf(0,0,.5*sin(Sine/WSVal)*MoveZ)*angles(-cotan(Sine/WSVal)*120*MoveZ,0,0,true)*angles(0,-cotan(Sine/WSVal)*70*MoveZ,0,true)*cf(-.15,0,0)*angles(10,0,-10*abs(MoveZ),true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		rs.C0=rs.C0:Lerp(rsC0*cf(-.25,-.65,0)*angles(X,0,Z)*angles(90,0,-20,true)*cf(0,1.5,0)*cf(0,-((t.CFrame*rsC0*cf(-.25,-.65,0)).Position-H2.Position).Magnitude,0),.65)
		ls.C0=ls.C0:Lerp(lsC0*cf(0,-.05*cos(Sine/WSVal),0)*angles(sin(Sine/WSVal)*2.25,-sin(Sine/(WSVal*3.5))*2.5,sin(Sine/WSVal)*-1.5,true)*Poses[1][4],.1)
		rh.C0=rh.C0:Lerp(rhC0*angles(-Ang.Y/2,0,0)*cf(0,.1+.75*cos(Sine/WSVal),-.2-.9*cos(Sine/WSVal))*angles(cotan(Sine/WSVal)*190*MoveZ,0,cotan(Sine/WSVal)*160*MoveX,true)*cf(0,0,0)*angles(-7.5*abs(MoveZ),0,0,true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		lh.C0=lh.C0:Lerp(lhC0*angles(-Ang.Y/2,0,0)*cf(0,.1+-.75*cos(Sine/WSVal),-.2+.9*cos(Sine/WSVal))*angles(-cotan(Sine/WSVal)*190*MoveZ,0,-cotan(Sine/WSVal)*160*MoveX,true)*cf(0,0,0)*angles(-7.5*abs(MoveZ),0,0,true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		--thanks to kyu or neb.. whatever
		if cos(Sine/WSVal)/2>.2 and Step=="L" then
			Step="R"
			if StandR then
				local SoundId=StepSounds[StandR.Material.Name] or 0
				if StandR.Material=="Sand" and (StandR.Color.r>.7 and StandR.Color.g>.7 and StandR.Color.b>.7) then
					SoundId=StepSounds["Snow"]
				end
				if StandR.Name=="Water" then SoundId=StepSounds.Water end
				local SizeVal=StandR.Size*RNID
				if SoundId==941640049 then
					SizeVal=SizeVal/2
				end
				Sound(SoundId,(.35*clamp((WSVal)/1.5,.5,3.5))/clamp(math.max(SizeVal.X,SizeVal.Y,SizeVal.Z),.5,1.25),random(.9,1.1,100)*clamp(math.max(SizeVal.X,SizeVal.Y,SizeVal.Z)/10,.5,1.2)*clamp((WSVal)/1.5,.5,2),t)
			end
		end
		if cos(Sine/WSVal)/2<-.2 and Step=="R" then
			Step="L"
			if StandL then
				local SoundId=StepSounds[StandL.Material.Name] or 0
				if StandL.Material==Enum.Material.Sand and (StandL.Color.r>.7 and StandL.Color.g>.7 and StandL.Color.b>.7) then
					SoundId=StepSounds["Snow"]
				end
				if StandL.Name=="Water" then SoundId=StepSounds.Water end
				local SizeVal=StandL.Size*LNID
				if SoundId==941640049 then
					SizeVal=SizeVal/2
				end
				Sound(SoundId,(.35*clamp((WSVal)/1.5,.5,3.5))/clamp(math.max(SizeVal.X,SizeVal.Y,SizeVal.Z),.5,1.25),random(.9,1.1,100)*clamp(math.max(SizeVal.X,SizeVal.Y,SizeVal.Z)/10,.5,1.2)*clamp((WSVal)/1.5,.5,2),t)
			end
		end
		--[[
		nec.C0=nec.C0:Lerp(necC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		rutj.C0=rutj.C0:Lerp(rutjC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		rs.C0=rs.C0:Lerp(rsC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		ls.C0=ls.C0:Lerp(lsC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		rh.C0=rh.C0:Lerp(rhC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		lh.C0=lh.C0:Lerp(lhC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		
		nec.C0=nec.C0:Lerp(necC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.2/(t.Size.Y/2)*(WSVal)/3)
		rutj.C0=rutj.C0:Lerp(rutjC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.2/(t.Size.Y/2)*(WSVal)/3)
		rs.C0=rs.C0:Lerp(rsC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.2/(t.Size.Y/2)*(WSVal)/3)
		ls.C0=ls.C0:Lerp(lsC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.2/(t.Size.Y/2)*(WSVal)/3)
		rh.C0=rh.C0:Lerp(rhC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.2/(t.Size.Y/2)*(WSVal)/3)
		lh.C0=lh.C0:Lerp(lhC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.2/(t.Size.Y/2)*(WSVal)/3)
		
		-																									-
		
		Joints.Neck.C0=Joints.Neck.C0:Lerp(Joints.Neck.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.Root.C0=Joints.Root.C0:Lerp(Joints.Root.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.Waist.C0=Joints.Waist.C0:Lerp(Joints.Waist.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.RightShoulder.C0=Joints.RightShoulder.C0:Lerp(Joints.RightShoulder.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.RightElbow.C0=Joints.RightElbow.C0:Lerp(Joints.RightElbow.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.RightWrist.C0=Joints.RightWrist.C0:Lerp(Joints.RightWrist.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.LeftShoulder.C0=Joints.LeftShoulder.C0:Lerp(Joints.LeftShoulder.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.LeftElbow.C0=Joints.LeftElbow.C0:Lerp(Joints.LeftElbow.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.LeftWrist.C0=Joints.LeftWrist.C0:Lerp(Joints.LeftWrist.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.RightHip.C0=Joints.RightHip.C0:Lerp(Joints.RightHip.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.RightKnee.C0=Joints.RightKnee.C0:Lerp(Joints.RightKnee.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.RightAnkle.C0=Joints.RightAnkle.C0:Lerp(Joints.RightAnkle.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.LeftHip.C0=Joints.LeftHip.C0:Lerp(Joints.LeftHip.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.LeftKnee.C0=Joints.LeftKnee.C0:Lerp(Joints.LeftKnee.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.LeftAnkle.C0=Joints.LeftAnkle.C0:Lerp(Joints.LeftAnkle.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		--]]
	elseif not Stand then
		local CF=(t.CFrame*rsC0*cf(-.25,-.65,0)):ToObjectSpace(cf(t.CFrame*rsC0*cf(0,-.65,0).Position,H2.Position))
		local X,Y,Z=(CF-CF.Position):ToOrientation()
		Change=1
		nec.C0=nec.C0:Lerp(necC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(clamp(hrp.Velocity.Y,-15,15),0,0,true),.2)
		rutj.C0=rutj.C0:Lerp(rutjC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(clamp(hrp.Velocity.Y,-30,20),0,0,true),.2)
		rs.C0=rs.C0:Lerp(rsC0*cf(-.25,-.65,0)*angles(X,0,Z)*angles(90,0,-20,true)*cf(0,1.5,0)*cf(0,-((t.CFrame*rsC0*cf(-.25,-.65,0)).Position-H2.Position).Magnitude,0),.65)
		ls.C0=ls.C0:Lerp(lsC0*cf(0,-.05*cos(Sine/20),0)*angles(sin(Sine/20)*2.25,-sin(Sine/(20*3.5))*2.5,sin(Sine/20)*-1.5,true)*Poses[1][4],.1)
		rh.C0=rh.C0:Lerp(rhC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,.4,-.35)*angles(-10,-5,5,true),.2)
		lh.C0=lh.C0:Lerp(lhC0*cf(0,0,0)*angles(clamp(-hrp.Velocity.Y,-25,35),0,0,true)*cf(0,.2,-.15)*angles(-2.5,5,-5,true),.2)
	end
	if Type=="R6" then
		nec.C1=nec.C1:Lerp(necC1,.2)
		rutj.C1=rutj.C1:Lerp(rutjC1,.2)
		rs.C1=rs.C1:Lerp(rsC1,.2)
		ls.C1=ls.C1:Lerp(lsC1,.2)
		rh.C1=rh.C1:Lerp(rhC1,.2)
		lh.C1=lh.C1:Lerp(lhC1,.2)
		HamW.C0=HamW.C0:Lerp(cf(),.2)
		necC0,necC1=cf(0,t.Size.Y/2,0),cf(0,-h.Size.Y/2,0)
		rutjC0,rutjC1=cf(0,0,0),cf(0,0,0)
		rsC0,rsC1=cf(t.Size.X/2,t.Size.Y/4,0),cf(-ra.Size.X/2,ra.Size.Y/4,0)
		lsC0,lsC1=cf(-t.Size.X/2,t.Size.Y/4,0),cf(la.Size.X/2,la.Size.Y/4,0)
		rhC0,rhC1=cf(t.Size.X/4,-t.Size.Y/2,0),cf(0,rl.Size.Y/2,0)
		lhC0,lhC1=cf(-t.Size.X/4,-t.Size.Y/2,0),cf(0,ll.Size.Y/2,0)
	end
end)

--//SClient
local Player,UIS,Mouse=game:GetService("Players").LocalPlayer,game:GetService("UserInputService")
Mouse=Player:GetMouse()
local Rem=script.Data.Scripts.SClient.Input
local InfoRef=Rem.InfoRef
local Values=script.Data.Scripts.SClient.Values
local HeadFollow=(Values.HeadFollow or{Value=false}).Value
local Resetted=false
local Char=Player.Character
local H=Char.Head
local T=Char.Torso
local RA=Char["Right Arm"]
local LA=Char["Left Arm"]
local RL=Char["Right Leg"]
local LL=Char["Left Leg"]
local Hum=Char:FindFirstChildOfClass("Humanoid")
local HRP=Char.HumanoidRootPart
local Ham=Char:WaitForChild("Sledgehammer")
local CSFuncs={Events={},Functions={}}
function CreateCSFunc(Type,Name,Func)
	if CSFuncs[Type.."s"] then
		CSFuncs[Type.."s"][Name]=Func
		return Func
	end
end
function CSFire(self,AT,Name,...)
	if not self then return end
	if AT=="S" then
		return Rem:FireServer(nil,false,AT,Name,...)
	elseif AT=="R" then
		return InfoRef:InvokeServer(AT,Name,...)
	end
end
function CSTrig(self,Type,Name,...)
	if not self then return end
	if CSFuncs[Type.."s"] and CSFuncs[Type.."s"][Name] then
		return CSFuncs[Type.."s"][Name](...)
	end
end
CSFuncs.new=CreateCSFunc
CSFuncs.Fire=CSFire
CSFuncs.Trigger=CSTrig
for i,v in pairs(workspace:GetDescendants()) do
	if v:IsA("Part") and (v.Parent:IsA("Accessory") or v.Parent:IsA("Hat")) then
		v.Size=Vector3.new()
	end
end
--// Free space for CrossServer functions \\
local TurnToggled=false
CSFuncs.new("Event","ToggleTTM",function(Bool)
	TurnToggled=Bool
end)
UIS.InputBegan:Connect(function(IO,L) Rem:FireServer({UserInputState=IO.UserInputState,KeyCode=IO.KeyCode,UserInputType=IO.UserInputType},L) end)
UIS.InputEnded:Connect(function(IO,L) Rem:FireServer({UserInputState=IO.UserInputState,KeyCode=IO.KeyCode,UserInputType=IO.UserInputType},L) end)
game:GetService("RunService").Heartbeat:Connect(function()
	HeadFollow=(Values.HeadFollow or{Value=false}).Value
	if HeadFollow then
		Resetted=false
		Hum.CameraOffset=Hum.CameraOffset:Lerp((HRP.CFrame*CFrame.new(0,1.5,0)):PointToObjectSpace(H.Position),.125)
	elseif not HeadFollow and not Resetted then
		Resetted=true
		Hum.CameraOffset=Vector3.new()
	end
	if TurnToggled and UIS.MouseBehavior~=Enum.MouseBehavior.LockCenter then
		HRP.CFrame=CFrame.new(HRP.Position,Vector3.new(Mouse.Hit.X,HRP.Position.Y,Mouse.Hit.Z))
	end
	for i,v in pairs(Ham:GetDescendants()) do
		if v:IsA("BasePart") then
			v.LocalTransparencyModifier=0
		end
	end
	if H.LocalTransparencyModifier~=0 then Values.HeadFollow.Value=true else Values.HeadFollow.Value=false end
end)
workspace.DescendantAdded:Connect(function(v)
	if v:IsA("Part") and (v.Parent:IsA("Accessory") or v.Parent:IsA("Hat")) then
		v.Size=Vector3.new()
	end
end)
Rem.OnClientEvent:Connect(function(Name,...)
	return CSFuncs:Trigger("Event",Name,...)
end)
InfoRef.OnClientInvoke=function(Name,...)
	return CSFuncs:Trigger("Function",Name,...)
end
while wait(1/30) do
	Rem:FireServer({Mouse=true,Hit=Mouse.Hit,Target=Mouse.Target,Origin=Mouse.Origin})
end


