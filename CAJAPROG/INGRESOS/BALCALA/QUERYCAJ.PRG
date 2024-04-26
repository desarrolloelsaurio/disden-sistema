********************************************************************************
*-- Programa: QUERYCaj.PRG
*-- Fecha   : 05-04-92 03:36pm
*-- Version : G. REINER
*-- Notas   : GENERA QUERY PARA LISTADO EN Caja
********************************************************************************
fUNCTION QUERYCaj
parameter porpant, paraquien
PRIVATE PORPANT, paraquien
ULPR=HORA_ULP(PROGRAM())
M.TITULO = 'Listado de '+IIF(PARAQUIEN='C','Ingresos','Egresos')+' de Caja '
=MOVEWIN(7,1,13,79,'win',' L¡mites del '+M.TITULO,' [ESC] para Men£ ')
store 1 to FILGAS,FILPro,FILFEC,filcli
STORE '.T.' to QUEgas,QUEPro,QUEfec,quecli
STORE '' to TTgas,TTPro,TTfec,ttcli
***
for m.i=nul to 1
   filcaj=3
   if paraquien='C'
      =rad_bot(1,1,'filcli','*RT Todos los Clientes;Un Cliente;Resumen por Cliente',8,m.i=1)
      read cycle when last()#27 .and. m.i=1
   else
      =rad_bot(1,1,'filPro','*RT Todos los Proveedores;Un Proveedor;Resumen por Proveedor',8,m.i=1)
      read cycle when last()#27 .and. m.i=1
   endif
   =rad_bot(1,27,'filfec','*RT Todas las Fechas;Una Fecha;Res£men por Fecha',8,m.i=1)
   read cycle when last()#27 .and. m.i=1
   if paraquien='P'
      =rad_bot(1,50,'filgas','*RT Todos los Gastos;Un Gasto;Res£men por Gasto',8,m.i=1)
      read cycle when last()#27 .and. m.i=1
   endif
next
if last()#27
   HABILITADO[1]=qw_CAJ(4,1,'caj.caja')
   HABILITADO[2]=iif(paraquien='C',.F.,qw_Pro(4,1,'caj.codcli'))
   HABILITADO[4]=iif(paraquien='P',.F.,qw_cli(4,1,'caj.codcli'))
   HABILITADO[5]=qw_fec(4,27,'caj.fechaop')
   HABILITADO[3]=qw_gas(4,50,'caj.GASTO')
   store .F. to HABILITADO[12], HABILITADO[13]
   FISC=''
   FISC=iif(paraquien='P',qw_FISC(FISC,quegas),FISC)
   FISC=qw_fisc(FISC,quePro)
   FISC=qw_fisc(FISC,quecli)
   FISC=qw_FISC(FISC,quefec)
   FISC=iif(paraquien='P',qw_FISC(FISC,'caj.proveedor'),FISC)
   FISC=iif(paraquien='C',qw_FISC(FISC,'!caj.proveedor'),FISC)
   FISC=IIF(EMPTY(FISC),'.T.',FISC)
   store "Resumen por " to ressu
   ttgas=iif(filgas=3,RESSU+'Gasto',ttgas)
   if paraquien#'C'
      ttPro=iif(filPro=3,RESSU+'Proveedor',ttPro)
   endif
   if paraquien#'P'
      ttcli=iif(filcli=3,RESSU+'Clientes',ttcli)
   endif
   ttfec=iif(filfec=3,RESSU+'Fecha',ttfec)
   TTQUE=M.TITULO+QW_TT(TTGAS)+QW_TT(TTPro)+QW_TT(TTCLI)+QW_TT(TTFEC)
endif
IF !EMPTY(WONTOP())
   =releWIN('win')
ENDIF
RETURN last()#27
