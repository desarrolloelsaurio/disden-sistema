********************************************************************************
*-- Programa: GPRE.PRG
*-- Fecha   : 05-15-92 06:15pm
*-- Version : G. REINER
*-- Notas   : GRABA PRECIOS EN ARCHIVO DE PRECIOS Y STOCK
********************************************************************************
FUNCTION GPRE
sele mer
=RLOCK() .OR. FLOK(STR(RECNO()),"MER")
=men_lin(" "+ALLTRIM(mer.merca)+" ")
IF !EMPTY(COST)
   REPL costo WITH cost
ENDIF
IF !EMPTY(COSTOREA)
   REPL costoreal WITH costorea
ENDIF
REPL precio1 WITH preci1
REPL precio2 WITH preci2
REPL precio3 WITH preci3
REPL precio4 WITH preci4
UNLO IN MER
IF !EMPTY(stoc) .OR. !EMPTY(stocmin) .OR. !EMPTY(stocmax) .OR. !EMPTY(stocres)
   SELE PRE
   FOR j=xatalmin TO xatalmax STEP xatalstep
      =men_lin(" "+ALLTRIM(mer.merca)+"/Talle:"+ALLTRIM(STR(j)))
      rtc=LEFT(mer.articulo,13)+zero(j*10,3)
      =FLOCK("PRE") .OR. flok("pre")
      IF !SEEK(rtc)
         APPE BLAN
         REPL articulo WITH rtc
      ENDIF
      REPL stock WITH stoc
      REPL stockmin WITH stocmin
      REPL stockmax WITH stocmax
      REPL stockres WITH stocres
      =REPUSE()
      REPL hora WITH TIME()
      UNLO IN pre
   ENDFOR
   SELE mer
ENDIF
RETURN .T.
