function onStartup()
	db.executeQuery("UPDATE `players` SET `online` = 0 WHERE `world_id` = " .. getConfigValue('worldId') .. ";")

	setGlobalStorageValue(STHENO_SPAWN,-1)
	setGlobalStorageValue(DEVOVORGA_SPAWN,-1)
	setGlobalStorageValue(DEVOVORGA_START,-1)
	return true
end
