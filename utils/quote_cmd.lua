--- quote_cmd
return function(s)
    return '"' .. s:gsub('"', '\\"') .. '"'
end
