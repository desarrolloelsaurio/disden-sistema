********************************************************************************
*-- Programa: QUERYCCI.PRG
*-- Fecha   : 05-04-92 03:36pm
*-- Version : R. 'EL BATA'
*-- Notas   : GENERA QUERY PARA LISTADO EN CUENTA CORRIENTE IMPUESTOS
********************************************************************************
FUNCTION QUERYCCI
parameter porpant
PRIVATE PORPANT
ULPR=HORA_ULP(PROGRAM())
=MOVEWIN(3,1,21,79,'win',' L¡mites del Listado de Cta Cte de Impuestos ',' [ESC] para Men£ ')
store 1 to FILPIN,filfop,filemp,FILENT,FILDEV,filimp,filprp,filcli,filfve,filfec
STORE '.T.' to QUEPIN,QUEFOP,QUEENT,QUEDEV,QUEIMP,QUEPRP,QUECLI,quefve,quefec
STORE '' to TTPIN,TTFOP,TTENT,TTDEV,TTIMP,TTPRP,TTCLI,ttfve,ttfec
***
FILPIN=2
for m.i=nul to 1
   =rad_bot(1,2,'filemp','*RT Todos los Datos;Opciones;Anula Listado',19,m.i=1)
   if m.i=1
      read cycle
   endif
   if m.i=0 .or. (m.i=1 .and. filemp=2)
      if last()#27 .or. (last()=27 .and. m.i=0)
         =rad_bot(1,23,'filfop','*RT Todas las Fechas;Opciones;Res£men',19,m.i=1)
         read cycle when last()#27 .and. m.i=1
         =rad_bot(1,49,'filfve','*RT Todos los Vencimientos;Opciones;Res£men',19,m.i=1)
         read cycle when last()#27 .and. m.i=1
         =rad_bot(6,23,'filcli','*RT Todos los Inquilinos;Opciones;Resumen',19,m.i=1)
         read cycle when last()#27 .and. filpin=2 .and. m.i=1
         =rad_bot(11,2,'filent','*RT Todos;Entregados;No Entregados',19,m.i=1)
         read cycle when last()#27 .and. m.i=1
         =rad_bot(11,23,'fildev','*RT Todos;Devueltos;No Devueltos',19,m.i=1)
         read cycle when last()#27 .and. m.i=1
         =rad_bot(11,49,'filimp','*RT Todos los Impuestos;Municipal;Inmobiliario;Dipos',19,m.i=1)
         read cycle when last()#27 .and. m.i=1
      endif
   ELSE
      EXIT
   endif
next
if lastkey()#27 .and. filemp=2
      filfec=filfop
      HABILITADO[1]=qw_fec(4,23,'CCI.fechaop')
      filfop=filfec
      ttfop=ttfec
      quefop=quefec
      filfec=filfve
      HABILITADO[6]=qw_fec(4,49,'CCI.fechave')
      filfve=filfec
      ttfve=ttfec
      quefve=quefec
      if filpin=2
         HABILITADO[2]=qw_cli(9,23,'CCI.CODCLI')
      endif
      if filpin=3
         HABILITADO[2]=qw_prp(9,49,'CCP.CODCLI',.T.)
      endif
      HABILITADO[7]=qw_ent(14,2,'CCI.entregada')
      HABILITADO[8]=qw_dev(14,23,'CCI.pagada')
      HABILITADO[4]=qw_imp(15,49,'CCI.DETALLE')
      FISC=''
      FISC=qw_fisc(FISC,quecli)
      FISC=qw_FISC(FISC,queprp)
      FISC=iif(filcli=1 .and. filprp=1,qw_fisc(FISC,quePIN),FISC)
      FISC=qw_FISC(FISC,quefop)
      FISC=qw_FISC(FISC,quefve)
      FISC=qw_FISC(FISC,queent)
      FISC=qw_FISC(FISC,quedev)
      FISC=qw_FISC(FISC,queIMP)
      FISC=IIF(EMPTY(FISC),'.T.',FISC)
      store "Resumen por " to ressu
      if filpin=2
         ttcli=iif(filcli=3,RESSU+'Inquilino',ttCLI)
      endif
      if filpin=3
         ttprp=iif(filprp=3,RESSU+'Propietario',ttprp)
      endif
      ttfop=iif(filfop=3,RESSU+'Fecha',ttfec)
      ttfve=iif(filfve=3,RESSU+'Vencimiento',ttfve)
      TTQUE=QW_TT(TTFEC)+QW_TT(TTPRP)+QW_TT(TTCLI)+QW_TT(TTPIN);
           +QW_TT(TTENT)+QW_TT(TTDEV)+QW_TT(TTIMP)+QW_TT(TTFVE)
   ELSE
      IF FILEMP=1
         TTQUE=""
         FISC=".T."
      ENDIF
   ENDIF
IF !EMPTY(WONTOP())
   =RELEWIN('WIN')
ENDIF
RETURN LAST()#27 .AND. FILEMP#3
