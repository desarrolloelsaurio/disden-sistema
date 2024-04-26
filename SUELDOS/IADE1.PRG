********************************************************************************
*-- Programa: IADE1.PRG
*-- Fecha   : 12/13/90 01:05am
*-- Version : G. REINER
*-- Notas   : INGRESO ADELANTOS EN ARCHIVO DE LIQUIDACION
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFI WIND win FROM 1,0 TO 24,79
posin=RECC("LIQ")+1
STORE .F. TO alguno
SELE emp
SET ORDER TO ordlis
STOR DATE() TO fee
STOR 1 TO cuotas
STORE SPACE(20) TO capanga
=INSMODE(.F.)
SCAN FOR &fisc
   STOR 0 TO mon
   STOR SPACE(20) TO conc
   STOR emp->legajo TO men
   RELE cuando,cuanto
   DEFI WIND win FROM 1,0 TO 22,79 DOUBLE TITL ' Adelanto de Sueldo de '+ALLTRIM(emp->apynom)+' ' SHAD COLOR SCHE 8
   ACTI WIND win
   CLEA
   @ 1,4 SAY 'FECHA DEL ADELANTO ' GET fee
   @ 1,40 SAY 'N§ de Recibo:' GET nuade PICTURE '9999999999'
   GOTO emp->jan IN jan
   @ 3,4 SAY 'RECIBI DE '+ALLTRIM(jan->empresa)+' LA CANTIDAD DE '+ALLTRIM(auss) GET mon PICTURE '9999999.99'
   @ 5,4 SAY 'EN CONCEPTO DE '
   @ 5,19 GET conc
   @ 5,40 SAY 'A SER DEVUELTO EN '
   @ 5,59 GET cuotas PICTURE '999'
   @ 5,63 SAY 'CUOTAS.'
   @ 7,4 SAY 'AUTORIZADO POR EL Sr. ' GET capanga
   @ 9,4 SAY 'Fdo.:' GET men
   @ 9,40 GET emp->apynom PICTURE 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
   CLEAR GETS
   @ 9,4 SAY 'Fdo.:' GET men;
      MESS '[TECLA] Confirma Empleado - [] Pr¢ximo Empleado - [ESC] Fin Adelantos'
   READ
   IF LASTKEY()<>27
      IF LASTKEY()<>24
         IF men<>emp->legajo
            SELE emp
            SET ORDER TO 2
            SEEK men
            ACTI WIND win
         ENDIF
         SET ORDER TO ordlis
         IF !EOF()
            @ 9,40 GET emp->apynom PICTURE 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
            CLEAR GETS
            STORE nuade TO nuade1
            @ 1,4 SAY 'FECHA DEL ADELANTO ' GET fee MESS 'Fecha del Adelanto'
            @ 1,40 SAY 'N§ de Recibo:' GET nuade1 PICTURE '9999999999'
            @ 3,4 SAY 'RECIBI DE '+ALLTRIM(jan->empresa)+' LA CANTIDAD DE '+ALLTRIM(auss) GET mon PICTURE '9999999.99' MESS 'Monto del Adelanto'
            @ 5,4 SAY 'EN CONCEPTO DE '
            READ
            respuesta=0
            DO WHILE eligas(" del Empleado")=0
            ENDDO
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
                  SELE liq
                  FOR vv=1 TO cuotas
                     APPEND BLANK
                     STORE .T. TO alguno
                     REPL empresa WITH emp->jan
                     REPL legajo WITH emp->legajo
                     REPL filtcon WITH 70+RECNO("GAS")
                     REPL archivo WITH "GAS"
                     REPL registro WITH RECNO("GAS")
                     REPL unidad WITH cuanto[VV]
                     REPL valor WITH nuade1
                     REPL fechaven WITH cuando[VV]
                     REPL INFORMA WITH .F.
                     REPL cencos WITH emp->ccos
                     REPL empleado WITH RECNO("EMP")
                     REPL emp->texto1 WITH capanga ADDI
                     IF nuade=nuade1
                        STORE nuade+1 TO nuade
                        STORE nuade1+1 TO nuade1
                     ENDIF
                  NEXT
                  SELE emp
               ENDIF
            ENDIF
         ENDIF
      ENDIF
   ELSE
      EXIT
   ENDIF
