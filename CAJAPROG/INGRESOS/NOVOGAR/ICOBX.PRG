********************************************************************************
*-- Programa: ICOB1.PRG
*-- Fecha   : 01/14/91
*-- Versi¢n : G. REINER
*-- Notas   : INGRESO COBROS de facturas directas
*-- VERSION NOVOGAR
*-- Modificacion GOYO 10-28-92 05:48pm
********************************************************************************
parameter tomon,cuota,HAYCHEQUES
DEFI WIND WIN1 FROM 0,0 TO 9+IIF(HAYCHEQUES,3,0),50 FOOT ALLTRIM(JANNAME) TITL "FORMA DE PAGO" COLO SCHE 8
=CENTWIN("WIN1")
@ 1,1 say "MONTO DE LA DEUDA:"
@ 1,30 GET TOMON PICT '999999999.99'
CLEA GETS
STORE NUL TO CHEQUES,EFECAUS,EFECDOL,SUMPAG,namonto,vuelto
STORE '999999999.99' TO PICU

   @ 3,1 SAY "PAGO EN "+ALLTRIM(UPPER(XAUSS))
   @ 3,30 GET M.EFECAUS PICTURE PICU MESS 'Monto del Pago en '+xauss

   @ 4,1 SAY "PAGO EN "+ALLTRIM(UPPER(XADOLS))
   @ 4,30 GET M.EFECdol PICTURE PICU MESS 'Monto del Pago en '+xadols

   READ
   IF !confirm1('Los Datos Ingresados',.T.,20,38)
      IF EFECAUS#0
         IF EFECAUS>TOMON
         vuelto=efecaus-TOMON
         efecaus=efecaus-vuelto
         ELSE
         VUELTO=0
         ENDIF
         SELE CAJ
         SCAT MEMV BLAN
         M.codcli=FAC.CODCLI
         M.CAJA='00'
         M.FECHAOP=date()
         M.COMPR='FA N§ '+FAC.FACTURA
         M.COMPRE='RE'
         M.MONTO=efecaus
         M.MONEDA=xauss
         M.NUMERE=NADAREC
         M.EQUIVALE=efecaus/xacotiz
         M.FECHA=DATE()
         M.USUARIO=USADOR
         =agrabar("caj")
         SELE ccl
         SCAT MEMV BLAN
         M.codcli=FAC.CODCLI
         M.fechaop=date()
         M.fechave=date()
         M.detalle="Pago efec FA N§"+FAC.FACTURA
         M.compr='FA N§ '+FAC.FACTURA
         M.comprre='RE'
         M.MONTO=efecaus
         M.MONEDA=xauss
         M.EQUIVALE=efecaus/xacotiz
         M.FECHA=DATE()
         M.USUARIO=USADOR
         M.NUMERE=NADAREC
         =agrabar("ccl")
      ENDIF
   ENDIF
if tomon>efecaus
      IF EFECDOL#0
         vuelto=efecdol*xacotiz+EFECAUS-TOMON
         efecdol=efecdol-(vuelto/xacotiz)
         SELE CAJ
         SCAT MEMV BLAN
         M.detalle="Pago ef FA N§"+FAC.FACTURA
         M.comprre='RE'
         M.CAJA='00'
         M.codcli=FAC.CODCLI
         M.FECHAOP=date()
         M.COMPR='FA N§ '+FAC.FACTURA
         M.COMPRE='RE'
         M.MONTO=efecdol
         M.MONEDA=xadols
         M.EQUIVALE=efecdol
         M.NUMERE=NADAREC
         M.FECHA=DATE()
         M.USUARIO=USADOR
         =AGRABAR("CAJ")
         SELE ccl
         SCAT MEMV BLAN
         M.codcli=FAC.CODCLI
         M.fechaop=date()
         M.fechave=date()
         M.detalle="Pago efec FA N§"+FAC.FACTURA
         M.compr='FA N§ '+FAC.FACTURA
         M.comprre='RE'
         M.MONTO=efecdol
         M.MONEDA=xadols
         M.EQUIVALE=efecdol
         M.FECHA=DATE()
         M.USUARIO=USADOR
         M.NUMERE=NADAREC
         =AGRABAR("CCL")
      ENDIF
   ENDIF
endif
IF HAYCHEQUES .and. tomon>efecaus+efecdol*xacotiz
   DO WHILE .T.
      @ 6,1 SAY "EN CHEQUES "
      @ 6,30 GET cheques PICTURE PICU MESS 'Monto del pago con Cheque (en '+alltrim(xauss)+")"
      READ
      IF !confirm1('Los Datos Ingresados',.T.,20,38)
         loop
      ELSE
         EXIT
      ENDIF
   ENDDO
   SUMPAG=EFECAUS+EFECDOL*XACOTIZ+CHEQUES
ELSE
   SUMPAG=EFECAUS+EFECDOL*XACOTIZ
