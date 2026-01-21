local function merge_all(table, table1)
    for k, v in pairs(table1) do
        if type(k) == "number" and k % 1 == 0 then
            table[#table + 1] = v
        elseif table[k] and type(table[k]) == "table" and type(v) == "table" then
            merge_all(table[k], v)
        else
            table[k] = v
        end
    end
    return table
end

return merge_all
