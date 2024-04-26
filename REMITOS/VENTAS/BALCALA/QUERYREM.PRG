********************************************************************************
*-- Programa: QUERYREM.PRG
*-- Fecha   : 06-07-92 05:37pm
*-- Version : G. REINER
*-- Notas   : GENERA QUERY PARA LISTADO EN REMITOS A CLIENTES
********************************************************************************
FUNCTION QUERYREM
parameter porpant
PRIVATE PORPANT
ULPR=HORA_ULP(PROGRAM())
=MOVEWIN(7,1,19,79,'win',' L¡mites del Listado de Remitos de Venta - [ESC] para Men£ ')
store 1 to filemp,filrem,filvia,filval,filmer,filfec,filmon,filcli,filfac
STORE '.T.' to QUEemp,QUErem,QUEvia,QUEval,QUEmer,quefec,quemon,quecli,quefac
STORE '' to TTemp,TTrem,TTvia,TTval,TTmer,ttfec,ttmon,ttcli,ttfac
***
for m.i=nul to 1
   =rad_bot(1,2,'filrem','*RT Todos los Remitos;Un Remito;Resumen por Remito',19,m.i=1)
   if m.i=1
      read cycle
   endif
   if m.i=0 .or. (m.i=1 .and. filemp=1)
      if last()#27 .or. (last()=27 .and. m.i=0)
         =rad_bot(1,27,'filcli','*RT Todos los Clientes;Un Cliente;Res£men por Cliente',19,m.i=1)
         read cycle when last()#27 .and. m.i=1 .and. filrem#2
         =rad_bot(1,52,'filfec','*RT Todas las Fechas;Una Fecha;Res£men por Fecha',19,m.i=1)
         read cycle when last()#27 .and. m.i=1 .and. filrem#2
         =rad_bot(6,2,'filvia','*RT Todos los '+biajas+';Un '+biaja+';Res£men por '+biaja,19,m.i=1)
         read cycle when last()#27 .and. m.i=1 .and. filrem#2
         =rad_bot(6,27,'filfac','*RT Todos los Remitos;Facturados;Sin Facturar',19,m.i=1)
         read cycle when last()#27 .and. m.i=1 .and. filrem#2
         =rad_bot(6,52,'filmer','*RT Sin Mercader¡a;Resumen por Producto',19,m.i=1)
         read cycle when last()#27 .and. m.i=1 .and. filrem#2
      endif
   ELSE
      EXIT
   endif
next
if lastkey()#27
   if filrem=2
      store NUL to respuesta,NUREM
      if busrem(.t.)
         nurem=rem.remito
         if porpant
            DO lremp1 WITH NUREM
         else
            =DISP_REM(.F.,.F.)
         endif
      ELSE
         store 1 to filrem
      endif
   ELSE
      HABILITADO[3]=qw_cli(4,27,'rem.codcli')
      HABILITADO[2]=qw_fec(9,2,'rem.fechaem')
      HABILITADO[4]=QW_via(9,27,'REM.codvia')
      IF FILFAC=2
         QUEFAC="!EMPTY(REM.FACTURADO)"
         TTFAC='REMITOS FACTURADOS'
      ELSE
         IF FILFAC=3
            QUEFAC="EMPTY(REM.FACTURADO)"
            TTFAC='REMITOS NO FACTURADOS'
            STORE .F. TO HABILITADO[6],HABILITADO[7]
         ENDIF
      ENDIF
      if filmer=2
         =qw_mer(14,52,'rex.articulo')
      endif
      FISC=''
      FISC=qw_fisc(FISC,quecli)
      FISC=qw_FISC(FISC,quefec)
      FISC=qw_FISC(FISC,quevia)
      FISC=qw_FISC(FISC,queFAC)
      FISC=qw_FISC(FISC,queMer)
      FISC=IIF(EMPTY(FISC),'.T.',FISC)
      store "Resumen por " to ressu
      ttREM=iif(filrem=3,RESSU+'Remito',ttREM)
      ttfec=iif(filfec=3,RESSU+'Fecha',ttfec)
      ttvia=iif(filvia=3,RESSU+'Viajante',ttvia)
      TTQUE=QW_TT(TTREM)+QW_TT(TTFEC)+QW_TT(TTCLI)+QW_TT(TTVIA)+QW_TT(TTFAC)+QW_TT(TTMER)
   ENDIF
endif
IF !EMPTY(WONTOP())
   =releWIN('win')
ENDIF
RETURN last()#27 .AND. filrem#2
