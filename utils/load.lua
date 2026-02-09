--- スキンのロード

local append_all = require("utils/append_all")

--- targetにsourceの内容を追記する
---
--- targetを配列のテーブルとみなし、targetの各要素に対してsourceの対応する要素を追加する
return function(target, source)
    for k, v in pairs(target) do
        if source[k] then
            append_all(v, source[k])
        end
    end
end
