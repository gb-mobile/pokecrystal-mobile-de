_FruitBearingTreeText::
	text "Es ist ein"
	line "Obstbaum."
	done

_HeyItsFruitText::
	text "Hey! Das ist eine"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_ObtainedFruitText::
	text_ram wStringBuffer3
	text_start
	line "erhalten!"
	done

_FruitPackIsFullText::
	text "Aber der BEUTEL"
	line "ist voll…"
	done

_NothingHereText::
	text "Hier ist"
	line "nichts…"
	done

_WhichApricornText::
	text "Welche APRIKOKO"
	line "soll ich benutzen?"
	done

_HowManyShouldIMakeText::
	text "Wie viele soll ich"
	line "fertigen?"
	done

_RecoveredSomeHPText::
	text_ram wStringBuffer1
	text_start
	line "erhält @"
	text_decimal wCurHPAnimDeltaHP, 2, 3
	text " KP!"
	done

_CuredOfPoisonText::
	text "Die Vergiftung von"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "wurde geheilt."
	done

_RidOfParalysisText::
	text "Die Paralyse von"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "wurde aufgehoben."
	done

_BurnWasHealedText::
	text "Verbrennung von"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "wurde geheilt."
	done

_WasDefrostedText::
	text_ram wStringBuffer1
	text_start
	line "wurde aufgetaut."
	done

_WokeUpText::
	text_ram wStringBuffer1
	text_start
	line "ist aufgewacht."
	done

_HealthReturnedText::
	text_ram wStringBuffer1
	text_start
	line "ist wieder fit."
	done

_RevitalizedText::
	text_ram wStringBuffer1
	text_start
	line "ist wieder fit."
	done

_GrewToLevelText::
	text_ram wStringBuffer1
	text " grew to"
	line "level @"
	text_decimal wCurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79 ; plays SFX_DEX_FANFARE_50_79, identical to SFX_LEVEL_UP
	text_waitbutton
	text_end

	text_end ; unused

_CameToItsSensesText::
	text_ram wStringBuffer1
	text " kommt"
	line "wieder zu sich."
	done

_EnterNewPasscodeText::
	text "Gib eine 4-"
	line "stellige Zahl ein."
	done

_ConfirmPasscodeText::
	text "Gib dieselbe Zahl"
	line "zur Bestätigung"
	cont "ein."
	done

_PasscodesNotSameText::
	text "Das war nicht"
	line "dieselbe Nummer."
	done

_PasscodeSetText::
	text "Dein CODE wurde"
	line "festgelegt."

	para "Gib diese Nummer"
	line "ein, wenn du den"
	cont "KARTENORDNER"
	cont "öffnen möchtest."

	para ""
	done

_FourZerosInvalidText::
	text "0000 ist ungültig!"

	para ""
	done

_EnterPasscodeText::
	text "Gib den KARTEN-"
	next "ORDNER-CODE ein."
	done

_IncorrectPasscodeText::
	text "CODE"
	line "falsch!"

	para ""
	done

_CardFolderOpenText::
	text "KARTENORDNER"
	line "geöffnet.@"
	text_end

_OakTimeText1::
	text "<……><……><……><……><……><……>"
	line "<……><……><……><……><……><……>"

	para "Zzz… Hm? Was…?"
	line "Du hast mich auf-"
	cont "geweckt. Kannst du"

	para "mir sagen, wie"
	line "spät es ist?"
	prompt

_OakTimeText2::
	text "Wie spät ist es?"
	done

_OakTimeText3::
	text "What?@"
	text_end

_OakTimeText4::
	text "?"
	done

_OakTimeText5::
	text "Wie viele Minuten?"
	done

_OakTimeText6::
	text "Whoa!@"
	text_end

_OakTimeText7::
	text "?"
	done

_OakTimeText8::
	text "!"
	line "Ich habe"
	cont "verschlafen!"
	done

_OakTimeText11::
	text "!"
	line "Uah! Ich habe"
	cont "verschlafen!"
	done

_OakTimeText12::
	text "!"
	line "Kein Wunder, dass"
	cont "es so dunkel ist!"
	done

_OakTimeText13::
	text "Welcher Tag ist"
	line "heute?"
	done

_OakTimeText14::
	text ", oder?"
	done

UnknownText_0x1bc384::
	text "Es ist nichts"
	line "angeschlossen."
	done

UnknownText_0x1bc3a1::
	text "Überprüfe den"
	line "Handy-Adapter."
	done

UnknownText_0x1bc3bc::
	text "Überprüfe"
	line "CDMA-Adapter."
	done

