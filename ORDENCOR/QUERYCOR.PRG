************************************************************
*-- Programa: QUERYCOR.PRG
*-- Fecha   : 07-26-92 05:10pm
*-- Version : G. REINER
*-- Notas   : GENERA QUERY PARA LISTADO DE ORDENES DE CORTE
*-- Modif. GOYO 11/9/95
************************************************************
FUNCTION QUERYCOR
parameter porpa
=MOVEWIN(5,1,22,79,'win',' L¡mites del Listado de Ordenes de '+PROP(korte),' [ESC] para Men£ ')
store '' TO TTCOR,TTFIN,TTmer,TTFFA,TTFFI,TTINI,ttfec
store '.T.' TO QUECOR,QUEFIN,QUEmer,QUEFFA,QUEFFI,QUEINI,quefec
STORE 1 TO FILCOR,FILFIN,FILMER,FILFFA,FILFFI,FILINI
for m.i=nul to 1
   =rad_bot(1,2,'filcor','*RT Todas las Ordenes;Una Orden;Ranking por Orden',19,m.i=1)
   if m.i=1
      read cycle
   endif
   if m.i=0 .or. (m.i=1 .and. filcor=1)
      if last()#27 .or. (last()=27 .and. m.i=0)
         =rad_bot(1,25,'filmer','*RT Todas las Mercader¡as;Un Producto;Ranking por Producto',19,m.i=1)
         read cycle when last()#27 .and. m.i=1
         =rad_bot(1,51,'filfin','*RT Por Fecha Inicio;Una Fecha;Ranking por F. Inicio',19,m.i=1)
         read cycle when last()#27 .and. m.i=1
         =rad_bot(6,2,'filffa','*RT Por Fecha Fabricaci¢n;Una Fecha;Ranking por F. Fabricaci¢n',19,m.i=1)
         read cycle when last()#27 .and. m.i=1
         =rad_bot(6,51,'filini','*RT Todas las Ordenes;Ordenes No Terminadas;Ordenes Terminadas;No Iniciadas',19,m.i=1)
         read cycle when last()#27 .and. m.i=1
         =rad_bot(11,25,'filffi','*RT Por Fecha de Finalizaci¢n;Una Fecha;Ranking por F. Finalizaci¢n',19,m.i=1)
         read cycle when last()#27 .and. m.i=1
      endif
   ELSE
      EXIT
   endif
next
if lastkey()#27
   store nul TO RESPUESTA
   =OPcor()
   =OPMER()
   *** elige ORDEN DE CORTE
   if filcor=2
      =OPEST()
      =OPPRC()
      =VCOR(" Muestra Orden de Corte ",.t.)
   else
      =qw_mer(4,25,'cor.articulo')
      filfec=filfin
      HABILITADO[2]=qw_fec(4,52,'cor.fechaini')
      quefin=quefec
      ttfin=IIF(EMPTY(ttfec),'','Fecha de Inicio:'+TTFEC)
      filfec=filffa
      HABILITADO[4]=qw_fec(9,2,'cor.fechafab')
      queffa=quefec
      ttffa=IIF(EMPTY(ttfec),'','Fecha de Fabricaci¢n:'+TTFEC)
      filfec=filffi
      HABILITADO[5]=qw_fec(14,25,'cor.fechafin')
      queffi=quefec
      ttffi=IIF(EMPTY(ttfec),'','Fecha de Finalizaci¢n:'+TTFEC)
      FISC=""
      FISC=iif(filini=1,'',iif(filini=2,'iniciado .and. empty(fechafin)',iif(filini=3,'!empty(fechafin)','!iniciado')))
      FISC=qw_FISC(FISC,quefin)
      FISC=qw_FISC(FISC,quemer)
      FISC=qw_FISC(FISC,queffi)
      FISC=qw_FISC(FISC,queffa)
      FISC=IIF(EMPTY(FISC),'.T.',FISC)
      store "Resumen por " to ressu
      ttcor=iif(filcor=3,RESSU+'Orden de '+proper(korte),ttcor)
      ttfin=iif(filfin=3,RESSU+'Fecha de Inicio',ttfin)
      ttmer=iif(filmer=3,RESSU+'Mercader¡a',ttmer)
      ttffa=iif(filffa=3,RESSU+'Fecha de Fabricaci¢n',ttffa)
      ttffi=iif(filffi=3,RESSU+'Fecha de Finalizaci¢n',ttffi)
      FISC=IIF(EMPTY(FISC),'.T.',FISC)
      TTQUE=IIF(FILINI=2,'Ordenes no Terminadas',iif(FILINI=3,"Ordenes Terminadas",iif(filini=4,"Ordenes no Iniciadas","")))
      TTQUE=IIF(EMPTY(TTQUE),'',CHR(13)+CHR(10)+TTQUE)+QW_TT(TTMER)+qw_tt(TTFIN)+qw_tt(TTFFA)+qw_tt(TTFFI)+qw_tt(TTINI)
   ENDIF
endif
IF !EMPTY(WONTOP())
   =releWIN('win')
ENDIF
RETURN last()#27 .AND. filcor#2
