*:*********************************************************************
*-- Programa: BPEC.PRG
*-- Fecha   : 06/12/91 03:24pm
*-- Version : R. 'EL BATA'
*-- Notas   : BORRA NOTAS DE PEDIDO DE compra
*:**********************************************************************
SELE pec
SCAT MEMV
STORE productiva TO tipopec
STORE RECNO() TO ff
registro=STR(ff)
SELE seg
STORE PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
	=hora_ulp()
   ACTI WIND win2
   CLEA
   DO lok WITH 'PEC'
   SELE pe1
   nohayent=.T.
   ft=""
   SCAN FOR pedido=m->pedido .AND. procod=m->procod
      ft=ft+ALLTRIM(STR(RECNO()))+","
      IF pe1->entregado>0
         nohayent=.F.
      ENDIF
   ENDSCAN
   ft=LEFT(ft,LEN(ft)-1)
   registro = ft
   DO lok WITH 'PE1'
   SELE pec
   STORE 17 TO COL
   SCAT MEMVAR
   DO mpec WITH ft, 1
   IF EMPTY(pec->fechaent)
      IF nohayent
         IF confirma("Borrar la nota de Pedido",.T.,12,0)
            SELE pec
            DELE RECO ff
            SELE pe1
            DELE FOR pedido=m->pedido .AND. procod=m->procod
            UNLO IN pe1
            UNLO IN pec
            DO iaud WITH 'BORRO NOTA PEDIDO '+ALLTRIM(STR(m->pedido))+pro->procod
         ENDIF
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
*: EOF: BPEC.PRG

