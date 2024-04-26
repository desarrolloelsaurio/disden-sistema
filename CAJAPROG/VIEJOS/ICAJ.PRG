********************************************************************************
*-- Programa: ICAJ.PRG
*-- Fecha   : 10/17/91
*-- Versi¢n : V.LEEGSTRA
*-- Notas   : EGRESOS DE EFECTIVO DE CAJA
********************************************************************************
SELE Seg
STORE PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   @ 0,rh SAY TIME() COLOR I
   @ 0,rp SAY padc(ULPR,10) COLOR I
   STORE 0 TO kok
   DO WHILE .T.
      define wind win FROM 0,0 TO 23,79 TITL " Egreso de Efectivo" COLOR sche 8 none
      acti wind win
		=CABPAN1()
      STORE 5 TO COL1
      STORE 18 TO COL2
      @ 3,COL1 SAY "Proveedor      :"
      @ 4,COL1 SAY "Factura a pagar:"
      @ 5,COL1 SAY "Gasto a cubrir :"
      @ 6,COL1 SAY "N§ del Recibo  :"
      @ 7,COL1 SAY "Monto de la Factura:"
      @ 8,COL1 SAY "Moneda         :"
      @ 9,COL1 SAY "Cotizaci¢n     :"
      SELE caj
      SCAT memv BLAN
      SELE ccp
      STORE 0 TO respuesta
      IF !EMPTY(elipro(" - [ESC] para Salir",3,COL2))
         STORE kok+1 TO kok
         m.codcli = ccp.procod
         nadapro = pro.proveedor
         acti wind win
         @ 3,COL2 SAY ALLTRIM(nadapro)
         IF LASTKEY()#27
            STORE 0 TO nadafac
            @ 4,COL2 GET nadafac PICTURE "9999999999";
              MESS "N§ de la Factura a Pagar - Con 0 Salir"
            READ
            IF nadafac=0
               RELE WIND win
               EXIT
            ENDIF
            SELE far
            DO FLOK WITH "far"
            GO TOP
            IF SEEK(nadafac)
               SELE mix
               STORE 0 TO respuesta
               IF !EMPTY(eligas(" - [ESC] para Salir",5,COL2))
                 STORE mix.texto1 TO nagasto1,nadagas
                 STORE mix.texto2 TO nagasto2
                 ACTI WIND win
                 @ 5,col2 GET nadagas PICTURE "!!!!!!!!!!!!!!!!!!!!";
                    MESS "Detalle del gasto a cubrir"
                 READ
                 STORE 0 TO nareci
                 DO WHILE nareci=0
                    @ 6,col2 GET nareci PICTURE "9999999999";
                     MESS "N§ del Recibo correspondiente al pago de la Factura"
                    READ
                 ENDDO
                 STORE 0 TO namonto
                 @ 7,col2+4 GET namonto PICTURE "99999999999.99";
                   MESS "Monto de la Factura - Con 0 Salir"
                 READ
                 IF LASTKEY()=27 .OR. namonto=0
                    RELE WIND win
                    EXIT
                 ENDIF
                 STORE xauss TO namoneda
                 STORE xacotiz TO nacotiz
                 STORE "@M "+ALLTRIM(xauss)+","+ALLTRIM(xadols) TO NN
                 @ 8,col2 GET namoneda PICTURE NN;
                   MESS "Moneda en que se paga"
                 @ 9,col2 GET nacotiz PICTURE "99999999999.99";
                   MESS "Cotizaci¢n del d¡a"
                 READ
                 SELE caj
                 DO flok WITH "caj"
                 APPE BLANK
                 m.proveedor=.T.
                 m.fechaop=DATE()
                 m.compr="RE-N§"+ALLTRIM(STR(nareci))
                 m.compre="FA"
                 m.numere=nadafac
                 m.monto=namonto
                 m.moneda=LEFT(namoneda,1)
                 IF namoneda=LEFT(xauss,1)
                    m.equivale=ROUND(namonto*nacotiz,2)
                 ELSE
                    m.equivale=namonto
                 ENDIF
                 GATH MEMV
                 DO repuse
                 UNLO IN caj
                 UNLO IN far
               ENDIF && ELIGAS
            ELSE
               ACTI SCRE
               @ 24,0 SAY PADC('N§ DE FACTURA INEXISTENTE ',80,'*') colo sche 19
               ACTI WIND WIN
            ENDIF
         ELSE
            RELE WIND win
            EXIT
         ENDIF            && LASTKEY
      ELSE
         RELE WIND win
         ACTI SCRE
         EXIT
      ENDIF   && ELIPRO
      CLEAR
      IF !EMPTY(kok)
        DO iaud WITH 'EGRESO DE EFECTIVO'
      ENDIF               && KOK#0
   ENDDO
ELSE
   DO iaud WITH 'ING ILEGAL '+ulpr
ENDIF
@ 24,0 SAY space(80)
RETURN
*: EOF: ICAJ.PRG
