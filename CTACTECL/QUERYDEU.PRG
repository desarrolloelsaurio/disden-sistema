********************************************************************************
*-- Programa: QUERYDEU.PRG
*-- Fecha   : 05-04-92 03:36pm
*-- Version : G. REINER
*-- Notas   : GENERA QUERY PARA LISTADO EN CUENTA CORRIENTE CLIENTES
*-- Modificaciones varias 02-11-93 06:21pm
********************************************************************************
FUNCTION QUERYDEU
parameter porcrt
PRIVATE porcrt
STORE .T. TO OK
ULPR=HORA_ULP(PROGRAM())
=MOVEWIN(7,1,14,79,'win',' L¡mites del Listado de Deuda Vencida de Clientes ',' [ESC] para Men£ ')
store 1 to FILCLI,FILFEC,filZON
STORE '.T.' to QUEcli,QUEfec,queZON
STORE '' to TTcli,TTfec,ttzon
***
for m.i=nul to 1
   =rad_bot(1,2,'filcli','*RT Todos los Clientes;Opciones;Resumen por Cliente',19,m.i=1)
   if m.i=1
      read cycle
   endif
   if last()#27 .or. (last()=27 .and. m.i=0)
      IF FILCLI=3
         =rad_bot(1,30,'filfec','*RT Todas las Fechas;Entre Fechas',19,m.i=1)
      ELSE
         =rad_bot(1,30,'filfec','*RT Todas las Fechas;Entre Fechas;Res£men',19,m.i=1)
      ENDIF
      read cycle when last()#27 .and. m.i=1
      IF  FILCLI=3 .OR. FILFEC=3
         =rad_bot(1,55,'filzon','*RT Todas las Zonas;Opciones',19,m.i=1)
      ELSE
         =rad_bot(1,55,'filzon','*RT Todas las Zonas;Opciones;Res£men',19,m.i=1)
      ENDIF
      read cycle when last()#27 .and. m.i=1
   else
      exit
   endif
