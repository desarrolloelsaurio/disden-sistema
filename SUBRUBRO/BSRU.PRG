******************************************
*-- Programa: bsru.prg
*-- Fecha   : 11-20-91
*-- Version : G. REINER
*-- Notas   : BORRA SUB-RUBROS
*-- Modificaci¢n GOYO 07-29-92 01:14am
*****************************************
ULPR=HORA_ULP()
IF CHEQSEG()
   DEFINE WINDOW win FROM mrubr,mrubc TO mrubr+mrubla+1,mrubc+mruban TITL " Borra Sub-Rubros " SHAD COLOR SCHE 8
   SELE rub
   do lok with "rub"
   COL=15
   SCATTER MEMVAR
   DO msru
   IF confirma("Borrar el Sub-Rubro",.T.,12,nul)
      DELE RECO ff
   ENDIF
   UNLO IN rub
   =RELEWIN("win")
   =IAUD(M.rubro)
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
