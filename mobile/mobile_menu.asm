MainMenu_Mobile:
	call ClearBGPalettes
	ld a, MUSIC_MOBILE_ADAPTER_MENU
	ld [wMapMusic], a
	ld de, MUSIC_MOBILE_ADAPTER_MENU
	call Function4a6c5
Function49f0a:
	call ClearBGPalettes
	call Function4a3a7
	call Function4a492
	call ClearBGPalettes
Function49f16:
	call MobileMenu_InitMenuBuffers
	ld c, 12
	call DelayFrames
	hlcoord 2, 0 ;4, 0 ; Changed size for international
	ld b, 10 ; menu height
	ld c, 14 ;10 ; menu width ; Changed size for international
	call Function48cdc
	hlcoord 4, 2 ;6, 2 ; menu text position ; Changed size for international
	ld de, MobileString1
	call PlaceString
	hlcoord 0, 12
	ld b, 4
	ld c, SCREEN_HEIGHT
	call Textbox
	xor a
	ld de, String_0x49fe9
	hlcoord 1, 14
	call PlaceString
	call WaitBGMap2
	call SetPalettes
	call StaticMenuJoypad
	ld hl, wMenuCursorY
	ld b, [hl]
	push bc
	jr .check_buttons

.joy_loop
	call ScrollingMenuJoypad
	ld hl, wMenuCursorY
	ld b, [hl]
	push bc

.check_buttons
	bit A_BUTTON_F, a
	jr nz, .a_button
	bit B_BUTTON_F, a
	jr nz, .b_button
	jr .next

.a_button
	ld hl, wMenuCursorY
	ld a, [hl]
	cp 1
	jp z, Function4a098
	cp 2
	jp z, Function4a0b9
	cp 3
	jp z, Function4a0c2
	cp 4
	jp z, Function4a100
	ld a, 1
	call MenuClickSound
.b_button
	pop bc
	call ClearBGPalettes
	call ClearTileMap
	ld a, MUSIC_MAIN_MENU
	ld [wMapMusic], a
	ld de, MUSIC_MAIN_MENU
	call Function4a6c5
	ret

.next
	ld hl, wMenuCursorY
	ld a, [hl]
	dec a
	ld hl, MobileStrings2
	call GetNthString
	ld d, h
	ld e, l
	hlcoord 1, 13
	ld b, 4
	ld c, SCREEN_HEIGHT
	call ClearBox
	hlcoord 1, 14
	call PlaceString
	jp .useless_jump

.useless_jump
	call MobileMenu_InitMenuBuffers
	pop bc
	ld hl, wMenuCursorY
	ld [hl], b
	ld b, $a
	ld c, $1
	hlcoord 3, 1 ; Changed size for international
	call ClearBox
	jp .joy_loop

MobileString1:
	db   "KARTENORDNER"
	next "GRUSSWORTE"
	next "MOBILPROFIL"
	next "EINSTELLUNGEN"
	next "ZURÜCK"
	db   "@"

MobileStrings2:

String_0x49fe9:
	db   "Eigene KARTE und"
	next "Freundes-KARTEN."
	db   "@"

String_0x4a004:
	db   "GRUSSWORTE"
	next "festlegen."
	db   "@"

String_0x4a026:
	db   "Alter und Region"
	next "ändern."
	db   "@"

String_0x4a042:
	db   "Verbindungs-"
	next "einstellungen"
	next "ändern."
	db   "@"

String_0x4a062:
	db   "Zurück zum vorhe-"
	next "rigen Bildschirm."
	db   "@"

MobileMenu_InitMenuBuffers:
	ld hl, w2DMenuCursorInitY
	ld a, 2
	ld [hli], a
	ld a, 3 ;5 ; w2DMenuCursorInitX ; Changed size for international
	ld [hli], a
	ld a, 5 ; w2DMenuNumRows
	ld [hli], a
	ld a, 1 ; w2DMenuNumCols
	ld [hli], a
	ld [hl], $0 ; w2DMenuFlags1
	set 5, [hl]
	inc hl
	xor a ; w2DMenuFlags2
	ld [hli], a
	ld a, $20 ; w2DMenuCursorOffsets
	ld [hli], a
	; this is a stupid way to load $c3
	ld a, A_BUTTON
	add D_UP
	add D_DOWN
	add B_BUTTON
	ld [hli], a ; wMenuJoypadFilter
	ld a, 1
	ld [hli], a ; wMenuCursorY, wMenuCursorX
	ld [hli], a ; wMenuCursorY, wMenuCursorX
	ret

