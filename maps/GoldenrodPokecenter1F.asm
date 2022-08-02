	object_const_def ; object_event constants
	const GOLDENRODPOKECENTER1F_NURSE
	const GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	const GOLDENRODPOKECENTER1F_SUPER_NERD ; $04
	const GOLDENRODPOKECENTER1F_LASS2 ; $05
	const GOLDENRODPOKECENTER1F_YOUNGSTER
	const GOLDENRODPOKECENTER1F_TEACHER ; $07
	const GOLDENRODPOKECENTER1F_ROCKER ; $08
	const GOLDENRODPOKECENTER1F_GAMEBOY_KID
	const GOLDENRODPOKECENTER1F_GRAMPS ; $0A
	const GOLDENRODPOKECENTER1F_LASS
	const GOLDENRODPOKECENTER1F_POKEFAN_F

GoldenrodPokecenter1F_MapScripts:
	db 2 ; scene scripts
	scene_script .Scene0 ; SCENE_DEFAULT
	scene_script .Scene0 ; SCENE_DEFAULT

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .prepareMap

.Scene0: ; stuff to handle the player turning his gb off without saving after a trade
	setval BATTLETOWERACTION_10 ; 5671d checks if a trade was made
	special BattleTowerAction
	iffalse .noTrade ; $2967
	prioritysjump scenejmp01 ; $6F68 received pokemon from trade corner dialogue
	end

.noTrade
	setval BATTLETOWERACTION_EGGTICKET ; check if player received the odd egg or still has the egg ticket
	special BattleTowerAction ; 5672b
	iffalse .notReceivedOddEgg ; $3467 still has egg ticket
	prioritysjump scenejmp02 ; $B568 received odd egg dialogue
.notReceivedOddEgg
	end

.prepareMap
	special Mobile_DummyReturnFalse
	iftrue .mobile ; $5067
	moveobject GOLDENRODPOKECENTER1F_LASS2, $10, $09 ; this is 71 in jp crystal???
	moveobject GOLDENRODPOKECENTER1F_GRAMPS, $00, $07
	moveobject GOLDENRODPOKECENTER1F_SUPER_NERD, $08, $0D
	moveobject GOLDENRODPOKECENTER1F_TEACHER, $1B, $0D
	moveobject GOLDENRODPOKECENTER1F_ROCKER, $15, $06
	return ; this is 8f in jp crystal
.mobile
	setevent EVENT_33F
	return
	

GoldenrodPokecenter1FNurseScript:
	setevent EVENT_WELCOMED_TO_POKECOM_CENTER
	jumpstd pokecenternurse
	
GoldenrodPokecenter1FTradeCornerAttendantScript:
	db $0F
	db $01
	db $00
	opentext
	writetext GoldenrodPokecenter1FWelcomeToPCCText ; $2d6a
	buttonsound ; 54 in jp crystal?
	checkitem EGG_TICKET ; 56762 in jp crystal
	iftrue playerHasEggTicket ; $7c68
	db $0F
	db $71 ; check save file?
	db $00
	ifequal $01, pokemonInTradeCorner ; $F667
	ifequal $02, leftPokemonInTradeCornerRecently ; $6968
	readvar $01
	ifequal $01, .onlyHaveOnePokemon ; $CF67 ; 56772
	writetext GoldenrodPokecenter1FTradeMustHoldPokemonText ; $726A
	yesorno
	iffalse playerCancelled ; $D567
	
	writetext GoldenrodPokecenter1FTradeSaveText ; $756E 
	yesorno
	iffalse playerCancelled ; $D567
	special TryQuickSave
	iffalse playerCancelled ; $D567
	writetext GoldenrodPokecenter1FTradeWhichPokemonText ; $8F6E
	waitbutton ; 53 in jp crystal?
	db $0F
	db $4D
	db $00 ; 56792
	ifequal $00, playerCancelled ; $D567
	ifequal $FD, cantAcceptEgg ; $EA67
	ifgreater $FB, pokemonAbnormal ; $F067
	db $0F
	db $7B ; check party pokemon fainted
	db $00
	ifnotequal $00, cantTradeLastPokemon ; $E467
	writetext GoldenrodPokecenter1FTradeWhatKindText ; $9E6A
	waitbutton
	special Function11ac3e
	ifequal $00, playerCancelled ; $D567
	ifequal $02, .tradePokemonNeverSeen ; $BB67
	writetext GoldenrodPokecenter1FTradeSeenText ; $B96A ; 567B5
	sjump  .tradePokemon ; $BE67
.tradePokemonNeverSeen
	writetext GoldenrodPokecenter1FTradeNeverSeenText ; $1E6B
.tradePokemon
	db $0F
	db $6E ; create data to send?
	db $00
	ifequal $0A, playerCancelled ; $D567
	ifnotequal $00, mobileError ; $DB67
	writetext GoldenrodPokecenter1FTradePokemonReceivedText ; $A86B
	waitbutton
	closetext
	end
	
