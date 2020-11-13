
local QUIWindow = class("QUIWindow", function()
    return fairygui.Window:create()
end)

local QFairyGUILoad = import("...utils.QFairyGUILoad")

function QUIWindow:ctor(fguiFile, resName, callbacks, options)
    self._options = options or {}
    self._fguiOwner = {}
    self._appear = false

    -- guiView
    if self._options.isPopTop then
        app:popTopWindew()
    end

    self._gComponent = QFairyGUILoad.loadLua(fguiFile, resName, self._fguiOwner, callbacks)
    self:setContentPane(self._gComponent)
    self:setModal(true)
    self:show()

    self._parentViewController = nil
    self._subViewControllers = {}
end

function QUIWindow:getOptions()
    return self._options
end

function QUIWindow:setOptions(options)
    self._options = options or {}
end

function QUIWindow:playEffectIn()
    if self._isEffectPlay == true then
        return 
    end
    if self.isAnimation then
        self:createAnimationProxy()
        self._isEffectPlay = true
        self._rootAnimationManager:runAnimationsForSequenceNamed(self.effectInName)
    else
        self:viewAnimationInHandler()
    end
end

function QUIWindow:playEffectOut()
    if self._isEffectPlay == true then
        return 
    end
    if self.isAnimation then
        self._isEffectPlay = true
        self._rootAnimationManager:runAnimationsForSequenceNamed(self.effectOutName)
    else
        self:viewAnimationOutHandler()
    end
end

function QUIWindow:viewDidAppear()
    QUIWindow.super.viewDidAppear(self)
    if self._isChild ~= true and self._isTouchSwallow == true then
        self:_enableTouchSwallow()
    end

    if self._enableDialogEvent == true then
        QNotificationCenter.sharedNotificationCenter():dispatchEvent({name = QNotificationCenter.EVENT_DIALOG_DID_APPEAR})
    end
end

function QUIWindow:viewWillDisappear()
    QUIWindow.super.viewWillDisappear(self)
    self:_disableTouchSwallow()

    self:removeAnimationProxy()

    if self._enableDialogEvent == true then
        QNotificationCenter.sharedNotificationCenter():dispatchEvent({name = QNotificationCenter.EVENT_DIALOG_WILL_DISAPPEAR})
    end
end

function QUIWindow:createAnimationProxy()
    self._rootAnimationManager = tolua.cast(self._root:getUserObject(), "CCBAnimationManager")
    self._rootAnimationManager:connectScriptHandler(handler(self, self.rootAnimationEndHandler))
end

function QUIWindow:removeAnimationProxy()
    if self._rootAnimationManager then
        self._rootAnimationManager:disconnectScriptHandler()
    end
end

function QUIWindow:rootAnimationEndHandler(name)
    if name == self.effectInName then
        self._isEffectPlay = false
        self:viewAnimationInHandler()
    elseif name == self.effectOutName then
        self:viewAnimationOutHandler()
    end
end

function QUIWindow:getEffectPlay()
    return self._isEffectPlay or false
end

function QUIWindow:viewAnimationInHandler()

end

function QUIWindow:viewAnimationOutHandler()
    self:popSelf()
end

function QUIWindow:popSelf()
    self:hide()
end

function QUIWindow:_topClickHandler()

end

return QUIWindow