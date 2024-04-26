#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
#DEFINE PICUMAX "9,999,999,999,999.99"           && PICUMAX
 
FUNCTION IPER_DO
=WORKING()
DO CASE
CASE COD_HACER=1                              && CUENTA CORRIENTE UN CLIENTE POR PANTALLA BOCHI
   =XSEEK(M.CODCLI,"PER","CODCLI")
#IF "Wind" $ vers()
   =OPCCL()
   SELE CCL
*----------   
   TMP=GENTMP()
**   =FLOCK() .OR. FLOK()
   SORT ON FECHAOP TO (TMP) FOR CODCLI=PER.CODCLI
**   UNLO IN CCL
   =PRXAREA(.T.)
   USE IN CCL
   USE (TMP) ALIAS CCL EXCL
**   PACK
   IF !empty(recc())
**      repo form LCCLU2 TO PRIN PROMPT 
      repo form LCCLU2 PREV NOCO
   ELSE
      WAIT "EL CLIENTE "+ALLTRIM(PER.CLIENTE)+" NO PRESENTA MOVIMIENTOS" WIND
   ENDIF
   =off_tmp()
*----------   
*   SET ORDER TO TAG CODCLI
*   IF SEEK(PER.CODCLI)
*      repo form LCCLU2 prev WHILE ccl.codcli=per.codcli
*   ELSE
*      WAIT "EL CLIENTE "+ALLTRIM(PER.CLIENTE)+" NO PRESENTA MOVIMIENTOS" WIND
*   ENDIF
#ELSE
   ENCONTRE=XSEEK(PER.CODCLI,'CCL','CODCLI')
   IF ENCONTRE
      TTQUE=CHR(13)+CHR(10)+ALLTRIM(PER.CLIENTE)+" ("+ALLTRIM(PER.CODCLI)+")"
      FISC="ccl.codcli='"+PER.codcli+"'"
      DO WHILE .T.
         M.PORDONDE=XPRN(4)
         DO CASE
         CASE M.PORDONDE=1
            DO LCCL WITH .T.,.T.
         CASE M.PORDONDE=2
            DO LCCL WITH .F.,.T.
         CASE M.PORDONDE=3
            STORE .T. TO ENASCII
            LOOP
         CASE M.PORDONDE=4 .OR. M.PORDONDE=5 .OR. M.PORDONDE=6
            =CIMP(.T.)
            LOOP
         OTHERWISE
            EXIT
         ENDCASE
      ENDDO
   ELSE
      =NOOPCLI("IMPOSIBLE EMITIR RESUMEN")
   ENDIF
#ENDIF
CASE COD_HACER=2                              && CUENTA CORRIENTE UN CLIENTE POR IMPRESORA BOCHI
#IF "Wind" $ vers()
   =XSEEK(M.CODCLI,"PER","CODCLI")
   store .T. to resumen
   =opccl()
   
      TMP=GENTMP()
   SORT ON FECHAOP TO (TMP) FOR CODCLI=PER.CODCLI
   =PRXAREA(.T.)
   USE IN CCL
   USE (TMP) ALIAS CCL EXCL
   IF !empty(recc())
      repo form LCCLU to prin  PROMPT 
   ELSE
      WAIT "EL CLIENTE "+ALLTRIM(PER.CLIENTE)+" NO PRESENTA MOVIMIENTOS" WIND
   ENDIF
   =off_tmp()

   
*   SELE CCL
*   SET ORDER TO TAG CODCLI
*   IF SEEK(PER.CODCLI)
*      ELCLI=PER.CODCLI
*      repo form LCCLU to prin  PROMPT FOR ccl.codcli=ELCLI noconsole
*   ELSE
*      WAIT "EL CLIENTE "+ALLTRIM(PER.CLIENTE)+" NO PRESENTA MOVIMIENTOS" WIND
*   ENDIF
#ENDIF
CASE COD_HACER=3                              && PASA A HISTORICO DE CUENTA CORRIENTE
   =WORKING()
   =DOTALK()
   =OPCCL()
   SELE CCL
   TMP=GENTMP()
   =FLOCK() .OR. FLOK()
   SORT ON FECHAOP TO (TMP) FOR CODCLI=PER.CODCLI
   UNLO IN CCL
   =PRXAREA(.T.)
   USE (TMP) ALIAS TMP EXCL
   PACK
   ACTI SCRE
   REPL ALL GY_DEBE WITH NUL,GY_HABER WITH NUL
   REPL GY_DEBE WITH MONTO FOR ESDEBE(COMPRRE)
   REPL GY_HABER WITH MONTO FOR !ESDEBE(COMPRRE)
   STORE NUL TO GY_PENDIENTE,GY_SALDO
   SCAN
      STORE GY_SALDO+GY_DEBE-GY_HABER TO GY_SALDO
      IF ESDEBE(COMPRRE)
         STORE GY_PENDIENTE+MONTO-CUOTA TO GY_PENDIENTE
      ENDIF
   ENDSCAN
   WAIT "SALDO:"+STR(GY_SALDO,10,2) WIND NOWA
   WAIT "PENDIENTE:"+STR(GY_PENDIENTE,10,2) WIND NOWA
   IF GY_SALDO=GY_PENDIENTE
