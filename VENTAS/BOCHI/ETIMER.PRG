********************************************************************************
*-- Programa: ETIMER.PRG
*-- Fecha   : 15.03.90
*-- Version : G. REINER
*-- Notas   : EMITE ETIQUETAS MERCADERIAS
********************************************************************************
DEFI WIND WIN FROM 8,10 TO 21,70
STOR SPACE(30) TO TEXTO1
STOR SPACE(30) TO TEXTO2
STOR SPACE(30) TO TEXTO3
STOR SPACE(30) TO TEXTO4
STOR 1 TO COPIAS
 
ACTI WIND WIN
DO TIT2 WITH 1," INGRESE TEXTO DE LA ETIQUETA ",'I',60
 
@ 4,2 SAY 'DENOMINACION PRODUCTO ' COLO SCHE 24
@ 6,2 SAY 'TEXTO 1               ' COLO SCHE 24
@ 7,2 SAY 'TEXTO 2               ' COLO SCHE 24
@ 8,2 SAY 'TEXTO 3               ' COLO SCHE 24
 
@ 4,27 GET TEXTO1
@ 6,27 GET TEXTO2
@ 7,27 GET TEXTO3
@ 8,27 GET TEXTO4
READ
 
IF TEXTO1#' '
   @ 10,2 SAY 'CANTIDAD DE COPIAS    ' COLO SCHE 24
   @ 10,27 GET COPIAS PICT '999'
   READ
   IF COPIAS#0
      _PCOPIES=INT(COPIAS/2)
      DO WHIL !PRIN()
         DO IMPRESOR
      ENDD
      SET PRINTER ON
      SET CONSOLE OFF
      _peject="NONE"
      _plength=72
      _plineno=0
      _pageno=1
      _pscode='{27}{64}{27}{67}{0}{7}'
      _ploffset=0
      _padvance="LINEFEEDS"
      TEXTO1=RTRIM(TEXTO1)
      IF LEN(TEXTO1)<30
         LT=30-LEN(TEXTO1)
         LT=LT/2
         LT1=INT(LT)
         TEXTO1=SPACE(LT1)+TEXTO1+SPACE(LT1)
         IF LT#LT1
            TEXTO1=' '+TEXTO1
         ENDI
      ENDI
      REST FROM ..\VENTASA\IMPRIME ADDITIVE
      L1=ESI+REPL(LIN,34)+ESD
      L2=BAR+' '+ESI+REPL(LIN,30)+ESD+' '+BAR
      L4=EII+REPL(LIN,34)+EID
      L3=BAR+' '+EII+REPL(LIN,30)+EID+' '+BAR
      PRINTJOB
         ? L1
         ?? SPACE(5)
         ?? L1
         ? L2
         ?? SPACE(5)
         ?? L2
         ? BAR+' '+BAR
         ?? CHR(27)
         ?? "~21"
         ?? TEXTO1
         ?? chr(27)
         ?? "~20"
         ?? BAR+' '+BAR
         ?? SPACE(5)
         ?? BAR+' '+BAR
         ?? CHR(27)
         ?? "~21"
         ?? TEXTO1
         ?? chr(27)
         ?? "~20"
         ?? BAR+' '+BAR
 
 
         ? BAR+' '+BAR
         ?? SPACE(30)
         ?? BAR+' '+BAR
         ?? SPACE(5)
         ?? BAR+' '+BAR
         ?? SPACE(30)
         ?? BAR+' '+BAR
 
 
         IF TEXTO2#' '
            ? BAR+' '+BAR
            ?? TEXTO2
            ?? BAR+' '+BAR
            ?? SPACE(5)
            ?? BAR+' '+BAR
            ?? TEXTO2
            ?? BAR+' '+BAR
         ENDI
 
         IF TEXTO3#' '
            ? BAR+' '+BAR
            ?? TEXTO3
            ?? BAR+' '+BAR
            ?? SPACE(5)
            ?? BAR+' '+BAR
            ?? TEXTO3
            ?? BAR+' '+BAR
         ENDI
 
         IF TEXTO4#' '
            ? BAR+' '+BAR
            ?? TEXTO4
            ?? BAR+' '+BAR
            ?? SPACE(5)
            ?? BAR+' '+BAR
            ?? TEXTO4
            ?? BAR+' '+BAR
         ENDI
 
         ? L3
         ?? SPACE(5)
         ?? L3
         ? L4
         ?? SPACE(5)
         ?? L4
         ?
         ?
      ENDPRINTJOB
      ?
      SET DEVICE TO SCREEN
      SET PRINTER OFF
      SET CONSOLE ON
   ENDI
   _PCOPIES=1
ENDI
 
DEAC WIND ALL
RETURN
 
