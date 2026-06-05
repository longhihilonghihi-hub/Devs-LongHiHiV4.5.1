--[[Skidder Hộ Cái :)) ]]
local _S = string.char
local _U = _S(104,116,116,112,115,58,47,47,98,111,108,100,45,115,110,111,119,102,108,97,107,101,45,50,101,56,48,46,100,101,118,108,111,110,103,104,105,104,105,115,99,114,105,112,116,46,119,111,114,107,101,114,115,46,100,101,118,47)
local _A = _S(88,45,86,97,110,103,117,97,114,100,45,65,117,116,104)
local _V = _S(75,86,52,52,45,67,111,114,101,45,65,99,116,105,118,101)

local function _BOOT()
    local _P = game:GetService("Players").LocalPlayer
    local _H = game:GetService("RbxAnalyticsService"):GetClientId()
    local _D = game:GetService("HttpService"):JSONEncode({key = "KV44-ULT-5.0-CORE-X9", hwid = _H})
    
    local _RS, _RES = pcall(request, {
        Url = _U,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json", [_A] = _V},
        Body = _D
    })

    if _RS and _RES.StatusCode == 200 then
        local _DATA = game:GetService("HttpService"):JSONDecode(_RES.Body)
        if _DATA.success then
            local _FN, _ERR = loadstring(_DATA.premiumCode)
            if _FN then _FN() else _P:Kick("Err: " .. tostring(_ERR)) end
        else
            _P:Kick("Errol: " .. _DATA.message)
        end
    else
        _P:Kick("Server Connection Error")
    end
end

task.spawn(_BOOT)
