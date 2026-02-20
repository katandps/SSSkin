return function(cmd)
    local ok, _, code = os.execute(cmd)
    if ok == true then
        return true
    end
    if type(ok) == "number" then
        return ok == 0
    end
    if type(code) == "number" then
        return code == 0
    end
    return false
end