ENDIF
cuota=sumpag
@ $+2,1 SAY "TOTAL"
@ $,30 GET SUMPAG PICT PICU
clea gets
if !empty(vuelto)
wait "Vuelto en "+xauss+":"+str(ABS(vuelto),10,2) wind
endif
*** CHEQUES
IF CHEQUES#0
   PUNTERO=0
   SELE cch
   SCAT memv BLANK
   STORE DATE() TO m.fechade
   DO WHILE .T.
      define wind winche FROM 12,10 TO 20,70 TITL " Cheques" shad COLOR sche 8
      acti wind winche
      STORE xauss TO nadamo
      @ 1,1 SAY "N§ Cheque:" GET m.nroche PICTURE "@X";
        MESS "N§ del cheque - [ESC] para Salir"
      @ 2,1  SAY "Banco    :"
      @ 2,35 SAY "Moneda      :"
      @ 3,1  SAY "Monto    :"
      @ 3,35 SAY "Fecha cheque:"
      @ 4,1  SAY "Horas de acreditaci¢n del cheque:"
      READ
      IF LASTKEY()=27 .OR. EMPTY(m.nroche) .or. namonto=cheques .or. namonto>cheques
         EXIT
      ENDIF
      @ 2,12 GET m.banco PICTURE "!!!!!!!!!!!!!!!!!!!!" MESS "Cheque del Banco"
      @ 2,49 GET nadamo PICTURE "@M &xauss,&xadols" MESS "Moneda en que se expide el cheque"
      @ 3,12 GET m.monto PICTURE "99999999999.99" MESS "Cantidad"
      @ 3,49 GET m.fechade RANGE CTOD("01/01/91") MESS "Fecha del cheque"
      @ 4,35 GET m.diasac PICTURE "999" MESS "Horas de acreditaci¢n del Cheque"
      READ
      IF !EMPTY(m.banco) .AND. !EMPTY(m.monto)
         STORE nadamo TO m.moneda
         IF m.moneda#xadols
            STORE xacotiz TO nada
            @ 5,1 SAY "Cotizaci¢n:" GET nada PICTURE "9999999999.99" MESS "Cotizaci¢n"
            READ
            STORE m.monto/nada TO m.equivale
            @ 6,1 SAY "Monto equivalente en "+Alltrim(xadols)+"="+Alltrim(STR(m.equivale,14,2))
            namonto=namonto+m.monto
            nada1=m.monto
         ELSE
            STORE m.monto TO m.equivale
            namonto=namonto+m.monto*xacotiz
            nada1=m.monto*xacotiz
         ENDIF
         IF confirm1('Los Datos Ingresados',.T.,20,38)
            PUNTERO=PUNTERO+1
            DIME XCHEQ(PUNTERO,17)
            XCHEQ(PUNTERO,1)=IIF(EMPTY(PER.codcli),'CONTADO','PER.CODCLI')
            XCHEQ(PUNTERO,2)=date()
            XCHEQ(PUNTERO,3)="RE"
            XCHEQ(PUNTERO,4)='FA N§ '+FAC.FACTURA
            XCHEQ(PUNTERO,5)='FA'
            XCHEQ(PUNTERO,6)=FAC.FACTURA
            XCHEQ(PUNTERO,7)=m.banco
            XCHEQ(PUNTERO,8)=m.nroche
            XCHEQ(PUNTERO,9)=m.monto
            XCHEQ(PUNTERO,10)=m.moneda
            XCHEQ(PUNTERO,11)=m.fechade
            XCHEQ(PUNTERO,12)=m.diasac
            XCHEQ(PUNTERO,13)={}
            XCHEQ(PUNTERO,14)=m.equivale
            XCHEQ(PUNTERO,15)=.F.
            =repuse1(@XCHEQ,PUNTERO,16)
         ELSE
            namonto=namonto-nada1
         ENDIF
      ENDIF  && !EMPTY(m.monto)
   ENDDO
   IF !EMPTY(PUNTERO)
      CLEA
      @ 0,1 SAY (padc("N§Cheque",15)+" "+padc("Banco",15)+"  "+padc(("Monto ("+ALLTRIM(xadols)+")"),15)+" "+padc("Fecha",8))
      STOR 1 TO ren
      STOR 0 TO nadtot
      FOR K=1 TO PUNTERO
         @ ren,1 SAY XCHEQ(K,8)
         @ ren,16 SAY XCHEQ(K,7)
         @ ren,33 SAY XCHEQ(K,14)
         @ ren,50 SAY XCHEQ(K,11)
         STORE nadtot+XCHEQ(K,14) TO nadtot
         IF ren=5
            @ 1,1 CLEAR TO 5,59
            ren=1
         ELSE
            ren=ren+1
         ENDIF
      ENDFOR
      IF ren=5
         @ 5,1 CLEAR TO 5,59
      ELSE
         ren=ren+1
      ENDIF
      @ ren,1 SAY "Un total de "+ALLTRIM(STR(nadtot,14,2))+" "+ALLTRIM(XADOLS)+" en "+ALLTRIM(STR(PUNTERO))+IIF (PUNTERO>0," cheques"," cheque")
      IF confirm1('Los Datos Ingresados',.T.,20,38)
         =AGRABAR("CCH",@XCHEQ)
         SELE CCL
         FOR K=1 TO PUNTERO
            M.codcli=XCHEQ(K,1)
            M.fechaop=XCHEQ(K,2)
            M.fechave=XCHEQ(K,11)+(XCHEQ(K,12)/24)
            M.detalle="Pago con cheque N§"+ALLTRIM(XCHEQ(k,8))
            M.compr='FA N§ '+FAC.FACTURA
            M.comprre='CH'
            M.numerore=FAC.FACTURA
            M.monto=XCHEQ(K,9)
            M.MONEDA=XCHEQ(K,10)
            M.equivale=XCHEQ(K,14)
            M.FECHA=DATE()
            M.USUARIO=USADOR
            M.NUMERE=NADAREC
            =AGRABAR("CCL")
         ENDFOR
      ENDIF
   ENDIF
   =RELEwin("winche")
   acti wind win1
ENDIF
=relewin('win1')
RETURN
