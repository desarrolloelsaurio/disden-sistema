@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
ulpr=program()
tt='Listado de Cheques Emitidos'
DO CASE
CASE BAR()=1
	SELE EMP
	@ 24,0 SAY PADC(" Ordenando el Archivo de Empleados ",80,'*') colo sche 19
	IF ORDLIS=1
		INDEX ON mejorsuel TO TMP1 FOR EMP->TOTAL>0 .AND. MEJORSUEL>0
	ELSE
		INDEX ON LEGAJO TO TMP1 FOR EMP->TOTAL>0 .AND. MEJORSUEL>0
	ENDIF
	goto top
	if .not. eof()
		tt=tt+' - Todos los Empleados'
		DO LCHEIE1
	endif
	SELE EMP
	USE
	B="LE"+LEFT(ptn[jannro],1)+'G'+SUBSTR(ptn[jannro],2,1)+'A'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
   USE (PATH+'\'+indice) INDEX (PATH+'\'+indice),(PATH+'\'+b) ALIAS emp
CASE BAR()=2
	store 0 to respuesta
	if elicat(" a Emitir")<>0
		goto respuesta
		xcos=recno()
		@ 24,0 SAY PADC(" Ordenando el Archivo de Empleados ",80,'*') colo sche 19
		sele emp
	IF ORDLIS=1
		INDEX ON mejorsuel TO TMP1 FOR EMP->TOTAL>0 .and. emp->cat=xcos .AND. MEJORSUEL>0
	ELSE
		INDEX ON LEGAJO TO TMP1 FOR EMP->TOTAL>0 .and. emp->cat=xcos .AND. MEJORSUEL>0
	ENDIF
	goto top
	if .not. eof()
		tt=tt+' - Por Categor¡a:'+cat->categoria
		DO LCHEIE1
		endif
	endif
	SELE EMP
	USE
	B="LE"+LEFT(ptn[jannro],1)+'G'+SUBSTR(ptn[jannro],2,1)+'A'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
   USE (PATH+'\'+indice) INDEX (PATH+'\'+indice),(PATH+'\'+b) ALIAS emp
CASE BAR()=3
	store 0 to respuesta
	if elicon(" a Emitir")<>0
		goto respuesta
		xcos=recno()
		@ 24,0 SAY PADC(" Ordenando el Archivo de Empleados ",80,'*') colo sche 19
		sele emp
	IF ORDLIS=1
		INDEX ON mejorsuel TO TMP1 FOR EMP->TOTAL>0 .and. emp->con=xcos .AND. MEJORSUEL>0
	ELSE
		INDEX ON LEGAJO TO TMP1 FOR EMP->TOTAL>0 .and. emp->con=xcos .AND. MEJORSUEL>0
	ENDIF
		goto top
		if .not. eof()
		tt=tt+' - Por Convenio:'+con->convenio
			DO LCHEIE1
		endif
	endif
	SELE EMP
	USE
	B="LE"+LEFT(ptn[jannro],1)+'G'+SUBSTR(ptn[jannro],2,1)+'A'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
   USE (PATH+'\'+indice) INDEX (PATH+'\'+indice),(PATH+'\'+b) ALIAS emp
CASE BAR()=4
	store 0 to respuesta
	if eliccos(" a Emitir")<>0
		goto respuesta
		xcos=recno()
		@ 24,0 SAY PADC(" Ordenando el Archivo de Empleados ",80,'*') colo sche 19
		sele emp
	IF ORDLIS=1
		INDEX ON mejorsuel TO TMP1 FOR EMP->TOTAL>0 .and. emp->ccos=xcos .AND. MEJORSUEL>0
	ELSE
		INDEX ON LEGAJO TO TMP1 FOR EMP->TOTAL>0 .and. emp->ccos=xcos .AND. MEJORSUEL>0
	ENDIF
		goto top
		if .not. eof()
		tt=tt+' - Por Centro de Costos:'+ccos->cencos
			DO LCHEIE1
		endif
	endif
	SELE EMP
	USE
	B="LE"+LEFT(ptn[jannro],1)+'G'+SUBSTR(ptn[jannro],2,1)+'A'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
   USE (PATH+'\'+indice) INDEX (PATH+'\'+indice),(PATH+'\'+b) ALIAS emp
CASE BAR()=5
	store 0 to respuesta
	if eliesp(" a Emitir")<>0
		goto respuesta
		xcos=recno()
		@ 24,0 SAY PADC(" Ordenando el Archivo de Empleados ",80,'*') colo sche 19
		sele emp
	IF ORDLIS=1
		INDEX ON mejorsuel TO TMP1 FOR EMP->TOTAL>0 .and. emp->esp=xcos .AND. MEJORSUEL>0
	ELSE
		INDEX ON LEGAJO TO TMP1 FOR EMP->TOTAL>0 .and. emp->esp=xcos .AND. MEJORSUEL>0
	ENDIF
		goto top
		if .not. eof()
		tt=tt+' - Por Especialidad'+esp->especiali
			DO LCHEIE1
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