UnknownText_0x1bc3d1::
	text "Überprüfe DOCOMO"
	line "PHS-Adapter."
	done

UnknownText_0x1bc3ec::
	text "Überprüfe DDI"
	line "PHS-Adapter."
	done

UnknownText_0x1bc404::
	text "Überprüfe unbe-"
	line "grenzten Mobil-"
	cont "Kampf-Adapter."
	done

UnknownText_0x1bc42c::
	text "Das Passwort ist:"
	line ""
	done

UnknownText_0x1bc43f::
	text "Einverstanden?"
	done

UnknownText_0x1bc44c::
	text "Gib die"
	line "ID-Nummer ein.."
	done

UnknownText_0x1bc45e::
	text "Gib den"
	line "Betrag ein."
	done

_NothingToChooseText::
	text "Es gibt nichts"
	line "zum Auswählen."
	prompt

_WhichSidePutOnText::
	text "Auf welcher Seite"
	line "willst du sie"
	cont "ablegen?"
	done

_WhichSidePutAwayText::
	text "Welche Seite"
	line "willst du ablegen?"
	done

_PutAwayTheDecoText::
	text_ram wStringBuffer3
	text_start
	line "ablegen."
	prompt

_NothingToPutAwayText::
	text "Hier ist nichts"
	line "zum Ablegen."
	prompt

_SetUpTheDecoText::
	text "Dekoriere dein"
	line "Zimmer mit"

	para "@"
	text_ram wStringBuffer3
	text "."
	prompt

_PutAwayAndSetUpText::
	text "Entferne"
	line "@"
	text_ram wStringBuffer3
	text_start

	para "und dekoriere mit"
	line "@"
	text_ram wStringBuffer4
	text "."
	prompt

_AlreadySetUpText::
	text "Das ist schon"
	line "in deinem Zimmer."
	prompt

_LookTownMapText::
	text "Dies ist die"
	line "KARTE."
	done

_LookPikachuPosterText::
	text "Das ist ein Poster"
	line "eines niedlichen"
	cont "PIKACHUs."
	done

_LookClefairyPosterText::
	text "Das ist ein Poster"
	line "eines niedlichen"
	cont "PIEPIs."
	done

_LookJigglypuffPosterText::
	text "Das ist ein Poster"
	line "eines niedlichen"
	cont "PUMMELUFFs."
	done

_LookAdorableDecoText::
	text "Sehr bezaubernd:"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

_LookGiantDecoText::
	text "Eine Riesenpuppe!"
	line "Sie ist flauschig"
	cont "und weich."
	done

_MomShoppingText1::
	text "Hi, <PLAYER>!"
	line "Wie geht es dir?"
	prompt

_MomShoppingText2::
	text "Ich habe beim"
	line "Einkaufen ein"
	cont "nützliches Item"
	cont "gefunden und"
	prompt

_MomShoppingText3::
	text "ich habe dieses"
	line "dekorative Item"

	para "von deinem Geld"
	line "gekauft!"
	prompt

_MomShoppingText4::
	text "Es ist in deinem"
	line "PC. Es wird dir"
	cont "gefallen!"
	done

_MomShoppingText5::
	text "Beim Einkaufen"
	line "heute habe ich"
	cont "eine tolle Puppe"
	cont "gesehen und"
	prompt

_MomShoppingText6::
	text "Sie ist in deinem"
	line "Zimmer. Du wirst"
	cont "sie lieben!"
	done

_TradingText1::
	text_ram wPlayerTrademonSpeciesName
	text " ge-"
	line "sendet an @"
	text_ram wOTTrademonSenderName
	text "."
	done

_TradingText2::
	text_start
	done

_TradingText3::
	text "Lebwohl,"
	line "@"
	text_ram wOTTrademonSpeciesName
	text_end
	done

_TradingText4::
	text "sagt @"
	text_ram wOTTrademonSenderName
	text "."
	done

_TradingText5::
	text "Kümmere dich um"
	line "@"
	text "sagt @"
	text_ram wOTTrademonSenderName
	text "."
	done

_TradingText6::
	text "Für @"
	text_ram wPlayerTrademonSenderName
	text "s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text_end
	done

_TradingText7::
	text "überträgt @"
	text_ram wOTTrademonSenderName
	text_start
	line "@"
	text "sagt @"
	text_ram wOTTrademonSenderName
	text "."
	done

_TradingText8::
	text_ram wOTTrademonSenderName
	text " tauscht"
	line "@"
	text_ram wOTTrademonSpeciesName
	text_end

	text_end ; unused

_TradingText9::
	text "gegen @"
	text_ram wPlayerTrademonSenderName
	text "s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text "."
	done

