@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
ulpr=program()
DO CASE
CASE BAR()=1
	SELE EMP
	@ 24,0 SAY PADC(" Ordenando el Archivo de Empleados ",80,'*') colo sche 19
	IF ORDLIS=1
		INDEX ON APYNOM TO TMP1 FOR EMP->TOTAL>0
	ELSE
		INDEX ON LEGAJO TO TMP1 FOR EMP->TOTAL>0
	ENDIF
	goto top
	if .not. eof()
		DO LCHEI1
	endif
	SELE EMP
	USE
	B="LE"+LEFT(ptn[jannro],1)+'G'+SUBSTR(ptn[jannro],2,1)+'A'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
   USE (PATH+'\'+indice) INDEX (PATH+'\'+indice),(PATH+'\'+b) ALIAS emp
CASE BAR()=2
	store 0 to respuesta
	if eliemp(" a Emitir")<>0
		goto respuesta
		xcos=legajo
		@ 24,0 SAY PADC(" Ordenando el Archivo de Empleados ",80,'*') colo sche 19
		INDEX ON APYNOM TO TMP1 FOR emp->legajo=xcos .and. emp->total>0
		goto top
		if .not. eof()
			repl all mejorsuel with 0
			DO LCHEI1
		endif
	endif
	SELE EMP
	USE
	B="LE"+LEFT(ptn[jannro],1)+'G'+SUBSTR(ptn[jannro],2,1)+'A'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
   USE (PATH+'\'+indice) INDEX (PATH+'\'+indice),(PATH+'\'+b) ALIAS emp
CASE BAR()=3
	store 0 to respuesta
	if elicat(" a Emitir")<>0
		goto respuesta
		xcos=recno()
		@ 24,0 SAY PADC(" Ordenando el Archivo de Empleados ",80,'*') colo sche 19
		sele emp
	IF ORDLIS=1
		INDEX ON APYNOM TO TMP1 FOR EMP->TOTAL>0 .and. emp->cat=xcos
	ELSE
		INDEX ON LEGAJO TO TMP1 FOR EMP->TOTAL>0 .and. emp->cat=xcos
	ENDIF
		goto top
		if .not. eof()
			repl all mejorsuel with 0
			DO LCHEI1
		endif
	endif
	SELE EMP
	USE
	B="LE"+LEFT(ptn[jannro],1)+'G'+SUBSTR(ptn[jannro],2,1)+'A'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
   USE (PATH+'\'+indice) INDEX (PATH+'\'+indice),(PATH+'\'+b) ALIAS emp
CASE BAR()=4
	store 0 to respuesta
	if elicon(" a Emitir")<>0
		goto respuesta
		xcos=recno()
		@ 24,0 SAY PADC(" Ordenando el Archivo de Empleados ",80,'*') colo sche 19
		sele emp
	IF ORDLIS=1
		INDEX ON APYNOM TO TMP1 FOR EMP->TOTAL>0 .and. emp->con=xcos
	ELSE
		INDEX ON LEGAJO TO TMP1 FOR EMP->TOTAL>0 .and. emp->con=xcos
	ENDIF
		goto top
		if .not. eof()
			repl all mejorsuel with 0
			DO LCHEI1
		endif
	endif
	SELE EMP
	USE
	B="LE"+LEFT(ptn[jannro],1)+'G'+SUBSTR(ptn[jannro],2,1)+'A'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
   USE (PATH+'\'+indice) INDEX (PATH+'\'+indice),(PATH+'\'+b) ALIAS emp
CASE BAR()=5
	store 0 to respuesta
	if eliccos(" a Emitir")<>0
		goto respuesta
		xcos=recno()
		@ 24,0 SAY PADC(" Ordenando el Archivo de Empleados ",80,'*') colo sche 19
		sele emp
	IF ORDLIS=1
		INDEX ON APYNOM TO TMP1 FOR EMP->TOTAL>0 .and. emp->ccos=xcos
	ELSE
		INDEX ON LEGAJO TO TMP1 FOR EMP->TOTAL>0 .and. emp->ccos=xcos
	ENDIF
		goto top
		if .not. eof()
			repl all mejorsuel with 0
			DO LCHEI1
		endif
	endif
	SELE EMP
	USE
	B="LE"+LEFT(ptn[jannro],1)+'G'+SUBSTR(ptn[jannro],2,1)+'A'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
   USE (PATH+'\'+indice) INDEX (PATH+'\'+indice),(PATH+'\'+b) ALIAS emp
CASE BAR()=6
	store 0 to respuesta
	if eliesp(" a Emitir")<>0
		goto respuesta
		xcos=recno()
		@ 24,0 SAY PADC(" Ordenando el Archivo de Empleados ",80,'*') colo sche 19
		sele emp
	IF ORDLIS=1
		INDEX ON APYNOM TO TMP1 FOR EMP->TOTAL>0 .and. emp->esp=xcos
	ELSE
		INDEX ON LEGAJO TO TMP1 FOR EMP->TOTAL>0 .and. emp->esp=xcos
	ENDIF
		goto top
		if .not. eof()
			repl all mejorsuel with 0
			DO LCHEI1
		endif
	endif
	SELE EMP
	USE
	B="LE"+LEFT(ptn[jannro],1)+'G'+SUBSTR(ptn[jannro],2,1)+'A'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
   USE (PATH+'\'+indice) INDEX (PATH+'\'+indice),(PATH+'\'+b) ALIAS emp
case bar()=7
	store 0 to respuesta
	if eliemp(" a Emitir")<>0
		goto respuesta
		xcos=legajo
		@ 24,0 SAY PADC(" Ordenando el Archivo de Empleados ",80,'*') colo sche 19
	IF ORDLIS=1
		store emp->apynom to xcos
		INDEX ON APYNOM TO TMP1 FOR EMP->TOTAL>0 .and. emp->apynom>=xcos
	ELSE
		store emp->legajo to xcos
		INDEX ON LEGAJO TO TMP1 FOR EMP->TOTAL>0 .and. emp->legajo>=xcos
	ENDIF
	goto top
		if .not. eof()
			repl all mejorsuel with 0
			DO LCHEI1
		endif
	endif
	SELE EMP
	USE
	B="LE"+LEFT(ptn[jannro],1)+'G'+SUBSTR(ptn[jannro],2,1)+'A'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
   USE (PATH+'\'+indice) INDEX (PATH+'\'+indice),(PATH+'\'+b) ALIAS emp
ENDCASE
ULPR=PROGRAM()
@ 24,0 SAY SPACE(80)
RETURN
