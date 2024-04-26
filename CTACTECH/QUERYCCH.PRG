********************************************************************************
*-- Programa: QUERYCCH.PRG
*-- Fecha   : 05-14-92 12:04pm
*-- Version : G. REINER
*-- Notas   : GENERA QUERY PARA LISTADO DE CHEQUES EN CARTERA
*-- Modif.  : E. BANALOTTI
*-- Modificaci¢n GOYO 09-03-92 04:33pm (agrega filent)
********************************************************************************
FUNCTION QUERYcch
parameter porpant
=MOVEWIN(2,1,23,79,'win1',' L¡mites del Listado de Cta. Cte de Cheques ',' [ESC] para Men£ ')
store '' to ttcch,ttcli,ttfec,ttfev,ttbco,ttmon,ttacr,TTEND,ttgas,TTENT && que se lista
store '.T.' to quecch,quecli,quefec,quefev,quebco,quemon,queacr,QUEENT,quegas && que se lista
store 1 to filcch,filcli,filfec,filfev,filbco,filmon,filacr,FILENT,filgas
***
for m.i=nul to 1
   =rad_bot(1,2,'filcch','*RT Todos los Cheques;Un Cheque',19,m.i=1)
   if m.i=1
      read cycle
   endif
   if m.i=0 .or. (m.i=1 .and. filcch=1)
      if last()#27 .or. (last()=27 .and. m.i=0)
         =rad_bot(1,25,'filcli','*RT Todos los Clientes;Un Cliente;Res£men por Cliente',19,m.i=1)
         read cycle when last()#27 .and. m.i=1 .and. filcch#2
         =rad_bot(1,50,'filbco','*RT Todos los Bancos;Un Banco;Res£men por Banco',19,m.i=1)
         read cycle when last()#27 .and. m.i=1 .and. filcch#2
         =rad_bot(6,2,'filfec','*RT Todas las Fechas Operaci¢n;Una Fecha Operaci¢n;Res£men por Fecha Operaci¢n',19,m.i=1)
         read cycle when last()#27 .and. m.i=1 .and. filcch#2
         =rad_bot(6,40,'filfev','*RT Todas las Fechas Vencimiento;Una Fecha Vencimiento;Res£men por Fecha Vencimiento',19,m.i=1)
         read cycle when last()#27 .and. m.i=1 .and. filcch#2
         =rad_bot(11,2,'filmon','*RT Todos los Montos;Montos Menores a...;Montos Mayores a...',19,m.i=1)
         read cycle when last()#27 .and. m.i=1 .and. filcch#2
         =rad_bot(11,27,'filENT','*RT Todos los Cheques;Entregados;No entregados',19,m.i=1)
         read cycle when last()#27 .and. m.i=1 .and. filcch#2
         =rad_bot(11,50,'filacr','*RT Todos los Cheques;Acreditados;No Acreditados',19,m.i=1)
         read cycle when last()#27 .and. m.i=1 .and. filcch#2
         =rad_bot(16,27,'filgas','*RT Todos los Gastos;Un Gasto;Res£men por Gasto',19,m.i=1)
         read cycle when last()#27 .and. m.i=1
      endif
   ELSE
      EXIT
   endif
next
if lastkey()#27
   if filcch=2
      store nul to respuesta
      if !empty(ELICCH(.T.))
         GOTO RESPUESTA IN CHEQ
         SCATT MEMVAR
         =MOVEWIN(6,15,20,65,'win','Cheques en Cartera',' [ESC] para Men£ ')
         =CENTWIN('WIN')
         COL=25
         DO MCHE
         =INKEY(NUL)
         =relewin('win')
      ELSE
         store 1 to FILcch
      endif
   ELSE
      IF FILCLI=2
         HABILITADO[1]=qw_cli(4,50,'CHEQ.codcli')
      ENDIF
      IF FILBCO=2
         HABILITADO[7]=qw_bco(4,50,'CHEQ.banco')
      ENDIF
      store '' to ttfe1,quefe1
      IF FILFEC=2
         HABILITADO[2]=qw_fec(9,2,'CHEQ.fechaop')
         TTFE1='Fecha de Operaci¢n '+ttfec
         quefe1=quefec
      ENDIF
      IF FILFEV=2
         HABILITADO[6]=qw_fec(9,40,'CHEQ.fechade')
         ttfev='Fecha de Dep¢sito '+ttfec
         ttfec=ttfe1
         quefev=quefec
         quefec=quefe1
      ENDIF
      IF FILMON#1
         HABILITADO[9]=qw_mon(14,2,'CHEQ.monto')
      ENDIF
			HABILITADO[14]=(FILENT=1)
			if filent=2
				 store ttfec  to ttnnn
				 store quefec to quennn
				 store filfec to filnnn
				 store ttent to ttfec
				 store queent to quefec
				 store filent to filfec
				 HABILITADO[14]=qw_fec(14,27,'CHEQ.fechasal')
				 store ttnnn  to ttfec
				 store quennn to quefec
				 store filnnn to filfec
			endif
      IF FILACR=2
         QUEACR="!EMPTY(CHEQ.FECHAAC)"
         TTACR='CHEQUES ACREDITADOS'
      ELSE
         IF FILACR=3
            QUEACR="EMPTY(CHEQ.FECHAAC)"
            TTACR='CHEQUES NO ACREDITADOS'
            STORE .F. TO HABILITADO[13]
         ENDIF
      ENDIF
      HABILITADO[15]=qw_gas(19,27,'che.GASTO')
      FISC=iif(filent=1,"",iif(filent=2,"entregado","!entregado"))
      ttent=iif(filent=1,"",iif(filent=2,"Cheques Entregados","Cheques no Entregados"))
      FISC=qw_fisc(FISC,quecch)
      FISC=qw_FISC(FISC,quecli)
      FISC=qw_FISC(FISC,quefec)
      FISC=qw_FISC(FISC,quefev)
      FISC=qw_FISC(FISC,quebco)
      FISC=qw_FISC(FISC,quemon)
      FISC=qw_FISC(FISC,queacr)
      FISC=IIF(EMPTY(FISC),'.T.',FISC)
      store "Resumen por " to ressu
      ttcch=iif(filcch=3,RESSU+'Cheques',ttcch)
      ttcli=iif(filcli=3,RESSU+'Cliente',ttcli)
      ttbco=iif(filbco=3,RESSU+'Banco',ttbco)
      ttfec=iif(filfec=3,RESSU+'Fecha Operaci¢n',ttfec)
      ttfev=iif(filfev=3,RESSU+'Fecha Vencimiento',ttfev)
      TTQUE=QW_TT(TTcch)+QW_TT(TTcli)+QW_TT(TTfec)+QW_TT(TTfev)+QW_TT(TTbco)+QW_TT(TTMON)+QW_TT(TTacr)+qw_tt(ttent)
   endif
endif
IF !EMPTY(WONTOP())
   =releWIN('win1')
ENDIF
RETURN last()#27 .AND. FILcch#2
