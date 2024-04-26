********************************************************************************
*-- Programa: INDOL.PRG
*-- Fecha   : 16/01/90
*-- Version : G. REINER
*-- Notas   : INGRESA COTIZACION DEL DOLAR
********************************************************************************
EXTERNAL ARRAY VALMON
REST FROM ..\VENTASA\DOLAR ADDITIVE
MS1="Ingrese Cotizaci¢n de "
MS2=" - ENTER para anular correcci¢n"
@ 1,2 SAY "COTIZACION MONEDA EXTRANJERA"
@ 0,1 TO 2,30
@ 3,0 TO 17,31 DOUB
@ 4,1 SAY "DOLAR         " COLOR w+/n
@ 4,21 GET m.valdol PICT "9999999.99" ;
  MESS MS1+'U$S'+MS2;
  RANGE -1
 
@ 5,1 SAY "CHELIN AUSTR. " COLOR w+/n
@ 5,21 GET valmon[2] PICT "9999999.99" ;
  RANGE -1 ;
  MESS MS1+'CHELIN AUSTRIACO'+MS2
 
@ 6,1 SAY "CORONA SUECA  " COLOR w+/n
@ 6,21 GET valmon[3] PICT "9999999.99" ;
  RANGE -1 ;
  MESS MS1+'CORONA SUECA'+MS2
 
@ 7,1 SAY "FRANCO BELGA  " COLOR w+/n
@ 7,21 GET valmon[4] PICT "9999999.99" ;
  RANGE -1 ;
  MESS MS1+'FRANCO BELGA'+MS2
 
@ 8,1 SAY "FRANCO FRANCES" COLOR w+/n
@ 8,21 GET valmon[5] PICT "9999999.99" ;
  RANGE -1 ;
  MESS MS1+'FRANCO FRANCES'+MS2
 
@ 9,1 SAY "FRANCO SUIZO  " COLOR w+/n
@ 9,21 GET valmon[6] PICT "9999999.99" ;
  RANGE -1 ;
  MESS MS1+'FRANCO SUIZO'+MS2
 
@ 10,1 SAY "DOLAR CANAD.  " COLOR w+/n
@ 10,21 GET valmon[7] PICT "9999999.99" ;
  RANGE -1 ;
  MESS MS1+'DOLAR CANADIENSE'+MS2
 
@ 11,1 SAY "LIBRA ESTER.  " COLOR w+/n
@ 11,21 GET valmon[9] PICT "9999999.99" ;
  RANGE -1 ;
  MESS MS1+'LIBRA ESTERLINA'+MS2
 
@ 12,1 SAY "LIRA          " COLOR w+/n
@ 12,21 GET valmon[10] PICT "9999999.99" ;
  RANGE -1 ;
  MESS MS1+'LIRA'+MS2
 
@ 13,1 SAY "MARCO ALEMAN  " COLOR w+/n
@ 13,21 GET valmon[11] PICT "9999999.99" ;
  RANGE -1 ;
  MESS MS1+'MARCO ALEMAN'+MS2
 
@ 14,1 SAY "YEN           " COLOR w+/n
@ 14,21 GET valmon[12] PICT "9999999.99" ;
  RANGE -1 ;
  MESS MS1+'YEN'+MS2
 
@ 16,1 SAY "FECHA DE COTIZAC." COLOR w+/n
@ 16,23 GET m.valfecha ;
  DEFAULT date() ;
  MESS "Fecha de la cotizaci¢n"
READ
valmon[8]=valdol
SAVE ALL LIKE VAL* TO ..\VENTASA\DOLAR
RETURN
 
