local consts = require("play/consts").properties

local property = {
    {
        name = "画面サイズ",
        item = {
            { name = "27inch", op = consts.size_27inch },
            { name = "43inch", op = consts.size_43inch }
        }
    },
}

return { consts = consts, property = property }
