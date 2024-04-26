********************************************************************************
*-- Programa: Btix2.prg
*-- Fecha   : 01-22-92 11:12am
*-- Version : R. 'EL BATA'
*-- Notas   : BORRA DATOS DE % de PART. x tipo de gasto
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   ANTEPOP=GASPOP
   GASPOP=.T.
   =OPGAS()
   IF !EMPTY(ELIGAS("",1,1))
      IF confirma("BORRAR la Particip. del tipo "+alltrim(mix.texto1)+" en el consorcio "+alltrim(cns.consorcio),.T.,mtixr+mtixla,mtixc+10)
         SELE TIX
         DELE FOR TIX.UNIGAS=LEFT(MIX.TEXTO2,11) .AND. TIX.CONCOD=CNS.CONCOD
      ENDIF
   ENDIF
   GASPOP=ANTEPOP
   =OPTIP()
ELSE
   =IAUDI()
ENDIF
=RELEWIN("WIN")
RETURN MEN_LIN(BOTOM)
