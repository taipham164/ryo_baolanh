ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('ryo_baolanh:payratu')
AddEventHandler('ryo_baolanh:payratu', function(price)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local bankMoney = xPlayer.getAccount('bank').money
	local cashMoney = xPlayer.getMoney()

	if cashMoney >= price then
		xPlayer.removeMoney(price)
		--TriggerEvent('esx_society:addMoney', 'police', price)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_police', function(account)
				account.addMoney(price)
			end)
		TriggerClientEvent('esx:showNotification', source, _U('you_paid_ratu', ESX.Math.GroupDigits(price)))
		TriggerEvent('esx-qalle-jail:unJailPlayer', xPlayer.identifier)
	elseif bankMoney >= price then
		xPlayer.removeAccountMoney('bank',price)
		--TriggerEvent('esx_society:addMoney', 'police', price)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_police', function(account)
				account.addMoney(price)
			end)
		TriggerClientEvent('esx:showNotification', source, _U('you_paid_ratu', ESX.Math.GroupDigits(price)))
		TriggerEvent('esx-qalle-jail:unJailPlayer', xPlayer.identifier)
	else
		TriggerClientEvent('esx:showNotification', source, _U('not_enough_money'))
	end
end)

RegisterServerEvent('ryo_baolanh:payhuyquetla')
AddEventHandler('ryo_baolanh:payhuyquetla', function(price)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local bankMoney = xPlayer.getAccount('bank').money
	local cashMoney = xPlayer.getMoney()

	if cashMoney >= price then
		xPlayer.removeMoney(price)
		--TriggerEvent('esx_society:addMoney', 'police', price)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_police', function(account)
				account.addMoney(price)
			end)
		TriggerClientEvent('esx:showNotification', source, _U('you_paid_huyquetla', ESX.Math.GroupDigits(price)))
		TriggerEvent('esx_communityservice:endCommunityServiceCommand', source)
	elseif bankMoney >= price then
		xPlayer.removeAccountMoney('bank',price)
		--TriggerEvent('esx_society:addMoney', 'police', price)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_police', function(account)
				account.addMoney(price)
			end)
		TriggerClientEvent('esx:showNotification', source, _U('you_paid_huyquetla', ESX.Math.GroupDigits(price)))
		TriggerEvent('esx_communityservice:endCommunityServiceCommand', source)
	else
		TriggerClientEvent('esx:showNotification', source, _U('not_enough_money'))
	end
end)

RegisterServerEvent('ryo_baolanh:payhuytruyna')
AddEventHandler('ryo_baolanh:payhuytruyna', function(price)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local bankMoney = xPlayer.getAccount('bank').money
	local cashMoney = xPlayer.getMoney()

	if cashMoney >= price then
		xPlayer.removeMoney(price)
		--TriggerEvent('esx_society:addMoney', 'police', price)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_police', function(account)
				account.addMoney(price)
			end)
		TriggerClientEvent('esx:showNotification', source, _U('you_paid_huytruyna', ESX.Math.GroupDigits(price)))
		TriggerEvent('esx-wanted:unWantedPlayer', xPlayer.identifier)
	elseif bankMoney >= price then
		xPlayer.removeAccountMoney('bank',price)
		--TriggerEvent('esx_society:addMoney', 'police', price)
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_police', function(account)
				account.addMoney(price)
			end)
		TriggerClientEvent('esx:showNotification', source, _U('you_paid_huytruyna', ESX.Math.GroupDigits(price)))
		TriggerEvent('esx-wanted:unWantedPlayer', xPlayer.identifier)
	else
		TriggerClientEvent('esx:showNotification', source, _U('not_enough_money'))
	end
end)

--[[ESX.RegisterServerCallback('ryo_baolanh:ratu', function(source, cb)
	local src = source

	local xPlayer = ESX.GetPlayerFromId(src)
	--local Identifier = xPlayer.identifier
	local dentifier = GetPlayerIdentifiers(source)[1]


	MySQL.Async.fetchAll("SELECT jail FROM users WHERE identifier = @identifier", { 
		["@identifier"] = identifier 
	}, function(result)

		local JailTime = tonumber(result[1].jail)

		if JailTime > 0 then

			cb(JailTime)
		else
			cb(0)
		end

	end)

end)]]

ESX.RegisterServerCallback('ryo_baolanh:huyquetla', function(source, cb)
	local identifier = GetPlayerIdentifiers(source)[1]

	MySQL.Async.fetchAll('SELECT * FROM communityservice WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		if result[1] ~= nil then
			local action = tonumber(result[1].actions_remaining)
		
			cb(action)
		else
			cb(0)

			print ("ESX_CommunityService :: Problem matching player identifier in database to reduce actions.")
		end
	end)

end)

ESX.RegisterServerCallback('ryo_baolanh:huytruyna', function(source, cb)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local Identifier = xPlayer.identifier
	MySQL.Async.fetchAll("SELECT wanted FROM users WHERE identifier = @identifier", { ["@identifier"] = Identifier }, function(result)
		local WantedTime = tonumber(result[1].wanted)
		if WantedTime ~= nil and WantedTime > 0 then
			cb(WantedTime)
		else
			cb(0)
		end
	end)

end)
