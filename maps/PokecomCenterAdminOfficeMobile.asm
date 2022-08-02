	object_const_def ; object_event constants
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST1
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST2
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST3

PokecomCenterAdminOfficeMobile_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PokecomCenterAdminOfficeMobileScientist1Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist1Text

PokecomCenterAdminOfficeMobileScientist2Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist2Text

PokecomCenterAdminOfficeMobileScientist3Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist3Text

PokecomCenterAdminOfficeMobileComputer1:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer1Text
	waitbutton
.loop:
	reloadmappart
	loadmenu .Computer1MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .PokeComClub
	ifequal 2, .MobileCenter
	sjump .Quit

.PokeComClub:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer1Text_PokeComClub
	waitbutton
	sjump .loop

.MobileCenter:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer1Text_MobileCenter
	waitbutton
	sjump .loop

.Quit:
	closetext
	end

.Computer1MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "#　つうしん　クラブ@" ; # COM CLUB
	db "モバイルセンター@" ; MOBILE CENTER
	db "やめる@" ; QUIT

PokecomCenterAdminOfficeMobileComputer2:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer2Text
	waitbutton
.loop:
	reloadmappart
	loadmenu .Computer2MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .UsePhone
	ifequal 2, .DontUsePhone
	sjump .Quit

.UsePhone:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer2Text_UsePhone
	waitbutton
	sjump .loop

.DontUsePhone:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer2Text_DontUsePhone
	waitbutton
	sjump .loop

.Quit:
	closetext
	end

.Computer2MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "でんわ<WO>つかうとき@" ; Use phone
	db "でんわ<GA>つながらないとき@" ; Don't use phone
	db "やめる@" ; QUIT

PokecomCenterAdminOfficeMobileComputer3:
	jumptext PokecomCenterAdminOfficeMobileComputer3Text

PokecomCenterAdminOfficeMobileScientist1Text:
	text "#COM-CENTER und"
	line "MOBILE-CENTER"
	cont "wurden erbaut, um"
	cont "das Tauschen und"
	cont "Kämpfen mit weit"
	cont "entfernten"
	cont "Trainern und sogar"
	cont "wildfremden"
	cont "Personen zu"
	cont "ermöglichen."
	done

PokecomCenterAdminOfficeMobileScientist2Text:
	text "Warst du nicht"
	line "auch beeindruckt,"
	cont "als du dich das"
	cont "erste Mal über"
	cont "dein Handy mit"
	cont "jemandem verbunden"
	cont "hast?"

	para "Als mein erster"
	line "Versuch klappte,"
	cont "war ich so"
	cont "beeindruckt, dass"
	cont "ich Gänsehaut"
	cont "bekam!"
	done

PokecomCenterAdminOfficeMobileScientist3Text:
	text "Dank Fortschritten"
	line "auf dem Gebiet der"

	para "Funktechnologie,"
	line "konnten sie diese"
	cont "Stätte bauen."
	done

PokecomCenterAdminOfficeMobileComputer1Text:
	text "Eine Notiz über"
	line "die Einsatzzwecke"
	cont "des MOBILE"
	cont "ADAPTER…"
	done

PokecomCenterAdminOfficeMobileComputer1Text_PokeComClub:
	text "Es gibt in jedem"
	line "#MON-CENTER im"
	cont "Obergeschoss den"
	cont "#COM-CLUB."

	para "Mit einem MOBILE"
	line "ADAPTER kannst du"
	cont "dort mit weit"
	cont "entfernten"
	cont "Freunden kämpfen"
	cont "oder tauschen."

	para "Um sich verbinden"
	line "zu können,"
	cont "benötigen dein"
	cont "Freund und du die"
	cont "gleiche Art von"
	cont "MOBILE ADAPTER."
	done

PokecomCenterAdminOfficeMobileComputer1Text_MobileCenter:
	text "HANDELSECKE und"
	line "#MON-DATEN"
	cont "werden über eine"
	cont "Verbindung zum"
	cont "MOBILE-CENTER"
	cont "bereitgestellt."

	para "Hierfür musst du"
	line "dich zunächst bei"
	cont "einem MOBILE-"
	cont "CENTER"
	cont "registrieren."
	done

PokecomCenterAdminOfficeMobileComputer2Text:
	text "Eine Notiz über"
	line "die Handy-"
	cont "Nutzung…"
	done

PokecomCenterAdminOfficeMobileComputer2Text_UsePhone:
	text "Bitte verbinde"
	line "Handy und MOBILE"
	cont "ADAPTER sicher"
	cont "miteinander und"
	cont "achte auf guten"
	cont "Netzempfang."

	para "Berühre während"
	line "der Übertragung"
	cont "nicht dein Handy"
	cont "und trenne nicht"
	cont "die Verbindung."
	done

PokecomCenterAdminOfficeMobileComputer2Text_DontUsePhone:
	text "Wenn das Netz"
	line "überlastet ist,"
	cont "könnte ein"
	cont "Verbindungsversuch"
	cont "scheitern."

	para "Versuche es dann"
	line "bitte später"
	cont "erneut."

	para "Wenn du dich"
	line "weiterhin nicht"
	cont "anmelden kannst"
	cont "oder die"
	cont "Fehlermeldungen"
	cont "nicht verständlich"
	cont "sind, kontaktiere"
	cont "den Kundendienst"
	cont "oder lies die"
	cont "Bedienungsanleitung."
	done

PokecomCenterAdminOfficeMobileComputer3Text:
	text "Eine E-Mail an das"
	line "VERWALTUNGS-BÜRO…"

	para "<……> <……> <……>"

	para "An die #COM-"
	line "CENTER-"
	cont "Belegschaft…"

	para "Dank der"
	line "Drahtlosverbindung"
	cont "können jetzt"
	cont "Trainer landesweit"
	cont "miteinander"
	cont "interagieren."
	cont "Lasst uns auch"
	cont "weiterhin unser"
	cont "Bestes geben,"
	cont "damit sich Trainer"
	cont "eines Tages auch"
	cont "über Ländergrenzen"
	cont "hinaus miteinander"
	cont "verbinden können!"

	para "<……> <……> <……>"
	done

PokecomCenterAdminOfficeMobile_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0, 31, GOLDENROD_POKECENTER_1F, 3
	warp_event  1, 31, GOLDENROD_POKECENTER_1F, 3

	db 0 ; coord events

	db 3 ; bg events
	bg_event  6, 26, BGEVENT_UP, PokecomCenterAdminOfficeMobileComputer1
	bg_event  6, 28, BGEVENT_UP, PokecomCenterAdminOfficeMobileComputer2
	bg_event  3, 26, BGEVENT_UP, PokecomCenterAdminOfficeMobileComputer3

	db 3 ; object events
	object_event  4, 28, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist1Script, -1
	object_event  7, 27, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist2Script, -1
	object_event  7, 29, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist3Script, -1
