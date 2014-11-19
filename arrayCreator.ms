plugin simpleObject fastArray
	name: "fastArray"
	classid:#(0x20934682, 0x57232de5)
	category: "Custom Plugins"
	
	(--start plugin
		parameters main rollout:boxParams
		(--start parameters boxParams
			length type:#float default:1 ui:spn_length
			width type:#float default:1 ui:spn_width
			thickness type:#float default:1 ui:spn_thickness
		)--end parameters box
		parameters main rollout:roCloner
		(--start parameters arrayParams
		objCount type:#float default:30 ui:spn_objCount
		arrayXOffset type:#float default:0 ui:spn_arrayXOffset
		arrayYOffset type:#float default:0 ui:spn_arrayYOffset
		)--end parameters array
		------------------------------------------------------------
		------------------------------------------------------------
		------------------------------------------------------------
		rollout boxParams "Box Parameters"
		( --start rollout boxParams
			spinner spn_length "Length" range:[0,100000,0]
			spinner spn_width "Width" range:[0,100000,0]
			spinner spn_thickness "Thickness" range:[0.01,100000,0]
		)--end rollout boxParams
	
		rollout roCloner "Array Creator"
		(--start roCloner
			
		fn CloneAndSelect objArray type = (--start fn
		currObjs = objects.count
		case type of ( --startcase
			1: copy objArray
			2: instance objArray
			3: reference objArray
		)--end case
		newObjs = for i = (currObjs) to objects.count collect objects[i]
		select newObjs
		)--end fn
		
		group "Type"
		(--start group Type
		radiobuttons clone labels:#("Copy", "Instance","Reference")
		)--end group Type
		
		group "Options"
		(
		spinner spn_arrayXOffset "X offset" range:[0,10000,1] type:#integer
		spinner spn_arrayYOffset "Y offset" range:[0,10000,1] type:#integer
		spinner spn_objCount "Elements:" range:[1,100,50] type:#integer 
		)
		
		button btnDO "Clone" width:50 align:#center
		button animDO "Animate" width:50 align:#center
		
		on btndo pressed do
		( --start btndo 
			mm = multimaterial numsubs:2 name:"Switch"
		mm.names = #("on", "off")
		mm[1].diffuse = mm[1].ambient = black
		mm[1].selfIllumAmount = 50
		mm[2].diffuse = mm[2].ambient = white
		mm[2].selfIllumAmount = 100

		objArray = $fastarray* as array -- make "shortcut"
		objArray.mat = mm
			for obj in objArray do
				addModifier obj (materialModifier name:"MatMod")
		objs = selection as array
		if objs.count > 0 do
		(--start if
			num = spn_objCount.value
			type = Clone.state
			objArray = #()
			for c = 1 to num do (--start for
				CloneAndSelect objs type
				join objArray (getCurrentSelection())
			)--end for
			--select objArray
		)--end if
			for i=1 to num do (
			if i<10 then
					stri ="0"+ i as string
				else
					stri = i as string
			rnd = random 2 10;
			offx = spn_arrayXOffset.value
			offy = spn_arrayYOffset.value 
			tempobj= getNodebyName ("fastArray" + stri);
			tempma3x = tempobj.transform
			tempma3x.row4 += [(tempobj.width*i+offx*i),offy*i,0]
			tempobj.transform = tempma3x
			tempobj.thickness += rnd
			max select none
			)
		

		)--end btndo
		
	
	
		on animDO pressed do (
			num = spn_objCount.value
			animationRange = interval 0 200
			frameRate = 30
			set animate on
			set time 20f
			for i=1 to num do (
			if i<10 then
					stri ="0"+ i as string
				else
					stri = i as string
			rnd = random 2 50;
			--rndarray = #();
			tempobj= getNodebyName ("fastArray" + stri);
			tempobj.thickness = rnd
			--append rndarray tempobj.thickness
			max select none
			)
		set time 40f
		for i=1 to num do (
			if i<10 then
					stri ="0"+ i as string
				else
					stri = i as string
			rnd = random 2 50;
			tempobj= getNodebyName ("fastArray" + stri);
			tempobj.thickness = rnd
			max select none
		)
set time 60f
for i=1 to num do (
			if i<10 then
					stri ="0"+ i as string
				else
					stri = i as string
			rnd = random 2 50;
			tempobj= getNodebyName ("fastArray" + stri);
			tempobj.thickness = rnd
			max select none
		)
	set time 80f
for i=1 to num do (
			if i<10 then
					stri ="0"+ i as string
				else
					stri = i as string
			rnd = random 2 50;
			tempobj= getNodebyName ("fastArray" + stri);
			tempobj.thickness = rnd
			max select none
		)	
		set time 100f
for i=1 to num do (
			if i<10 then
					stri ="0"+ i as string
				else
					stri = i as string
			rnd = random 2 50;
			tempobj= getNodebyName ("fastArray" + stri);
			tempobj.thickness = rnd
			max select none
		)
		set time 120f
for i=1 to num do (
			if i<10 then
					stri ="0"+ i as string
				else
					stri = i as string
			rnd = random 2 50;
			tempobj= getNodebyName ("fastArray" + stri);
			tempobj.thickness = rnd
			max select none
		)
		set time 140f
for i=1 to num do (
			if i<10 then
					stri ="0"+ i as string
				else
					stri = i as string
			rnd = random 2 50;
			tempobj= getNodebyName ("fastArray" + stri);
			tempobj.thickness = rnd
			max select none
		)
		set time 160f
for i=1 to num do (
			if i<10 then
					stri ="0"+ i as string
				else
					stri = i as string
			rnd = random 2 50;
			tempobj= getNodebyName ("fastArray" + stri);
			tempobj.thickness = rnd
			max select none
		)
		set time 180f
for i=1 to num do (
			if i<10 then
					stri ="0"+ i as string
				else
					stri = i as string
			rnd = random 2 50;
			tempobj= getNodebyName ("fastArray" + stri);
			tempobj.thickness = rnd
			max select none
		)
		set time 200f
for i=1 to num do (
			if i<10 then
					stri ="0"+ i as string
				else
					stri = i as string
			rnd = random 2 50;
			tempobj= getNodebyName ("fastArray" + stri);
			tempobj.thickness = rnd
			max select none
		)
set animate off
set time off

-- animate materialID's
with animate on (
for t = 0 to 200 do (
sliderTime = t
	for i=1 to num do (
			if i<10 then
					stri ="0"+ i as string
				else
					stri = i as string
			tempobj= getNodebyName ("fastArray" + stri);
if (tempobj.thickness>=25)  then
tempobj.modifiers[#MatMod].materialID = 1
else 
tempobj.modifiers[#MatMod].materialID = 2
)
)
)

playAnimation()
)
		)--end roCloner

		on buildMesh do
		(
			bottomBox = createInstance box width:width length:length height:thickness
			mesh = bottomBox.mesh
		)--on buildMesh
		
		tool create
		(
			on mousePoint click do 
			(
				case click of 
				(
					1: nodeTM.translation = gridPoint
					2:#stop
				)
			)
			on mouseMove click do
			(
				case click of
				(
				2:(width	= abs gridDist.x*2; length= abs gridDist.y*2)
				)--end case
			)--end mouseMove
		)--end tool
	)--endplugin