.onlyHaveOnePokemon
	writetext GoldenrodPokecenter1FTradeOnlyOnePokemonText ; $D76B
	waitbutton
	closetext
	end
	
playerCancelled
	writetext GoldenrodPokecenter1FTradeCancelledGoodbyeText ; $0F6C
	waitbutton
	closetext
	end
	
mobileError
	db $0F
	db $8B ; mobile error
	db $00
	writetext GoldenrodPokecenter1FTradeCancelledText ; $AA6E
	waitbutton
	closetext
	end
	
cantTradeLastPokemon
	writetext GoldenrodPokecenter1FTradeNoPokemonForBattleText ; $2C6C
	waitbutton
	closetext
	end
	
cantAcceptEgg
	writetext GoldenrodPokecenter1FTradeNoEggText ; $516C
	waitbutton
	closetext
	end
	
pokemonAbnormal
	writetext GoldenrodPokecenter1FTradeAbnormalText ; $6F6C
	waitbutton
	closetext
	end
	
pokemonInTradeCorner
	writetext GoldenrodPokecenter1FTradeSaveText ; $756E
	yesorno
	iffalse playerCancelled ; $D567
	special TryQuickSave
	iffalse playerCancelled ; $D567 ; 56800
	writetext GoldenrodPokecenter1FTradeAlreadyHoldingPokemonText ; $896C
	buttonsound
	readvar $01
	ifequal $06, partyFull ; $3868
	writetext GoldenrodPokecenter1FRoomCheckText ; $A56C
	db $0F
	db $6F ; connect
	db $00
	ifequal $0A, playerCancelled ; $D567
	ifnotequal $00, mobileError ; $DB67
	setval $0F
	db $0F
	db $86 ; 86 = BattleTowerAction
	db $00
	ifequal $00, noTradePartnerFound ; $3E68 ; 56820
	ifequal $01, .receivePokemon ; $2B68
	sjump pokemonInTradeCornerForALongTime ; $5668
	
.receivePokemon
	writetext GoldenrodPokecenter1FPartnerFoundText ; $C46C
	buttonsound
	db $0F
	db $70 ; receive a pokemon animation?
	db $00
	writetext GoldenrodPokecenter1FTradePokemonPartnerReceivedText ; $E66C
	waitbutton
	closetext
	end

partyFull
	writetext GoldenrodPokecenter1FTradePartyFullText ; $216D ; 56838
	waitbutton
	closetext
	end

noTradePartnerFound
	writetext GoldenrodPokecenter1FTradePokemonReturnedPromptText ; $576D ; 5683E
	yesorno
	iffalse continueHoldingPokemon ; $6368
	db $0F
	db $72 ; something with mobile
	db $00
	ifequal $0A, playerCancelled ; $D567
	ifnotequal $00, mobileError  ; $DB67
	writetext GoldenrodPokecenter1FTradePokemonReturnedAcceptText ; $8A6D
	waitbutton
	closetext
	end
	
pokemonInTradeCornerForALongTime
	writetext GoldenrodPokecenter1FTradeLonelyPokemonText ; $9A6D ; 56856
	buttonsound
	db $0F
	db $73 ; something with mobile
	db $00
	writetext GoldenrodPokecenter1FTradeLonelyPokemonGoodbyeText ; $016E
	waitbutton
	closetext
	end
	
continueHoldingPokemon
	writetext GoldenrodPokecenter1FTradeContinueHoldingText ; $176E ;56863
	waitbutton
	closetext
	end
	
leftPokemonInTradeCornerRecently
	writetext GoldenrodPokecenter1FTradeTooSoonText ; $306E ; 56869
	waitbutton
	closetext
	end
	
scenejmp01 ; ???
	setscene $01 ; 5686F
	refreshscreen
	writetext GoldenrodPokecenter1FPartnerFoundText ; $C46C
	buttonsound
	writetext GoldenrodPokecenter1FTradePokemonPartnerReceivedText ; $E66C
	waitbutton
	closetext
	end
	
playerHasEggTicket
	writetext GoldenrodPokecenter1FEggTicketOwnedText ; $CD6E ; 5687C
	waitbutton
	readvar $01
	ifequal $06, partyFull ; $3868
	writetext GoldenrodPokecenter1FTradeEggTicketExplanationText ; $106F
	waitbutton
	writetext GoldenrodPokecenter1FTradeSaveText ; $756E
	yesorno
	iffalse playerCancelled ; $D567
	special TryQuickSave
	iffalse playerCancelled ; $D567
	writetext GoldenrodPokecenter1FEggTicketPleaseWaitText ; $CC6F
	db $0F
	db $7D ; download odd egg
	db $00
	ifequal $0B, eggTicketExchangeNotRunning ; $AF68
	ifequal $0A, playerCancelled ; $D567
	ifnotequal $00, mobileError ; $DB67
receivedOddEgg
	writetext GoldenrodPokecenter1FEggTicketReceivedText ; $E66F
	waitbutton
	closetext
	end
	
