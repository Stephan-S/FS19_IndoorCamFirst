IndoorCamFirst = {};
IndoorCamFirst.Version = "1.0.0.0";
local myName = "FS19_IndoorCamFirst";

IndoorCamFirst.directory = g_currentModDirectory;

function IndoorCamFirst:prerequisitesPresent(specializations)
    return true;
end;

function IndoorCamFirst:delete()	

end;

function IndoorCamFirst:loadMap(name)		
end;

function IndoorCamFirst.registerEventListeners(vehicleType)    
  for _,n in pairs( {"onEnterVehicle"} ) do
    SpecializationUtil.registerEventListener(vehicleType, n, IndoorCamFirst)
  end 
end

function IndoorCamFirst:init(vehicle)
	vehicle.indoorCamFirst = {};
	vehicle.indoorCamFirst.initialized = true;

	if vehicle.spec_enterable ~= nil then
		for camIndex, camera in pairs(vehicle.spec_enterable.cameras) do
			if camera.isInside then
				vehicle.spec_enterable:setActiveCameraIndex(camIndex);
			end;
		end;
	end;
end;

function IndoorCamFirst:onEnterVehicle()
	if self.indoorCamFirst == nil then
		IndoorCamFirst:init(self);
	end;
end;

addModEventListener(IndoorCamFirst);
