PROCEDURE HORAS
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF

ULPR=HORA_ULP(PROGRAM())
H_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE H_DIJO="Ingreso de Horas"
DO EMPL
CASE H_DIJO="Listados"
respuesta='LHOR#4#20#Listado de Horas Trabajadas#3;
#Un \<Empleado;
#Un Tipo de \<Hora;
#\<Resumen Mensual'
=defpop()
ON SELE POPU LHOR DO LHOR
ACTI POPU LHOR
RELE POPU LHOR
ULPR=HORA_ULP(PROGRAM())
CASE H_DIJO="Backup en disco" .or. H_DIJO="Recupera Backup"
bacap=(H_DIJO="Backup en disco")
tex1=iif(bacap,"Respaldar","Recuperar")
        M.MESANIO=MESANIO("Mes a "+tex1,.t.,.t.)
        IF !EMPTY(M.MESANIO)
           m.elmes=val(left(mesanio,2))
           m.elanio=val(right(mesanio,4))
tex2=iif(bacap,"Backup","Recuperaci¢n")
          
		   M.ALGUN=ALGUN(30,"Disco de "+tex2,;
		   "Disco \<A;Disco \<B;An\<ula "+tex2)
		   IF M.ALGUN#3
tex3=iif(bacap,;
"realizar Back-Up en el",;
"restaurar informacion del")+;
" disco "+iif(m.algun=1,"A:","B:")
		      IF CARTEL("Usted est  por "+tex3,;
		      "del archivo del mes de "+qmes(m.ELmes)+" de "+str(m.ELanio,4),;
		      "Por favor, coloque el disco en la diskettera correspondiente y",;
		      "oprima [ENTER] para continuar o [ESC] para anular la operaci¢n")#27
		         =OPHOR()
		         =WORKING()
		         =DOTALK()
		         SELE HOR
                 LABASE=iif(m.algun=1,"A","B")+":\"+LEFT(qmes(m.ELmes),3)+"-"+RIGHT(str(m.ELanio,4),2)
                 if bacap
                 COPY TO (LABASE) FOR MONTH(FECHAOP)=m.elmes .AND. ;
                 YEAR(FECHAOP)=m.elanio
                 else
                 appe from (labase)
                 endif
		         =UNWORK()		         
		         =UNTALK()
		         =iif(bacap,WNCL("BACKUP TERMINADO SATISFACTORIAMENTE"),wncl("RECUPERACION REALIZADA SATISFACTORIAMENTE"))
		      ELSE
		         WAIT "BACKUP ANULADO" WIND NOWA
		      ENDIF
		   ENDIF
        ELSE
           =NOSELEC("FECHA")
        ENDIF
CASE H_DIJO="Depura Archivo"
        M.MESANIO=MESANIO("Mes a Depurar",.t.,.t.)
        IF !EMPTY(M.MESANIO)
           m.elmes=val(left(mesanio,2))
           m.elanio=val(right(mesanio,4))
		      IF CARTEL("Usted est  por BORRAR LOS REGISTROS",;
		      "del archivo del mes de "+qmes(m.ELmes)+" de "+str(m.ELanio,4),;
		      "Si no ha hecho Back-Up de los mismos perder  la informaci¢n irremisiblemente",;
		      "oprima [ENTER] para continuar o [ESC] para anular el borrado")#27
		         =OPHOR(.T.)
		         =WORKING()
		         =DOTALK()
		         SELE HOR
                 DELE FOR MONTH(FECHAOP)=m.elmes .AND. ;
                 YEAR(FECHAOP)=m.elanio
                 PACK
                 =OPHOR(.F.,.T.)
		         =UNWORK()		         
		         =UNTALK()
		         =WNCL("ARCHIVO DEPURADO SATISFACTORIAMENTE")
		   ELSE
              =WNCL("DEPURACION ANULADA")		   
		   ENDIF
        ELSE
           =NOSELEC("FECHA")
        ENDIF
CASE H_DIJO="Reindexa Base"
  =xhor()
ENDCASE
=RELEWIN("WIN")
RETURN MEN_LIN(BOTOM)