ENDSCAN
IF alguno
   DO imprec
   IF imprec
      STOR 0 TO copias
      DEFI WIND win FROM 18,0 TO 23,79 NONE
      ACTI WIND win
      @ WROW()-2,4 SAY REPLICATE(' ',70)
      @ WROW()-2,4 SAY 'CANTIDAD DE COPIAS DE LOS RECIBOS ' GET copias PICTURE '9'
      READ
      IF copias<>0
         DO WHILE !PRINTSTATUS()
            DO impresor
            IF LASTKEY()=27
               RETURN TO MASTER
            ENDIF
         ENDDO
         ACTI SCRE
         @ 24,0 SAY PADC(" Imprimiendo Comprobantes de Adelanto ",80,'*') COLO SCHE 19
         ON KEY DO ERROR
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
            SELE liq
            GOTO posin
            DO WHILE .T.
               GOTO liq->empleado IN emp
               _WRAP=.F.
               DO pagehead
               ?
               _ALIGNMENT="CENTER"
               _WRAP=.T.
               tt='ADELANTO DE SUELDO AL PERSONAL / COMPROBANTE COMPRA MUTUAL / PRESTAMO'
               xs=nux(liq->unidad)
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
                  xs1=xs+REPLICATE("*",80-LEN(ALLTRIM(xs)))
                  xs2=REPLICATE("*",80)
               ENDIF
               ? tt
               ?
               _ALIGNMENT='RIGHT'
               ? 'RECIBO N§ '
               ?? STR(liq->valor,8)
               _WRAP=.F.
               ?
               ?
               ? 'RECIBI DE '+ALLTRIM(jan->empresa)+' LA CANTIDAD DE '+ALLTRIM(auss)
               ?? REPLICATE('*',19)
               ?
               ? xs1
               ?
               ? xs2
               ?
               ? 'EN CONCEPTO DE '
               GOTO liq->registro IN gas
               ?? ALLTRIM(gas->gasto)
               ?? ' A SER DEVUELTO EN '
               ?? 1 PICTURE '*999'
               ?? ' PAGO'
               ?
               ? 'QUE SERA DESCONTADO MIS HABERES SEGUN EL PLAZO QUE SE DETALLA'
               ?
               ? 'OPERACION AUTORIZADA POR EL Sr. '
               capanga=LEFT(emp->texto1,20)
               REPL emp->texto1 WITH SUBSTR(emp->texto1,21)
               ?? capanga
               ?
               ? 'SON '+ALLTRIM(auss)+':'
               ?? liq->unidad PICTURE '*999999999.99'
               ?
               ?
               ? 'VENCIMIENTO DEL PAGO '
               ?? liq->fechaven
               ?? ' -- MONTO: '
               ?? liq->unidad PICTURE '*999999999.99'
               _WRAP=.T.
               _ALIGNMENT="CENTER"
               ?
               ?
               ? ALLTRIM(emp->apynom)
							 ? 'LEGAJO:'+ALLTRIM(EMP->LEGAJO)
               _WRAP=.F.
               ?
               ?
               ? REPLICATE('-',80)
               EJECT PAGE
               SELE liq
               posin=posin+1
               IF posin<=RECC()
                  GOTO posin
               ELSE
                  EXIT
               ENDIF
            ENDDO
         ENDPRINTJOB
         ?
         ON KEY LABEL shift-f1 DO hlp
         SET DEVICE TO SCREEN
         SET PRINTER OFF
         SET CONSOLE ON
      ENDIF
   ELSE
      SELE emp
      REPL ALL texto1 WITH ""
   ENDIF
   _PCOPIES=1
ENDIF
RELE fee,mon,cuotas,conc,capanga,cuando,cuanto,me,mes,vv,dd,mon,montocuot,xs,xs1,xs2,posin,alguno,nuade1
DEAC WIND ALL
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: IADE1.PRG
