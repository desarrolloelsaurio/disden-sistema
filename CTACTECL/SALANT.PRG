PUBLIC botom, aba
botom = "  "+REPL("°",78)
aba   = "Abriendo Base de "
SET DATE BRIT
SET CENT ON
SET CONF OFF
SET SAFE OFF

*******  busca el directorio
STORE FOPEN('c:\salant.ini') TO file_handle
= FGETS(handle, caminito)
= FCLOSE(file_handle)						
if empty(caminito)
	wait "FALTA C:\SALANT.INI" wind
	return
endif
******STORE IIF(EMPTY(GETENV("TEMP")),"C:\TMP",GETENV("TEMP")) TO pathtmp

m.fecini=infec("WIN","Límite del Saldo")
IF LAST()#27 .AND. !EMPTY(m.fecini)
	IF confirma("Cierre anual ....  Calcular saldo al "+DTOC(m.fecini),.T.,10,10)
		use (caminito+"cccli") alias ccl
		use (caminito+"ccclih") alias cclh
		=working()
		=dotalk()
		tmp  = "c:\tempo1"
		tmp1 = "c:\tempo2"
		SELECT *, gy_debe  AS gy_debec1, ;
			gy_haber AS gy_haberc1, ;
			gy_debe  AS gy_debec2, ;
			gy_haber AS gy_haberc2 ;
			FROM ccl WHERE fechaop<=m.fecini INTO TABLE (tmp)
		SELE (tmp)
		**
		REPL ALL gy_debe WITH 0.00 ,gy_haber WITH 0.00
		REPL gy_debe  WITH monto FOR esdebe(comprre)
		REPL gy_haber WITH monto FOR EMPTY(gy_debe)
		**
		REPL ALL gy_debec1 WITH 0.00 ,gy_haberc1 WITH 0.00
		REPL gy_debec1  WITH comision FOR esdebe(comprre)
		REPL gy_haberc1 WITH comision FOR EMPTY(gy_debec1)
		**
		REPL ALL gy_debec2 WITH 0.00 ,gy_haberc2 WITH 0.00
		REPL gy_debec2  WITH comisip FOR esdebe(comprre)
		REPL gy_haberc2 WITH comisip FOR EMPTY(gy_debec2)
		**
		INDEX ON codcli TAG codcli
		SET ORDER TO TAG codcli
		TOTAL ON codcli ;
			FIELD gy_debe,   gy_haber, ;
			gy_debec1, gy_haberc1, ;
			gy_debec2, gy_haberc2 ;
			TO (tmp1)
		DELE FOR comprre="SA" .OR. comprre="SD"
		PACK
		=prxarea(.T.)
		USE (tmp1) ALIAS tmp1 EXCL
		DELE FOR gy_debe=gy_haber
		PACK
		SELE ccl
		DELE FOR fechaop<=m.fecini
		PACK
		SCAT MEMV BLAN
		m.fechaop=m.fecini
		m.fechave=m.fecini
		m.detalle="Saldo al "+DTOC(m.fecini)
		SELE tmp1
		SCAN
			m.monto=ABS(tmp1.gy_debe-tmp1.gy_haber)
			m.comision=ABS(tmp1.gy_debec1-tmp1.gy_haberc1)
			m.comisip=ABS(tmp1.gy_debec2-tmp1.gy_haberc2)
			m.comprre=IIF(tmp1.gy_debe>tmp1.gy_haber,"SD","SA")
			m.codcli=tmp1.codcli
			INSERT INTO ccl FROM MEMV
			SELE tmp1
		ENDSCAN
		SELE cclh
		APPE FROM DBF("TEMPO1")
		UNLO ALL
		=untalk()
		=unwork()
	ENDIF
ENDIF