_TradingText10::
	text_ram wPlayerTrademonSenderName
	text " tauscht"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text_end

	text_end ; unused

_TradingText11::
	text "gegen @"
	text_ram wOTTrademonSenderName
	text "s"
	line "@"
	text "sagt @"
	text_ram wOTTrademonSenderName
	text "."
	done

_TradingText12::
	text_ram wPlayerTrademonSenderName
	text " tauscht"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text "…"
	done

_TradingText13::
	text "Kümmere dich um"
	line "@"
	text "sagt @"
	text_ram wOTTrademonSenderName
	text "."
	done

_TradingText14::
	text_ram wPlayerTrademonSenderName
	text " tauscht"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text "…"
	done

_TradingText15::
	text "Kümmere dich um"
	line "@"
	text "sagt @"
	text_ram wOTTrademonSenderName
	text "."
	done

_TradingText16::
	text_ram wOTTrademonSpeciesName
	text_start
	line "kam zurück!"
	done

; Oak's Pokémon Talk

_OPT_IntroText1::
	text_start
	line "MARGIT:"
	done

_OPT_IntroText2::
	text_start
	line "PROF. EICHs"
	done

_OPT_IntroText3::
	text_start
	line "#MON-TALK!"
	done
	
_OPT_IntroText3_2::
	text_start
	line "Mit MARGIT!"
	done


_OPT_OakText1::
	text_start
	line "EICH: @"
	text_ram wMonOrItemNameBuffer
	text_end

	text_end ; unused

_OPT_OakText2::
	text_start
	line "wurde gesehen auf"
	done

_OPT_OakText3::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "."
	done

_OPT_MaryText1::
	text_start
	line "MARGIT: @"
	text_ram wStringBuffer1
	text_end
	done

OPT_SweetAdorably::
	text_start
	line "Wie bezaubernd."
	done

OPT_WigglySlickly::
	text_start
	line "Wie smart."
	done

OPT_AptlyNamed::
	text_start
	line "Wie reizend."
	done

OPT_UndeniablyKindOf::
	text_start
	line "Wie freundlich."
	done

OPT_Unbearably::
	text_start
	line "Nicht zu ertragen…"
	done

OPT_WowImpressively::
	text_start
	line "Wow, faszinierend."
	done

OPT_AlmostPoisonously::
	text_start
	line "Fast giftig."
	done

OPT_Sensually::
	text_start
	line "Wie einfühlsam."
	done

OPT_Mischievously::
	text_start
	line "So schelmisch."
	done

OPT_Topically::
	text_start
	line "Sehr aktuell."
	done

OPT_Addictively::
	text_start
	line "Suchterregend."
	done

OPT_LooksInWater::
	text_start
	line "Schaut ins Wasser."
	done

OPT_EvolutionMustBe::
	text_start
	line "Entwicklung, ja."
	done

OPT_Provocatively::
	text_start
	line "Wie provozierend."
	done

OPT_FlippedOut::
	text_start
	line "Wie ausgeflippt."
	done

OPT_HeartMeltingly::
	text_start
	line "Wie wunderbar."
	done

OPT_Cute::
	text_start
	line "Wie niedlich."
	done

OPT_Weird::
	text_start
	line "Wie verrückt."
	done

OPT_Pleasant::
	text_start
	line "Wie angenehm."
	done

OPT_BoldSortOf::
	text_start
	line "Wie dreist."
	done

OPT_Frightening::
	text_start
	line "Furchterregend."
	done

OPT_SuaveDebonair::
	text_start
	line "Wie weltmännisch!"
	done

OPT_Powerful::
	text_start
	line "Wie stark."
	done

OPT_Exciting::
	text_start
	line "Wie aufregend."
	done

OPT_Groovy::
	text_start
	line "Jetzt!"
	done

OPT_Inspiring::
	text_start
	line "Wie inspirierend."
	done

OPT_Friendly::
	text_start
	line "Wie freundlich."
	done

OPT_HotHotHot::
	text_start
	line "Wie interessant!"
	done

OPT_Stimulating::
	text_start
	line "Wie anregend."
	done

OPT_Guarded::
	text_start
	line "Gut geschützt."
	done

OPT_Lovely::
	text_start
	line "Wie lieblich."
	done

OPT_Speedy::
	text_start
	line "Wie rasant."
	done

_OPT_PokemonChannelText::
	text "#MON"
	done

_PokedexShowText::
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

	text_end ; unused

; Pokémon Music Channel / Pokémusic

_BenIntroText1::
	text_start
	line "BEN: #MON-MUSIK"
	done