eggTicketExchangeNotRunning
	writetext GoldenrodPokecenter1FEggTicketNotRunningText ; $2270 ; 568AF
	waitbutton
	closetext
	end
	
scenejmp02 ; 568B5
	opentext
	sjump receivedOddEgg ; $A968
	
GoldenrodPokecenter1F_NewsMachineScript:
	special Mobile_DummyReturnFalse ; 568B9
	iftrue .mobileEnabled ; $C268
	jumptext GoldenrodPokecenter1FNewsMachineNotReadyText ; $1F76
	
.mobileEnabled
	opentext
	writetext GoldenrodPokecenter1FNewsMachineText ; $4D70
	buttonsound
	setval $14
	db $0F
	db $86 ; battle tower action (get battle tower save file flags if save is yours?)
	db $00
	ifnotequal $00, .skipExplanation ; $D968
	setval $15
	db $0F
	db $86 ; battle tower action (set battle tower save file flags?)
	db $00
	writetext GoldenrodPokecenter1FNewsMachineExplanationText ; $6370 news machine tut
	waitbutton
.skipExplanation
	writetext GoldenrodPokecenter1FNewsMachineSaveText ; $C371
	yesorno
	iffalse .cancel ; $FF68
	special TryQuickSave
	iffalse .cancel ; $FF68
	setval $15
	db $0F
	db $86 ; battle tower action (set battle tower save file flags?)
	db $00
.showMenu
	writetext GoldenrodPokecenter1FNewsMachineWhatWillYouDoText ; $5970
	setval $00
	db $0F
	db $88 ; show news machine menu
	db $00
	ifequal $01, .getNews 		  ; $0869
	ifequal $02, .showNews 		  ; $1D69
	ifequal $03, .showExplanation ; $0169
.cancel
	closetext
	end
	
.showExplanation
	writetext GoldenrodPokecenter1FNewsMachineExplanationText ; $6370 ; 56901
	waitbutton
	sjump .showMenu ; $EB68
	
.getNews
	writetext GoldenrodPokecenter1FNewsMachineGetNewsPromptText ; $3E71 ; 56908
	yesorno
	iffalse .showMenu ; $EB68
	writetext GoldenrodPokecenter1FNewsMachineGettingNewsWaitText ; $5471 reading the latest news
	db $0F
	db $89 ; download news?
	db $00
	ifequal $0A, .showMenu ; $EB68
	ifnotequal $00, .mobileError ; $3569
.showNews
	db $0F
	db $8A ; show news?
	db $00
	iffalse .quitViewingNews ; $3269
	ifequal $01, .noOldNews ; $2E69
	writetext GoldenrodPokecenter1FNewsMachineCorruptedText ; $8971
	waitbutton
	sjump .showMenu ; $EB68
	
.noOldNews
	writetext GoldenrodPokecenter1FNewsMachineNoOldNewsText ; $7971 ; 5692E
	waitbutton
.quitViewingNews
	sjump .showMenu ; $EB68
	
.mobileError
	db $0F ; 56935
	db $8B ; mobile error
	db $00
	closetext
	end

Unreferenced:
	writetext GoldenrodPokecenter1FLinkReceptionistNotReadyText ; ??? $AA71 ; 5693A no jump to here?
	waitbutton
	closetext
	end
	
GoldenrodPokecenter1F_GSBallSceneLeft
	setval $0B ; 56940
	db $0F
	db $86 ; battle tower action (load mobile event index)
	db $00
	iffalse nogsball ; $9769
	checkevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER ; 340
	iftrue nogsball ; $9769
	moveobject $03, $0C, $0B
	sjump gsball ; 6769
	
GoldenrodPokecenter1F_GSBallSceneRight
	setval $0B ; 56955
	db $0F
	db $86 ; battle tower action (load mobile event index)
	db $00
	iffalse nogsball ; $9769
	checkevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER ; 340
	iftrue nogsball ; $9769
	moveobject $03, $0D, $0B
	
gsball ; 56769
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	appear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistApproachPlayerMovement ; $0F6A
	turnobject PLAYER, UP
	opentext
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText
	waitbutton
	verbosegiveitem GS_BALL
	setevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText
	waitbutton
	closetext
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistWalkBackMovement ; $196A
	special RestartMapMusic
	moveobject GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, 16,  8
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	appear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	
nogsball
	end
	
GoldenrodPokecenter1FSuperNerdScript:
	special Mobile_DummyReturnFalse ; 56998
	iftrue .mobile ; $A169
	jumptextfaceplayer GoldenrodPokecenter1FMobileOffSuperNerdText ; $E071 
	
.mobile
	jumptextfaceplayer GoldenrodPokecenter1FMobileOnSuperNerdText ; $1E72
	
GoldenrodPokecenter1FLass2Script:
	special Mobile_DummyReturnFalse ; 569A4
	iftrue .mobile
	jumptextfaceplayer GoldenrodPokecenter1FMobileOffLassText ; $AD72
	
