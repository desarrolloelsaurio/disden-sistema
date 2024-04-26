********************************************************************************
*-- Programa: QUERYSTO.PRG
*-- Fecha   : 05/22/92 12:21pm
*-- Version : G. REINER
*-- Notas   : GENERA QUERY PARA LISTA DE STOCK
********************************************************************************
FUNCTION QUERYSTO
parameter porpa
PRIVATE PORPA
ULPR=HORA_ULP(PROGRAM())
=MOVEWIN(8,5,14,66,'win',' L¡mites del Listado de Stock ',' [ESC] para Men£ ')
store 1 to FILMER,FILPRE,FILsto
store '.T.' to queMER,quePRE,questo
store '' to ttMER,ttPRE,ttsto
***
for m.i=nul to 1
   =rad_bot(1,2,'filmer','*RT Todos los Art¡culos;Un Art¡culo;Anula Listado',19,m.i=1)
   if m.i=1
      read cycle
   endif
   if m.i=0 .or. (m.i=1 .and. filmer#3)
      if last()#27 .or. (last()=27 .and. m.i=0)
         =rad_bot(1,30,'filsto','*RT Todos;Stock Mayor que el M ximo;Stock Menor que el M¡nimo',19,m.i=1)
         read cycle when last()#27 .and. m.i=1
      endif
   ELSE
      EXIT
   endif
next
if lastkey()#27 .and. filmer#3
   store 0 to largor
   =qw_mer(4,2,'mer.articulo')
   =QW_sto()
   FISC='.T.'
   FISC=qw_fisc(FISC,quemer)
   FISC=qw_fisc(FISC,questo)
   FISC=IIF(EMPTY(FISC),'.T.',FISC)
   TTQUE=QW_TT(TTsto)
endif
IF !EMPTY(WONTOP())
   =releWIN('win')
ENDIF
RETURN last()#27