_BenIntroText2::
	text_start
	line "PROGRAMM!"
	done

_BenIntroText3::
	text_start
	line "Ich bin's, DJ BEN!"
	done

_FernIntroText1::
	text_start
	line "FABIAN: #MUSIK!"
	done

_FernIntroText2::
	text_start
	line "Mit DJ FABIAN!"
	done

_BenFernText1::
	text_start
	line "Es ist @"
	text_today
	text "!"
	done

_BenFernText2A::
	text_start
	line "Mach mit beim"
	done

_BenFernText2B::
	text_start
	line "Entspann dich beim"
	done

_BenFernText3A::
	text_start
	line "#MON-Marsch!"
	done

_BenFernText3B::
	text_start
	line "PKMN-Schlaflied!"
	done

; Lucky Channel

_LC_Text1::
	text_start
	line "BASTIAN: Yeah! Wie"
	done

_LC_Text2::
	text_start
	line "geht es euch nun?"
	done

_LC_Text3::
	text_start
	line "Geht es gut, oder"
	done

_LC_Text4::
	text_start
	line "geht es nicht,"
	done

_LC_Text5::
	text_start
	line "die GLÜCKSZAHLSHOW"
	done

_LC_Text6::
	text_start
	line "ist immer Pflicht!"
	done

_LC_Text7::
	text_start
	line "Die Glückszahl ist"
	done

_LC_Text8::
	text_start
	line "Number is @"
	text_pause
	text_ram wStringBuffer1
	text "!"
	done

_LC_Text9::
	text_start
	line "Ich wiederhole!"
	done

_LC_Text10::
	text_start
	line "Gewonnen? Kommt"
	done

_LC_Text11::
	text_start
	line "zum RADIOTURM!"
	done

_LC_DragText1::
	text_start
	line "…Die Wiederholung"
	done

_LC_DragText2::
	text_start
	line "verzögert alles…"
	done

; Places and People

_PnP_Text1::
	text_start
	line "ORTE UND PERSONEN!"
	done

_PnP_Text2::
	text_start
	line "Moderiert von"
	done

_PnP_Text3::
	text_start
	line "DJ LILLY!"
	done

_PnP_Text4::
	text_start
	line "@"
	text_ram wStringBuffer2
	text " @"
	text_ram wStringBuffer1
	text_end

	text_end ; unused

_PnP_cute::
	text_start
	line "ist niedlich."
	done

_PnP_lazy::
	text_start
	line "irgendwie faul."
	done

_PnP_happy::
	text_start
	line "ist immer heiter."
	done

_PnP_noisy::
	text_start
	line "ist ziemlich laut."
	done

_PnP_precocious::
	text_start
	line "ist frühreif."
	done

_PnP_bold::
	text_start
	line "ist wohl dreist."
	done

_PnP_picky::
	text_start
	line "ist zu wählerisch!"
	done

_PnP_sortofok::
	text_start
	line "ist O.K."
	done

_PnP_soso::
	text_start
	line "geht so."
	done

_PnP_great::
	text_start
	line "ist großartig."
	done

_PnP_mytype::
	text_start
	line "ist mein Typ."
	done

_PnP_cool::
	text_start
	line "ist so cool, oder?"
	done

_PnP_inspiring::
	text_start
	line "ist inspirierend!"
	done

_PnP_weird::
	text_start
	line "ist verrückt."
	done

_PnP_rightforme::
	text_start
	line "ist genau richtig?"
	done

_PnP_odd::
	text_start
	line "ist merkwürdig!"
	done

_PnP_Text5::
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

	text_end ; unused

_RocketRadioText1::
	text_start
	line "… …Ähm, wir sind"
	done

_RocketRadioText2::
	text_start
	line "TEAM ROCKET!"
	done

_RocketRadioText3::
	text_start
	line "Nach drei Jahren"
	done

_RocketRadioText4::
	text_start
	line "Vorbereitung sind"
	done

_RocketRadioText5::
	text_start
	line "wir bereit für"
	done

_RocketRadioText6::
	text_start
	line "unser Comeback!"
	done

_RocketRadioText7::
	text_start
	line "GIOVANNI! @"
	text_pause
	text "Hörst"
	done

_RocketRadioText8::
	text_start
	line "du uns? Geschafft!"
	done

_RocketRadioText9::
	text_start
	line "@"
	text_pause
	text "Wo ist unser Boss?"
	done

_RocketRadioText10::
	text_start
	line "@"
	text_pause
	text "Hört er zu?"
	done

_BuenaRadioText1::
	text_start
	line "BUENA: BUENA hier!"
	done