#IF "Wind" $ VERS()
      IF CONFIRMA("Mandar operaciones a histórico",.t.,10,0)
#ELSE
         IF CONFIRMA("Mandar operaciones a hist¢rico",.t.,20,10)
#ENDIF
            DELE FOR !ESDEBE(COMPRRE)
            DELE FOR ESDEBE(COMPRRE) .AND. MONTO=CUOTA
            TMP1=GENTMP()
            SET DELE OFF
            COPY TO (TMP1) for dele()
            SET DELE ON
            PACK
            =PRXAREA(.T.)
            USE (TMP1) ALIAS TMP1
            RECA ALL
            SELE CCL
            =FLOCK() .OR. FLOK()
            DELE FOR CODCLI=PER.CODCLI
            UNLO IN CCL
            APPE FROM DBF("TMP")
            =OPCCLH()
            APPE FROM DBF("TMP1")
            USE IN CCLH
         ENDIF
      ELSE
         =CARTEL("LA CUENTA CORRIENTE DEL "+UPPER(ALLTRIM(TEXTO[1])),;
           ALLTRIM(PER.CLIENTE)+" ("+PER.CODCLI+")",;
           "NO PARECE ESTAR IMPUTADA CORRECTAMENTE",;
           "POR FAVOR, HAGALO Y REINTENTE")
      ENDIF
      =OFF_TMP()
      =UNTALK()
   CASE COD_HACER=4 .OR. COD_HACER=5
      IF XSEEK(PER.CODCLI,'CCL','CODCLI')
         TTQUE=CHR(13)+CHR(10)+ALLTRIM(PER.CLIENTE)+" ("+ALLTRIM(PER.CODCLI)+")"
         FISC="ccl.codcli='"+PER.codcli+"'"
         DO LCCL WITH COD_HACER=4,.T.
      ELSE
         ELTEX=ALLTRIM(PER.CLIENTE)
         =NOOPCLI("IMPOSIBLE EMITIR RESUMEN")
      ENDIF
   CASE COD_HACER=6
      =OPCCL()
      =XSEEK(M.CODCLI,'PER',"CODCLI")
      =imputRAF()
   CASE COD_HACER=7 .OR. COD_HACER=8
      =OPCCL()
      =opcclh()
      IF XSEEK(PER.CODCLI,'CClh','CODCLI')
         TTQUE=CRLF+;
           "Base de Datos Hist¢rica"+;
           CRLF+;
           ALLTRIM(PER.CLIENTE)+" ("+ALLTRIM(PER.CODCLI)+")"
         FISC="cclh.codcli='"+PER.codcli+"'"
         DO LCCL WITH COD_HACER=7,.T.,.T.
      ELSE
         ELTEX=ALLTRIM(PER.CLIENTE)
         =NOOPCLI("IMPOSIBLE EMITIR RESUMEN")
      ENDIF
      =CLOSDBF("CCLH")
   CASE COD_HACER=9
      DO ICOBCUOT.SPR
   CASE COD_HACER=10
      =IMPUTMAN()
   CASE COD_HACER=11
      =SCCLPAR()
   CASE COD_HACER=12                          && listado de horas trabajadas de un empleado en un mes
      =OPHOR()
      SELE HOR
      SET ORDER TO
      TMP=GENTMP()
      =FLOCK() .OR. FLOK()
      M.ELMES=VAL(LEFT(MESANIO,2))
      M.ELANIO=VAL(RIGHT(MESANIO,4))
      SORT ON FECHAOP TO (TMP) FOR CODCLI=M.CODCLI .AND. ;
        YEAR(FECHAOP)=M.ELANIO .AND. ;
        MONTH(FECHAOP)=M.ELMES
      =UNLO_PRX("HOR",TMP,"TMP")
      IF !EMPTY(RECC("TMP"))
         TT="Listado de Horas Trabajadas"+;
           crlf+;
           alltrim(per.cliente)+;
           crlf+;
           qmes(m.ELmes)+" de "+str(m.ELanio,4)
         aclaPAN=PAIP+"DIA"+PAIP+;
           "HR"+PAIP+"ENTRA"+PAIP+" SALE"+PAIP+"TOTAL"+PAIP+PAIP+;
           "HR"+PAIP+"ENTRA"+PAIP+" SALE"+PAIP+"TOTAL"+PAIP+PAIP+;
           "HR"+PAIP+"ENTRA"+PAIP+" SALE"+PAIP+"TOTAL"+PAIP
         aclaPRN=PAIP+"DIA"+PAIP+;
           PADC("HORA",20)+PAIP+"ENTRA"+PAIP+" SALE"+PAIP+"TOTAL"+PAIP+PAIP+;
           PADC("HORA",20)+PAIP+"ENTRA"+PAIP+" SALE"+PAIP+"TOTAL"+PAIP+PAIP+;
           PADC("HORA",20)+PAIP+"ENTRA"+PAIP+" SALE"+PAIP+"TOTAL"+PAIP
         =XPRN1(4,"TMP","LHOR0()",M.CODCLI+"-"+M.MESANIO,"LHOR1E",.T.)
      ELSE
         WAIT "NO SE HAN ENCONTRADO HORAS DE "+ALLTRIM(PER.CLIENTE)+" DE "+;
           qmes(m.ELmes)+" de "+str(m.ELanio,4) WIND
      ENDIF
      =OFF_TMP()
   CASE COD_HACER=13
      STORE NUL TO M.RESPUESTA
      IF ELIRUB("a Listar",-1,1)
         =WORKING()
         =DOTALK()
         STORE NUL TO M.RESPUESTA
         M.ELRUBRO=LEFT(MIX.TEXTO2,3)
         IF ELITALS("a Listar",-1,1)
            TT="Listado de Presupuesto de Servicios"+;
              crlf+;
              "Taller:"+alltrim(per.cliente)+;
              crlf+;
              "Proceso:"+alltrim(prc.procfab)
            SELE PRS
            TMP=GENTMP()
            SORT ON ARTICULO TO (TMP) FOR ;
              CODCLI=PER.CODCLI .AND. ;
              PRCCOD=PRC.PRCCOD
            =UNLO_PRX("PRS",TMP)
            ACLAPRN=PAIP+PADC("ARTICULO",13)+PAIP+;
              PADC("DESCRIPCIOM",40)+PAIP+;
              PADC("PROCESO",30)+PAIP+;
              PADC("P. Unit.",xacdigi)+PAIP
            ACLAPAN=PAIP+PADC("ARTICULO",13)+PAIP+;
              PADC("DESCRIPCIOM",20)+PAIP+;
              PADC("PROCESO",20)+PAIP+;
              PADC("P. Unit.",xacdigi)+PAIP
            =UNTALK()
            =UNWORK()
            =xprn1(4,"TMP","LPRS12(4)",LEFT(MIX.TEXTO2,3)+"/"+PRC.PRCCOD,"LPRSPR")
            =OFF_TMP()
         ELSE
            =NOSELEC("PROCESO DE FABRICACION")
         ENDIF
      ELSE
         =NOSELEC("RUBRO")
      ENDIF
   CASE COD_HACER=15 .or. COD_HACER=14        && cta cte historica impresora/pantalla
   	if COD_HACER=15
		   if !pideclav(1)
			return
		endif
	endif
      =XSEEK(M.CODCLI,"PER","CODCLI")
      STORE .T. TO RESUMEN
      =OPCCLH()
      SELE CCLH
      SET ORDER TO TAG CODCLI
      store {} to m.fecini,m.fecfin
	if entre_fe("a Listar")
      =seek(m.codcli,"PER")
          ELCLI=PER.CODCLI
         #IF "Wind" $ vers()
              tmp=GENTMP()
              sele cclH
              sort on fechaop to (tmp) for codcli=m.codcli .and. fechaop<=m.fecfin
              use (tmp) alias CCLH
              REPL ALL GY_DEBE WITH 0,GY_HABER WITH 0
              REPL GY_DEBE WITH MONTO ;
               	FOR COMPRRE="FA" .OR. ;   
		       COMPRRE="ND" .OR. ;   
		       COMPRRE="SD" 
              REPL GY_HABER WITH ABS(MONTO) FOR EMPTY(GY_DEBE)
              CALC SUM(GY_DEBE), SUM(GY_HABER) TO TGY_DEBE, TGY_HABER ;
              	for fechaop<m.fecini
              STORE TGY_DEBE-TGY_HABER TO TGY_SALDO 
              dele for fechaop<m.fecini
              go top
		scatter memv
		append blank
		gather memv
		repl fechaop with m.fecini-1
		repl monto with tgy_saldo
		repl detalle with "Saldo anterior"
		repl comprre   with " "
		repl numerore with " "
		inde on fechaop tag fecha
		set orde to fecha
               if cod_hacer=14
                  repo form LCCLUH2 prev noconsole 
               else
                  repo form LCCLUH to prin PROMPT noconsole
               endif
               =OFF_TMP()
      #ELSE
      =dotalk()
      =working()
      TTQUE=CHR(13)+CHR(10)+ALLTRIM(PER.CLIENTE)+" ("+ALLTRIM(PER.CODCLI)+")"
      tt=alltrim(per.cliente)+" ("+per.codcli+")"+;
      crlf+;
      "Operaciones Hist¢ricas"
      tmp=gentmp()
      sele cclh
      =flock() .or. flok()
      sort on fechaop TO (TMP) for cclh.codcli=per.codcli
      =unlo_prx("cclh",tmp)
      acla=paip+"  FECHA "+PAIP+;
