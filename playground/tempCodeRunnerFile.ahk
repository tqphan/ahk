	; OnClick(doc) {
    ;     id := doc.parentWindow.event.target.id
    ;     cn := doc.parentWindow.event.target.className
    ;     at := doc.parentWindow.event.target.getAttribute("data-vk")
    ;     tn := doc.parentWindow.event.target.tagName
    ;     ToolTip, id: %id%`ncn: %cn%`nvk: %at%`ntn: %tn%, 0, 0
    ;     ;MsgBox, Right click disabled.
	;     ; if doc.parentWindow.event.srcElement.name in username,password
	;     ; 	doc.parentWindow.event.srcElement.value := doc.parentWindow.event.srcElement.name
	; }