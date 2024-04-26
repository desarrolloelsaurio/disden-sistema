********************************************************************************
*-- Programa: LLPER.PRG
*-- Fecha   : 06/27/91
*-- Version : V.LEEGSTRA
*-- Notas   : RECUPERA CLIENTES BORRADOS LOGICAMENTE
********************************************************************************
stor RECNO() TO ff
stor STR(ff) TO registro
ulpr=hora_ulp(program())
if cheqseg()
	SELE PER
   =LOCK() .OR. lok('PER')
   stor 24 TO COL
   SCAT MEMVAR
	=MOVECENT(NUL,NUL,16,60,"WIN"," Recupera el Cliente ")
   DO mcli WITH .T.
   IF confirma("Recuperar el Cliente",.T.,18,nul)
      RECA RECO ff
      =iaud(alltrim(PER.cliente)+' '+PER.codcli)
   ENDIF
   UNLO IN PER
   =RELEWIN("WIN")
ELSE
   =iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
