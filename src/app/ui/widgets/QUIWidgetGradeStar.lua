local QUIWidget = import(".QUIWidget")
local QUIWidgetGradeStar = class("QUIWidgetGradeStar", QUIWidget)

function QUIWidgetGradeStar:ctor(options)
    local fguiFile = "basics"
    local resName = "grade_star"
    local callbacks = {
    }
    QUIWidgetGradeStar.super.ctor(self, fguiFile, resName, callbacks, options)

    self._gradeStarIcon = QResPath("grade_star_icon")
end

function QUIWidgetGradeStar:setInfo(grade, showStyle)
    showStyle = showStyle or 1
    local diff = 25
    local star = (grade-1)%5 + 1
    for i = 1, 5 do
        local node = self._fguiOwner["sp_grade_"..i]
        node:setVisible(false)
        if i <= star then
            node:setVisible(true)
            if grade > 10 then
                node:setURL(self._gradeStarIcon[3])
            elseif grade > 5 then
                node:setURL(self._gradeStarIcon[2])
            else
                node:setURL(self._gradeStarIcon[1])
            end
        end
        if showStyle == 1 then
            node:setY((i-1)*diff)
        else
            node:setX((i-1)*diff)
        end
    end
end

return QUIWidgetGradeStar