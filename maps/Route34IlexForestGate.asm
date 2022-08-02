	object_const_def ; object_event constants
	const ROUTE34ILEXFORESTGATE_TEACHER1
	const ROUTE34ILEXFORESTGATE_BUTTERFREE
	const ROUTE34ILEXFORESTGATE_LASS
	const ROUTE34ILEXFORESTGATE_TEACHER2

Route34IlexForestGate_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .IsForestRestless

.IsForestRestless:
	checkevent EVENT_FOREST_IS_RESTLESS
	iffalse .Normal
	disappear ROUTE34ILEXFORESTGATE_TEACHER1
	appear ROUTE34ILEXFORESTGATE_TEACHER2
	return

.Normal:
	disappear ROUTE34ILEXFORESTGATE_TEACHER2
	appear ROUTE34ILEXFORESTGATE_TEACHER1
	return

Route34IlexForestGateCelebiEvent:
	checkevent EVENT_FOREST_IS_RESTLESS
	iffalse .skip
	showemote EMOTE_SHOCK, ROUTE34ILEXFORESTGATE_TEACHER2, 20
	turnobject ROUTE34ILEXFORESTGATE_TEACHER2, LEFT
	turnobject PLAYER, RIGHT
	follow PLAYER, ROUTE34ILEXFORESTGATE_TEACHER2
	applymovement PLAYER, MovementData_0x62d97
	stopfollow
	turnobject PLAYER, DOWN
	opentext
	writetext Route34IlexForestGateTeacher_ForestIsRestless
	waitbutton
	closetext
	applymovement ROUTE34ILEXFORESTGATE_TEACHER2, MovementData_0x62d9a
.skip:
	end

Route34IlexForestGateTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_FOREST_IS_RESTLESS
	iftrue .ForestIsRestless
	checkevent EVENT_GOT_TM12_SWEET_SCENT
	iftrue .GotSweetScent
	writetext Route34IlexForestGateTeacherText
	buttonsound
	verbosegiveitem TM_SWEET_SCENT
	iffalse .NoRoom
	setevent EVENT_GOT_TM12_SWEET_SCENT
.GotSweetScent:
	writetext Route34IlexForestGateTeacher_GotSweetScent
	waitbutton
.NoRoom:
	closetext
	end

.ForestIsRestless:
	writetext Route34IlexForestGateTeacher_ForestIsRestless
	buttonsound
	closetext
	end

Route34IlexForestGateButterfreeScript:
	opentext
	writetext Route34IlexForestGateButterfreeText
	cry BUTTERFREE
	waitbutton
	closetext
	end

Route34IlexForestGateLassScript:
	jumptextfaceplayer Route34IlexForestGateLassText

MovementData_0x62d97:
	step UP
	step UP
	step_end

MovementData_0x62d9a:
	step DOWN
	step RIGHT
	step_end

Route34IlexForestGateTeacherText:
	text "Oh, interessant."
	line "Du erstellst einen"
	cont "#DEX?"

	para "Das muss schwierig"
	line "sein, wenn du"
	cont "keine #MON"

	para "triffst. Versuche"
	line "es mit dieser TM."
	done

Route34IlexForestGateTeacher_GotSweetScent:
	text "Sie enthält"
	line "LOCKDUFT."

	para "Benutze sie dort,"
	line "wo #MON"
	cont "auftauchen."

	para "#MON werden"
	line "von dem Duft"
	cont "angezogen."
	done

Route34IlexForestGateTeacher_ForestIsRestless:
	text "Etwas stimmt nicht"
	line "im STEINEICHEN-"
	cont "WALD!"

	para "Geh nicht hinein!"
	done

Route34IlexForestGateButterfreeText:
	text "SMETTBO: Booh!"
	done

Route34IlexForestGateLassText:
	text "Hast du den"
	line "Schrein gesehen,"
	cont "der dem Schutz-"
	cont "patron huldigt?"

	para "Er wacht über den"
	line "WALD, aus einer"
	cont "anderen Zeit."

	para "Ich glaube, das"
	line "ist ein"
	cont "Pflanzen-#MON."
	done

Route34IlexForestGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_34, 1
	warp_event  5,  0, ROUTE_34, 2
	warp_event  4,  7, ILEX_FOREST, 1
	warp_event  5,  7, ILEX_FOREST, 1

	db 1 ; coord events
	coord_event  4,  7, SCENE_DEFAULT, Route34IlexForestGateCelebiEvent

	db 0 ; bg events

	db 4 ; object events
	object_event  9,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route34IlexForestGateTeacherScript, EVENT_ROUTE_34_ILEX_FOREST_GATE_TEACHER_BEHIND_COUNTER
	object_event  9,  4, SPRITE_BUTTERFREE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route34IlexForestGateButterfreeScript, -1
	object_event  3,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route34IlexForestGateLassScript, EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS
	object_event  5,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route34IlexForestGateTeacherScript, EVENT_ROUTE_34_ILEX_FOREST_GATE_TEACHER_IN_WALKWAY
