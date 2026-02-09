--- スキンのロード

local append_all = require("utils/append_all")

--- targetにsourceの内容を追記する
---
--- targetの各要素に対して、sourceの対応する要素を追加する
--- targetの要素が配列のものは追記、連想配列のものは上書きする

--- 配列として扱う要素の一覧
local arrays = {
    source = 1,
    image = 1,
    font = 1,
    imageset = 1,
    text = 1,
    slider = 1,
    value = 1,
    destination = 1,
    property = 1,
    filepath = 1,
    offset = 1
}
return function(target, source, context)
    for k, v in pairs(source) do
        if arrays[k] then
            if not target[k] then
                target[k] = {}
            end
            if type(v) ~= "table" then
                error(context .. ": スキンパラメータ:" .. k .. "の型が不正です")
            end
            append_all(target[k], v)
        else
            if target[k] then
                error(context .. ": スキンパラメータ:" .. k .. "が多重に定義されています")
            else
                target[k] = v
            end
        end
    end
end
