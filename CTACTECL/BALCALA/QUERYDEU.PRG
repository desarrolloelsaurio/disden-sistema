********************************************************************************
*-- Programa: QUERYCCL.PRG
*-- Fecha   : 05-04-92 03:36pm
*-- Version : G. REINER
*-- Notas   : GENERA QUERY PARA LISTADO EN CUENTA CORRIENTE CLIENTES
********************************************************************************
FUNCTION QUERYDEU
parameter porpant
PRIVATE PORPANT
ULPR=HORA_ULP(PROGRAM())
=MOVEWIN(7,1,14,79,'win',' L¡mites del Listado de Deuda Vencida de Clientes ',' [ESC] para Men£ ')
store 1 to FILCLI,FILFEC,filZON
STORE '.T.' to QUEcli,QUEfec,queZON
STORE '' to TTcli,TTfec,ttzon
***
for m.i=nul to 1
   =rad_bot(1,2,'filcli','*RT Todos los Clientes;Un Cliente;Resumen por Cliente',8,m.i=1)
   if m.i=1
      read cycle
   endif
   if last()#27 .or. (last()=27 .and. m.i=0)
      =rad_bot(1,30,'filfec','*RT Todas las Fechas;Una Fecha;Res£men por Fecha',8,m.i=1)
      read cycle when last()#27 .and. m.i=1
      =rad_bot(1,55,'filzon','*RT Todas las Zonas;Una Zona;Res£men por Zona',8,m.i=1)
      read cycle when last()#27 .and. m.i=1
   else
      exit
   endif
endf
if lastkey()#27
   store nul TO RESPUESTA
   HABILITADO[1]=qw_cli(4,2,'ccl.codcli')
   HABILITADO[2]=qw_fec(4,30,'ccl.fechaop')
   =qw_zon(4,50,'PER.zona')
   FISC="!pagada .AND. (EMPTY(CCL.COMPRRE) .OR. CCL.COMPRRE='FA' .or. CCL.COMPRRE='ND')"+iif(EMPTY(QUEFEC),'',' .AND. FECHAVE<=DATE()')
   FISC=qw_fisc(FISC,quecli)
   FISC=qw_FISC(FISC,quefec)
   FISC=QW_FISC(FISC,QUEzon)
   FISC=IIF(EMPTY(FISC),'.T.',FISC)
   store "Resumen por " to ressu
   ttcli=iif(filcli=3,RESSU+'Cliente',ttcli)
   ttfec=iif(filfec=3,RESSU+'Fecha',ttfec)
   TTQUE='-Deuda Vencida al d¡a '+dtoc(date())+QW_TT(TTCLI)+QW_TT(TTFEC)+QW_TT(TTZON)
endif
IF !EMPTY(WONTOP())
   =releWIN('win')
ENDIF
RETURN last()#27