.mobile
	checkevent EVENT_33F
	iftrue .alreadyMoved ; $D369
	faceplayer
	opentext
	writetext GoldenrodPokecenter1FMobileOnLassText1 ; $EB72
	waitbutton
	closetext
	readvar $09
	ifequal $02, .talkedToFromRight ; $C769
	applymovement GOLDENRODPOKECENTER1F_LASS2, GoldenrodPokeCenter1FLass2WalkRightMovement ; $236A
	sjump .skip ; $CB69
.talkedToFromRight
	applymovement GOLDENRODPOKECENTER1F_LASS2, GoldenrodPokeCenter1FLassWalkRightAroundPlayerMovement ; $276A
.skip
	setevent EVENT_33F
	moveobject GOLDENRODPOKECENTER1F_LASS2, $12, $09
	end

.alreadyMoved
	jumptextfaceplayer GoldenrodPokecenter1FMobileOnLassText2 ; $2373
	
GoldenrodPokecenter1FYoungsterScript:
	special Mobile_DummyReturnFalse ; 569D6
	iftrue .mobile ; $DF69
	jumptextfaceplayer GoldenrodPokecenter1FMobileOffYoungsterText ; $5473
	
.mobile
	jumptextfaceplayer GoldenrodPokecenter1FMobileOnYoungsterText ; $1074
	
GoldenrodPokecenter1FTeacherScript:
	special Mobile_DummyReturnFalse ; 569E2
	iftrue .mobile ; $EB69
	jumptextfaceplayer GoldenrodPokecenter1FMobileOffTeacherText ; $8273
	
.mobile
	jumptextfaceplayer GoldenrodPokecenter1FMobileOnTeacherText ; $3274
	
GoldenrodPokecenter1FRockerScript:
	special Mobile_DummyReturnFalse ; 569EE
	iftrue .mobile ; $F769
	jumptextfaceplayer GoldenrodPokecenter1FMobileOffRockerText ; $D073
	
.mobile
	jumptextfaceplayer GoldenrodPokecenter1FMobileOnRockerText ; $5474
	
GoldenrodPokecenter1FGrampsScript:
	special Mobile_DummyReturnFalse ; 569FD
	iftrue .mobile ; $066A
	jumptextfaceplayer GoldenrodPokecenter1FMobileOffGrampsText ; $D674
	
.mobile
	jumptextfaceplayer GoldenrodPokecenter1FMobileOnGrampsText ; $1875
	
GoldenrodPokecenter1FInfoSign:
	jumptext GoldenrodPokecenter1FInfoSignText

GoldenrodPokecenter1FGameboyKidScript:
	jumptextfaceplayer GoldenrodPokecenter1FGameboyKidText

GoldenrodPokecenter1FLassScript:
	jumptextfaceplayer GoldenrodPokecenter1FLassText

GoldenrodPokecenter1FPokefanF:
	faceplayer
	opentext
	writetext GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText
	waitbutton
	writetext GoldenrodPokecenter1FAskGiveAwayAnEonMailText
	yesorno
	iffalse .NoEonMail
	takeitem EON_MAIL
	iffalse .NoEonMail
	writetext GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText
	waitbutton
	writetext GoldenrodPokecenter1FPokefanFThisIsForYouText
	waitbutton
	verbosegiveitem REVIVE
	iffalse .NoRoom
	writetext GoldenrodPokecenter1FPokefanFDaughterWillBeDelightedText
	waitbutton
	closetext
	end

.NoEonMail:
	writetext GoldenrodPokecenter1FPokefanFTooBadText
	waitbutton
	closetext
	end

.NoRoom:
	giveitem EON_MAIL
	writetext GoldenrodPokecenter1FPokefanFAnotherTimeThenText
	waitbutton
	closetext
	end

GoldenrodPokeCenter1FLinkReceptionistApproachPlayerMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step_end

GoldenrodPokeCenter1FLinkReceptionistWalkBackMovement:
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

GoldenrodPokeCenter1FLass2WalkRightMovement:
	slow_step RIGHT ; db $0B
	slow_step RIGHT ; db $0B
	turn_head UP    ; db $01
	step_end 		; db $47

GoldenrodPokeCenter1FLassWalkRightAroundPlayerMovement:
	slow_step DOWN  ; db $08
	slow_step RIGHT ; db $0B
	slow_step RIGHT ; db $0B
	slow_step UP    ; db $09
	turn_head UP    ; db $01
	step_end 		; db $47

GoldenrodPokecenter1FWelcomeToPCCText:
					
	text "Hallo! Willkommen"
	line "in der #COM-"
	cont "CENTER-"
	cont "HANDELSECKE."

	para "Du kannst hier"
	line "#MON mit weit"
	cont "entfernten"
	cont "Freunden tauschen."
	done

