	object_const_def ; object_event constants
	const CELADONDEPTSTORE1F_RECEPTIONIST
	const CELADONDEPTSTORE1F_GENTLEMAN
	const CELADONDEPTSTORE1F_TEACHER

CeladonDeptStore1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonDeptStore1FReceptionistScript:
	jumptextfaceplayer CeladonDeptStore1FReceptionistText

CeladonDeptStore1FGentlemanScript:
	jumptextfaceplayer CeladonDeptStore1FGentlemanText

CeladonDeptStore1FTeacherScript:
	jumptextfaceplayer CeladonDeptStore1FTeacherText

CeladonDeptStore1FDirectory:
	jumptext CeladonDeptStore1FDirectoryText

CeladonDeptStore1FElevatorButton:
	jumpstd elevatorbutton

CeladonDeptStore1FReceptionistText:
	text "Hallo! Willkommen"
	line "im EINKAUFSZENTRUM"
	cont "von PRISMANIA"
	cont "CITY!"

	para "Die Übersicht"
	line "ist an der Wand."
	done

CeladonDeptStore1FGentlemanText:
	text "Dieses EINKAUFS-"
	line "ZENTRUM gehört"

	para "derselben Kette"
	line "an, wie das in"
	cont "DUKATIA CITY."

	para "Sie wurden beide"
	line "zur selben Zeit"
	cont "renoviert."
	done

CeladonDeptStore1FTeacherText:
	text "Ich bin zum"
	line "ersten Mal hier."

	para "Es ist so groß…"

	para "Ich habe Angst,"
	line "mich zu verlaufen."
	done

CeladonDeptStore1FDirectoryText:
	text "EG: KUNDEN-"
	line "    INFORMATION"

	para "1S: ZUBEHÖR für"
	line "    TRAINER"

	para "2S: TM-LADEN"

	para "3S: GESCHENK-"
	line "    ARTIKEL"

	para "4S: DROGERIE"

	para "5S: DACHTERRASSE"
	done

CeladonDeptStore1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  7,  7, CELADON_CITY, 1
	warp_event  8,  7, CELADON_CITY, 1
	warp_event 15,  0, CELADON_DEPT_STORE_2F, 2
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, CeladonDeptStore1FDirectory
	bg_event  3,  0, BGEVENT_READ, CeladonDeptStore1FElevatorButton

	db 3 ; object events
	object_event 10,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore1FReceptionistScript, -1
	object_event 11,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore1FGentlemanScript, -1
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore1FTeacherScript, -1
