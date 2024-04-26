********************************************************************************
*-- Programa: QUERYPRE.PRG
*-- Fecha   : 05-15-92 06:56pm
*-- Version : G. REINER
*-- Notas   : GENERA QUERY PARA LISTA DE PRECIOS
********************************************************************************
FUNCTION QUERYPRE
parameter porpa
PRIVATE PORPA
ULPR=HORA_ULP(PROGRAM())
=MOVEWIN(8,10,14,69,'win',' L¡mites de la Lista de Precios ',' [ESC] para Men£ ')
store 1 to FILMER,FILPRE,FILART
store '.T.' to queMER,quePRE,queART
store '' to ttMER,ttPRE,ttART
***
for m.i=nul to 1
   =rad_bot(1,2,'filmer','*RT Todos los Art¡culos;Un Art¡culo;Anula Listado',19,m.i=1)
   if m.i=1
      read cycle
   endif
   if m.i=0 .or. (m.i=1 .and. filmer#3)
      if last()#27 .or. (last()=27 .and. m.i=0)
         =rad_bot(1,30,'filpre','*RT Precios;Porcentajes;Lista Mixta',19,m.i=1)
         read cycle when last()#27 .and. m.i=1
      endif
   ELSE
      EXIT
   endif
next
if lastkey()#27 .and. filmer#3
   store 0 to largor
   =qw_mer(4,2,'mer.articulo')
   =QW_PRE()
   FISC='.T.'
   FISC=qw_fisc(FISC,quemer)
   FISC=IIF(EMPTY(FISC),'.T.',FISC)
   TTQUE=QW_TT(TTMER)+QW_TT(TTPRE)
endif
IF !EMPTY(WONTOP())
   =releWIN('win')
ENDIF
RETURN last()#27