GoldenrodPokecenter1FTradeMustHoldPokemonText:
	text "Zum Tauschen"
	line "bewahren wir dein"
	cont "#MON bei uns"
	cont "auf."

	para "Möchtest du gerne"
	line "tauschen?"
	done

GoldenrodPokecenter1FTradeWhatKindText:
	text "Welches #MON"
	line "erhoffst du dir im"
	cont "Gegenzug?"
	done

GoldenrodPokecenter1FTradeSeenText:
	text "Gut, wir werden"
	line "versuchen dein"

	cont "@"
	text_ram wStringBuffer3
	text ""

	cont "gegen ein"

	cont "@"
	text_ram wStringBuffer4
	text ""

	cont"zu tauschen."

	para "Wir nehmen dein"
	line "#MON jetzt"
	cont "entgegen."

	para "Warte bitte,"
	line "während wir den"
	cont "Raum vorbereiten."
	done

GoldenrodPokecenter1FTradeNeverSeenText:
	text "Gut, wir werden"
	line "versuchen dein"

	cont "@"
	text_ram wStringBuffer3
	text ""

	cont "gegen ein #MON"
	cont "zu tauschen, dem"
	cont "du bisher noch"
	cont "nicht begegnet"
	cont "bist."

	para "Wir nehmen dein"
	line "#MON jetzt"
	cont "entgegen."

	para "Warte bitte,"
	line "während wir den"
	cont "Raum vorbereiten."
	done

GoldenrodPokecenter1FTradePokemonReceivedText:
	text "Dein #MON wurde"
	line "entgegengenommen."

	para "Einen"
	line "Tauschpartner zu"
	cont "finden kann nun"
	cont "ein wenig dauern,"
	cont "also komm später"
	cont "wieder vorbei."
	done

GoldenrodPokecenter1FTradeOnlyOnePokemonText:
	text "Oh? Du hast nur"
	line "ein #MON in"
	cont "deinem Team."

	para "Bitte komm wieder,"
	line "wenn du dein Team"
	cont "vergrößert hast."
	done

GoldenrodPokecenter1FTradeCancelledGoodbyeText:
	text "Komm jederzeit"
	line "wieder vorbei!"
	done

GoldenrodPokecenter1FCommunicationError: ; Unreferenced
	text "Übertragungs-"
	line "fehler."
	done

GoldenrodPokecenter1FTradeNoPokemonForBattleText:
	text "Wenn wir dieses"
	line "#MON"
	cont "entgegennehmen,"
	cont "hättest du keine"
	cont "#MON mehr zum"
	cont "Kämpfen übrig."
	done

GoldenrodPokecenter1FTradeNoEggText:
	text "Tut mir Leid, aber"
	line "wir können kein EI"
	cont "annehmen."
	done

GoldenrodPokecenter1FTradeAbnormalText:
	text "Mit diesem #MON"
	line "scheint etwas"
	cont "nicht in Ordnung"
	cont "zu sein."

	para "Wir können es"
	line "daher nicht"
	cont "entgegennehmen."
	done

GoldenrodPokecenter1FTradeAlreadyHoldingPokemonText:
	text "Oh? Haben wir"
	line "nicht schon eines"
	cont "deiner #MON"
	cont "entgegengenommen?"
	done

GoldenrodPokecenter1FRoomCheckText:
	text "Wir überprüfen die"
	line "Räume für dich."

	para "Bitte warte einen"
	line "Moment…"
	done

GoldenrodPokecenter1FPartnerFoundText:
	text "Danke, dass du"
	line "gewartet hast."

	para "Ein Tauschpartner"
	line "wurde gefunden!"
	done

GoldenrodPokecenter1FTradePokemonPartnerReceivedText:
	text "Hier ist dein"
	line "neuer Freund!"

	para "Kümmere dich gut"
	line "um ihn."

	para "Komm jederzeit"
	line "wieder vorbei."
	done

GoldenrodPokecenter1FTradePartyFullText:
	text "Oh, oh. Dein Team"
	line "ist schon voll"
	cont "besetzt."

	para "Schaffe Platz in"
	line "deinem Team und"
	cont "komm dann wieder."
	done

GoldenrodPokecenter1FTradePokemonReturnedPromptText:
	text "Leider konnte"
	line "bisher kein"
	cont "Tauschpartner"
	cont "gefunden werden."

	para "Möchtest du dein"
	line "#MON zurück?"
	done

GoldenrodPokecenter1FTradePokemonReturnedAcceptText:
	text "Hier hast du dein"
	line "#MON zurück."
	done

GoldenrodPokecenter1FTradeLonelyPokemonText:
	text "Leider konnte"
	line "bisher kein"
	cont "Tauschpartner"
	cont "gefunden werden."

	para "Da wir dein"
	line "#MON bereits"
	cont "sehr lange"
	cont "aufbewahren, fühlt"
	cont "es sich"
	cont "mittlerweile"
	cont "ziemlich einsam."

	para "Wir geben es dir"
	line "vorerst zurück…"
	done

