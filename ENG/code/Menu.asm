.386

.data
szTestTest db "test de Giazz",0		; nonsense text for test

.code

HandleMenu proc menu:WPARAM
	.IF menu == IDM_FILE_NEW
		invoke AddTab, hTab, offset szTestTest
	.ENDIF
	ret
HandleMenu endp