ls=ALIAS()
ON KEY
SELE 25
SEEK ulpr
IF .NOT. FOUND()
   GOTO 2
ENDIF
DEFINE WIND hlp1 FROM 4,12 TO 21,68  TITL ' *** AYUDA EN LINEA *** ' SHAD COLOR SCHE 3
DEFINE WIND hlp FROM 1,1 TO 13,53 TITL ' '+RTRIM(LTRIM(ulpr))+' ' DOUB SHAD COLOR SCHE 3
ACTI WIND hlp1
@ WROW()-1,6 SAY "[ESC]" COLOR I
?? ' Fin Ayuda / '
SET COLOR TO I
?? '[Pg Up - Pg Dn]'
SET COLOR TO W+
?? " Mueve"
MODI MEMO ayuda NOEDIT WIND hlp IN WIND hlp1
RELE WIND hlp1
IF .NOT. EMPTY(ls)
   SELE &ls
ENDIF
RELE ls
SET COLOR TO W/B,B,B
ON KEY LABEL shift-f1 DO hlp
RETURN
*: EOF: HLP.PRG