PADC("DETALLE",30)+PAIP+;
PADC("COMPROBANTE",20)+PAIP+;
PADC("SALDO",XACDIGI)+PAIP
      =xprn1(4,"tmp","lcclh0()",per.codcli,"lcclh",.T.,right(picumax,xacdigi))
      =unwork()
      =untalk()
      =off_tmp()
      #ENDIF
         ELSE
            WAIT "EL CLIENTE "+ALLTRIM(PER.CLIENTE)+" NO PRESENTA MOVIMIENTOS" WIND
         ENDIF
   CASE COD_HACER=16        && cta cte PROVEEDORES
      =OPCCP()
      SELE CCP
      SET ORDER TO
      TMP=GENTMP()
      =FLOCK() .OR. FLOK()
      SORT ON FECHAOP TO (TMP) FOR PROCOD=PER.CODCLI
      =UNLO_PRX("CCP",TMP)
      REPL ALL GY_DEBE WITH 0,GY_HABER WITH 0
      REPL GY_DEBE WITH MONTO FOR ESDEBE(COMPRRE)
      REPL GY_HABER WITH MONTO FOR EMPTY(GY_DEBE)
      IF _WINDOWS
      IF PRO_TIPO="CCLPRP" 
                REPO FORM LCCP PREV
      ELSE
          REPO FORM LCCP TO PRIN PROM NOCONSOLE
          ENDIF
      ELSE
      CANT_MAX=8
      EXTERNAL PROCEDURE LCCP10
      DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], Habilitado[CANT_MAX],habilant[cant_max]
      TEXTO[1,2]=8
      TEXTO[2,2]=8
      TEXTO[3,2]=30
      TEXTO[4,2]=23
      TEXTO[5,2]=14
      TEXTO[6,2]=XACDIGI
      TEXTO[7,2]=XACDIGI
      TEXTO[8,2]=XACDIGI
      TEXTO[1,1]=" F.OPER "
      TEXTO[2,1]=" F.VENC "
      TEXTO[3,1]=PADC("DETALLE",30)
      TEXTO[4,1]=PADC("COMPROBANTE",23)
      TEXTO[5,1]=PADC("NUMERO",14)
      TEXTO[6,1]=PADC("DEBE",XACDIGI)
      TEXTO[7,1]=PADC("HABER",XACDIGI)
      TEXTO[8,1]=PADC("SALDO",XACDIGI)
      store .t. to habilitado
      TT="Listado de Cuenta Corriente"+;
        crlf+;
        alltrim(per.cliente)+" ("+alltrim(per.codcli)+")"
      DO WHILE CFGFAC()
         ACLA=HAZ_ACLA()
         =XPRN1(4,"TMP","LCCP10()",PER.CODCLI,"LCCLP1",3,RIGHT(PICUMAX,XACDIGI))
      ENDDO
      ENDIF
      =OFF_TMP()
   CASE COD_HACER=20        && COBRADO ALQUILERES E IMPUESTOS
   DO ICOB WITH .T.
   CASE COD_HACER=21		&& ASIGNA TRANSPORTE
     M.ELCLICOD=PER.CODCLI
     M.ELCLI=PER.CLIENTE
     STORE 0 TO M.RESPUESTA
      STORE NUL TO M.RESPUESTA
      IF ELITPT("correspondiente",-1,1)
         =UNWORK()
         IF CONFIRMA("ASIGNAR A "+ALLTRIM(M.ELCLI)+;
         " EL TRANSPORTE "+ALLTRIM(PER.CLIENTE),;
         .t.,20,0)
         M.ELTRA=PER.CODCLI
            IF XSEEK(M.ELCLICOD,"PER","CODCLI")
                REPL TEXTO3 WITH M.ELTRA
            ENDIF
         ENDIF
      ENDIF
   ENDCASE
   =UNWORK()
   RETURN .T.
 
