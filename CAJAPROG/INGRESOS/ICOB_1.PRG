* ษออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : ICOB_1.PRG           บ
* บ COMENTARIO    : INGRESA COBROS       บ
* ฬออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER             บ
* บ FECHA      : 08-21-93                บ
* บ HORA       : 08:40:31pm              บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER บ
* ศออออออออออออออออออออออออออออออออออออออผ
FUNCTION ICOB_1
PARAMETER HAYRECIBO
#DEFINE PICU "99,999,999.99"                   && PICU
#DEFINE ESCAFIN " - [ESC] para Fin"            && ESCAFIN
#DEFINE NUL    0                                 && NUL

ELCLI=PER.CODCLI
CLISHEM=ALLTRIM(PER.CLIENTE)
ESCONSOR=IIF(TYPE("ESCONSOR")="U",.F.,ESCONSOR)
SELE CCL
SET ORDER TO TAG CODCLI
IF SEEK(ELCLI)
   STORE NUL TO DEBE,HABER,PUNTERO,EFECAUS,EFECDOL,PLASTICO,CHEQUES,GTTL,PNCHE,DESCU,TARJETA
   RELE FAXT
   M.TOMON=Q_DEU(ELCLI,'DEBE','HABER',.T.)
   STORE .F. TO M.AGREGO
   IF M.TOMON>0
      DEFI WIND SALDO FROM 2,2 TO 4,22 PANEL SHAD
      IF SSTM1#"ADMIN"
         ACTI WIND SALDO
         @ 0,0 FILL TO 2,20 COLO R/W
         @ 0,0 SAY "SALDO:"+TRANSF(M.TOMON,PICU)
      ELSE
         STORE NUL TO M.DESCU
         CALC SUM(ABS(MONTO)) TO M.DESCU FOR ;
           CCL.CODCLI=PER.CODCLI .AND. ;
           LEFT(CCL.NUMERORE,3)="NCV" .AND. ;
           CCL.COMPRRE="NC" .AND. ;
           !CCL.PAGADA
         IF !EMPTY(M.DESCU)
            =CARTEL(;
              "EL INQUILINO "+ALLTRIM(PER.CLIENTE)+" RECIBE UNA DEV. VOLUNT. DE",;
              "PESOS:"+ALLTRIM(TRANSF(M.DESCU,PICU))+" QUE SE SUMARA AL EFECTIVO.",;
              "HAGA EL RECIBO POR EL MONTO REALMENTE PAGADO POR EL INQUILINO",;
              "PULSE [ENTER] PARA CONTINUAR")
         ENDIF
         SELE CCP
         =AFIELDS(PROVI)
         SELE CCL
      ENDIF
      STORE NUL TO TTOT
      STORE SYS(3) TO TMP
      TMPBAK=TMP+".BAK"
      TMP=TMP+".TMP"
      TMP1=GENTMP()
      STORE SPACE(11) TO M.GASTO
      =ICOB_2()
      ON KEY LABE ENTER
      ON KEY LABE ESCAPE
      =MOVEWIN(19,20,23,70,'OPT',' Confirma Cobro ')
      @ 1,12 SAY '*INGRESA*'
      @ 1,32 SAY '**ANULA**'
      STORE 1 TO I_SIG
      @ 1,12 GET I_SIG PICT '@*ITH ;' SIZE 1,9,11 ;
        COLO SCHE 18 ;
        MESS "Confirma el Cobro ?"
      READ CYCLE
      =RELEWIN("OPT")
      =RELEWIN("WIN")
      IF LAST()#27 .AND. I_SIG=1
         =MOVECENT(0,0,9,55,'WIN1',' Discriminaciขn de la Cobranza ')
         STORE DATE() TO LAFECHA
         m.RECIBO=GETDOC((JANNRO-1)*20+7)
         @ 1,1 say 'FECHA' COLO SCHE 3
         @ 1,20 GET LAFECHA MESS 'Fecha de la Operaciขn'+escafin
         @ 1,30 SAY "RECIBO Nง"
         @ 1,40 GET M.RECIBO MESS "Nง de Recibo" ;
           WHEN LAST()#27 .AND. !EMPTY(LAFECHA)

         @ 2,1 SAY "IMPUTACION"
         @ 2,20 GET M.GASTO ;
           MESS 'Seleccione el Tipo de Imputaciขn'+TEX_EFES ;
           PICT "99.99.99.99" ;
           WHEN ICOB_5() ;
           VALID ICOB_6() ;
           ERROR "CUENTA INEXISTENTE"

         @ 4,1 SAY UPPER(XAUSS) COLO SCHE 3
         @ 4,30 GET EFECAUS PICT PICU ;
           MESS 'Cobrado en '+XAUSS+escafin ;
           WHEN LAST()#27 .AND. !EMPTY(LAFECHA) .AND. !EMPTY(M.RECIBO)

         @ 5,1 SAY UPPER(XADOLS) COLO SCHE 3
         @ 5,30 GET EFECDOL PICT PICU ;
           MESS 'Cobrado en '+XADOLS+escafin ;
           WHEN LAST()#27 .AND. !EMPTY(LAFECHA) .AND. !EMPTY(M.RECIBO)

         @ 6,1 GET CHEQUES ;
           PICT 'CHEQUES' FUNC '*C' ;
           MESS 'Hay Cheques ?'+escafin ;
           WHEN LAST()#27 .AND. !EMPTY(LAFECHA) .AND. !EMPTY(M.RECIBO)

         @ 7,1 GET TARJETA ;
           PICT 'TARJETA' FUNC '*C' ;
           MESS 'Hay pago con Tarjeta ?'+escafin ;
           WHEN LAST()#27 .AND. !EMPTY(LAFECHA) .AND. !EMPTY(M.RECIBO)

         READ CYCLE

         IF !EMPTY(CHEQUES+EFECAUS+EFECDOL)
            TTL=EFECAUS+EFECDOL
            GTTL=EFECAUS+EFECDOL*XACOTIZ
            IF !EMPTY(CHEQUES)
               STORE NUL TO CHEQUES
               STORE "" TO ARCHE
               M.CHEQUES=ICCH(@ARCHE,.T.,99,'CH')
               TTL=TTL+CHEQUES
            ENDIF
            IF !EMPTY(TTL)
               ACTI WIND WIN1
               ZOOM WIND WIN1 NORM FROM WLROW(),WLCOL() TO WLROW()+WROWS()+4,WLCOL()+WCOLS()
               @ 6,1 SAY SPACE(50)
               @ 6,1 SAY 'CHEQUES' COLO SCHE 3
               @ 6,30 GET CHEQUES PICT PICU
               @ 7,1 SAY 'TARJETA' COLO SCHE 3
               @ 7,30 GET TARJETA PICT PICU
               @ 8,1 SAY 'TOTAL' COLO SCHE 3
               M.EFECAUS=M.EFECAUS+M.DESCU
               M.TTL=M.TTL+M.DESCU
               @ 4,30 GET EFECAUS PICT PICU
               @ 8,30 GET TTL PICT PICU
               CLEA GETS
               IF CONFIRMA("el Pago",.f.,9,2)
                  LAGUITA=TTL
                  =WORKING()
                  SELE CCL
                  COPY TO (TMP1) STRU EXTE
                  USE
                  =GETDBF(TMP,.F.,'TMP',25,.T.)
                  SELE 0
                  USE (TMP1) ALIAS TMP1 EXCL
                  M.FIELD_NAME="VENCIM"
                  M.FIELD_TYPE="D"
                  M.FIELD_LEN=008
                  M.FIELD_DEC=000
                  INSERT INTO TMP1 FROM MEMV
                  M.FIELD_NAME="DIASRET"
                  M.FIELD_TYPE="N"
                  M.FIELD_LEN=008
                  M.FIELD_DEC=000
                  INSERT INTO TMP1 FROM MEMV
                  TMP2=GENTMP()
                  SELE TMP1
                  USE
                  CREATE (TMP2) FROM (TMP1)
                  USE (TMP2) ALIAS TMP1
                  ERASE (TMP1)
                  =OPCCL()
                  SET ORDER TO TAG NUMERORE
                  NADAREC=Q_FAC(SUCU+"-"+ALLTRIM(STR(M.RECIBO)))
                  M.ELRECANT=M.RECIBO
                  ***** PARA GRABAR EN CTA CTE
                  M.NUMERORE=NADAREC
                  M.COMPRRE='RE'
                  ***** PARA GRABAR EN CAJA
                  STORE "00" TO M.CAJA
                  STORE .F. TO M.PROVEEDOR
                  STORE NADAREC TO M.NUMERE
                  STORE SPACE(10) TO M.PROCOD
                  STORE IIF(SSTM2="CAJAARRI","0000",SUCU) TO M.SUCRSAL
                  M.COMPRE='RE'
                  ***** EN AMBOS
                  M.CODCLI=PER.CODCLI
                  M.FECHAOP=M.LAFECHA
                  M.COMPRRE='RE'
                  ***
                  IF SSTM1="ADMIN"
                     CREATE CURSOR PROVISOR FROM ARRAY PROVI
                     SELE PROVISOR
                     APPE BLAN
                     IF M.AGREGO
                        SELE TMP
                        REPL ALL CODCLI WITH ELCLI
                        SELE CCL
                        APPE FROM DBF("TMP") FOR ;
                          COMPRRE="ND" .AND.;
                          FECHAOP=DATE() .AND. ;
                          FECHAVE=DATE() .AND. ;
                          USUARIO=USADOR .AND. ;
                          LEFT(DETALLE,3)="INT"
                        SELE PROVISOR
                        APPE FROM DBF("TMP") FOR ;
                          COMPRRE="ND" .AND.;
                          FECHAOP=DATE() .AND. ;
                          FECHAVE=DATE() .AND. ;
                          USUARIO=USADOR .AND. ;
                          LEFT(DETALLE,3)="INT"
                     ENDIF
                  ENDIF
                  *** DISPARA IMPUTACIONES
                  =ICOB_X(M.EFECAUS,1)
                  =ICOB_X(M.EFECDOL,2)
                  IF !EMPTY(M.CHEQUES)
                     ***** PARA CHEQUES
                     STORE 'CH' TO M.TIPO
                     STORE .F. TO M.ENTREGADO
                     STORE "" TO M.SELECCION,M.COMPR
                     FOR XA=1 TO ALEN(ARCHE,1)
                        =ICOB_X(ARCHE[XA,2],3,ARCHE[XA,3],ARCHE[XA,4],ARCHE[XA,5])
                        STORE ARCHE[XA,5] TO M.BANCO
                        STORE ARCHE[XA,4] TO M.NROCHE
                        STORE ARCHE[XA,2] TO M.MONTO
                        STORE XAUSS TO M.MONEDA
                        STORE ARCHE[XA,3] TO M.FECHADE
                        STORE ARCHE[XA,6] TO M.DIASAC
                        STORE {} TO M.FECHAAC
                        STORE M.MONTO/XACOTIZ TO M.EQUIVALE
                        =AGRABAR("CCH")
                     NEXT
                  ENDIF
                  RELE WIND SALDO
                  RELE WIND WIN2
                  SELE TMP1
                  REPL ALL CODCLI WITH ELCLI
                  IF USED("PROVISOR")
                  SELE PROVISOR
                  APPE FROM DBF("TMP1")
                  ENDIF
                  SELE CCL
                  =FLOCK() .OR. FLOK()
                  APPE FROM DBF("TMP1")
                  UNLO IN CCL
                  IF SSTM1="ADMIN"
                     SELE TMP1
                     * BROW
                     * ESTOY PROBANDO LA IMPUTACION DE LOS IMPUESTOS
                     * REVISAR DIRECTAMENTE DESDE EL INGRESO
                     *
                     SCAN FOR LEFT(NUMERORE,3)="NDT"
                        IF PAGADA
                           *.AND.
                           COSA=COMPR+STR(C_MES,2)+RIGHT(STR(C_ANIO,4),2)+STR(C_CUOTA,1)
                           WAIT COSA WIND NOWA
                           IF XSEEK(COSA,"CONTROL","CCI")
                              SELE CCI
                              BROW
                              SELE TMP1
                           ENDIF
                        ENDIF
                     ENDSCAN

                     SELE PROVISOR
                     DELE FOR EMPTY(MONTO)
                     DELE FOR LEFT(COMPR,3)="NDT" .OR. LEFT(COMPR,3)="NDC"
                     REPL ALL PROCOD WITH CODCLI
                     REPL ALL CODCLI WITH M.ELCLI
                     IF TYPE("XPENSAS")#"U" .AND. XPENSAS
                        SELE CCP
                        =FLOCK() .OR. FLOK()
                        APPE FROM DBF("PROVISOR") FOR !DELE()
                        DELE FOR EMPTY(MONTO)
                        UNLO IN CCP
                     ENDIF
                     IF USED("PROVISOR")
                        SELE PROVISOR
                        ** BROW
                        SCAN
                        SCAT MEMV
                        M.PAGADA=.F.
                        M.AUTORIZ=.T.
	                    IF !ESCONSOR
                        =XSEEK(PROVISOR.CODINM,"INM","CODINM")
                        M.PROCOD=INM.PROCOD
                        =AGRABAR("CCP")
                        =XSEEK(PROVISOR.CODINM,"ALQ","CODINM")
                        M.MONTO=MONTO*ALQ.COMISION/100
                        M.COMPRRE="NC"
                        =AGRABAR("CCP")
                        ENDIF
                        ENDSCAN
                        USE
                     ENDIF
                  ENDIF
                  SELE TMP1
                  =UNWORK()
                  IF HAYRECIBO
                     SUMPAG=CHEQUES+EFECDOL*XACOTIZ+EFECAUS
                     #IF "NOVOGAR" $ CURDIR()
                     DO LRECIU
                     #ELSE
                     IF TYPE("XPENSAS")#"U" .AND. XPENSAS
                        DO LRECIU2
                     ELSE
                        DO LRECIU
                     ENDIF
                     #ENDIF
                  ENDIF
                  =SAVDOC((JANNRO-1)*20+7,M.ELRECANT)
                  IF SSTM1="ADMIN" .AND. !EMPTY(M.DESCU)
                     SELE CCL
                     SCAN FOR CCL.CODCLI=ELCLI .AND. ;
                          LEFT(CCL.NUMERORE,3)="NCV" .AND. ;
                          CCL.COMPRRE="NC" .AND. ;
                          !PAGADA
                        DO LRECIU1
                        =LOCK("CCL") .OR. LOK("CCL")
                        REPL CCL.PAGADA WITH .T.
                        SCAT MEMV
                        UNLO IN CCL
                        M.PROCOD=M.CODCLI
                        M.CODCLI=M.ELCLI
                        =AGRABAR("CCP")
                        EXIT
                     ENDSCAN
                  ENDIF
                  USE IN TMP
                  USE IN TMP1
                  ERASE (TMP)
                  ERASE (TMPBAK)
                  ERASE (TMP2)
               ENDIF
            ENDIF
         ENDIF
         =RELEWIN("WIN1")
      ENDIF
      =RELEWIN("WIN")
      RELE WIND SALDO
      RELE WIND WIN2
   ELSE
      IF SSTM2="EXPENSAS" .OR. HAYTRU("XPENSAS")
         TCL="CONSORCISTA"
      ELSE
         IF SSTM2='ALQUILER'
            TCL="INQUILINO"
         ELSE
            TCL="CLIENTE"
         ENDIF
      ENDIF
      =CARTEL2("NO SE ENCONTRO DEUDA",;
        "DEL "+TCL+" ("+ALLTRIM(PER.CODCLI)+") "+ALLTRIM(PER.CLIENTE),;
        "IMPOSIBLE INGRESAR PAGOS",;
        "PULSE [ENTER] PARA CONTINUAR")
   ENDIF
