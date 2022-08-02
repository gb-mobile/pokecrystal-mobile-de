	object_const_def ; object_event constants
	const RUINSOFALPHOUTSIDE_YOUNGSTER1
	const RUINSOFALPHOUTSIDE_SCIENTIST
	const RUINSOFALPHOUTSIDE_FISHER
	const RUINSOFALPHOUTSIDE_YOUNGSTER2
	const RUINSOFALPHOUTSIDE_YOUNGSTER3

RuinsOfAlphOutside_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_RUINSOFALPHOUTSIDE_NOTHING
	scene_script .DummyScene1 ; SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ScientistCallback

.DummyScene0:
	end

.DummyScene1:
	end

.ScientistCallback:
	checkflag ENGINE_UNOWN_DEX
	iftrue .NoScientist
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .MaybeScientist
	sjump .NoScientist

.MaybeScientist:
	readvar VAR_UNOWNCOUNT
	ifgreater 2, .YesScientist
	sjump .NoScientist

.YesScientist:
	appear RUINSOFALPHOUTSIDE_SCIENTIST
	setscene SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX
	return

.NoScientist:
	disappear RUINSOFALPHOUTSIDE_SCIENTIST
	setscene SCENE_RUINSOFALPHOUTSIDE_NOTHING
	return

RuinsOfAlphOutsideScientistScene1:
	turnobject RUINSOFALPHOUTSIDE_SCIENTIST, UP
	turnobject PLAYER, DOWN
	sjump RuinsOfAlphOutsideScientistSceneContinue

RuinsOfAlphOutsideScientistScene2:
	turnobject RUINSOFALPHOUTSIDE_SCIENTIST, LEFT
	turnobject PLAYER, RIGHT
	sjump RuinsOfAlphOutsideScientistSceneContinue

RuinsOfAlphOutsideScientistScript:
	faceplayer
RuinsOfAlphOutsideScientistSceneContinue:
	opentext
	writetext RuinsOfAlphOutsideScientistText
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow RUINSOFALPHOUTSIDE_SCIENTIST, PLAYER
	applymovement RUINSOFALPHOUTSIDE_SCIENTIST, MovementData_0x580ba
	disappear RUINSOFALPHOUTSIDE_SCIENTIST
	stopfollow
	applymovement PLAYER, MovementData_0x580c5
	setmapscene RUINS_OF_ALPH_RESEARCH_CENTER, SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX
	warpcheck
	end

RuinsOfAlphOutsideFisherScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_RUINS_COWARD
	iftrue .Next
	setevent EVENT_TALKED_TO_RUINS_COWARD
	writetext RuinsOfAlphOutsideFisherText1
	buttonsound
.Next:
	writetext RuinsOfAlphOutsideFisherText2
	waitbutton
	closetext
	end

RuinsOfAlphOutsideYoungster1Script:
	faceplayer
	opentext
	writetext RuinsOfAlphOutsideYoungster1Text
	waitbutton
	closetext
	end

RuinsOfAlphOutsideYoungster2Script:
	faceplayer
	opentext
	writetext RuinsOfAlphOutsideYoungster2Text
	waitbutton
	closetext
	turnobject RUINSOFALPHOUTSIDE_YOUNGSTER3, UP
	end

TrainerPsychicNathan:
	trainer PSYCHIC_T, NATHAN, EVENT_BEAT_PSYCHIC_NATHAN, PsychicNathanSeenText, PsychicNathanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicNathanAfterBattleText
	waitbutton
	closetext
	end

TrainerSuperNerdStan:
	trainer SUPER_NERD, STAN, EVENT_BEAT_SUPER_NERD_STAN, SuperNerdStanSeenText, SuperNerdStanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SuperNerdStanAfterBattleText
	waitbutton
	closetext
	end

RuinsOfAlphOutsideMysteryChamberSign:
	jumptext RuinsOfAlphOutsideMysteryChamberSignText

RuinsOfAlphSign:
	jumptext RuinsOfAlphSignText

RuinsOfAlphResearchCenterSign:
	jumptext RuinsOfAlphResearchCenterSignText

MovementData_0x580ba:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

MovementData_0x580c5:
	step UP
	step_end

RuinsOfAlphOutsideScientistText:
	text "Hm? Das ist doch"
	line "ein #DEX, nicht"
	cont "wahr? Darf ich"
	cont "ihn sehen?"

	para "Es gibt so viele"
	line "unterschiedliche"
	cont "#MON."

	para "Hm? Was ist das?"

	para "Was ist das für"
	line "ein #MON?"

	para "Es sieht aus wie"
	line "die merkwürdigen"

	para "Zeichen an den"
	line "Wänden in den"
	cont "RUINEN."

	para "Falls diese Zei-"
	line "chen tatsächlich "
	cont "#MON sind, dann"
	cont "gibt es noch"
	cont "viel mehr davon."

	para "Ich weiß! Lass"
	line "mich deinen #-"
	cont "DEX erweitern."
	cont "Mir nach!"
	done