GoldenrodPokecenter1FTradeLonelyPokemonGoodbyeText:
	text "Komm jederzeit"
	line "wieder vorbei!"
	done

GoldenrodPokecenter1FTradeContinueHoldingText:
	text "In Ordnung, wir"
	line "werden dein"
	cont "#MON noch eine"
	cont "Weile aufbewahren."
	done

GoldenrodPokecenter1FTradeTooSoonText:
	text "Oh? Du hast uns"
	line "dein #MON erst"
	cont "kürzlich"
	cont "anvertraut."

	para "Komm bitte später"
	line "wieder."
	done

GoldenrodPokecenter1FTradeSaveText:
	text "Das Spiel wird"
	line "gesichert, ehe die"
	cont "Verbindung zum"
	cont "CENTER aufgebaut"
	cont "wird."
	done

GoldenrodPokecenter1FTradeWhichPokemonText:
	text "Welches #MON"
	line "willst du"
	cont "tauschen?"
	done

GoldenrodPokecenter1FTradeCancelledText:
	text "Tut mir Leid, aber"
	line "der Tausch wurde"
	cont "abgebrochen."
	done

GoldenrodPokecenter1FEggTicketOwnedText:
	text "Oh! Wie ich sehe,"
	line "besitzt du ein EI-"
	cont "TICKET!"

	para "Dieser Coupon ist"
	line "nur für besondere"
	cont "Leute und er kann"
	cont "gegen ein"
	cont "besonderes #MON"
	cont "eingelöst werden."
	done

GoldenrodPokecenter1FTradeEggTicketExplanationText:
	text "Lass mich dir eine"
	line "kurze Einweisung"
	cont "geben!"

	para "In der HANDELSECKE"
	line "kannst du über"
	cont "größere"
	cont "Entfernungen"
	cont "tauschen, weshalb"
	cont "dieser Vorgang"
	cont "etwas Zeit in"
	cont "Anspruch nehmen"
	cont "kann."

	para "Das KURIOS-EI"
	line "hingegen wurde"
	cont "extra nur für dich"
	cont "hinterlegt!"

	para "Daher können wir"
	line "es dir sofort in"
	cont "einen von dir"
	cont "gewählten CENTER-"
	cont "Raum übersenden."
	done

GoldenrodPokecenter1FEggTicketPleaseWaitText:
	text "Vorbereitungen"
	line "werden getroffen…"
	done

GoldenrodPokecenter1FEggTicketReceivedText:
	text "Danke, dass du"
	line "gewartet hast."

	para "Wir haben dein"
	line "KURIOS-EI"
	cont "empfangen!"

	para "Bitte schön!"

	para "Bitte ziehe es in"
	line "liebevoller Pflege"
	cont "auf."
	done

GoldenrodPokecenter1FEggTicketNotRunningText:
	text "Tut mir Leid, aber"
	line "der EI-TICKET-"
	cont "Austausch ist"
	cont "momentan nicht"
	cont "verfügbar."
	done

GoldenrodPokecenter1FNewsMachineText:
	text "Es ist eine"
	line "#MON-DATEN-"
	cont "MASCHINE."
	done

GoldenrodPokecenter1FNewsMachineWhatWillYouDoText:
	text "Was möchtest du"
	line "tun?"
	done

GoldenrodPokecenter1FNewsMachineExplanationText:
	text "#MON-DATEN"
	line "werden aus den"
	cont "SPIELSTÄNDEN"
	cont "verschiedener"
	cont "Trainer"
	cont "zusammengestellt."

	para "Dein SPIELSTAND"
	line "wird übertragen,"
	cont "wenn du neue DATEN"
	cont "abrufst."

	para "Der SPIELSTAND"
	line "enthalten dein"
	cont "Abenteuer-Logbuch"
	cont "und MOBILPROFIL."
	cont "Deine"
	cont "Telefonnummer wird"
	cont "dabei nicht"
	cont "übertragen."

	para "Der Inhalt der"
	line "DATEN hängt von"
	cont "den SPIELSTÄNDEN"
	cont "aller Teilnehmer"
	cont "ab."

	para "Vielleicht taucht"
	line "auch dein Name"
	cont "eines Tages in den"
	cont "DATEN auf!"
	done

GoldenrodPokecenter1FNewsMachineGetNewsPromptText:
	text "Möchtest du die"
	line "DATEN abrufen?"
	done

GoldenrodPokecenter1FNewsMachineGettingNewsWaitText:
	text "Empfange die"
	line "aktuellen DATEN…"
	cont "Bitte warten."
	done

GoldenrodPokecenter1FNewsMachineNoOldNewsText:
	text "Bisher keine"
	line "DATEN empfangen."
	done

GoldenrodPokecenter1FNewsMachineCorruptedText:
	text "Die DATEN sind"
	line "beschädigt."

	para "Bitte lade die"
	line "DATEN erneut"
	cont "herunter."
	done