ELSE
   =NOOPCLI("IMPOSIBLE INGRESAR PAGOS")
ENDIF
IF USED("PROVISOR")
   USE IN PROVISOR
ENDIF
=REOPCCL()
=OFF_TMP()
RETURN .T.

* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ FUNCTION      : ICOB_2.PRG                                               บ
* บ COMENTARIO    : GENERA ARCHIVO TEMPORAL DE CTACTE RELEVA PAGOS           บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-22-93                                                    บ
* บ HORA       : 12:39:26pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION ICOB_2
#DEFINE PICU "99,999,999.99"                   && PICU

=WORKING()
SELE CCL
=FLOCK() .OR. FLOK()
SET ORDER TO
SORT ON FECHAVE,COMPRRE ;
  TO (TMP) FOR CCL.CODCLI=PER.CODCLI
UNLO IN CCL
=GETDBF(TMP,.F.,'CCL',5,.T.)
IF EXTENS(DBF())="TMP"
   DELE FOR PAGADA
   DELE FOR !ESDEBE(ccl.comprre)
   PACK
   #IF "RAFULS" $ CURDIR()
   IF SSTM1="ADMIN"
      *REPL ALL DETALLE WITH Q_TIPTEX(DETALLE)
      =MEN_LIN("Calculando Intereses")
      SCAN FOR FECHAVE<DATE() .AND. ;
           LEFT(NUMERORE,3)#"NDC"
           * .AND. ;
           LEFT(NUMERORE,3)#"NDT"
         M.AGREGO=IDEB_FLY()
      ENDSCAN
      CALC SUM(ABS(MONTO)-CUOTA) TO M.TOMON
      ACTI WIND SALDO
      @ 0,0 FILL TO 2,20 COLO R/W
      @ 0,0 SAY "SALDO:"+TRANSF(M.TOMON,PICU)
   ENDIF
   #ENDIF
   REPL ALL MARKA WITH .F.
   =UNWORK()
   DEFI WIND WIN2 FROM 2,41 TO 4,70 PANEL SHAD
   ACTI WIND WIN2
   @ 0,0 FILL TO 2,29 COLO R/W
   @ 0,0 SAY "MONTO MARCADO " ;
     GET TTOT PICT PICU ;
     DISA
   ACTI SCRE
   =MEN_LIN("[ENTER] Selecciona-Deselecciona Cuota"+ESCAFIN)
   =MOVECENT(0,0,15,70,'WIN',' DEUDA DEL '+;
     IIF(SSTM1="ADMIN",IIF(PER.FILTRO="O","CONSORCISTA ","INQUILINO "),"CLIENTE ")+;
     CLISHEM+' ')
   ON KEY LABE ENTER DO ICOB_3
   ON KEY LABE ESCAPE RETURN .T.
   GO TOP
   BROW FIELD FECHAVE:H="F. VENC.":R,;
     "PAGA"=IIF(MARKA,"[X]","[ ]"),;
     JT=IIF(SSTM1="ADMIN","",COMPRRE+" Nง ")+NUMERORE:H=PADC("ORIGEN",20):R,;
     A=MONTO-CUOTA:R:P="9,999,999.99":H=PADC("DEUDA",14) ,;
     DETALLE=Q_TIPTEX(DETALLE):R ;
     IN WIN
   ON KEY LABE ENTER
   ON KEY LABE ESCAPE
