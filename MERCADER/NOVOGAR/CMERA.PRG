********************************************************************************
*-- Programa: CMERA.PRG
*-- Fecha   : 06/28/91
*-- Version : g. reiner
*-- Notas   : CORRIGE MERCADERIAS (N§ DE PARTIDA)
*-- Modificaci¢n GOYO 06-10-92 05:53pm (movewin/auditor)
********************************************************************************
ff=recno("mer")
REGISTRO=STR(ff)
=lock("mer") .or. LOK("MER")
STORE hora_ulp(PROGRAM()) to ULPR
IF CHEQSEG()
   STORE 20 TO COL
   SELE mer
   scat memv
   ACTI SCRE
   =MEN_LIN(PADC('[TAB] Para Grabar - [ESC] para Anular',80))
   =movewin(3,1,9,1+mclian,'win',' Datos de la Mercader¡a ')
   @ 1,2 SAY "Art¡culo" COLOR SCHE 3
   @ 1,COL GET m.articulo PICTURE '@!'
   @ 2,2 SAY "Denominaci¢n " COLOR SCHE 3
   @ 2,COL GET m.merca PICTURE '@!'
   CLEAR GETS
   @ 3,2 SAY "N§ de Partida" COLOR SCHE 3
   @ 3,COL GET m.partida PICTURE '@!'
   read
   if last()#27 .and. confirma("Datos Ingresados",.t.,20,40)
      sele mer
      go ff
      gath memv
      =iaud(alltrim(mer.articulo)+m.partida)
   endif
   =RELEWIN('win')
ELSE
   =iaudI()
ENDIF
unlo in mer
RETURN
