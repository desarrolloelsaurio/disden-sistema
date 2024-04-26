**********************************
*-- Programa: BMI1.PRG
*-- Fecha   : 05-18-92 07:20pm
*-- Version : G. REINER
*-- Notas   : BORRA BASE MIXTA 1
**********************************
STOR RECNO() TO FF
REGISTRO=STR(FF)
STOR HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   SELE MI1
   SET ORDER TO TAG (OTROS[1])
   STOR OTROS[2] TO COL
   =MOVEWIN(OTROS[3],OTROS[4],OTROS[5],OTROS[6],'WIN',MENSAJE[5])
      =LOCK(REGISTRO,"MI1") .OR. LOK("MI1")
      SCAT MEMVAR
      DO MMI1
      IF CONFIRMA("Borrar "+TEXTO[1,1],.T.,12,nul)
         DELE RECO ff
      ENDIF
      UNLO IN MI1
      =IAUD(ALLTRIM(MI1->TEXTO1)+'-'+MI1.TEXTO2)
      =RELEWIN('WIN')
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
