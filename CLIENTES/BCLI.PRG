********************************************************************************
*-- Programa: BPER.PRG
*-- Fecha   : 06/27/91-ABR 1992
*-- Version : G, REINER
*-- Notas   : BORRA CLIENTE
********************************************************************************
stor RECNO() TO ff
stor STR(ff) TO registro
ulpr=hora_ulp(program())
if cheqseg()
	SELE PER
   SET ORDER TO tag cliente
   =LOCK() .OR. lok('PER')
   stor 24 TO COL
   SCAT MEMVAR
	=MOVECENT(NUL,NUL,16,60,"WIN"," Borra el Cliente ")
   DO mcli WITH .T.
   IF confirma("Borrar el Cliente",.T.,18,nul)
      =OPCCL(JANNRO)
      STORE NUL TO DEBE,hABER
      IF EMPTY(Q_DEU(PER.CODCLI))
			SELE PER
         DELE RECO ff
         UNLO IN PER
         =iaud(alltrim(PER.codcli)+"/"+PER.cliente)
      ELSE
         =CARTEL("IMPOSIBLE BORRAR EL CLIENTE",;
           ALLTRIM(PER.CLIENTE)+" ("+PER.CODCLI+")",;
           "DADO QUE SU CUENTA CORRIENTE REGISTRA SALDO",;
           "POR FAVOR CORRIJA Y REINTENTE")
         =IAUD("C/SALDO "+alltrim(PER.codcli)+"/"+PER.cliente)
      ENDIF
   ENDIF
   UNLO IN PER
   =RELEWIN("win")
ELSE
   =iaud()
ENDIF
=men_lin(botom)
RETURN
