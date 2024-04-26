********************************************************************************
*-- Programa: BPED.PRG
*-- Fecha   : 06/12/91 03:24pm
*-- Version : R. 'EL BATA'
*-- Notas   : BORRA NOTAS DE PEDIDO
*-- Modificaci¢n GOYO 08-06-92 05:02pm
*-- Modificaci¢n GOYO
*-- VERSION NAZA (cta cte mercaderias)
********************************************************************************
dijo=bar()
SELE ped
STORE RECNO() TO ff
registro=STR(ff)
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
tt=''
fisc=qwcli(dijo)
if FISC#'.F.'
=MEN_LIN("BORRANDO DATOS PEDIDOS")
=WORKING()
SET ORDER TO TAG CODCLI IN PED
SET ORDER TO TAG CODCLI IN PEX
	SELE PER
   SCAN FOR &FISC
      SELE PED
      SEEK PER.CODCLI
      DELE WHILE CODCLI=PER.CODCLI
      SELE PEX
      SEEK PER.CODCLI
      DELE WHILE CODCLI=PER.CODCLI
		SELE PER
   ENDSCAN
   =IAUD(FISC)
   =UNWORK()
ENDIF
ELSE
   =iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)
