********************************************************************************
*-- Programa: CMERD.PRG
*-- Fecha   : 05-12-92 09:57am
*-- Version : G. REINER
*-- Notas   : CORRIGE MERCADERIA, SOLO DENOMINACION
********************************************************************************
STORE hora_ulp(PROGRAM()) to ULPR
IF CHEQSEG()
   =MOVEWIN(9,0,18,79,'WIN','Correcci¢n de la Descripci¢n')
   store 30 to col1,COL
   sele mer
   =LOCK() .OR. LOK(STR(RECNO()),"MER")
   scat memv
   DO MMER1
   @ 4,1 SAY 'ARTICULO'
   @ 4,COL GET M.ARTICULO
   CLEA GETS
   @ 5,1 say 'DETALLE'
   @ 5,col1 get m->merca
   read
   if last()#27
      sele mer
      gath memv
   endif
   UNLO IN MER
   =relewin("win")
else
   =iaudI()
endif
=MEN_LIN(BOTOM)
return
