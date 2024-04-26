*:*********************************************************************
*-- Programa: IRECP.PRG
*-- Fecha   : 08-12-92 01:24pm
*-- Versi¢n : G. REINER
*-- Notas   : REMITO DE NOTA DE PEDIDO
*:*********************************************************************
#DEFINE ENTERCON "PULSE [ENTER] PARA CONTINUAR"  && ENTERCON
SELE pec
STORE RECNO() TO ff
registro=STR(ff)
SCAT MEMV
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   IF EMPTY(PEC.FECHAENT)
   =WORKING()
   =lock("pec") .or. lok('PEC')
   SELE pe1
   ft2=blo_mult(M.PEDIDO+M.PROCOD)
   =lock() .or. lok()
   IF XSEEK(M.PEDIDO+M.PROCOD,'PE1','PEDIDO')
      BASE=GENTMP()
      INDICE=GENTMP()
      SELE 25
      USE
      CREATE DBF (BASE) ;
        ("ARTICULO" C(20),;
        "SEPIDIO" N(10),;
        "HABIA" N(10),;
        "LLEGO" N(10),;
        "MONTO" N(14,2),;
        "FECHA" D,;
        "USUARIO" C(10))
      USE
      SELE 25
      USE (BASE) ALIAS TMP EXCL
      SET ORDER TO TAG ARTICULO IN MER
      SET RELA TO ARTICULO INTO MER
      SELE PE1
      SCAN WHILE PE1.PEDIDO=M.PEDIDO .AND. ;
           PE1.PROCOD=M.PROCOD
         IF PE1.CANTIDAD>PE1.ENTREGADO
            SELE TMP
            M.ARTICULO=PE1.ARTICULO
            M.MONTO=PE1.MONTO
            M.SEPIDIO=PE1.CANTIDAD
            M.HABIA=PE1.CANTIDAD-PE1.ENTREGADO
            M.LLEGO=NUL
            =AGRABAR("TMP")
            SELE PE1
         ENDIF
      ENDSCAN
      IF !EMPTY(RECC("TMP"))
      ON KEY LABEL Ctrl+H DO IREPHELP
      ON KEY LABEL Ctrl+X KEYBOARD CHR(23)
      ON KEY LABEL Ctrl+L DO IREPDELE
      ON KEY LABEL Ctrl+R DO IREPRUB
      SELE TMP
      INDE ON ARTICULO TAG ARTICULO
      SET ORDER TO TAG ARTICULO
      =UNWORK()
      =MEN_LIN("Ctrl - H para Operaciones")
      =MOVEWIN(5,0,22,79,'WIN','Remito de Pedido N§ '+m.pedido+' - '+alltrim(pro.proveedor)+'/PROMESA:'+DTOC(PEC.FECHAPROM)+' ')
      BROW FIELD ;
        TMP.ARTICULO:R:H=PADC("ARTICULO",20),;
        MER.MERCA:R:H=PADC("DESCRIPCION",30),;
        TMP.SEPIDIO:R:H="PEDIDO":P="999999",;
        TMP.LLEGO:H="RECIBI":P="999999":V=(TMP.LLEGO>-1 .AND. TMP.LLEGO<=TMP.HABIA):E="No puede recibir m s de lo que Pidi¢",;
        TMP.HABIA:R:H="PENDI.":P="999999";
        WIND WIN ;
        FREE LLEGO ;
        TITL ' Remito de Pedido N§ '+m.pedido+' - '+alltrim(pro.proveedor)+'/PROMESA:'+DTOC(PEC.FECHAPROM)+' '
      =RELEWIN("WIN")
      ON KEY LABEL Ctrl+H
      ON KEY LABEL Ctrl+X
      ON KEY LABEL Ctrl+L
      ON KEY LABEL Ctrl+R
      SUM LLEGO TO M.TOTAL
      IF !EMPTY(M.TOTAL) .AND. LAST()#27
         =MOVEWIN(10,5,16,75,'WIN',' Recepci¢n de Remito ')
         @ 1,1 say PRO.PROVEEDOR
         @ 2,1 SAY PRO.DOMICILIO
         =XSEEK(PRO.LOCAL,'MIX','CIUCOD')
         @ 3,1 SAY MIX.TEXTO1
         STORE SPACE(14) TO M.REMITO
         @ 1,40 SAY 'REMITO N§'
         @ 2,40 SAY "FECHA"
         @ 1,50 GET M.REMITO
         READ
         M.REMITO=Q_FAC(M.REMITO)
         @ 1,50 GET M.REMITO
         CLEA GETS
         IF LAST()#27 .AND. RIGHT(M.REMITO,8)#'00000000'
            SELE REC
            IF !SEEK(M.REMITO+M.PROCOD)
               M.NUMERO=M.REMITO
               STORE DATE() TO M.FECHAREM
               @ 2,50 GET M.FECHAREM
               READ
               IF LAST()#27
                  M.FECHAPED=PEC.FECHAEM
                  M.FECHAFAC={}
                  =AGRABAR("REC")
                  M.OPK='02'
                  M.DOCREF='RC'
                  M.NRODOCREF=M.REMITO
                  M.CLIENTE=M.PROCOD
                  M.DETALLE='REM. NOTA DE PEDIDO'
                  M.SALIDA=NUL
                  M.PROVEEDOR=.T.
                  SELE TMP
                  SCAN
                     IF !EMPTY(TMP.LLEGO)
                        M.CANTIDAD=TMP.LLEGO
                        M.MONTO=TMP.MONTO
                        M.ARTICULO=TMP.ARTICULO
                        =AGRABAR("RE1")
                        SELE MER
                        IF XSEEK(TMP.ARTICULO,'MER','ARTICULO')
                           =RLOCK() .OR. LOK("MER",STR(RECNO()))
                           REPL STOCK WITH STOCK+TMP.LLEGO
                           UNLO IN MER
                        ENDIF
                        M.ARTICULO=MER.ARTICULO
                        M.FECHAOP=M.FECHAREM
                        M.ENTRADA=TMP.LLEGO
                        =AGRABAR("KAR")
                     ENDIF
                     SELE TMP
                  ENDSCAN
                  SELE PE1
                  SET ORDER TO TAG PEDIDO
                  SEEK M.PEDIDO+M.PROCOD
                  SCAN WHILE PE1.PEDIDO=M.PEDIDO .AND. ;
                       PE1.PROCOD=M.PROCOD
                       IF XSEEK(PE1.ARTICULO,"TMP","ARTICULO") .AND. ;
                           !EMPTY(TMP.LLEGO)
                           =LOCK() .OR. LOK("PE1",STR(RECNO()))
						   * wait "reemplazando "+pe1.ARTICULO
                           REPL PE1.ENTREGADO WITH PE1.ENTREGADO+TMP.LLEGO
                           UNLO IN PE1
                       ENDIF
                  ENDSCAN
               ENDIF
            ELSE
               =CARTEL2("EL REMITO N§ "+M.REMITO,"DE LA EMPRESA "+ALLTRIM(PRO.PROVEEDOR),"EXISTE","DEBE HABER UN ERROR")
            ENDIF
         ENDIF
         =Relewin("win")
      ENDIF
      ELSE
         =CARTEL("LA NOTA DE PEDIDO N§"+PEC.PEDIDO,;
         "DEL PROVEEDOR "+ALLTRIM(PRO.PROVEEDOR),;
         "FIGURA COMO COMPLETAMENTE CANCELADA",;
         ENTERCON)
         =UNWORK()
      ENDIF
      USE IN TMP
      SELE MER
      SET ORDER TO
      =REOPPEC()
   ENDIF
   ELSE
         =CARTEL("LA NOTA DE PEDIDO N§"+PEC.PEDIDO,;
         "DEL PROVEEDOR "+ALLTRIM(PRO.PROVEEDOR),;
         "FIGURA TERMINADA DE RECIBIR EL DIA "+DTOC(PEC.FECHAENT),;
         ENTERCON)
   ENDIF
ELSE
   =iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)

procedure IREPhelp
=movewin(10,NUL,17,40,'AYUDA',' AYUDA ')
@ 1,1 SAY 'Ctrl L  Borra L¡nea'
@ 2,1 SAY 'Ctrl R  Borra Rubro'
@ 3,1 SAY 'Ctrl X  Sale de Remito'
@ 4,1 say 'ENTER  Fin Ayuda'
=inkey(NUL,'HM')
=relewin("ayuda")
return
PROCEDURE IREPRUB
ELRUB=LEFT(TMP.ARTICULO,3)
DELE FOR LEFT(TMP.ARTICULO,3)=ELRUB
GO TOP
RETURN
PROCEDURE IREPDELE
DELE
GO TOP
RETURN
