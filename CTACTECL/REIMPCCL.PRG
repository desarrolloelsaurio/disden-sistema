*********************************************************************************
*-- Programa: REIMPCCL.PRG
*-- Fecha   : 09-05-92 02:41pm
*-- Version : G. REINER
*-- Notas   : DERIVA A PROCEDIMIENTOS DE REIMPUTACION
********************************************************************************
PARAMETER REIM_TIPO
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
   =POPCARTE(tt)
   IF CONFIRMA("REIMPUTAR COBROS",.T.,10,10)
		SELE PER
      INDE ON CODCLI TO (GENTMP()) FOR EVAL(FISC) COMP
      SCAN
         =MEN_LIN('IMPUTANDO PAGOS DE '+ALLTRIM(PER.CLIENTE))
         =IMPUTCCL(PER.CODCLI,REIM_TIPO)
			SELE PER
      ENDSCAN
      =REOPCLI()
      =REOPCCL()
   ENDIF
   =RELEWIN("POPCARTE")
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
