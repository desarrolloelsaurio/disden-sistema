********************************************************************************
*-- Programa: QUERYCO1.PRG
*-- Fecha   : 07-26-92 05:10pm
*-- Version : G. REINER
*-- Notas   : GENERA QUERY PARA LISTADO DE ORDENES DE CORTE (MERCADERIAS)
********************************************************************************
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
FUNCTION QUERYCO1
parameter porpa
=MOVEWIN(7,1,18,79,'win',' L¡mites del Listado de Ordenes de '+PROP(korte),' [ESC] para Men£ ')
store '' TO TTCOR,TTMER,TTTAL,ttini, TTQUE
store '.T.' TO queCOR,queMER,quetal,queini
store 1 to filCOR,filMER,FILTAL,filini
***
for m.i=nul to 1
   =rad_bot(1,2,'filcor','*RT Todas las Ordenes;Una Orden;Resumen por Orden',19,m.i=1)
   if m.i=1
      read cycle
   endif
   if m.i=0 .or. (m.i=1 .and. filcor=1)
      if last()#27 .or. (last()=27 .and. m.i=0)
         =rad_bot(1,25,'filmer','*RT Todas las Mercader¡as;Un Producto;Ranking por Producto',19,m.i=1)
         read cycle when last()#27 .and. m.i=1
         =rad_bot(1,52,'filTAL','*RT Todos los Talles;Un Talle;Ranking por Talle',19,m.i=1)
         read cycle when last()#27 .and. m.i=1
         =rad_bot(6,25,'filini','*RT Todas las Ordenes;Ordenes Iniciadas;No Iniciadas',19,m.i=1)
         read cycle when last()#27 .and. m.i=1
      endif
   ELSE
      EXIT
   endif
next
if lastkey()#27
   store nul TO RESPUESTA
   DO OPcor
   do opcor
   =OPMER()
   *** elige ORDEN DE CORTE
   if filcor=2
      DO ICOR_DO.SPR WITH  " PARA VISUALIZAR ",9
   else
      =qw_mer(4,25,'cor.articulo')
      IF FILTAL=2
         STORE 0 TO RESPUESTA
         ELTALLE=INFIC("TALLE A LISTAR",XATALMAX)
         IF !EMPTY(RESPUESTA)
            HABILITADO[3]=.F.
            TTTAL='Por Talle:'+alltrim(str(respuesta))
            quetal="co1.talle="+alltrim(str(respuesta))
         else
            filtal=1
         ENDIF
      ENDIF
      FISC=iif(filini=1,'',iif(filini=2,'COR.iniciado','!COR.iniciado'))
      FISC=qw_FISC(FISC,quemer)
      FISC=qw_FISC(FISC,quetal)
      FISC=IIF(EMPTY(FISC),'.T.',FISC)
      store "Resumen por " to ressu
      ttcor=iif(filcor=3,RESSU+'Orden de '+proper(korte),ttcor)
      ttmer=iif(filmer=3,RESSU+'Mercader¡a',ttmer)
      FISC=IIF(EMPTY(FISC),'.T.',FISC)
      TTINI=IIF(FILINI=2,'Ordenes Iniciadas',IIF(filini=3,'Ordenes no Iniciadas',''))
      TTQUE=QW_TT(TTQUE)+QW_TT(TTMER)+QW_TT(TTCOR)+qw_tt(TTTAL)+qw_tt(TTINI)
   ENDIF
endif
IF !EMPTY(WONTOP())
   =releWIN('win')
ENDIF
RETURN last()#27 .AND. filcor#2