Function4a098:
	ld a, 2
	call MenuClickSound
	call PlaceHollowCursor
	call WaitBGMap
	call LoadStandardMenuHeader
	farcall Function89de0
	call Call_ExitMenu
	call MG_Mobile_Layout_LoadPals
	call Function4a485
	pop bc
	jp Function49f16

Function4a0b9:
	ld a, 2
	call MenuClickSound
	pop bc
	jp Function4a4c4

Function4a0c2:
	ld a, 2
	call MenuClickSound
	ld a, BANK(sPlayerData)
	call GetSRAMBank
	ld hl, sPlayerData + wPlayerName - wPlayerData
	ld de, wPlayerName
	ld bc, PLAYER_NAME_LENGTH ;NAME_LENGTH_JAPANESE
	call CopyBytes
	call CloseSRAM
	farcall _LoadData
	ld c, 2
	call DelayFrames
	ld c, $1
	call InitMobileProfile
	push af
	call ClearBGPalettes
	pop af
	and a
	jr nz, .skip_save
	farcall _SaveData
.skip_save
	ld c, 5
	call DelayFrames
	jr asm_4a111

Function4a100:
	ld a, 2
	call MenuClickSound
	call ClearBGPalettes
	call Function4a13b
	call ClearBGPalettes
	call ClearTileMap

asm_4a111:
	pop bc
	call LoadFontsExtra
	jp Function49f0a

Function4a118:
	ld hl, w2DMenuCursorInitY
	ld a, $1
	ld [hli], a
	ld a, $b;$d ; Changed size for international ; position of cursor in log-in-password submenu
	ld [hli], a
	ld a, $3
	ld [hli], a
	ld a, $1
	ld [hli], a
	ld [hl], $0
	set 5, [hl]
	inc hl
	xor a
	ld [hli], a
	ld a, $20
	ld [hli], a
	ld a, $1
	add $2
	ld [hli], a
	ld a, $1
	ld [hli], a
	ld [hli], a
	ret

Function4a13b:
	call Function4a3a7
	call Function4a492
	call Function4a373
	ld c, 10
	call DelayFrames

Function4a149:
	hlcoord 1, 2
	ld b, $6
	ld c, $10
	call Function48cdc
	hlcoord 3, 4
	ld de, String_4a1ef
	call PlaceString
	hlcoord 0, 12
	ld b, $4
	ld c, $12
	call Textbox
	ld a, [wMenuCursorY]
	dec a
	ld hl, Strings_4a23d
	call GetNthString
	ld d, h
	ld e, l
	hlcoord 1, 13
	ld b, $4
	ld c, $12
	call ClearBox
	hlcoord 1, 14
	call PlaceString
	farcall Mobile_OpenAndCloseMenu_HDMATransferTileMapAndAttrMap
	call SetPalettes
	call StaticMenuJoypad
	ld hl, wMenuCursorY
	ld b, [hl]
	push bc
	jr asm_4a19d

Function4a195:
	call ScrollingMenuJoypad
	ld hl, wMenuCursorY
	ld b, [hl]
	push bc

asm_4a19d:
	bit 0, a
	jr nz, .asm_4a1a7
	bit 1, a
	jr nz, .asm_4a1ba
	jr .asm_4a1bc
.asm_4a1a7
	ld hl, wMenuCursorY
	ld a, [hl]
	cp $1
	jp z, Function4a20e
	cp $2
	jp z, Function4a221
	ld a, $1
	call MenuClickSound
.asm_4a1ba
	pop bc
	ret
.asm_4a1bc
	ld hl, wMenuCursorY
	ld a, [hl]
	dec a
	ld hl, Strings_4a23d
	call GetNthString
	ld d, h
	ld e, l
	hlcoord 1, 13
	ld b, $4
	ld c, $12
	call ClearBox
	hlcoord 1, 14
	call PlaceString
	jr .asm_4a1db
.asm_4a1db
	call Function4a373
	pop bc
	ld hl, wMenuCursorY
	ld [hl], b
	lb bc, 6, 1
	hlcoord 2, 3
	call ClearBox
	jp Function4a195

String_4a1ef:
	db   "MOBILE-CENTER";"モバイルセンター¯えらぶ"
	next "LOG-IN-PASSWORT";"ログインパスワード¯いれる"
	next "ZURÜCK@";"もどる@"

Function4a20e:
	ld a, $1
	call MenuClickSound
	farcall Function1719c8
	call ClearBGPalettes
	call DelayFrame
	jr Function4a239

