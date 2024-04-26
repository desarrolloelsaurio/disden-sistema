*******************************************************************************
*-- Programa: CONCILIO.PRG
*-- Fecha   : 08-06-92 11:42am
*-- Version : R. 'EL BATA'
*-- Notas   : CONCILIA PAGOS
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   DO WHILE .T.
      STORE NUL TO RESPUESTA
      IF !empty(ELIEMP("a Ingresar",-1,1))
         DO OPCCP WITH JANNRO
         DO WHILE .T.
            STORE NUL TO RESPUESTA
            IF !EMPTY(ELIPRO("",-1,1))
               ELPRO=PRO.PROCOD
               SELE CCP
               SET ORDER TO TAG PROCOD
               IF SEEK(ELPRO)
                  STORE NUL TO HABER,DEBE
                  IF !Empty(Q_PAG(ELPRO,'HABER','DEBE',.F.))
                     msg=alltr(JANNAME)
                     CREN=12
                     =MOVEWIN(CREN,NUL,21,79,'WIN',' Concilia Cobranza - '+alltrim(PRO.PROVEEDOR)+' ',MSG)
                     @ 1,1 SAY 'PROVEEDOR' COLO SCHE 3
                     @ 1,15 SAY PRO.PROVEEDOR
                     @ 3,1 SAY 'COMPRAS' COLO SCHE 3
                     @ 3,20 SAY HABER PICT '99,999,999.99'
                     @ 4,1 SAY 'PAGOS' COLO SCHE 3
                     @ 4,20 SAY DEBE PICT '99,999,999.99'
                     DEUDA=HABER-DEBE
                     @ 5,1 SAY 'DEUDA' COLO SCHE 3
                     @ 5,20 GET DEUDA PICT '99,999,999.99'
                     clear gets
									   if confirma("Conciliaci¢n ",.t.,21,20)
                     SELE CCP
                     SET ORDER TO TAG NUMERORE
                     =FLOCK() .OR. FLOK("CCP")
                     REPL PAGADA WITH .F.,CUOTA WITH nul ;
                       FOR inlist(COMPRRE,'FA','RE','ND').and. procod=pro.procod
                     scan FOR inlist(COMPRRE,'FA','RE','ND').and. procod=pro.procod
                        IF haber>=monto
                           replace pagada with .T.
                           replace cuota  with monto
                           haber=haber-monto
                        ELSE
                           REPL CUOTA WITH haber
                           exit
                        ENDIF
                     endscan
                     UNLO IN CCP
										 =iaud("Proveed.:"+pro.procod)
                     =relewin('win')
										 endif
                  endif
               endif
            ELSE
               EXIT
            ENDIF
         enddo
      ELSE
         EXIT
      ENDIF
      if cant_empre=1
         exit
      endif
   ENDDO
ELSE
   =Iaudi()
ENDIF
=MEN_LIN(BOTOM)
RETURN
