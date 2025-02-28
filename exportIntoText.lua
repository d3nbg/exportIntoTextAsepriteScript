local filepath = "C:/Users/Denis/Pictures"

local activeSprite = app.sprite
local lay = app.activeLayer

local imgWidth = activeSprite.width
local imgHeight = activeSprite.height

startFrame = 1
resultString = ""


local d = Dialog("Export Tilemap as .txt File")
d:file{id = "path", label="Export Path", filename="",open=false,filetypes={"txt"}, save=true, focus=true}
 :entry{id="frameSeparator",label="frameSeparator",text="*"}
 :entry{id="drawchar",label="drawchar",text="o"}
 :button{id="ok",text="&OK",focus=true}
 :button{text="&Cancel" }
 :show()

for _, c in ipairs(lay.cels) do
	local img = c.image
	--print("img")
	--print(c.frameNumber)
	for y=0, imgHeight-1, 1 do
	

		for x=0 , imgWidth -1, 1 do
		
			--print(x..", ".. y.." "..c.frameNumber.." "..img:getPixel(x,y))
			--print(x .. " ")
			--if(startFrame ~= c.frameNumber) then
			--	startFrame = c.frameNumber
			--	resultString = resultString .. d.data.frameSeparator .."\n"
			--end
			
			if(img:getPixel(x,y) ==4278190080) then
			
				
				resultString = resultString .. d.data.drawchar
				
			else
				resultString = resultString .. " "
				
			end
			
			if(x == imgWidth -1) then
				resultString = resultString .. "\n"
			end
		end
	end
	
	resultString = resultString .. d.data.frameSeparator .."\n"
end

file = io.open(d.data.path, "w")
file:write(resultString)
file:close()

print(resultString)

--print(app.frame.frameNumber)
--print(activeImage.frames[2])
--local frame = sprite:newFrame(3)
--
--if not activeImage then return print("active Image not found :(") 
--
--else
--	print("active Image found :)") 
--end
--
--outputstring = ""
--
--
--
--
--print("imgWidth: "..imgWidth..", imgHeight: "..imgHeight)
--
--print(activeImage.cels)
--

--
--io.open(d.data.path,"w")
 
--for y=0, imgHeight, 1 do
--	for x=0, imgWidth, 1 do
--	
--		
--		print(x..", ".. y.." ".. activeImage:getPixel(x,y))
--		
--	end
--end

--for p in activeImage:pixels() do
--
--	print(p)
--
--end



--local file, err = io.open(filepath, 