********************************************************************************
*-- Programa: MREM.PRG
*-- Fecha   : 07/08/91
*-- Version : V.LEEGSTRA
*-- Notas   : MUESTRA REMITO
********************************************************************************
ACTI WIND win
@ 1,2 SAY "NUMERO DE REMITO" COLO SCHE 3
@ 2,2 SAY "MARCA" COLO SCHE 3
@ 3,2 SAY "FECHA DE EMISION" COLO SCHE 3
@ 4,2 SAY "CODIGO DEL CLIENTE" COLO SCHE 3
@ 5,2 SAY "CLIENTE" COLO SCHE 3
@ 6,2 SAY "VIAJANTE" COLO SCHE 3
@ 7,2 SAY "CONDICION DE PAGO" COLO SCHE 3
@ 1,COL GET m->remito
STORE janname TO nada
@ 2,COL GET nada
@ 3,COL GET m->fechaem
@ 4,COL GET m->codcli
if xSEEK(m->codcli,'PER','codcli')
   STORE PER.cliente TO nada
   @ 5,COL GET nada
ENDIF
if xSEEK(m->codvia,'via','codvia')
   STORE via->viajante TO nada
   @ 6,COL GET nada
ENDIF
SELE rem
=xseek(m->condpago,'mix','pagcod')
STORE mix->texto1 TO nada
FOR A=4 TO 16 STEP 3
   STORE VAL(SUBSTR(nada,A,3)) TO nada5
   IF EMPTY(nada5)
      STORE SUBSTR(nada,1,A-1) TO nada
      STORE SUBSTR(nada,1,3) TO nada1
      FOR I=4 TO A-1 STEP 3
         STORE nada1+"-"+SUBSTR(nada,I,3) TO nada1
      ENDFOR
      EXIT
   ENDIF
ENDFOR
@ 7,COL GET nada1
CLEAR GETS
RETURN
*: EOF: MREM.PRG
