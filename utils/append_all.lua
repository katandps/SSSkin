---
--- `list1`の全要素を`list`に追加します。
---
local function append_all(list, list1)
    -- list, list1はtableでなければならない
    if type(list) ~= "table" then
        error("list must be a table, got " .. type(list), 2)
    end
    if type(list1) ~= "table" then
        error("list1 must be a table, got " .. type(list1), 2)
    end

    for _, v in ipairs(list1) do
        table.insert(list, v)
    end
end

return append_all
