REM "SWORD.TXT" START 7B16 LEN 1DCF
1 POKE30744,0:COLOR,0:CLS
10 CLS:CLEAR
11 PRINT" INSTRUCTIONS (Y/N) ?"
12 A$=INKEY$:A$=INKEY$
36608 A$="Y"THEN10000
14 IFA$<>"N"THEN12
17 SOUND21,1
20 DIMA(5,4),A$(5,4),E$(5,4)
21 DIMO(19),W(19),N(19)
22 DIMO$(19),N$(19)
40 FORY=1TO4:FORX=1TO5:READA(X,Y),A$(X,Y),E$(X,Y):NEXT:NEXT
50 FORI=1TO19:READO(I),W(I),N(I),O$(I),N$(I):NEXT
199 X=1:Y=2
200 REM *** PRINT OUT ***
201 IFR=18ANDO(8)<>-1THENK$=O$(11):CLS:GOTO12000
202 CLS:SS=0
203 R=(Y*5+X)-5
210 PRINTA$(X,Y)
220 PRINTE$(X,Y):PRINT
225 PRINT"YOU SEE :"
230 FORU=1TO19:IFO(U)<>RTHEN250
240 PRINTO$(U):SS=1
250 NEXT:IFSS=0THENPRINT" NOTHING"
260 SS=0:PRINT
300 PRINT"VISIBLE EXITS GO : ";
302 A=A(X,Y):EN=0:ES=0:EE=0:EW=0
305 IFA/2=INT(A/2)THENPRINT"-N";:EN=1
306 IFA/3=INT(A/3)THENPRINT"-S";:ES=1
307 IFA/5=INT(A/5)THENPRINT"-E";:EE=1
308 IFA/7=INT(A/7)THENPRINT"-W";:EW=1
310 IFEN=0ANDES=0ANDEE=0ANDEW=0THENPRINT"NOWHERE."
320 PRINT
500 REM *** INPUT ***
510 V$="":N$="":X$="":O$=""
515 M=M+1:PRINT
520 INPUTA$
521 IFA$=""THEN520:ELSEPRINT
522 IFA$="N"ANDEN=1THENY=Y-1:GOTO200
523 IFA$="S"ANDES=1THENY=Y+1:GOTO200
524 IFA$="E"ANDEE=1THENX=X+1:GOTO200
36610 A$="W"ANDEW=1THENX=X-1:GOTO200
526 IFA$="L"THEN200
528 IFA$="I"THEN760
529 V$=LEFT$(A$,3)
530 FORI=1TOLEN(A$):IFMID$(A$,I,1)<>" "THEN550
540 N$=MID$(A$,I+1,3):GOTO560
550 NEXTI:GOTO600
560 FORZ=I+1TOLEN(A$):IFMID$(A$,Z,1)<>" "THEN570
565 X$=MID$(A$,Z+1,3):GOTO600
570 NEXTZ:GOTO600
600 :REM
640 IFV$="GET"ORV$="TAK"THEN800
650 IFV$="DRO"THEN1000
690 IFV$="LOO"THENIFN$="AT "THENN$=X$:GOTO2000:ELSE200
700 IFV$="KIL"THEN900
710 IFV$="SAY"ORV$="SPE"THEN1500
715 IFV$="HOL"ORV$="SHI"ORV$="REF"THEN1350
720 IFV$="THR"THEN1100
730 IFV$="CAT"THEN1300
740 IFV$="OPE"ORV$="UNL"THEN1200
750 PRINT"I DONT UNDERSTAND":GOTO500
760 :REM
761 II=0:PRINT:PRINT" YOU ARE CARRYING :- "
762 FORI=1TO19:IFO(I)=-1THENPRINTO$(I):II=1
764 NEXTI:IFII=0THENPRINT"NOTHING..."
765 PRINT:GOTO500
800 :REM
805 IFWT>5THENPRINT"YOU ARE CARRYING THE MAXIMUM.":GOTO500
810 FORI=1TO19:IFN$(I)=N$ANDO(I)=RTHEN820
815 NEXTI:GOTO9998
820 IFO(I)=RANDW(I)<3THEN830:ELSE9998
830 FORU=1TO19:IFO(U)=RANDW(U)=3THEN9997
835 NEXTU
860 O(I)=-1:WT=WT+W(I):GOTO9999
900 :REM
910 FORI=1TO19:IFN$(I)=N$THEN920
915 NEXTI:GOTO9997
920 IFO(I)=RANDW(I)=3THEN930:ELSE9997
930 IFN(I)<0THENK$=O$(I):GOTO12000:ELSEN=N(I)
935 IFO(N)=-1THEN960:ELSE9998
940 IFN(I)=UANDO(U)<0THEN960:ELSE9997
960 O(I)=0 :REMMONSTER DEAD!
999 GOTO9999
1000 :REM
1010 FORI=1TO19:IFN$(I)=N$THEN1025
1020 NEXTI:GOTO9998
1025 IFR=2ANDN$="PLA"THENA(X,Y)=A(X,Y)*5:WT=WT+W(I):W(I)=4
1026 IFR=3ANDN$="MON"ANDO(10)=-1THENO(7)=0:A(X,Y)=35:GOTO11111
1030 O(I)=R:WT=WT-W(I):GOTO9999
1100 :REM
1110 IFR=11ANDO(2)=RANDN$="ROC"ANDO(1)=-1THEN1115:ELSE1120
1115 O(1)=R:O(2)=0:PRINT"YOU KILLED THE GOBLIN":GOTO500
1120 IFR=5ANDN$="SPE"ANDO(14)=-1ANDO(15)=RTHEN1125:ELSE1130
1125 O(14)=R:O(15)=0:PRINT"YOU KILLED THE GORGAN":GOTO500
1130 FORI=1TO19:IFN$(I)=N$ANDO(I)=-1THEN1140
1135 NEXT:PRINT"YOU HAVENT GOT ONE!!":GOTO500
1140 O(I)=R:WT=WT-W(I):GOTO9999
1200 :REM
1210 IFA(X,Y)/11<>INT(A(X,Y)/11)THENGOTO9998
1220 IFR=6ANDO(3)=-1THENA(X,Y)=A(X,Y)/11*5:GOTO9999
1230 IFR=7ANDO(6)=7THENK$=O$(6):GOTO12000
1235 IFR=7ANDO(16)=-1THENA(X,Y)=A(X,Y)/11*5:GOTO9999
1240 IFR=9ANDO(9)=-1THENA(X,Y)=A(X,Y)/11*5:GOTO9999
1250 GOTO9997
1300 :REM
1310 IFN$="MON"ANDO(10)=RANDO(5)=-1THEN1320:ELSE9998
1320 O(10)=-1:WT=WT+W(10):GOTO9999
1350 :REM
1360 IFR=20ANDO(13)=RANDN$="MIR"ANDO(12)=-1THEN1370:ELSE9998
1370 O(13)=0:PRINT" MEDUSSA LOOKS INTO THE MIRROR"
1374 PRINT"    AND TURNS TO STONE...":GOTO500
1500 :REM
1510 IFR<>7ORO(6)=0THEN1550
1520 IFN$="MAN"ORN$="HUM"THEN1530:ELSE9996
1530 PRINT" YOU SAID THE CORRECT ANSWER,"
1540 PRINT" SO THE SPHINX DISSAPEARED.":O(6)=0:GOTO500
1550 IFR<>8ORO(18)=0THEN9996
1560 IFN$="MEL"THEN1570:ELSE9996
1570 SOUND0,9;0,9;21,2;21,2;25,2;25,2;31,7:PRINT
1572 PRINT" THE SPIRIT FADES INTO THE "
1574 PRINT" SHADOWS , YOU HAVE RECOVERED"
1576 PRINT" THE ANCIENT SWORD OF THE KINGS"
1578 PRINT" WHICH HAS BEEN LOST FOR YEARS."
1580 SOUND0,9;0,9;0,9:PRINT
1590 PRINT"--------------------------------":GOTO15000
2000 :REM***LOOK AT OBJECTS***
2010 FORI=1TO19:IFN$(I)=N$THEN2020
2015 NEXT:GOTO200
2020 IFO(I)=RANDW(I)>2THEN2040:ELSE200
2040 IFN$<>"GOB"THEN2050
2041 PRINT"THE GOBLIN IS TALL AND HEAVILY"
2042 PRINT"ARMED. HE IS SITTING ON A ROCK.":GOTO500
2050 IFN$<>"SPH"THEN2059
2051 PRINT"THE SPHINX HAS A WOMAN'S HEAD,"
2052 PRINT"THE BODY OF A DOG AND A SERPANTSTAIL."
2053 PRINT"SHE LOOKS AT YOU AND SAYS ,"
2054 PRINT"'IF YOU WANT TO PASS ME YOU MUST";
2055 PRINT" ANSWER THIS RIDDLE..."
2056 PRINT" WHAT HAS 4 LEGS IN THE MORNING,";
2057 PRINT" 2 LEGS IN THE DAY & 3 LEGS IN"
2058 PRINT" THE EVENING ?":GOTO500
2059 IFN$<>"SNA"THEN2065
2060 PRINT"THE SNAKE IS ABOUT 20 FEET LONG"
45576 "AND EXTREMELY POISONESS.":GOTO500
2065 IFN$<>"SIR"THEN2080
2066 IFO(8)<>-1THEN2070
2067 PRINT"THE SIREN LOOK'S AT YOU AND SAYS";
2068 PRINT"SOMETHING, BUT YOU CANT HEAR"
2069 PRINT"BECAUSE OF THE EARMUFFS.":GOTO500
2070 PRINT"THE SOUND OF HER SINGING SENDS"
2071 PRINT"YOU TO SLEEP, INSTANTLY."
2072 PRINT"   YOU WILL NEVER WAKE UP...":K$=O$(I):GOTO12000
2080 IFN$<>"WOM"ORR<>20THEN2090
2081 PRINT" YOU LOOK AT THE STRANGE WOMAN"
2082 PRINT" AND AS YOUR EYES GET USED TO "
2083 PRINT" THE PALE LIGHT, YOU SEE THAT"
2084 PRINT" SHE HAS LIVE SNAKES IN HER "
45576 " HAIR, AND THAT HER DISGUSTING"
2086 PRINT" FACE IS SMILING AT YOU...":SOUND0,9;0,9;0,9;0,9;0,9
2087 PRINT"  HER NAME IS MEDUSSA!":SOUND31,9:K$=O$(I):GOTO12000
2090 IFN$<>"GOR"THEN2100
2091 PRINT" THE GORGAN IS A HUGE BEAST"
2092 PRINT" SHAPED LIKE A DRAGON BUT WITH"
2093 GOTO500
2100 IFN$<>"PIC"THEN2110
2101 PRINT" THE ROOM OF A 1000 WORDS IS "
2102 PRINT" COVERED IN OLD DRAWINGS."
2103 PRINT" THERE IS A PICTURE OF A BABY"
2104 PRINT" CRAWLING, A MAN WALKING & OF AN OLD MAN WITH A STICK
2105 PRINT" ABOVE THE DOOR THERE IS A WORD"
2106 PRINT" IN RED, SAYING 'MELLON' "
2108 GOTO500
2110 IFN$<>"SPI"THEN2120
2111 PRINT"A FIGURE CLOAKED IN A WHITE ROBE";
2112 PRINT"IS STANDING OVER THE LOST SWORD"
2113 PRINT"IT IS THE GUARDIAN SPIRIT."
2114 PRINT"HE SAYS, "
2115 PRINT" SPEAK, FRIEND AND YOU WILL PASS";
2116 PRINT" THE FINAL TEST..."
2117 GOTO500
2120 GOTO200
9000 REM *** LAND DATA ***
9010 DATA3,"YOU ARE AT A BROKEN DOWN HUT"
9011 DATA"THE PATH LEADS BACK SOUTH"
9013 DATA33,"YOU ARE IN A WINDING TUNNEL WITHA LOW ROOF."
9014 DATA"A PATH GOES SOUTH, BUT A DEEP   PIT LIES EAST"
9016 DATA35,"YOU ARE IN A WIDE TUNNEL COVEREDIN BONES."
9017 DATA"IT CONTINUES EAST & WEST"
9019 DATA105,"YOU ARE IN A LOOMING CAVERN"
9020 DATA"THREE TUNNELS SEPERATE TO THE   SOUTH,EAST & WEST"
9022 DATA7,"THIS IS THE GORGANS LAIR..."
9023 DATA"A NARROW PASSAGE LEADS WEST"
9025 DATA66,"YOU ARE IN A WIDE FLAT CLEARING"
9026 DATA"A GATE IS TO THE EAST AND A PATHGOES NORTH & SOUTH."
9028 DATA462,"THIS IS THE MAIN CHAMBER,GUARDEDBY THE SPHINX"
9029 DATA"THE DOOR TO THE EAST IS THE ENTR-ANCE TO THE CRYPT..."
9030 DATA7,"THIS IS THE ANCIENT CRYPT..."
9031 DATA"THE LOST SWORD IS GUARDED BY THEANCIENT SPIRIT..."
9033 DATA66,"YOU ARE IN A PASSAGE GOING NORTHAND SOUTH."
9034 DATA"A RUSTY DOOR IS TO THE EAST"
9036 DATA7,"THIS IS THE ROOM OF A 1000 WORDS"
9037 DATA"THE EXIT IS TO THE EAST."
9038 DATA2,"YOU ARE ON A ROCKY SLOPE"
9039 DATA"THERE ARE SIGNS OF A CAMP. THE  TUNNEL GOES NORTH."
9040 DATA30,"YOU ARE IN A LARGE PASSAGE"
9041 DATA"THREE TUNNELS LEAD NORTH,SOUTH  AND EAST."
9043 DATA21,"YOU ARE IN A SMALL CAVE."
9044 DATA"EXITS GO WEST AND SOUTH."
9046 DATA30,"YOU ARE IN A WIDE PASSAGE"
9047 DATA"EXITS GO NORTH,SOUTH & EAST"
9049 DATA21,"YOU ARE IN A WINDING TUNNEL"
9050 DATA"TWO TUNNELS LEAD SOUTH & WEST."
9052 DATA5,"YOU ARE IN A SMALL CAVE."
9053 DATA"THE TUNNEL LEADS EAST"
9055 DATA14,"YOU ARE IN A NARROW TUNNEL."
9056 DATA"IT TRAVELS NORTH & WEST."
9058 DATA10,"YOU ARE AT AN UNDERGROUND LAKE."
9059 DATA"THERE IS A BEAUTIFUL WOMAN ON A LOG, SINGING"
9061 DATA14,"YOU ARE IN A WIDE TUNNEL."
9062 DATA"EXITS LEAD NORTH & WEST."
9063 DATA2,"YOU ARE IN AN EERIE CAVE."
9064 DATA"YOU SEE THE OUTLINE OF A WOMAN. THE EXIT GOES NORTH."
9500 REM *** OBJECT DATA ***
9510 DATA6,2,0,"A ROCK","ROC"
9512 DATA11,3,1,"AN ARMED GOBLIN","GOB"
9513 DATA11,1,6,"AN IRON KEY","KEY"
9514 DATA1,2,2,"A LARGE PLANK","PLA"
9515 DATA16,1,0,"A SMALL NET","NET"
9516 DATA7,3,-1,"THE SPHINX","SPH"
9517 DATA3,3,10,"A LARGE SNAKE","SNA"
9518 DATA3,1,0,"A PAIR OF EARMUFFS","EAR"
9519 DATA13,1,0,"AN OLD RUSTY KEY","KEY"
9520 DATA13,1,5,"A SMALL FIERCE MONGOOSE","MON"
9521 DATA18,4,8,"A SINGING SIREN...","SIR"
9522 DATA18,1,0,"A MIRROR","MIR"
9523 DATA20,3,12,"A STRANGE WOMAN","WOM"
9524 DATA20,2,0,"A LONG POISONED SPEAR","SPE"
9525 DATA5,3,14,"THE MIGHTY GORGAN...","GOR"
9526 DATA5,1,7,"THE ANCIENT KEY","KEY"
9527 DATA10,4,0,"A WALL COVERED IN PICTURES","PIC"
9528 DATA8,3,-2,"THE ANCIENT SPIRIT...","SPI"
9529 DATA8,2,0,"THE LOST SWORD","SWO"
9996 PRINT"NOTHING HAPPENED.":GOTO500
45607 "CANT":SOUND1,5:GOTO500
9998 PRINT"NO WAY":SOUND21,1;10,2:GOTO500
9999 PRINT"OK":SOUND31,1:GOTO500
10000 REM *** INSTRUCTIONS ***
10005 POKE30744,1:SOUND0,9:COLOR3
13207 
10010 CLS:PRINT"  T H E    L O S T   S W O R D  "
10020 PRINT"       BY DUNCAN MURRAY"
10103 PRINT"             ~"
10104 PRINT"            ~~~"
10105 PRINT"            ~~~"
10106 PRINT"            ~~~"
10107 PRINT"            ~~~"
10108 PRINT"            ~~~"
10109 PRINT"            ~~~"
10110 PRINT"            ~~~"
10111 PRINT"            ~~~"
10112 PRINT"          ~~~~~~~"
10113 PRINT"          ~ ~~  ~"
10114 PRINT"        ~   ~~"
10120 FORU=1TO1000:NEXT
10122 FORI=29183TO28672STEP-1:POKEI,96:NEXT:PRINT@0,"";
10130 PRINT"  THE LAND OF ERINDOR IS SLOWLY ";
10131 PRINT"BEING DESTROYED BY THE EVIL     ";
10132 PRINT"SORCEROR, FEAMOR.               ";
10135 PRINT" YOU HAVE BEEN CHOSEN BY THE    ";
10137 PRINT"KING OF ERINDOR TO RECOVER THE  ";
10138 PRINT"ONLY HOPE OF DESTROYING HIM     ";
10140 PRINT" ...THE 'LOST SWORD'"
10142 PRINT"  YOU WILL ENTER THE ANCIENT    ";
10144 PRINT"CAVES WHERE THE SWORD LIES, NOW ";
10145 PRINT"GUARDED BY THE IMMORTAL SERVANTS";
10146 PRINT"OF FEAMOR."
10150 GOSUB19990
10155 PRINT"     *  C O M M A N D S  *"
10160 PRINT" THE FOLLOWING COMMANDS ARE      ABBREVIATED AS -"
10161 PRINT"    NORTH, SOUTH, EAST, WEST,    LOOK & INVENTORY."
10163 PRINT"BUT OTHERWISE USE SIMPLE ENTRIES";
10165 PRINT"SUCH AS : GET KEYS,OPEN GATE  & KILL GUARD ETC..."
10167 PRINT"IF YOU 'LOOK AT' AN OBJECT YOU"
10168 PRINT"GET A FURTHER DESCRIPTION, AND"
10169 PRINT"PERHAPS A HIDDEN CLUE..."
10170 PRINT:PRINT" YOUR MOVES WILL BE COUNTED, SO"
10171 PRINT" IT IS ADVISIBLE TO USE AS FEW   MOVES AS POSSIBLE"
10200 GOSUB19990
10999 RUN
11111 PRINT" THE MONGOOSE KILLED THE SNAKE":GOTO500
12000 REM *** DEAD ***
12010 SOUND0,9;0,9;31,5;21,5;11,5;1,5;0,9:PRINT
12020 PRINT" YOU WERE KILLED BY -","   ";K$:PRINT
12099 PRINT:PRINT
12100 PRINT"    PLAY AGAIN (Y/N) ?"
12101 IFINKEY$<>""THEN12101
12110 G$=INKEY$
12111 IFG$="Y"THENRUN
12112 IFG$="N"THENCLS:NEW
12113 GOTO12110
12999 PRINT:PRINT:
15000 REM *** END ***
15010 PRINT" C O N G R A T U L A T I O N S  "
15020 PRINT"--------------------------------"
15030 PRINT" YOU TOOK ";M;" MOVES, WHICH"
15040 PRINT" GIVES YOU A SCORE OF  %";(70/M)*100
15050 FORI=1TO3500:NEXTI
15055 PRINT:PRINT"     YOU ARE NOW READY TO "
15057 PRINT"      FIND & KILL FEAMOR":PRINT
15058 SOUND11,3;21,2;31,7
15060 PRINT"   * PLEASE START THE TAPE *":PRINT:PRINT:CRUN
19990 PRINT@481,"    PRESS SPACE TO CONTINUE   ";
19991 IFINKEY$<>""THEN19991
19992 IFINKEY$<>" "THEN19992
19995 SOUND31,1:CLS
19999 RETURN
