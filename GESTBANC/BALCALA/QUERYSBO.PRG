********************************************************************************
*-- Programa: QUERYSBO.PRG
*-- Fecha   : 07-27-92 09:26am
*-- Version : R. 'EL BATA'
*-- Notas   : GENERA QUERY PARA LISTADO DE BANCO
********************************************************************************
FUNCTION QUERYSBO
  parameter porpant
  PRIVATE PORPANT
  ULPR=HORA_ULP(PROGRAM())
  =MOVEWIN(7,1,14,79,'win',' L¡mites del Listado de Bancos ',' [ESC] para Men£ ')
  store 1 to FILban,FILFEC,filope
  STORE '.T.' to QUEBAN,QUEfec,queope
  STORE '' to TTBAN,TTfec,ttope
  ***
  for m.i=nul to 1
    =rad_bot(1,2,'filBAN','*RT Una Cuenta;Resumen de Saldos',19,m.i=1)
    if m.i=1
      read cycle
    endif
    if last()#27 .or. (last()=27 .and. m.i=0)
      =rad_bot(1,25,'filope','*RT Todas las Operaciones;D‚bitos;Cr‚ditos',19,m.i=1)
      read cycle when last()#27 .and. m.i=1
      =rad_bot(1,55,'filfec','*RT Todas las Fechas;Una Fecha;Res£men por Fecha',19,m.i=1)
      read cycle when last()#27 .and. m.i=1
    else
      exit
    endif
  next
  if lastkey()#27
    store nul TO RESPUESTA
    HABILITADO[1]=qw_BAN(4,2,'caj.caja')
    =qw_ope(4,25)
    HABILITADO[2]=qw_fec(4,50,'caj.fechaop')
    FISC=""
    FISC=qw_fisc(FISC,queBAN)
    FISC=QW_FISC(FISC,QUEope)
    FISC=qw_FISC(FISC,quefec)
    FISC=IIF(EMPTY(FISC),'.T.',FISC)
    store "Resumen por " to ressu
    ttBAN=iif(filBAN=3,RESSU+'Cliente',ttBAN)
    ttfec=iif(filfec=3,RESSU+'Fecha',ttfec)
    date=dtoc(INFEC('WIN','de corte del informe'))
    FISC=FISC+' .AND. FECHAOP<={'+DATE+'}'
    TTQUE=chr(13)+chr(10)+'Informe al d¡a '+date+QW_TT(TTBAN)+QW_TT(TTFEC)+QW_TT(TTope)
  endif
  IF !EMPTY(WONTOP())
    =releWIN('win')
  ENDIF
RETURN last()#27
