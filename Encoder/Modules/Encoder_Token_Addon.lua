--Token Desginator
--By Tipsy Hobbit
encVersion = 1.2
pID = "MTG_Token"

function onload()
  self.createButton({
  label="+", click_function='registerModule', function_owner=self,
  position={0,0.2,-0.5}, height=100, width=100, font_size=100,
  rotation={0,0,0},tooltip=""
  })
end


function registerModule()
  enc = Global.getVar('Encoder')
  if enc ~= nil then
    properties = {
    propID = pID,
    name = "Is Token",
    dataStruct = {},
    funcOwner = self,
    callOnActivate = false,
    activateFunc =''
    }
    enc.call("APIregisterProperty",properties)
  end
end

function createButtons(t)
  enc = Global.getVar('Encoder')
  if enc ~= nil then
    flip = enc.call("APIgetFlip",{obj=t.object})
    scaler = {x=1,y=1,z=1}--t.object.getScale()
    temp = " Token "
    barSize,fsize,offset_x,offset_y = enc.call('APIformatButton',{str=temp,font_size=90,max_len=90,xJust=0,yJust=0})
    t.object.createButton({
    label=temp, click_function='doNothing', function_owner=self,
    position={(0+offset_x)*flip*scaler.x,0.28*flip*scaler.z,(-1.65+offset_y)*scaler.y}, height=170, width=barSize, font_size=fSize,
    rotation={0,0,90-90*flip}
    })
  end
end

function doNothing()
end