_BuenaRadioText2::
	text_start
	line "Heutiges Passwort!"
	done

_BuenaRadioText3::
	text_start
	line "Moment… es lautet"
	done

_BuenaRadioText4::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

_BuenaRadioText5::
	text_start
	line "Vergesst es nicht!"
	done

_BuenaRadioText6::
	text_start
	line "Ich bin im RADIO-"
	done

_BuenaRadioText7::
	text_start
	line "TURM von DUKATIA!"
	done

_BuenaRadioMidnightText1::
	text_start
	line "BUENA: Oh, es ist…"
	done

_BuenaRadioMidnightText2::
	text_start
	line "Mitternacht!"
	done

_BuenaRadioMidnightText3::
	text_start
	line "Ich muss aufhören!"
	done

_BuenaRadioMidnightText4::
	text_start
	line "Danke, Zuhörer!"
	done

_BuenaRadioMidnightText5::
	text_start
	line "Das Ende naht!"
	done

_BuenaRadioMidnightText6::
	text_start
	line "Bleibt nicht zu"
	done

_BuenaRadioMidnightText7::
	text_start
	line "lange auf! Euer"
	done

_BuenaRadioMidnightText8::
	text_start
	line "DJ BUENA!"
	done

_BuenaRadioMidnightText9::
	text "Ich muss weg!"
	done

_BuenaRadioMidnightText10::
	text "…"
	done

_BuenaOffTheAirText::
	text_start
	line ""
	done

Text_EnemyWithdrew::
	text "<ENEMY>"
	line "ersetzt"
	cont "@"
	text_ram wEnemyMonNick
	text "!"
	prompt

Text_EnemyUsedOn::
	text "<ENEMY>"
	line "setzt @"
	text_ram wMonOrItemNameBuffer
	text_start
	cont "bei"

	para "@"
	text_ram wEnemyMonNick
	text_start
	line "ein!"
	prompt

Text_ThatCantBeUsedRightNow::
	text "Es ist noch nicht"
	line "an der Zeit, dies"
	cont "zu benutzen."
	prompt

Text_ThatItemCantBePutInThePack::
	text "Dieses Item gehört"
	line "nicht in den"
	cont "BEUTEL."
	done

Text_TheItemWasPutInThePack::
	text_ram wStringBuffer1
	text_start
	line "wurde im BEUTEL"
	cont "verstaut."
	done

Text_RemainingTime::
	text "Verbleibende Zeit"
	done

Text_YourMonsHPWasHealed::
	text "Dein #MON wurde"
	line "komplett geheilt."
	prompt

Text_Warping::
	text "Warpen…"
	done

UnknownText_0x1bd05e::
	text "Welche Nummer soll"
	line "geändert werden?"
	done

UnknownText_0x1bd07f::
	text "Möchtest du"
	line "@"
	text_ram wStringBuffer2
	text " einsetzen?"
	done

UnknownText_0x1bd09a::
	text "Du benötigst zwei"
	line "#MON, um zu"
	cont "züchten."
	prompt

Text_BreedingIsNotPossible::
	text "Züchten ist hier"
	line "nicht möglich."
	prompt

UnknownText_0x1bd0d8::
	text "The compatibility"
	line "is @"
	text_decimal wBreedingCompatibility, 1, 3
	text "."
	cont "Should they breed?"
	done

UnknownText_0x1bd109::
	text "Es gibt kein EI."
	line ""
	prompt

UnknownText_0x1bd11c::
	text "Es wird bald aus"
	line "dem EI schlüpfen!"
	prompt

UnknownText_0x1bd131::
	text "Ereignistest"
	line "@"
	text_decimal wStringBuffer2, 1, 2
	text "?"
	done

UnknownText_0x1bd145::
	text "Start!"
	done

UnknownText_0x1bd14d::
	text "Ende!"
	done

UnknownText_0x1bd153::
	text "Für einen Jungen!"
	done

UnknownText_0x1bd15f::
	text "Für ein Mädchen!"
	done

UnknownText_0x1bd16c::
	text "Das geht Jungen"
	line "nichts an!"
	done

UnknownText_0x1bd188::
	text "Die BOX ist voll!"
	done

UnknownText_0x1bd19a::
	text "Eine neue KARTE"
	line "von @"
	text_ram wStringBuffer2
	text "."
	done

UnknownText_0x1bd1ba::
	text "KARTE in den KAR-"
	line "TENORDNER legen?"
	done

UnknownText_0x1bd1dd::
	text_ram wStringBuffer2
	text "s KARTE"
	line "ist Nr.@"
	text_decimal wStringBuffer1, 1, 2
	text "."
	prompt

