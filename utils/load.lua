local append_all = require("utils/append_all")

--- 配列として扱う要素の一覧
--- @see https://github.com/exch-bms2/beatoraja/blob/17c57c39b9a714ef4b2040100bc0726a04b9ce2a/src/bms/player/beatoraja/skin/json/JsonSkinSerializer.java#L68
local arrays = {
    property = 1,
    filepath = 1,
    offset = 1,
    source = 1,
    font = 1,
    image = 1,
    imageset = 1,
    value = 1,
    float_value = 1,
    text = 1,
    slider = 1,
    graph = 1,
    gauge_graph = 1,
    judge_graph = 1,
    hit_error_visualizer = 1,
    timingvisualizer = 1,
    timing_distribution_graph = 1,
    judge = 1,
    destination = 1,
    animation = 1,
    custom_event = 1,
    custom_timer = 1,
}

--- targetにsourceの内容を追記する
---
--- targetの各要素に対して、sourceの対応する要素を追加する
--- targetの要素が配列のものは追記、連想配列のものは上書きする
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
