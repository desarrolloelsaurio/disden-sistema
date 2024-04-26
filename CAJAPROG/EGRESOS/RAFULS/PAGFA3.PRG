#DEFINE NUL    0                                 && NUL
STORE NUL TO RESPUESTA
IF ELIPRP("a Pagar",-1,1)
   =WORKING()
   SELE CCP
   =FLOCK("CCP") .OR. FLOK("CCP")
   SET ORDER TO
   REPL ALL REGNO WITH NUL
   UNLO IN CCP
   SET ORDER TO TAG FECHAOP
   STORE NUL TO SUMA
   =UNWORK()
   =MOVEWIN(5,2,15,77,"win"," Facturas de"+dosspac(PER.CLIENTE))
   =MEN_LIN("[ENTER] Selecciona-Deselecciona / [TAB] Confirma / [ESC] Anula")
   ON KEY LABEL ENTER DO PAGFA31
   ON KEY LABEL TAB KEYB CHR(23)
   BROW ;
     FIEL FECHAVE:H="VENCIM.":R ,;
     DETALLE:H=PADC("DETALLE",30):R ,;
     COMPRRE:H="CP":P="!!":R ,;
     NUMERORE:H=PADC("NUMERO",14):R ,;
     MONTO:H=PADC("MONTO",9):P="99,999.99":R ,;
     PAGA=IIF(EMPTY(REGNO)," NO "," SI "):R ;
     FREE DETALLE ;
     FOR !PAGADA .AND. ;
     AUTORIZ .AND. ;
     COMPRRE="FA" .AND. ;
     EMPTY(COMPR) .AND. ;
     !IDA .AND. ;
     PROCOD=PER.CODCLI ;
     WIND WIN ;
     NOCLEAR
   ON KEY LABEL ENTER
   ON KEY LABEL TAB
   IF LAST()#27 .AND. ;
        !EMPTY(SUMA) .AND. ;
        CONFIRMA("facturas a pagar",.t.,21,0)
      M.OPCION=ALGUN(20,"Seleccione Forma de Pago","Pesos;D¢lares;Cheque Propio;Anula")
      STORE NUL TO M.SUMA
      IF M.OPCION#4
         NUMERO=GETNU1("ORDENPAGO","FOXGRL")+1
         SCAN FOR !PAGADA .AND. ;
              AUTORIZ .AND. ;
              COMPRRE="FA" .AND. ;
              EMPTY(COMPR) .AND. ;
              REGNO=9999 .AND. ;
              PROCOD=PER.CODCLI
            REPL IDA WITH .T.
            REPL REGNO WITH NUMERO
            SUMA=SUMA+CCP.MONTO
            M.CAJA="F3"
            M.CODCLI=PER.CODCLI
            M.FECHAOP=DATE()
            M.COMPR="OP N§ "+ZERO(NUMERO,8)
            M.COMPRRE="FA"
            M.NUMERE="A0001-"+ZERO(NUMERO,8)
            M.MONTO=0-CCP.MONTO
            M.MONEDA=CCP.MONEDA
            M.PROCOD=PER.CODCLI
            =AGRABAR("CAJ")
         ENDSCAN
         =PUTNU1("ORDENPAGO",NUMERO,"FOXGRL")
      ENDIF
   ENDIF
   =RELEWIN("WIN")
ELSE
   =NOSELEC()
ENDIF
RETURN
 
PROCEDURE PAGFA31
IF EMPTY(REGNO)
   REPL REGNO WITH 9999
   SUMA=SUMA+CCP.MONTO
ELSE
   REPL REGNO WITH NUL
   IF !EMPTY(SUMA)
      SUMA=SUMA-CCP.MONTO
   ENDIF
ENDIF
WAIT "SUMA:"+TRANS(SUMA,"99,999.99") WIND NOWA
RETU
