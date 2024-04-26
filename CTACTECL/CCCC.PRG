*******************************************************************************
*-- Programa: CCCC.PRG
*-- Fecha   : 08-10-92 02:09pm
*-- Version : BANALOTTI
*-- Notas   : INGRESA MOVIMIENTOS EN CTA. CTE. CLIENTES
*****************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   DO WHILE .T.
      STORE NUL TO RESPUESTA
      COL=22
      SELE CCL
      SCATT MEMVAR BLANK
      =MOVEWIN(5,10,15,69,'WIN',' Corrige Movimientos en Cta. Cte. ')
      @ 1,1 SAY 'CLIENTE ' COLO SCHE 3
      @ 2,1 SAY 'FECHA OPERACION' COLO SCHE 3
      @ 3,1 SAY 'FECHA VENCIMIENTO' COLO SCHE 3
      @ 4,1 SAY 'DETALLE' COLO SCHE 3
      @ 5,1 SAY 'COMPROBANTE' COLO SCHE 3
      @ 6,1 SAY 'NUMERO COMPROBANTE' COLO SCHE 3
      @ 7,1 SAY 'MONTO' COLO SCHE 3
      STORE NUL TO ELCLI
      ELCLI=elicli(" a seleccionar - [ESC] para Men£",1,col)
      CODCLI=PER.CODCLI
      FECHAOP=DATE()
      FECHAVE=DATE()
      if lastkey()#27
         @ 1,COL SAY PER.CLIENTE
         CLEA GET
         @ 2,COL GET FECHAOP MESS "Ingrese Fecha de Operaci¢n "
         @ 3,COL GET FECHAVE MESS "Ingrese Fecha de Vencimiento"
         @ 4,COL GET DETALLE pictu "@!" ;
           MESS "Ingrese Detalle de Operaci¢n"
         @ 5,COL GET COMPRRE pictu '@M FA,ND,NC,RE';
           MESS "Ingrese  Comprobante"
         @ 6,COL GET NUMERORE PICTU '999999999999999';
           MESS "Ingrese N§ del Comprobante"
         @ 7,COL GET MONTO PICTU '99999999999.99';
           MESS "Ingrese Monto de la Operaci¢n"
         READ
         IF !EMPTY(M.MONTO) .AND. confirma("los Datos Ingresados",.T.,16,1)
            MONEDA=XAUSS
            EQUIVALE=MONTO/XACOTIZ
            PAGADA=.F.
			CUOTA=MONTO
            =AGRABAR("CCL")
			=IAUD(PER.CODCLI)
         ENDIF
      ELSE
         EXIT
      ENDIF
   ENDDO
ELSE
   =IAUDI()
ENDIF
=RELEWIN('WIN')
RETURN MEN_LIN(BOTOM)
