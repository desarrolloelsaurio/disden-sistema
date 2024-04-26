****************************************
*-- Programa: LLMI1.PRG
*-- Fecha   : 05-18-92 07:19pm
*-- Version : G. REINER
*-- Notas   : RECUPERA BASE MIXTA1
*-- Modificaci¢n GOYO 05-26-92 11:58am
****************************************
STOR RECNO() TO FF
REGISTRO=STR(FF)
STOR HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   SELE MI1
   SET ORDER TO TAG (OTROS[1])
   STOR OTROS[2] TO COL
   =MOVEWIN(OTROS[3],OTROS[4],OTROS[5],OTROS[6],'WIN',MENSAJE[5])
   SCAT MEMVAR
   DO MMI1
   IF confirma("Recuperar "+texto[1,1],.T.,12,nul)
      =LOCK(REGISTRO,"MI1") .OR. LOK("MI1")
      RECA RECO ff
      UNLO IN MI1
      =IAUD(MI1.TEXTO1)
   ENDIF
  =RELEWIN('win')
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