SuperNerdStanSeenText:
	text "Was willst du?"
	line "Ich lerne--"
	cont "stör mich nicht!"
	done

SuperNerdStanBeatenText:
	text "Entschuldigung…"
	line "Unser Mangel an"

	para "Verständnis"
	line "frustriert mich…"
	done

SuperNerdStanAfterBattleText:
	text "Die RUINEN"
	line "sind ungefähr"
	cont "1500 Jahre alt."

	para "Niemand weiß,"
	line "wer sie erbaute."

	para "Die Bedeutung der "
	line "#MON-Statuen"
	cont "ist auch noch"
	cont "nicht geklärt."

	para "Das Ganze ist ein"
	line "großes Rätsel…"
	done

PsychicNathanSeenText:
	text "Hm… Dies ist ein"
	line "merkwürdiger Ort."
	done

PsychicNathanBeatenText:
	text "…"
	done

PsychicNathanAfterBattleText:
	text "Ich komme oft"
	line "hierher, um nach-"
	cont "zudenken."
	done

RuinsOfAlphOutsideMysteryChamberSignText:
	text "RÄTSELSTEIN"
	line "PUZZLEKAMMER"
	done

RuinsOfAlphSignText:
	text "ALPH-RUINEN"
	line "Fremde willkommen!"
	done

RuinsOfAlphResearchCenterSignText:
	text "ALPH-RUINEN"
	line "FORSCHUNGSZENTRUM"

	para "DIE AUTORITÄT IN"
	line "SACHEN ALPH-RUINEN"
	done

RuinsOfAlphOutsideFisherText1:
	text "Beim Erkunden der"
	line "RUINEN haben wir"

	para "plötzlich eine"
	line "seltsame Gegenwart"
	cont "gespürt."

	para "Alle hatten Angst"
	line "und liefen davon."

	para "Du solltest auch"
	line "vorsichtig sein."
	done

RuinsOfAlphOutsideFisherText2:
	text "Den RUINEN wohnt"
	line "ein großes"
	cont "Geheimnis inne!"

	para "…Ich denke…"
	done

RuinsOfAlphOutsideYoungster1Text:
	text "Es gibt viele un-"
	line "terschiedliche"

	para "ICOGNITO, die wir"
	line "für unsere Geheim-"
	cont "codes benötigen."
	done

RuinsOfAlphOutsideYoungster2Text:
	text "V… O… R… A… U… S…"
	line "Hmm…"

	para "Wie?"

	para "Ich dechiffriere"
	line "diese Nachricht!"
	done

RuinsOfAlphOutside_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event  2, 17, RUINS_OF_ALPH_HO_OH_CHAMBER, 1
	warp_event 14,  7, RUINS_OF_ALPH_KABUTO_CHAMBER, 1
	warp_event  2, 29, RUINS_OF_ALPH_OMANYTE_CHAMBER, 1
	warp_event 16, 33, RUINS_OF_ALPH_AERODACTYL_CHAMBER, 1
	warp_event 10, 13, RUINS_OF_ALPH_INNER_CHAMBER, 1
	warp_event 17, 11, RUINS_OF_ALPH_RESEARCH_CENTER, 1
	warp_event  6, 19, UNION_CAVE_B1F, 1
	warp_event  6, 27, UNION_CAVE_B1F, 2
	warp_event  7,  5, ROUTE_36_RUINS_OF_ALPH_GATE, 3
	warp_event 13, 20, ROUTE_32_RUINS_OF_ALPH_GATE, 1
	warp_event 13, 21, ROUTE_32_RUINS_OF_ALPH_GATE, 2

	db 2 ; coord events
	coord_event 11, 14, SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX, RuinsOfAlphOutsideScientistScene1
	coord_event 10, 15, SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX, RuinsOfAlphOutsideScientistScene2

	db 3 ; bg events
	bg_event 16,  8, BGEVENT_READ, RuinsOfAlphOutsideMysteryChamberSign
	bg_event 12, 16, BGEVENT_READ, RuinsOfAlphSign
	bg_event 18, 12, BGEVENT_READ, RuinsOfAlphResearchCenterSign

	db 5 ; object events
	object_event  4, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerPsychicNathan, -1
	object_event 11, 15, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideScientistScript, EVENT_RUINS_OF_ALPH_OUTSIDE_SCIENTIST
	object_event 13, 17, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideFisherScript, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_FISHER
	object_event 14, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideYoungster1Script, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	object_event 12,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideYoungster2Script, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
