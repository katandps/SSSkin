--- Merges two tables recursively.
--- 第一引数のtableに第二引数のtable1の内容をマージして返します。tableの内容は破壊されます。
---
--- 両方のテーブルに同じキーが存在し、かつその値が両方ともテーブルである場合、
--- それらのテーブルも再帰的にマージされます。
local function merge_recursive(table, table1)
    for k, v in pairs(table1) do
        if type(k) == "number" and k % 1 == 0 then
            table[#table + 1] = v
        elseif table[k] and type(table[k]) == "table" and type(v) == "table" then
            merge_recursive(table[k], v)
        else
            table[k] = v
        end
    end
    return table
end

return merge_recursive
