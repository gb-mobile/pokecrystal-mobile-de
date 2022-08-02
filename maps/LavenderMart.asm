	object_const_def ; object_event constants
	const LAVENDERMART_CLERK
	const LAVENDERMART_POKEFAN_M
	const LAVENDERMART_ROCKER

LavenderMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

LavenderMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_LAVENDER
	closetext
	end

LavenderMartPokefanMScript:
	jumptextfaceplayer LavenderMartPokefanMText

LavenderMartRockerScript:
	jumptextfaceplayer LavenderMartRockerText

LavenderMartPokefanMText:
	text "Es ist unabding-"
	line "bar, SCHUTZ bei"

	para "sich zu haben,"
	line "wenn man Höhlen"
	cont "erkundet."

	para "Obwohl ich Höhlen"
	line "sehr gerne"

	para "erforsche, habe"
	line "ich noch nicht"
	cont "alle erforscht."
	done

LavenderMartRockerText:
	text "Ich habe von einem"
	line "Kunstschmied"

	para "gehört, der maß-"
	line "gefertigte #-"
	cont "BÄLLE in AZALEA"

	para "in JOHTO her-"
	line "stellt. Ich"
	cont "wünschte, ich"
	cont "hätte auch welche."
	done

LavenderMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, LAVENDER_TOWN, 5
	warp_event  3,  7, LAVENDER_TOWN, 5

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderMartClerkScript, -1
	object_event  6,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderMartPokefanMScript, -1
	object_event  9,  2, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderMartRockerScript, -1