GoldenrodPokecenter1FLinkReceptionistNotReadyText:
	text "Wir treffen noch"
	line "Vorbereitungen."

	para "Komm bitte später"
	line "wieder."
	done

GoldenrodPokecenter1FNewsMachineSaveText:
	text "Ehe du die DATEN-"
	line "MASCHINE bedienst,"
	cont "wird dein"
	cont "Spielstand"
	cont "gesichert."
	done

GoldenrodPokecenter1FMobileOffSuperNerdText:
	text "Dieses #MON-"
	line "CENTER ist riesig."

	para "Es wurde soeben"
	line "fertig. Es gibt"

	para "auch viele neue"
	line "Maschinen."
	done

GoldenrodPokecenter1FMobileOnSuperNerdText:
	text "Ich habe mir etwas"
	line "lustiges für die"
	cont "TAUSCHECKE aus-|cont/LINE ADDEDgedacht"

	para "Ich gebe TAUBSI"
	line "einen BRIEF und"

	para "tausche es gegen"
	line "ein anderes!"

	para "Wenn das jeder"
	line "tut, könnte man"

	para "mit allen mög-"
	line "lichen Leuten"
	cont "BRIEFE tauschen!"

	para "Ich nenne das"
	line "TAUBSI-BRIEF!"

	para "Setzt es sich"
	line "durch, schließe"

	para "ich viele neue"
	line "Freundschaften!"
	done

GoldenrodPokecenter1FMobileOffLassText:
	text "Sie sagen, dass"
	line "man dort sogar mit"

	para "Fremden tauschen"
	line "kann."

	para "Aber sie arbeiten"
	line "noch daran."
	done

GoldenrodPokecenter1FMobileOnLassText1:
	text "Ein mir fremdes"
	line "Mädchen schickte"

	para "mir ihr"
	line "HOPPSPROSS."

	para "Tausche #MON,"
	line "die du möchtest."
	done

GoldenrodPokecenter1FMobileOnLassText2:
	text "Ich erhielt ein"
	line "weibliches"
	cont "HOPPSPROSS, das"
	cont "SEAMUS heißt!"

	para "So heißt mein"
	line "Vater!"
	done

GoldenrodPokecenter1FMobileOffYoungsterText:
	text "Welches ist die"
	line "NACHRICHTEN-"
	cont "MASCHINE?"

	para "Bezieht sie die"
	line "Nachrichten"
	cont "nur vom Radio?"
	done

GoldenrodPokecenter1FMobileOffTeacherText:
	text "Das #COM-CENTER"
	line "ist drahtlos mit"
	cont "allen #MON-"
	cont "CENTERN verbunden."

	para "Das bedeutet wohl,"
	line "dass ich mich mit"
	cont "allen möglichen"
	cont "Leuten verbinden"
	cont "kann!"
	done

GoldenrodPokecenter1FMobileOffRockerText:
	text "Die Maschinen sind"
	line "noch nicht ein-"
	cont "satzbereit."

	para "Dennoch ist es"
	line "toll, solch einen"

	para "modernen Ort vor"
	line "allen anderen zu"
	cont "besuchen."
	done

GoldenrodPokecenter1FMobileOnYoungsterText:
	text "Mein Freund war"
	line "neulich in den"

	para "NACHRICHTEN. Das"
	line "hat mich"
	cont "überrascht!"
	done

GoldenrodPokecenter1FMobileOnTeacherText:
	text "Ich werde unruhig,"
	line "wenn ich nicht"

	para "die neusten"
	line "NACHRICHTEN"

	para "bekomme!"
	done

GoldenrodPokecenter1FMobileOnRockerText:
	text "Wenn ich in die"
	line "NACHRICHTEN komme,"

	para "werde ich berühmt"
	line "und verehrt."

	para "Wie kann ich es"
	line "bloß in die NACH-"
	cont "RICHTEN schaffen?"
	done

GoldenrodPokecenter1FGameboyKidText:
	text "Im oberen Stock-"
	line "werk findest du"

	para "das KOLOSSEUM."
	line "Hier kannst du"

	para "gegen Freunde"
	line "antreten."

	para "Kampfergebnisse"
	line "werden an der Wand"

	para "ausgehängt. Ich"
	line "kann es mir nicht"

	para "erlauben, zu ver-"
	line "lieren."
	done

GoldenrodPokecenter1FMobileOffGrampsText:
	text "Ich bin sofort"
	line "hierher gekommen,"

	para "als ich hörte,"
	line "dass das #MON-"
	cont "CENTER in DUKATIA"

	para "neue Maschinen"
	line "hat."

	para "Aber es scheint,"
	line "als seien sie noch"

	para "mitten in den"
	line "Vorbereitungen…"
	done

GoldenrodPokecenter1FMobileOnGrampsText:
	text "Allein das Be-"
	line "trachten dieser"

	para "neuen Errungen-"
	line "schaften macht"
	cont "mich jünger!"
	done