Function4a221:
	ld a, $1
	call MenuClickSound
	call Function4a28a
	jr c, Function4a239
	call Function4a373
	ld a, $2
	ld [wMenuCursorY], a
	jr .asm_4a235
.asm_4a235
	pop bc
	jp Function4a149

Function4a239:
	pop bc
	jp Function4a13b

Strings_4a23d:
	db   "Das CENTER für";"いつも　せつぞく¯する"
	next "die Verbindung.@";"モバイルセンター¯えらびます@"

	db   "Das PASSWORT für";"モバイルセンター<NI>せつぞくするとき"
	next "die Verbindung.@";"つかうパスワード¯ほぞんできます@"

	db   "Zurück zum vorhe-";"まえ<NO>がめん　<NI>もどります@"
	next "rigen Bildschirm.@"

	db   "@"

Function4a28a:
	hlcoord 2, 3
	lb bc, 6, 1
	ld a, " "
	call Function4a6d8
	call PlaceHollowCursor
	call WaitBGMap
	
	ld hl, MenuHeader_0x4a346
	call LoadMenuHeader
	
	;call LoadStandardMenuHeader
	ld a, BANK(sMobileLoginPassword)
	call GetSRAMBank
	ld a, [sMobileLoginPassword]
	call CloseSRAM
	and a
	jr z, .asm_4a2df
	hlcoord 10, 0;12, 0 ; Changed size for international ; position of box
	ld b, $5 ; height of box
	ld c, $8;$6 ; Changed size for international ; width of box
	call Function48cdc
	hlcoord 12, 1;14, 1 ; Changed size for international ; position of text
	ld de, String_4a34b
	call PlaceString
	farcall Mobile_OpenAndCloseMenu_HDMATransferTileMapAndAttrMap
	call Function4a118
	call ScrollingMenuJoypad
	push af
	call PlayClickSFX
	pop af
	bit B_BUTTON_F, a
	jr nz, .quit
	ld a, [wMenuCursorY]
	cp $2
	jr z, .DeleteLoginPassword
	cp $3
	jr z, .quit
.asm_4a2df
	farcall Function11765d
	call ClearBGPalettes
	call Call_ExitMenu
	call LoadFontsExtra
	scf
	ret

.DeleteLoginPassword:
	call PlaceHollowCursor
	ld hl, UnknownText_0x4a358
	call PrintText
	hlcoord 14, 7
	ld b, 3
	ld c, 4
	call Textbox
	farcall Mobile_OpenAndCloseMenu_HDMATransferTileMapAndAttrMap
	ld hl, DeletePassword_YesNo_MenuHeader
	call LoadMenuHeader
	call VerticalMenu
	bit B_BUTTON_F, a
	jr nz, .dont_delete_password
	ld a, [wMenuCursorY]
	cp $2
	jr z, .dont_delete_password
	ld a, BANK(sMobileLoginPassword)
	call GetSRAMBank
	ld hl, sMobileLoginPassword
	xor a
	ld bc, MOBILE_LOGIN_PASSWORD_LENGTH
	call ByteFill
	call CloseSRAM
	ld hl, UnknownText_0x4a35d
	call PrintText
	call JoyWaitAorB
.dont_delete_password
	call ExitMenu
.quit
	farcall Mobile_OpenAndCloseMenu_HDMATransferTileMapAndAttrMap ; switched
	call Call_ExitMenu ;
	xor a
	ret

MenuHeader_0x4a346:
	db MENU_BACKUP_TILES ; flags
	menu_coords 10, 0, SCREEN_WIDTH - 1, 6;12, 0, SCREEN_WIDTH - 1, 6 ; Changed size for international

String_4a34b:
	db   "ÄNDERN";"いれなおす"
	next "LÖSCHEN";"けす"
	next "ZURÜCK@";"もどる@"

UnknownText_0x4a358:
	; Delete the saved LOG-IN PASSWORD?
	text_far UnknownText_0x1c5196
	text_end

UnknownText_0x4a35d:
	; Deleted the LOG-IN PASSWORD.
	text_far UnknownText_0x1c51b9
	text_end

DeletePassword_YesNo_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 14, 7, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw MenuData_0x4a36a
	db 2 ; default option

MenuData_0x4a36a:
	db STATICMENU_CURSOR | STATICMENU_NO_TOP_SPACING | STATICMENU_WRAP ; flags
	db 2 ; items
	db "JA@";"はい@"
	db "NEIN@";"いいえ@"