PROCEDURE LHOR
ULPR=HORA_ULP(PROGRAM())
LH_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE LH_DIJO="Un Empleado"
DO EMPL WITH "Listado de Horas"
CASE LH_DIJO="Resumen Mensual"
EXTERNAL PROCEDURE LHOR10
        M.MESANIO=MESANIO("Mes a Listar",.t.,.t.)
        IF !EMPTY(M.MESANIO)
           =opmix()
           =ophor()
           =working()
           =dotalk()
           TMP=GENTMP()
           =CLOSDBF("TEMPORIA")
           create CURSOR TEMPORIA ;
           (FIELD_NAME c(10),;
           FIELD_TYPE c(1),;
           FIELD_LEN n(3),;
           FIELD_DEC n(3),;
           FECHA D(8),;
           USUARIO C(10))
           sele mix
           set order to tag thotex
           STORE 0 TO TOTHOR
           scan
              TOTHOR=TOTHOR+1
              m.field_name=alltrim(mix.texto2)
              m.field_type="N"
              m.field_len=5
              m.field_dec=2
              =agrabar("temporia")
           endscan
            m.field_name="CODCLI"
            m.field_type="C"
            m.field_len=10
            m.field_dec=0
            =agrabar("temporia")
            m.field_name="usuario"              
            =agrabar("temporia")              
            m.field_name="cliente"
            m.field_len=30
            =agrabar("temporia")              
              m.field_name="fecha"
              m.field_type="D"
              m.field_len=8
              m.field_dec=0
              =agrabar("temporia")
           tmp1=gentmp()
           =PRXAREA(.T.)           
           CREATE (TMP1) FROM DBF("TEMPORIA")
           USE
           =PRXAREA(.T.)
           USE (TMP1) ALIAS TMP1 EXCL
           INDEX ON CODCLI TAG CODCLI
           SELE HOR
           m.elmes=val(left(mesanio,2))
           m.elanio=val(right(mesanio,4))
          SCAN FOR year(fechaop)=m.elanio .and. ;
             month(fechaop)=m.elmes
           IF !XSEEK(HOR.CODCLI,"TMP1","CODCLI")
              SCAT MEMV BLAN
              M.CODCLI=HOR.CODCLI
              =agrabar("tmp1")
           ENDIF
           IF !EMPTY(HOR.THO1)           
           SELE TMP1
           =XSEEK(HOR.CODCLI,"TMP1","CODCLI")           
           COSA=EVAL(HOR.THO1)
           DIFF=SUMAHORA(HOR.SALIDA1,HOR.ENTRADA1,.T.)
           DIFF=SUMAHORA(COSA,DIFF)
           REPL (HOR.THO1) WITH DIFF
           SELE HOR
           ENDIF
           IF !EMPTY(HOR.THO2)           
           SELE TMP1
           =XSEEK(HOR.CODCLI,"TMP1","CODCLI")           
           COSA=EVAL(HOR.THO2)
           DIFF=SUMAHORA(HOR.SALIDA2,HOR.ENTRADA2,.T.)
           DIFF=SUMAHORA(COSA,DIFF)
           REPL (HOR.THO2) WITH DIFF
           SELE HOR
           ENDIF
           IF !EMPTY(HOR.THO3)           
           SELE TMP1
           =XSEEK(HOR.CODCLI,"TMP1","CODCLI")           
           COSA=EVAL(HOR.THO3)
           DIFF=SUMAHORA(HOR.SALIDA3,HOR.ENTRADA3,.T.)
           DIFF=SUMAHORA(COSA,DIFF)
           REPL (HOR.THO3) WITH DIFF
           SELE HOR
           ENDIF
           ENDSCAN
           =OPPER()
           SELE TMP1
           SELE MIX
           ACLA=""
           SCAN
           ACLA=ACLA+;
           PADC(LEFT(TEXTO2,2)+"/"+ALLTRIM(MIX.TEXTO1),XACDIGI)+PAIP
           ENDSCAN
           ACLA=ACLA+PADC("TOTAL",XACDIGI)+PAIP
           TT="Resumen de Horas Trabajadas"+;
           crlf+;
           qmes(m.ELmes)+" de "+str(m.ELanio,4)
           ACLAPAN=PAIP+"  CODIGO  "+PAIP+ACLA           
           ACLAPRN=PAIP+"  CODIGO  "+PADC("EMPLEADO",30)+PAIP+ACLA                      
           TOTHOR=TOTHOR+1
           DIME TOTAL[TOTHOR]
           STORE NUL TO TOTAL
           =XPRN1(4,"TMP1","LHOR10()","RESUMEN "+M.MESANIO,"LHORES",TOTHOR)
		   =OFF_TMP()               
           =UNTALK()
           =UNWORK()
        ELSE
           =NOSELEC("FECHA")
        ENDIF
ENDCASE
=RELEWIN("WIN")
RETURN MEN_LIN(BOTOM)