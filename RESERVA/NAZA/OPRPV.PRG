********************************************
*-- Programa: OPRPV.PRG
*-- Fecha   : 12-18-95
*-- Version : R. 'EL BATA'
*-- Notas   : ABRE ARCHIVO RESERVA DE STOCK
*-- Modificacion GOYO 18/1/96
********************************************
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
 
PARAMETER O_REOP,O_EXCL
DO CASE
CASE O_EXCL .OR. O_REOP
   =CLOSDBF("RPV")
OTHERWISE
   IF USED("RPV")
      SELE RPV
      RETURN MEN_LIN(BOTOM)
   ENDIF
ENDCASE
=MEN_LIN(ABA+"Reserva de stock")
=GETDBF('RESPREV',.F.,"RPV",PRXAREA(),O_EXCL)
RETURN MEN_LIN(BOTOM)
 