Function4a373:
	ld hl, w2DMenuCursorInitY
	ld a, $4
	ld [hli], a
	ld a, $2
	ld [hli], a
	ld a, $3
	ld [hli], a
	ld a, $1
	ld [hli], a
	ld [hl], $0
	set 5, [hl]
	inc hl
	xor a
	ld [hli], a
	ld a, $20
	ld [hli], a
	ld a, $1
	add $40
	add $80
	add $2
	ld [hli], a
	ld a, $1
	ld [hli], a
	ld [hli], a
	ret

Function4a39a:
	call Function4a485
	call Function4a492
	call Function4a3aa
	call SetPalettes
	ret

Function4a3a7:
	call Function4a485
Function4a3aa:
	hlcoord 0, 0
	lb bc, 3, 1
	xor a
	call Function4a6d8
	lb bc, 1, 1
	ld a, $1
	call Function4a6d8
	lb bc, 1, 1
	xor a
	call Function4a6d8
	lb bc, 1, 1
	ld a, $1
	call Function4a6d8
	lb bc, 4, 1
	ld a, $2
	call Function4a6d8
	lb bc, 1, 1
	ld a, $3
	call Function4a6d8
	lb bc, 1, 1
	ld a, " "
	call Function4a6d8
	hlcoord 1, 0
	ld a, $1
	lb bc, 3, 18
	call Function4a6d8
	lb bc, 1, 18
	ld a, $0
	call Function4a6d8
	lb bc, 1, 18
	ld a, $1
	call Function4a6d8
	lb bc, 1, 18
	ld a, $2
	call Function4a6d8
	lb bc, 11, 18
	ld a, " "
	call Function4a6d8
	hlcoord 19, 0
	lb bc, 3, 1
	ld a, $0
	call Function4a6d8
	lb bc, 1, 1
	ld a, $1
	call Function4a6d8
	lb bc, 1, 1
	xor a
	call Function4a6d8
	lb bc, 1, 1
	ld a, $1
	call Function4a6d8
	lb bc, 4, 1
	ld a, $2
	call Function4a6d8
	lb bc, 1, 1
	ld a, $3
	call Function4a6d8
	lb bc, 1, 1
	ld a, " "
	call Function4a6d8
	ret

Function4a449:
	ld bc, 3 * SCREEN_WIDTH
	ld a, $0
	hlcoord 0, 0
	call ByteFill
	ld bc, 2 * SCREEN_WIDTH
	ld a, $1
	call ByteFill
	ld bc, 2 * SCREEN_WIDTH
	ld a, $0
	call ByteFill
	ld bc, 2 * SCREEN_WIDTH
	ld a, $1
	call ByteFill
	ld bc, SCREEN_WIDTH
	ld a, $2
	call ByteFill
	ld bc, SCREEN_WIDTH
	ld a, $3
	call ByteFill
	ld bc, SCREEN_WIDTH
	ld a, " "
	call ByteFill
	ret

Function4a485:
	ld de, GFX_49c0c
	ld hl, vTiles2 tile $00
	lb bc, BANK(GFX_49c0c), 13
	call Get2bpp
	ret

Function4a492:
	call MG_Mobile_Layout00
	ret

MainMenu_MobileStudium:
	ld a, [wStartDay]
	ld b, a
	ld a, [wStartHour]
	ld c, a
	ld a, [wStartMinute]
	ld d, a
	ld a, [wStartSecond]
	ld e, a
	push bc
	push de
	farcall MobileStudium
	call ClearBGPalettes
	pop de
	pop bc
	ld a, b
	ld [wStartDay], a
	ld a, c
	ld [wStartHour], a
	ld a, d
	ld [wStartMinute], a
	ld a, e
	ld [wStartSecond], a
	ret

Function4a4c4:
	call ClearBGPalettes
	call Function4a3a7
	call Function4a492
	call Function4a680
	call ClearBGPalettes
	ld c, 20
	call DelayFrames
	hlcoord 2, 0
	ld b, $a
	ld c, $e
	call Function48cdc
	hlcoord 4, 2
	ld de, String_4a5c5
	call PlaceString
	hlcoord 4, 4
	ld de, String_4a5cd
	call PlaceString
	hlcoord 4, 6
	ld de, String_4a5da
	call PlaceString
	hlcoord 4, 8
	ld de, String_4a5e6
	call PlaceString
	hlcoord 4, 10
	ld de, String_4a5f2
	call PlaceString
	hlcoord 0, 12
	ld b, $4
	ld c, $12
	call Textbox
	xor a
	ld hl, Strings_4a5f6
	ld d, h
	ld e, l
	hlcoord 1, 14
	call PlaceString
	ld a, $1
	ld hl, Strings_4a5f6
	call GetNthString
	ld d, h
	ld e, l
	hlcoord 1, 16
	call PlaceString
	call WaitBGMap2
	call SetPalettes
	call StaticMenuJoypad
	ld hl, wMenuCursorY
	ld b, [hl]
	push bc
	jr asm_4a54d