GoldenrodPokecenter1FLassText:
	text "Ein starkes #-"
	line "MON muss nicht"
	cont "zwingend gewinnen."

	para "Meist entscheidet"
	line "der Vor- oder"
	cont "Nachteil des Typs."

	para "Ich glaube nicht,"
	line "dass es ein #-"
	cont "MON gibt, das al-"
	cont "len anderen über-"
	cont "legen ist."
	done

GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText:
	text "<PLAYER>, oder?"

	para "Glückwunsch!"

	para "Nur für dich wurde"
	line "ein GS-BALL"
	cont "geschickt!"

	para "Nimm ihn bitte!"
	done

GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText:
	text "Beehre uns bald"
	line "wieder!"
	done

GoldenrodPokecenter1FInfoSignText:
	text "#COM-CENTER"

	para "EG INFORMATIONEN"

	para "Links: VERWALTUNG"

	para "Mitte: HANDELSECKE"

	para "Rechts: #MON-"
	line "DATEN"
	done

GoldenrodPokecenter1FNewsMachineNotReadyText:
	text "Das ist eine #-"
	line "MON NACHRICHTEN-"
	cont "MASCHINE!"

	para "Sie ist noch nicht"
	line "in Betrieb…"
	done

GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText:
	text "Oh, dein Beutel"
	line "sieht schwer aus!"

	para "Oh! Hast du zufäl-"
	line "lig etwas, das man"
	cont "ANARA-BRIEF nennt?"

	para "Meine Tochter"
	line "sucht danach."

	para "Du gibst mir doch"
	line "einen, nicht wahr?"
	done

GoldenrodPokecenter1FAskGiveAwayAnEonMailText:
	text "ANARA-BRIEF"
	line "weggeben?"
	done

GoldenrodPokecenter1FPokefanFThisIsForYouText:
	text "Oh, großartig!"
	line "Danke, Schatz!"

	para "Hier, als Aus-"
	line "gleich sollst"
	cont "du das haben!"
	done

GoldenrodPokecenter1FPokefanFDaughterWillBeDelightedText:
	text "Meine Tochter wird"
	line "entzückt sein!"
	done

GoldenrodPokecenter1FPokefanFTooBadText:
	text "Oh? Du hast"
	line "keinen? Schade."
	done

GoldenrodPokecenter1FPokefanFAnotherTimeThenText:
	text "Oh… Ein anderes"
	line "Mal vielleicht."
	done

GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText:
	text "<PLAYER> gibt den"
	line "ANARA-BRIEF weg."
	done

GoldenrodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  6, 15, GOLDENROD_CITY, 15
	warp_event  7, 15, GOLDENROD_CITY, 15
	warp_event  0,  6, POKECOM_CENTER_ADMIN_OFFICE_MOBILE, 1
	warp_event  0, 15, POKECENTER_2F, 1

	db 2 ; coord events
	coord_event  6, 15, SCENE_DEFAULT, GoldenrodPokecenter1F_GSBallSceneLeft
	coord_event  7, 15, SCENE_DEFAULT, GoldenrodPokecenter1F_GSBallSceneRight

	db 16 ; bg events
	bg_event 24,  5, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript ; 57666
	bg_event 24,  6, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript
	bg_event 24,  7, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript
	bg_event 24,  9, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript
	bg_event 24, 10, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript
	bg_event 25, 11, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript
	bg_event 26, 11, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript
	bg_event 27, 11, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript
	bg_event 28, 11, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript
	bg_event 29,  5, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript
	bg_event 29,  6, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript
	bg_event 29,  7, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript
	bg_event 29,  8, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript
	bg_event 29,  9, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript
	bg_event 29, 10, BGEVENT_READ, GoldenrodPokecenter1F_NewsMachineScript
	bg_event  2,  9, BGEVENT_READ, GoldenrodPokecenter1FInfoSign

	db 11 ; 576B6 ; 5 ; object events sprite, y, x, movedata , ?, ?, ?, pal, ?, pointer, ?, ?
	object_event  7,  7, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FNurseScript, -1
	 ; 576C4
	object_event 16,  8, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FTradeCornerAttendantScript, -1
	 ; boy left of trade corner 576D1
	object_event 13,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_UP_DOWN, 16, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FSuperNerdScript, -1
	 ; girl in front of trade corner 576DE
	object_event 18,  9, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FLass2Script, -1
	 ; boy left of news machine 576EB
	object_event 23, 08, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FYoungsterScript, -1
	 ; girl right of news machine 576F8
	object_event 30, 09, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FTeacherScript, -1
	 ; boy right of news machine 57705
	object_event 30, 05, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FRockerScript, -1
	 ; 57712
	object_event 11, 12, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FGameboyKidScript, -1
	 ; old man 5771F
	object_event 19, 14, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FGrampsScript, -1
	 ; 5772C
	object_event  4, 11, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FLassScript, -1
	object_event 15, 12, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FPokefanF, -1
