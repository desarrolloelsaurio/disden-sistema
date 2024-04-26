public BOTOM, ABA
BOTOM = "  "+repl("°",78)
ABA   = "Abriendo Base de "
set date brit
set cent on
set conf off
set safe off
=getpath2()
ULPR=HORA_ULP(PROGRAM())
=OPCCL()
=OPPER()
M.FECINI=INFEC("WIN","Límite del Saldo")
IF LAST()#27 .AND. !EMPTY(M.FECINI)
     IF CONFIRMA("Cierre anual ....  Calcular saldo al "+dtoc(m.fecini),.t.,10,10)
          =OPCCLH()
          =OPCCL()
          =WORKING()
          =DOTALK()
          TMP  = "c:\tempo1"
          TMP1 = "c:\tempo2"
******          =FLOCK() .OR. FLOK()
          select *, gy_debe  as gy_debec1, ;
          			gy_haber as gy_haberc1, ; 
          			gy_debe  as gy_debec2, ;
          			gy_haber as gy_haberc2 ;
                from ccl where FECHAOP<=M.FECINI into table (tmp)              
susp
******          COPY TO (TMP) FOR FECHAOP<=M.FECINI
******          =PRXAREA(.T.)
*******          USE (TMP) ALIAS TMP EXCL
		  sele (tmp)
**
          REPL ALL GY_DEBE WITH 0.00 ,GY_HABER WITH 0.00
          REPL GY_DEBE  WITH MONTO FOR ESDEBE(COMPRRE)
          REPL GY_HABER WITH MONTO FOR EMPTY(GY_DEBE)
**
          REPL ALL GY_DEBEc1 WITH 0.00 ,GY_HABERc1 WITH 0.00
          REPL GY_DEBEc1  WITH comision FOR ESDEBE(COMPRRE)
          REPL GY_HABERc1 WITH comision FOR EMPTY(GY_DEBEc1)
**
          REPL ALL GY_DEBEc2 WITH 0.00 ,GY_HABERc2 WITH 0.00
          REPL GY_DEBEc2  WITH comisip FOR ESDEBE(COMPRRE)
          REPL GY_HABERc2 WITH comisip FOR EMPTY(GY_DEBEc2)
**          
          INDEX ON CODCLI TAG CODCLI
          SET ORDER TO TAG CODCLI
          TOTAL ON CODCLI ;
          		FIELD GY_DEBE,   GY_HABER, ;
          		      GY_DEBEc1, GY_HABERc1, ;
          		      GY_DEBEc2, GY_HABERc2 ;
          		TO (TMP1)
          DELE FOR COMPRRE="SA" .OR. COMPRRE="SD"
          PACK
          =PRXAREA(.T.)
          USE (TMP1) ALIAS TMP1 EXCL
          DELE FOR GY_DEBE=GY_HABER
          PACK
          SELE CCL
          DELE FOR FECHAOP<=M.FECINI
          pack
          SCAT MEMV BLAN
          M.FECHAOP=M.FECINI
          M.FECHAVE=M.FECINI
          M.DETALLE="Saldo al "+dtoc(m.fecini)
          SELE TMP1
          SCAN
               m.monto=ABS(tmp1.gy_debe-tmp1.gy_haber)
               m.comision=ABS(tmp1.gy_debec1-tmp1.gy_haberc1)
               m.comisip=ABS(tmp1.gy_debec2-tmp1.gy_haberc2)
               m.comprre=iif(tmp1.gy_debe>tmp1.gy_haber,"SD","SA")
               M.CODCLI=TMP1.CODCLI
               insert into CCL from memv
******               =AGRABAR("CCL")
               SELE TMP1
          ENDSCAN
          SELE CCLH
          APPE FROM DBF("TEMPO1")
*****        =IAUD(DTOC(M.FECINI))
          UNLO ALL
          =UNTALK()
          =UNWORK()
**          =OFF_TMP()
**          do comihist
     ENDIF
ENDIF