Function4a545:
	call ScrollingMenuJoypad
	ld hl, wMenuCursorY
	ld b, [hl]
	push bc

asm_4a54d:
	bit 0, a
	jr nz, .asm_4a557
	bit 1, a
	jr nz, .asm_4a574
	jr .asm_4a57e
.asm_4a557
	ld hl, wMenuCursorY
	ld a, [hl]
	cp $1
	jp z, Function4a6ab
	cp $2
	jp z, Function4a6ab
	cp $3
	jp z, Function4a6ab
	cp $4
	jp z, Function4a6ab
	ld a, $1
	call MenuClickSound
.asm_4a574
	pop bc
	call ClearBGPalettes
	call ClearTileMap
	jp Function49f0a
.asm_4a57e
	ld hl, wMenuCursorY
	ld a, [hl]
	dec a
	add a
	push af
	ld hl, Strings_4a5f6
	call GetNthString
	ld d, h
	ld e, l
	hlcoord 1, 13
	ld b, $4
	ld c, $12
	call ClearBox
	hlcoord 1, 14
	call PlaceString
	pop af
	inc a
	ld hl, Strings_4a5f6
	call GetNthString
	ld d, h
	ld e, l
	hlcoord 1, 16
	call PlaceString
	jp Function4a5b0

Function4a5b0:
	call Function4a680
	pop bc
	ld hl, wMenuCursorY
	ld [hl], b
	ld b, $a
	ld c, $1
	hlcoord 3, 1
	call ClearBox
	jp Function4a545

String_4a5c5:
	db "VORSTELLUNG@";"じこしょうかい@"
String_4a5cd:
	db "KAMPFANTRITT@";"たいせん　<GA>はじまるとき@"
String_4a5da:
	db "SIEG@";"たいせん　<NI>かったとき@"
String_4a5e6:
	db "NIEDERLAGE@";"たいせん　<NI>まけたとき@"
String_4a5f2:
	db "ZURÜCK@";"もどる@"

Strings_4a5f6:
	db "Auf der KARTE@";"めいし　や　ニュース　<NI>のせる@"
	db "und in den DATEN.@";"あなた<NO>あいさつです@"
	db "Bei Beginn eines@";"モバイル　たいせん<GA>はじまるとき@"
	db "Kampfes.@";"あいて<NI>みえる　あいさつです@"
	db "Bei Sieg in@";"モバイル　たいせんで　かったとき@"
	db "einem Kampf.@";"あいて<NI>みえる　あいさつです@"
	db "Bei Niederlage@";"モバイル　たいせんで　まけたとき@"
	db "in einem Kampf.@";"あいて<NI>みえる　あいさつです@"
	db "Zurück zum vorhe-@";"まえ<NO>がめん　<NI>もどります@"
	db "rigen Bildschirm.@"

Function4a680:
	ld hl, w2DMenuCursorInitY
	ld a, $2
	ld [hli], a
	ld a, $3
	ld [hli], a
	ld a, $5
	ld [hli], a
	ld a, $1
	ld [hli], a
	ld [hl], $0
	set 5, [hl]
	inc hl
	xor a
	ld [hli], a
	ld a, $20
	ld [hli], a
	ld a, $1
	add $40
	add $80
	add $2
	ld [hli], a
	ld a, $1
	ld [hli], a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret

Function4a6ab:
	ld a, $2
	call MenuClickSound
	call ClearBGPalettes
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	farcall Function11c1ab
	pop bc
	call LoadFontsExtra
	jp Function4a4c4

Function4a6c5:
	ld a, $5
	ld [wMusicFade], a
	ld a, e
	ld [wMusicFadeID], a
	ld a, d
	ld [wMusicFadeID + 1], a
	ld c, 22
	call DelayFrames
	ret

Function4a6d8:
	push bc
	push hl
.asm_4a6da
	ld [hli], a
	dec c
	jr nz, .asm_4a6da
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, Function4a6d8
	ret
