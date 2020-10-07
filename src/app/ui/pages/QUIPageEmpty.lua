
local QUIPage = import(".QUIPage")
local QUIPageEmpty = class("QUIPageEmpty", QUIPage)

function QUIPageEmpty:ctor(options)
    QUIPageEmpty.super.ctor(self, nil, nil, nil, options)
end

return QUIPageEmpty