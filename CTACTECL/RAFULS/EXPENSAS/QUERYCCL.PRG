********************************************************************************
*-- Programa: QUERYCCL.PRG
*-- Fecha   : 05-04-92 03:36pm
*-- Version : G. REINER
*-- Notas   : GENERA QUERY PARA LISTADO EN CUENTA CORRIENTE CLIENTES
********************************************************************************
FUNCTION QUERYCCL
parameter porpant
PRIVATE PORPANT
ULPR=HORA_ULP(PROGRAM())
IF SSTM1="ADMIN"
   IF SSTM2="EXPENSAS"
      TXCLI="Consorcistas"
   ELSE
		SELE PER
      OP_TEX=LEFT(ORDER(),1)
      TXCLI=IIF(OP_TEX='I','Inquilinos',IIF(OP_TEX='C','Propietarios',"Clientes"))+" "
   ENDIF
ELSE
   TXCLI="Clientes "
ENDIF
TXCLI_SIN=SINULT(ALLTRIM(TXCLI))
=MOVEWIN(7,1,14,79,'win',' L¡mites del Listado de Cta Cte '+TXCLI,' [ESC] para Men£ ')
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
         =rad_bot(1,20,'filcli','*RT Todos los '+;
           ALLTRIM(TXCLI)+";Un "+;
           TXCLI_SIN+";Resumen por "+;
           TXCLI_SIN+;
           +IIF(SSTM2="EXPENSAS",';Resumen por Consorcio',"");
           ,19,m.i=1)
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
	=OPCCL()
   @ 4,2 say janname
   HABILITADO[1]=qw_cli(4,20,'ccl.codcli')
   HABILITADO[2]=qw_fec(4,50,'ccl.fechaop')
   FISC=""
   IF FILCLI>2
      FISC=IIF(SSTM2="EXPENSAS",'LEFT(PER.CODCLI,1)="C"',"")
   ENDIF
   FISC=qw_fisc(FISC,quecli)
   FISC=qw_FISC(FISC,quefec)
   FISC=IIF(EMPTY(FISC),'.T.',FISC)
   store "Resumen por " to ressu
   ttcli=iif(filcli=3,RESSU+Q_TIPCLI(),ttcli)
   ttfec=iif(filfec=3,RESSU+'Fecha',ttfec)
   TTQUE=QW_TT(TTCLI)+QW_TT(TTFEC)
endif
IF !EMPTY(WONTOP())
   =releWIN('win')
ENDIF
RETURN last()#27
