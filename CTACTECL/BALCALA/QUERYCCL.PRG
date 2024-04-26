********************************************************************************
*-- Programa: QUERYCCL.PRG
*-- Fecha   : 05-04-92 03:36pm
*-- Version : G. REINER
*-- Notas   : GENERA QUERY PARA LISTADO EN CUENTA CORRIENTE CLIENTES
*-- Modificaci¢n GOYO 07-22-92 11:37pm marca -> empresa
********************************************************************************
FUNCTION QUERYCCL
parameter porpant
PRIVATE PORPANT
ULPR=HORA_ULP(PROGRAM())
=MOVEWIN(7,1,14,79,'win',' L¡mites del Listado de Cta Cte Clientes ',' [ESC] para Men£ ')
store 1 to FILCLI,FILFEC,filemp
STORE '.T.' to QUEcli,QUEfec
STORE '' to TTcli,TTfec
***
for m.i=nul to 1
   =rad_bot(1,2,'filemp','*RT Empresa;Anula Listado',19,m.i=1)
   if m.i=1
      read cycle
   endif
   if m.i=0 .or. (m.i=1 .and. filemp=1)
      if last()#27 .or. (last()=27 .and. m.i=0)
         =rad_bot(1,25,'filcli','*RT Todos los Clientes;Un Cliente;Resumen por Cliente',19,m.i=1)
         read cycle when last()#27 .and. m.i=1
         =rad_bot(1,50,'filfec','*RT Todas las Fechas;Una Fecha;Res£men por Fecha',19,m.i=1)
         read cycle when last()#27 .and. m.i=1
      endif
   ELSE
      EXIT
   endif
next
if lastkey()#27 .and. filemp=1
   ** ELIGE EMPRESA
   store nul TO RESPUESTA
   IF !empty(ELIEMP("a Listar",4,2))
      =OPCCL() WITH JANNRO
      @ 4,2 say janname
      HABILITADO[1]=qw_cli(4,25,'ccl.codcli')
      HABILITADO[2]=qw_fec(4,50,'ccl.fechaop')
      FISC=''
      FISC=qw_fisc(FISC,quecli)
      FISC=qw_FISC(FISC,quefec)
      FISC=IIF(EMPTY(FISC),'.T.',FISC)
      store "Resumen por " to ressu
      ttcli=iif(filcli=3,RESSU+'Cliente',ttcli)
      ttfec=iif(filfec=3,RESSU+'Fecha',ttfec)
      TTQUE=QW_TT(TTCLI)+QW_TT(TTFEC)
   endif
endif
IF !EMPTY(WONTOP())
   =releWIN('win')
ENDIF
RETURN last()#27 .and. jannro#0
