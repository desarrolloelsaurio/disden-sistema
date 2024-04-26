*:*********************************************************************
*:
*:        Program: LPEC.PRG
*:
*:         System: SYSTEMA DE COMPRAS
*:         Author: GOYO REINER
*:      Copyright (c) 1992, NAZA S.R.L.
*:  Last modified: 01/10/92     17:19
*:
*:      Called by: PEC.PRG                       
*:
*:          Calls: LOK.PRG
*:               : MPEC.PRG
*:               : IAUD.PRG
*:
*:      Documented 01/30/92 at 15:49               FoxDoc  version 2.01
*:*********************************************************************
*
*-- Programa: LPEC.PRG
*-- Fecha   : 06/12/91 03:24pm
*-- Version : R. 'EL BATA'
*-- Notas   : MUESTRA NOTAS DE PEDIDO proveed.
*
SELE pec
STORE RECNO() TO ff
SCAT MEMV
STORE productiva TO tipopec
registro=STR(ff)
SELE seg
STORE PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   @ 0,rh SAY TIME() COLOR I
   @ 0,rp SAY PADC(ulpr,10) COLOR I
   ACTI WIND win2
   CLEA
   DO lok WITH 'PEC'
   SELE pe1
   ft=""
   SCAN FOR pedido=m->pedido .AND. procod=m->procod
      ft=ft+ALLTRIM(STR(RECNO()))+","
   ENDSCAN
   IF ft==""
      RETURN
   ENDIF
   ft=LEFT(ft,LEN(ft)-1)
   cuantos=OCCURS(",",ft)+1
   registro = ft
   DO lok WITH 'PE1'
   SELE pec
   STORE 17 TO COL
   SCAT MEMVAR
   IF EMPTY(pec->fechaent)
      desdecual = 1
      DO WHILE .T.
         DO mpec WITH ft, desdecual
         hastacual=desdecual+13
         IF hastacual>cuantos
            hastacual=cuantos
         ENDIF
         ren=9
         DO WHILE .T.
            @ 24, 30 PROMPT "\<ANTERIOR"
            @ 24, 45 PROMPT "\<SALIR"
            @ 24, 60 PROMPT "\<POSTERIOR"
            opcion = 0
            MENU TO opcion
            IF opcion = 1
               IF desdecual-14>=1
                  desdecual=desdecual-14
               ELSE
                  LOOP
               ENDIF
            ELSE
               IF opcion = 2
                  EXIT
               ELSE
                  IF opcion = 3
                     IF desdecual+14<=cuantos
                        desdecual=desdecual+14
                     ELSE
                        LOOP
                     ENDIF
                  ENDIF
               ENDIF
            ENDIF
            EXIT
         ENDDO
         IF opcion = 2
            EXIT
         ENDIF
      ENDDO
   ELSE
      DO mpec WITH ft, 1
      DEFINE WINDOW win10 FROM 21,5 TO 24,69 DOUB TITL ' *** MENSAJE *** ' SHAD COLO SCHE 8
      ACTI WIND win10
      @ 0,0 SAY PADC("FUE TOTALMENTE ENTREGADO",63)
      @ 1,0 SAY PADC("EL DIA "+DTOC(pec->fechaent),63)
      =INKEY(nul )
      RELE WIND win10
   ENDIF
ELSE
   DO iaud WITH 'ING ILEGAL '+ulpr
ENDIF
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: LPEC.PRG