NEXT
if lastkey()#27
   store nul TO RESPUESTA
   *HABILITADO[1]=qw_cli(4,2,'ccl.codcli')
   =qw_cli(4,2,'ccl.codcli')
   *HABILITADO[2]=qw_fec(4,30,'ccl.fechaop')
   =qw_fec(4,30,'ccl.fechaop')
   =qw_zon(4,50,'PER.zona')
   FISC="!CCL.pagada .AND. (EMPTY(CCL.COMPRRE) .OR. CCL.COMPRRE='FA' .or. CCL.COMPRRE='ND')"
   FISC=qw_fisc(FISC,quecli)
   FISC=qw_FISC(FISC,quefec)
   FISC=QW_FISC(FISC,QUEzon)
   FISC=IIF(EMPTY(FISC),'.T.',FISC)
   store "Resumen por " to ressu
   ttcli=iif(filcli=3,RESSU+'Cliente',ttcli)
   ttfec=iif(filfec=3,RESSU+'Fecha',ttfec)
   ttZON=iif(filZON=3,RESSU+'Zona',ttZON)
   date=INFEC('WIN','de corte')
   FISC=FISC+' .AND. ccl.FECHAVE<={'+DTOC(DATE)+'}'
   TTQUE='Deuda Vencida al d¡a '+dtoc(date)+QW_TT(TTCLI)+QW_TT(TTFEC)+QW_TT(TTZON)
   IF FILCLI=3 .OR. FILFEC=3 .OR. FILZON=3
      IF FILcli=3 .or. filfec=3 .or. filzon=3
         STORE .T. TO HAY
         CANT_MAX=3
         DIME TEXTO[CANT_MAX,5],variable[CANT_MAX],CTRL[CANT_MAX]
         store .t. to variable,CTRL
         STORE .F. TO TEXTO
         TEXTO[2,1]="C. CUOTAS"
         TEXTO[2,2]=XACDIGI
         texto[2,3]="TTL[2]"
         texto[2,4]="1"
         TEXTO[2,5]=REPL("9",XACDIGI)
         TEXTO[3,1]="MONTO"
         TEXTO[3,2]=XACDIGI
         texto[3,3]="TTL[3]"
         texto[3,4]="ccL.monto-CCL.CUOTA"
         TEXTO[3,5]=REPL("9",XACDIGI-3)+".99"
         TT='Resumen de Pendientes'+CHR(13)+CHR(10)+ttque
         IF FILCLI=3
            FILCLI=2
            IF qw_cli(4,2,'ccl.codcli')
               FISC=QW_FISC(FISC,QUECLI)
               TTQUE=TTQUE+QW_TT(TTCLI)
               TT='Resumen de Pendientes'+CHR(13)+CHR(10)+TTQUE
               SET ORDER TO TAG CODCLI IN PER
               SELE CCL
               SET RELA TO CODCLI INTO PER
               TEXTO[1,1]='CLIENTE'
               TEXTO[1,2]=30
               texto[1,3]="eltexto"
               TEXTO[1,5]="@!"
               IF porcrt
                  DO LRESPT WITH "LDEUPX","CCL","PER.CLIENTE","CCL.CODCLI","PER.CLIENTE",'"|"+STR(GTOTAL)+"|"',3,.T.
               ELSE
                  DO LRESIT WITH "LDEUPX","CCL","PER.CLIENTE","CCL.CODCLI","PER.CLIENTE",'"|"+STR(GTOTAL)+"|"',3,.T.
               ENDIF
            ENDIF
         ELSE
            IF FILFEC=3
               TEXTO[1,1]='FECHA VENC.'
               TEXTO[1,2]=11
               texto[1,3]="eltexto"
               TEXTO[1,5]="@!"
               IF porcrt
                  DO LRESPT WITH "LDEUPX","CCL","CCL.FECHAVE","CCL.FECHAVE",;
                    "str(day(ccl.fechave),2)+'/'+left(qmes(month(ccl.fechave)),3)+'/'+alltrim(str(year(ccl.fechave)))",;
                    '"|"+STR(GTOTAL)+"|"',3,.T.
               ELSE
                  DO LRESIT WITH "LDEUPX","CCL","CCL.FECHAVE","CCL.FECHAVE",;
                    "str(day(ccl.fechave),2)+'/'+left(qmes(month(ccl.fechave)),3)+'/'+alltrim(str(year(ccl.fechave)))",;
                    '"|"+STR(GTOTAL)+"|"',3,.T.
               ENDIF
            ELSE
               IF FILZON=3
                  SET ORDER TO TAG ZONCOD IN MIX
						SELE PER
                  SET ORDER TO TAG CODCLI
                  SET RELA TO ZONA INTO MIX
                  SELE CCL
                  SET RELA TO CODCLI INTO PER
                  TEXTO[1,1]='ZONA'
                  TEXTO[1,2]=20
                  texto[1,3]="eltexto"
                  TEXTO[1,5]="@!"
                  IF porcrt
                     DO LRESPT WITH "LDEUPX","CCL","MIX.TEXTO1","PER.ZONA",;
                       "MIX.TEXTO1",;
                       '"|"+STR(GTOTAL)+"|"',3,.T.
                  ELSE
                     DO LRESIT WITH "LDEUPX","CCL","MIX.TEXTO1","PER.ZONA",;
                       "MIX.TEXTO1",;
                       '"|"+STR(GTOTAL)+"|"',3,.T.
                  ENDIF
                  =REOPCLI()
               ENDIF
            ENDIF
         ENDIF
         STORE .F. TO OK
         =REOPCCL()
      ENDIF
   ENDIF
ENDIF
IF !EMPTY(WONTOP())
   =releWIN('win')
ENDIF
RETURN last()#27 .AND. OK
