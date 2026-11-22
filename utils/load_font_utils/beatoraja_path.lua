-- beatoraja本体の絶対パスを取得する
return function()
    local ok, result = pcall(function()
        local System = luajava.bindClass("java.lang.System")
        return System:getProperty("user.dir")
    end)
    if ok and result and result ~= "" then
        return tostring(result)
    end

    -- フォールバック: java.io.File
    ok, result = pcall(function()
        local File = luajava.bindClass("java.io.File")
        return File:new("."):getCanonicalPath()
    end)
    if ok and result and result ~= "" then
        return tostring(result)
    end

    return nil
end