UnknownText_0x1bd201::
	text "Verbindung steht."
	done

UnknownText_0x1bd211::
	text "Verbindung"
	line "getrennt."
	done

UnknownText_0x1bd223::
	text "Verbindungsende."
	done

UnknownText_0x1bd232::
	text "Zeitbegrenzung"
	line "löschen?"
	done

UnknownText_0x1bd249::
	text "Die Zeitbegrenzung"
	line "wurde gelöscht."
	done

UnknownText_0x1bd266::
	text "Welches Paket als"
	line "Fehler wählen?"
	done

UnknownText_0x1bd286::
	text "Tausche @"
	text_ram wStringBuffer2
	text_start
	line "gegen @"
	text_ram wStringBuffer1
	text "…"
	done

UnknownText_0x1bd2a0::
	text "VOLTOBALORDEN"
	line "erhalten!"
	done

UnknownText_0x1bd2bc::
	text "Welcher Stock?"
	done

UnknownText_0x1bd2ca::
	text "SPRECHER: BIEP!"

	para "Die Zeit ist um!"
	done

UnknownText_0x1bd2e7::
	text "SPRECHER: Der"
	line "Wettkampf ist"
	cont "vorbei!"
	done

_RepelWoreOffText::
	text "SCHUTZ wirkt"
	line "nicht mehr."
	done

_PlayerFoundItemText::
	text "<PLAYER> hat"
	line "@"
	text_ram wStringBuffer3
	text_start
	cont "gefunden."
	done

_ButNoSpaceText::
	text "Aber <PLAYER> hat"
	line "keinen Platz"
	cont "dafür…"
	done

_JustSawSomeRareMonText::
	text "Ich sah seltene"
	line "@"
	text_ram wStringBuffer1
	text " bei"
	cont "@"
	text_ram wStringBuffer2
	text "."

	para "Ich rufe an, wenn"
	line "ich ein anderes"
	cont "seltenes #MON"
	cont "sehe, in Ordnung?"
	prompt

_SavingRecordText::
	text "SPEICHERN…"
	line ""
	done

_ReceiveItemText::
	text_ram wPlayerName
	text " received"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	sound_item
	text_waitbutton
	text_end

	text_end ; unused

_NoCoinsText::
	text "Du hast keine"
	line "Münzen."
	prompt

_NoCoinCaseText::
	text "Du hast keinen"
	line "MÜNZKORB."
	prompt

UnknownText_0x1bd407::
	text "O.K., benutze das"
	line "Game Link-Kabel."
	prompt

UnknownText_0x1bd429::
	text "<PLAYER> tauscht"
	line "@"
	text_ram wMonOrItemNameBuffer
	text " gegen"
	cont "@"
	text_ram wStringBuffer2
	text ".@"
	text_end

UnknownText_0x1bd445::
	sound_dex_fanfare_80_109
	text_pause
	text_end

	text_end ; unused

_NPCTradeIntroText1::
	text "Ich sammle #-"
	line "MON. Hast du ein"
	cont "@"
	text_ram wStringBuffer1
	text "?"

	para "Möchtest du es"
	line "gegen mein"

	para "@"
	text_ram wStringBuffer2
	text_start
	line "tauschen?"
	done

_NPCTradeCancelText1::
	text "Du möchtest nicht"
	line "tauschen? Schade…"
	done

_NPCTradeWrongText1::
	text "Häh? Das ist kein"
	line "@"
	text_ram wStringBuffer1
	text "."
	cont "Wie enttäuschend…"
	done

_NPCTradeCompleteText1::
	text "Yo! Ich habe mir"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "besorgt! Danke!"
	done

_NPCTradeAFterText1::
	text "Hi, wie geht es"
	line "meinem @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeIntroText2::
	text "Hi, ich suche"
	line "ein #MON."

	para "Wenn du ein"
	line "@"
	text_ram wStringBuffer1
	text " hast,"

	para "tauschst du es"
	line "gegen mein"
	cont "@"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText2::
	text "Du hast auch"
	line "keines?"

	para "Das ist wirklich"
	line "enttäuschend…"
	done

_NPCTradeWrongText2::
	text "Du hast kein"
	line "@"
	text_ram wStringBuffer1
	text "? Das"
	cont "ist schade, na ja."
	done

_NPCTradeCompleteText2::
	text "Großartig! Danke!"

	para "Endlich habe ich"
	line "ein @"
	text_ram wStringBuffer1
	text "."
	done

