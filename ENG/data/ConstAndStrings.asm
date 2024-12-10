.686

.const

IDM_FILE_NEW	equ 1

.data

szMainClassName 			db "LR_VisAsm",0		; Name of the main window className of the main window class.
szAppName				db "Visual Asm",0		; Application name
szMainMenu				db "MainMenu",0			; Name of the menu in the main window the resource is located in the file res.rc
WC_TABCONTROL				db "SysTabControl32",0		; control name Tab (if I change the name, the control does not work)
szTitle					db "FileTest.asm",0		; test tab name
compEdit				db "Edit",0			; test for the creation of the tab editor

;
; Message Box Warning Messages
;
szCaptionWarning			db "WARNING",0			; Message Box title


;
; Error Messages for Message Box
;
szCaptionError				db "ERROR",0			; Message Box title
szErrorRegisterWindowMainClass		db "Unable to register window class.’, 0ah, 0dh, “Program terminated”,0
szErrorCreateWindow			db "Cannot create window.", 0ah, 0dh, "Program terminated",0