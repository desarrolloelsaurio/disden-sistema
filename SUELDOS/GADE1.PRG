********************************************************************************
*-- Programa: GADE1.PRG
*-- Fecha   : 12/13/90 01:05am
*-- Version : G. REINER
*-- Notas   : GENERALIZA ADELANTOS DE SUELDO ARCHIVO DE LIQUIDACION
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO imprec
DEFI WIND win FROM 1,0 TO 24,79
SELE emp
SET ORDER TO ordlis
GOTO TOP
STOR DATE() TO fee
STOR 1 TO cuotas
STORE SPACE(20) TO capanga
STOR 0 TO mon
STOR SPACE(20) TO conc
STOR PROMPT() TO ppt
RELE cuando,cuanto
DEFI WIND win FROM 1,0 TO 22,77 DOUBLE TITL ' Generaliza Adelanto de Sueldo - '+ALLTRIM(ppt)  SHAD COLOR SCHE 8
ACTI WIND win
CLEA
@ 1,4 SAY 'FECHA DEL ADELANTO ' GET fee
@ 1,40 SAY 'N§ de Recibo:' GET nuade
GOTO emp->jan IN jan
@ 3,4 SAY 'RECIBI DE '+ALLTRIM(jan->empresa)+' LA CANTIDAD DE '+ALLTRIM(auss) GET mon PICTURE '9999999.99'
@ 5,4 SAY 'EN CONCEPTO DE '
@ 5,19 GET conc
@ 5,40 SAY 'A SER DEVUELTO EN '
@ 5,59 GET cuotas PICTURE '999'
@ 5,63 SAY 'CUOTAS.'
@ 7,4 SAY 'AUTORIZADO POR EL Sr. ' GET capanga
@ 9,4 SAY 'Fdo.:'+ppt
CLEAR GETS
@ 1,4 SAY 'FECHA DEL ADELANTO ' GET fee MESS 'Fecha del Adelanto'
@ 1,40 SAY 'N§ de Recibo:' GET nuade MESS 'N§ de Comprobante'
@ 3,4 SAY 'RECIBI DE '+ALLTRIM(jan->empresa)+' LA CANTIDAD DE '+ALLTRIM(auss) GET mon PICTURE '9999999.99' MESS 'Monto del Adelanto'
@ 5,4 SAY 'EN CONCEPTO DE '
READ
respuesta=0
IF eligas(" del Empleado")<>0
   ACTI WIND win
   GOTO respuesta
   @ 5,19 GET gas->gasto
   CLEAR GETS
   @ 5,40 SAY 'A SER DEVUELTO EN '
   @ 5,59 GET cuotas PICTURE '999' MESS 'Cantidad de Cuotas para Devoluci¢n'
   @ 5,63 SAY 'CUOTAS.'
   @ 7,4 SAY 'AUTORIZADO POR EL Sr. ' GET capanga MESS 'Jer rquico que Autoriza el Adelanto'
   READ
   IF cuotas>0
      DECLARE cuando[CUOTAS],cuanto[CUOTAS]
      STOR mon/cuotas TO montocuot
      CLEAR GETS
      cuando[1]=fee+IIF(DAY(fee)<=15,15,28)-DAY(fee)
      FOR vv=1 TO cuotas
         IF vv<>1
            cuando[VV]=GOMONTH(cuando[VV-1],1)
         ENDIF
         cuanto[VV]=montocuot
         @ vv+10,4 SAY 'VENCIMIENTO '+STR(vv,2)+'a CUOTA' GET cuando[VV] FUNCTION 'E'
         @ vv+10,40 SAY 'MONTO DE LA CUOTA ' GET cuanto[VV] PICTURE '9999999.99'
         READ
      NEXT
      IF CONFI(.F.,'CONFIRMA EL ADELANTO ? ',WROW()-2,4))
         IF imprec
            STOR 0 TO copias
            @ WROW()-2,4 SAY REPLICATE(' ',70)
            @ WROW()-2,4 SAY 'CANTIDAD DE COPIAS DEL RECIBO ' GET copias PICTURE '9'
            READ
         ELSE
            copias=1
         ENDIF
         IF copias<>0
            xs=nux(mon)
            IF LEN(xs)>80
               FOR xa=80 TO 1 STEP -1
                  IF SUBSTR(xs,xa,1)=' '
                     EXIT
                  ENDIF
               NEXT
               xs1=LEFT(xs,xa)
               xs2=SUBSTR(xs,xa+1)
               xs1=LEFT(xs1+REPLICATE("*",80),80)
               xs2=LEFT(xs2+REPLICATE("*",80),80)
            ELSE
               xs1=LEFT(xs+REPLICATE("*",80),80)
               xs2=REPLICATE("*",80)
            ENDIF
            SELE emp
            SCAN FOR &fisc
               @ 9,4 SAY 'Fdo.:'+emp->apynom
               SELE liq
               FOR vv=1 TO cuotas
                  APPEND BLANK
                  REPL empresa WITH emp->jan
                  REPL legajo WITH emp->legajo
                  REPL filtcon WITH 70+RECNO("GAS")
                  REPL archivo WITH "GAS"
                  REPL registro WITH RECNO("GAS")
                  REPL unidad WITH cuanto[vv]
                  REPL valor WITH nuade
                  REPL fechaven WITH cuando[VV]
                  REPL INFORMA WITH .F.
                  REPL cencos WITH emp->ccos
                  REPL empleado WITH RECNO("EMP")
               NEXT
               STOR nuade+1 TO nuade
               SELE emp
               IF imprec
                  DO WHILE .NOT. PRINTSTATUS()
                     DO impresor
                     IF LASTKEY()=27
                        RETURN TO MASTER
                     ENDIF
                  ENDDO
                  ACTI SCRE
                  @ 24,0 SAY PADC("Imprimiendo los Recibos - [TECLA] Interrumpe",80,' ') COLOR SCHE 19
                  ACTI WIND win
                  ON KEY DO abpr
                  SET DEVICE TO PRINT
                  SET PRINTER ON
                  SET CONSOLE OFF
                  _PEJECT="NONE"
                  _PLENGTH=36
                  _PLINENO=0
                  _PAGENO=1
                  _PCOPIES=copias
                  _PSCODE='{27}{64}{27}{67}{36}'
                  _PECODE='{27}{67}{72}'
                  _PLOFFSET=0
                  _PADVANCE="LINEFEEDS"
                  _RMARGIN=80
                  PRINTJOB
                     _WRAP=.T.
                     _ALIGNMENT='RIGHT'
                     DO pagehead
                     ?
                     _ALIGNMENT="CENTER"
                     tt='ADELANTO DE SUELDO AL PERSONAL / COMPROBANTE COMPRA MUTUAL / PRESTAMO'
                     ? tt
                     ?
                     _ALIGNMENT='RIGHT'
                     ? 'RECIBO N§ '
                     ?? STR(nuade,8)
                     _WRAP=.F.
                     ?
                     ?
                     GOTO emp->jan IN jan
                     ? 'RECIBI DE '+ALLTRIM(jan->empresa)+' LA CANTIDAD DE '+ALLTRIM(auss)
                     ?? REPLICATE('*',19)
                     ?
                     ? xs1
                     ?
                     ? xs2
                     ?
                     ? 'EN CONCEPTO DE '
                     ?? ALLTRIM(gas->gasto)
                     ?? ' A SER DEVUELTO EN '
                     ?? cuotas PICTURE '*999'
                     ?? IIF(cuotas=1,' CUOTA',' CUOTAS')
                     ?
                     ? 'QUE SERAN DESCONTADAS MIS HABERES SEGUN LOS PLAZOS QUE SE DETALLAN'
                     ?
                     ? 'OPERACION AUTORIZADA POR EL Sr. '
                     ?? capanga
                     ?
                     ? 'SON '+ALLTRIM(auss)+':'
                     ?? mon PICTURE '*999999999.99'
                     ?
                     ?
                     FOR vv=1 TO cuotas
                        ? 'VENCIMIENTO '+STR(vv,2)+'¦ CUOTA '
                        ?? cuando[VV]
                        ?? ' -- MONTO DE LA CUOTA '
                        ?? cuanto[VV] PICTURE '*9999999.99'
                     NEXT
                     _WRAP=.T.
                     _ALIGNMENT="CENTER"
                     ?
                     ?
                     ? ALLTRIM(emp->apynom)
	                   ? "LEGAJO:"+alltrim(emp->legajo)
                     _WRAP=.F.
                     ?
                     ?
                     ? REPLICATE('-',80)
                     EJECT PAGE
                  ENDPRINTJOB
                  ?
                  ON KEY LABEL shift-f1 DO hlp
                  SET DEVICE TO SCREEN
                  SET PRINTER OFF
                  SET CONSOLE ON
               ENDIF
            ENDSCAN
         ENDIF
      ENDIF
   ENDIF
ENDIF
RELE WIND win
_PCOPIES=1
RELE fee,mon,cuotas,conc,capanga,cuando,cuanto,me,mes,vv,dd,mon,montocuot,xs,xs1,xs2,ppt
@ 24,0 SAY SPACE(80)
RETURN

*: EOF: GADE1.PRG