ELSE
   =ERROR1()
ENDIF
RETURN .T.

PROCEDURE ICOB_3
#DEFINE PICU "99,999,999.99"                   && PICU
IF MARKA
   TTOT=TTOT-(MONTO-CUOTA)
ELSE
   TTOT=TTOT+(MONTO-CUOTA)
ENDIF
REPL MARKA WITH !MARKA
ACTI WIND WIN2
@ 0,0 SAY "MONTO MARCADO " ;
  GET TTOT PICT PICU ;
  DISA
ACTI WIND WIN
RETURN .T.

FUNCTION ICOB_5
IF LAST()#27 .AND. !EMPTY(LAFECHA)
   ON KEY LABE F2 M.GASTO=QUEPOPUP("a Imputar",2,20)
   ON KEY LABE F3 M.GASTO=QUEPOPUP("a Imputar",2,20)
   RETURN .T.
ENDIF
RETURN .F.

FUNCTION ICOB_6
ON KEY LABE F2
ON KEY LABE F3
IF (EMPTY(M.GASTO) .AND. LAST()=27)
   RETURN .T.
ENDIF
IF XSEEK(M.GASTO,'MIX','GASCOD')
   @ 2,33 SAY MIX.TEXTO1
   RETURN .T.
ENDIF
RETURN .F.

FUNCTION ICOB_X
PARAMETER XLAGUITA,IX_MONEDA,IX_FECHAVE,IX_NUMCHE,IX_NOMBAN
IF !EMPTY(M.XLAGUITA)
   SOBRANTE=ICOB_4(XLAGUITA,IX_MONEDA,IX_FECHAVE,IX_NUMCHE,IX_NOMBAN)
   IF SOBRANTE>0
      =ICOB_4(SOBRANTE,IX_MONEDA,IX_FECHAVE,IX_NUMCHE,IX_NOMBAN,.T.)
   ENDIF
ENDIF
RETURN .T.