_NPCTradeAfterText2::
	text "Dem @"
	text_ram wMonOrItemNameBuffer
	text ","
	line "das du mit mir"
	cont "getauscht hast,"
	cont "geht es gut!"
	done

_NPCTradeIntroText3::
	text_ram wMonOrItemNameBuffer
	text " ist"
	line "niedlich, aber ich"

	para "habe keines. Hast"
	line "du ein @"
	text_ram wStringBuffer1
	text "?"

	para "Möchtest du es"
	line "gegen mein"

	para "@"
	text_ram wStringBuffer2
	text_start
	line "tauschen?"
	done

_NPCTradeCancelText3::
	text "Du möchtest nicht"
	line "tauschen? Schade…"
	done

_NPCTradeWrongText3::
	text "Das ist kein"
	line "@"
	text_ram wStringBuffer1
	text "."

	para "Komm wieder, wenn"
	line "du tauschen"
	cont "möchtest."
	done

_NPCTradeCompleteText3::
	text "Danke! Ich wollte"
	line "immer schon ein"
	cont "@"
	text_ram wMonOrItemNameBuffer
	text "!"
	done

_NPCTradeAfterText3::
	text "Wie geht es dem"
	line "getauschten"
	cont "@"
	text_ram wStringBuffer2
	text "?"

	para "Dein @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "ist so niedlich!"
	done

_NPCTradeCompleteText4::
	text "Was ist passiert?"
	done

_NPCTradeAfterText4::
	text "Tauschen ist"
	line "seltsam…"

	para "Ich muss noch viel"
	line "darüber lernen."
	done

_MomLeavingText1::
	text "Das ist ein nied-"
	line "liches #MON."

	para "Wo hast du es"
	line "her?"

	para "…"

	para "Du beginnst also"
	line "ein Abenteuer…"

	para "O.K.! Auch ich"
	line "werde dir helfen."

	para "Aber was kann ich"
	line "für dich tun?"

	para "Ich weiß! Ich"
	line "werde für dich"
	cont "sparen."

	para "Auf einer langen"
	line "Reise ist Geld"
	cont "sehr wichtig."

	para "Soll ich dein"
	line "Geld sparen?"
	done

_MomLeavingText2::
	text "O.K., ich verwalte"
	line "deine Ersparnisse."

	para "<……><……><……>"
	prompt

_MomLeavingText3::
	text "Sei auf der Hut."

	para "#MON sind"
	line "deine Kameraden."
	cont "Ihr müsst als Team"
	cont "auftreten."

	para "Also mach's gut!"
	done

_MomVisitingText1::
	text "Hi! Willkommen!"
	line "Ich sehe, du"
	cont "bemühst dich sehr."

	para "Ich habe dein"
	line "Zimmer aufgeräumt."

	para "Ist es wegen"
	line "deinem Geld?"
	done

_MomVisitingText2::
	text "Was möchtest du"
	line "tun?"
	done

_MomVisitingText3::
	text "Wie viel möchtest"
	line "du sparen?"
	done

_MomVisitingText4::
	text "Wie viel möchtest"
	line "du mitnehmen?"
	done

_MomVisitingText5::
	text "Möchtest du weiter"
	line "Geld sparen?"
	done

_MomVisitingText6::
	text "So viel hast du"
	line "nicht gespart."
	prompt

_MomVisitingText7::
	text "So viel kannst du"
	line "nicht mitnehmen."
	prompt

_MomVisitingText8::
	text "So viel hast"
	line "du nicht."
	prompt

_MomVisitingText9::
	text "So viel kannst"
	line "du nicht sparen."
	prompt

_MomVisitingText10::
	text "O.K., ich spare"
	line "für dich! Traue"
	cont "mir!"

	para "<PLAYER>, bleib"
	line "dabei!"
	done

_MomVisitingText11::
	text "Dein Geld ist hier"
	line "sicher! Tschüss!"
	done

_MomVisitingText12::
	text "<PLAYER>, nur nicht"
	line "aufgeben!"
	done

_MomVisitingText13::
	text "Gib immer dein"
	line "Bestes."
	done

_DaycareDummyText::
	text_start
	done

_DayCareManIntroText::
	text "Ich bin der"
	line "PENSIONSLEITER."
	cont "Soll ich eines"
	cont "deiner #MON"
	cont "aufziehen?"
	done

_DayCareManOddEggText::
	text "Ich bin der"
	line "PENSIONSLEITER."
	cont "Kennst du dich"
	cont "mit EIERN aus?"

	para "Ich habe #MON"
	line "mit meiner"
	cont "Frau aufgezogen."

	para "Wir waren ent-"
	line "setzt, als wir ein"
	cont "EI fanden!"

	para "Das ist doch"
	line "unglaublich, oder?"

	para "Soll ich ein"
	line "#MON aufziehen?"
	done

