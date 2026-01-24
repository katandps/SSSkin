--- シリアライズ可能な値に変換するユーティリティ関数 デバッグ用
--- usage:
---
--- error("Value: " .. serialize_value(your_value))
---
local function serialize_value(value)
    if type(value) == "table" then
        local result = "{"
        local first = true
        for k, v in pairs(value) do
            if not first then
                result = result .. ", "
            end
            result = result .. tostring(k) .. "=" .. serialize_value(v)
            first = false
        end
        result = result .. "}"
        return result
    else
        return tostring(value)
    end
end

return { serialize_value = serialize_value }
