*************************************************************
*-- Programa: ASTO.PRG
*-- Fecha   : 09/11/91 05:10pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE ACTUALIZACION DE STOCK
*-- VERSION BALCALA
* SI ES LOGICO O 1 VA A ASTO1
* SI ES 2 VA A CSTO
*************************************************************
PARAMETER AST_NUMERO
=HORA_ULP(PROGRAM())
TT=''
FISC=QWMER(BAR())
IF FISC#".F."
   IF TYPE("AST_NUMERO")#"N" .OR. AST_NUMERO=1
      DO ASTO1
   ELSE
      respuesta='CSTO#12#40#Campo a Corregir#3;
#\<Stock Actual;
#Stock \<M ximo;
#Stock \<M¡nimo;
#Stock \<Reservado'
=defpop()
ACTI SCRE
ON SELE POPU CSTO DO CSTO
ACTI POPU CSTO
RELE POPU CSTO
	 ENDIF
ENDIF
unlo all
RETURN men_lin(botom)