_DayCareLadyIntroText::
	text "Ich bin die"
	line "PENSIONSLEITERIN."

	para "Soll ich eines"
	line "deiner #MON"
	cont "aufziehen?"
	done

_DayCareLadyOddEggText::
	text "Ich bin die"
	line "PENSIONSLEITERIN."
	cont "Kennst du dich"
	cont "mit EIERN aus?"

	para "Mein Mann und ich"
	line "haben #MON"
	cont "aufgezogen."

	para "Wir waren er-"
	line "staunt, als wir"
	cont "ein EI fanden!"

	para "Das ist doch"
	line "unglaublich, oder?"

	para "Soll ich eines"
	line "deiner #MON"
	cont "aufziehen?"
	done

_WhatShouldIRaiseText::
	text "Welches soll"
	line "ich aufziehen?"
	prompt

_OnlyOneMonText::
	text "Oh? Aber du hast"
	line "nur ein #MON."
	prompt

_CantRaiseEggText::
	text "Tut mir Leid, aber"
	line "ich kann kein EI"
	cont "annehmen."
	prompt

_RemoveMailText::
	text "Entferne den"
	line "BRIEF, ehe du mich"
	cont "aufsuchst."
	prompt

_LastHealthyMonText::
	text "Wenn du mir das"
	line "gibst, wer soll"
	cont "dann kämpfen?"
	prompt

_IllRaiseYourMonText::
	text "O.K. Ich kümmere"
	line "mich um dein"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

_ComeBackLaterText::
	text "Hole es später"
	line "wieder ab."
	done

_AreWeGeniusesText::
	text "Wir sind genial,"
	line "oder? Möchtest du"
	cont "dein @"
	text_ram wStringBuffer1
	text_start
	cont "sehen?"
	done

_YourMonHasGrownText::
	text "Dein @"
	text_ram wStringBuffer1
	text_start
	line "ist groß geworden."

	para "Es ist um @"
	text_decimal wStringBuffer2 + 1, 1, 3
	text_start
	line "Level gestiegen."

	para "Wenn du dein"
	line "#MON zurück"
	cont "haben möchtest,"
	cont "kostet dich das"
	cont "¥@"
	text_decimal wStringBuffer2 + 2, 3, 4
	text "."
	done

_PerfectHeresYourMonText::
	text "Perfekt! Hier ist"
	line "dein #MON."
	prompt

_GotBackMonText::
	text "<PLAYER> erhält"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_BackAlreadyText::
	text "Huh? Schon zurück?"
	line "Dein @"
	text_ram wStringBuffer1
	text_start
	para "sollte noch ein"
	line "wenig hierbleiben."

	para "Wenn du dein"
	line "#MON zurück-"
	cont "haben möchtest,"
	cont "zahle ¥100."
	done

_HaveNoRoomText::
	text "Du hast dafür"
	line "keinen Platz."
	prompt

_DCNotEnoughMoneyText::
	text "Du hast nicht"
	line "genügend Geld."
	prompt

_OhFineThenText::
	text "Oh, in Ordnung."
	prompt

_ComeAgainText::
	text "Komm wieder."
	done

_NotYetText::
	text "Noch nicht…"
	done

_FoundAnEggText::
	text "Ah, du bist's!"

	para "Wir haben uns um"
	line "dein #MON"

	para "gekümmert und"
	line "waren sehr"
	cont "erstaunt!"

	para "Dein #MON hatte"
	line "ein EI!"

	para "Wir wissen nicht,"
	line "wie es dahin"

	para "gekommen ist; dein"
	line "#MON hat es."
	cont "Möchtest du es?"
	done

_ReceivedEggText::
	text "<PLAYER> erhält"
	line "das EI!"
	done

_TakeGoodCareOfEggText::
	text "Pass gut darauf"
	line "auf."
	done

_RefuseEggText::
	text "Gut, ich passe"
	line "darauf auf. Danke!"
	done

_NoRoomForEggText::
	text "Du kannst keine"
	line "#MON mehr"
	cont "tragen. Komm"
	cont "später wieder."
	done

_WhichMonPhotoText::
	text "Welches #MON"
	line "soll ich"
	cont "fotografieren?"
	prompt

_HoldOnText::
	text "O.K. Beweg dich"
	line "nicht."
	prompt

_PrestoAllDoneText::
	text "Erledigt! Schau"
	line "mal wieder vorbei!"
	done
