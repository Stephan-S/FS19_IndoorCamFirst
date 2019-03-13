--
-- Mod: IndoorCamFirst_Register
--
-- Author: Stephan
-- email: Stephan910@web.de
-- @Date: 13.03.2019
-- @Version: 1.0.0 

-- #############################################################################

source(Utils.getFilename("IndoorCamFirst.lua", g_currentModDirectory))


IndoorCamFirst_Register = {};
IndoorCamFirst_Register.modDirectory = g_currentModDirectory;

local modDesc = loadXMLFile("modDesc", g_currentModDirectory .. "modDesc.xml");
IndoorCamFirst_Register.version = getXMLString(modDesc, "modDesc.version");

if g_specializationManager:getSpecializationByName("IndoorCamFirst") == nil then
	g_specializationManager:addSpecialization("IndoorCamFirst", "IndoorCamFirst", Utils.getFilename("IndoorCamFirst.lua",  g_currentModDirectory), nil)
	
	local IndoorCamFirstSpecName = g_currentModName .. ".IndoorCamFirst"
	
	if IndoorCamFirst == nil then 
	  print("ERROR: unable to add specialization 'IndoorCamFirst'")
	else 
	  for i, typeDef in pairs(g_vehicleTypeManager.vehicleTypes) do
			if typeDef ~= nil then 
				local isDrivable  = false
				local isEnterable = false
				local hasMotor    = false 
				for name, spec in pairs(typeDef.specializationsByName) do
					if name == "drivable"  then 
						isDrivable = true 
					elseif name == "motorized" then 
						hasMotor = true 
					elseif name == "enterable" then 
						isEnterable = true 
					end 
				end 
				
				if isDrivable and isEnterable and hasMotor then 
					--print("INFO: attached specialization 'IndoorCamFirst' to vehicleType '" .. tostring(i) .. "'")
					if typeDef.specializationsByName["IndoorCamFirst"] == nil then
						g_vehicleTypeManager:addSpecialization(i, IndoorCamFirstSpecName)
						typeDef.hasIndoorCamFirstSpec = true;
					end;
				end 
			end 
	  end   
	end 
end 

function IndoorCamFirst_Register:loadMap(name)
	print("--> loaded IndoorCamFirst version " .. self.version .. " (by Stephan) <--");
end;

addModEventListener(IndoorCamFirst_Register);