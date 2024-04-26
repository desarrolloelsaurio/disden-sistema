use \\bochi\zip\ventasa\cccli  alias ccl  in 1
use \\bochi\zip\ventasa\ccclih alias cclh in 2
sele ccl
scan for USUARIO="BOCHI" and comprre="RE" and year(fechaop)=2009
	
	m.rec=recn()
	m.qarea=sele()
	m.cualfec=fechaop
	m.codcli=codcli
	m.monto=monto
	
	store 0 to m.comision, M.COMISIP
	
	do calcacom with alltr(numerore)
	
	sele ccl
	goto m.rec
	replace gy_haber with m.comision

endscan
retu

procedure calcacom
para elreci
if empty(elreci)
	select * from cclh 	;
	     where CODCLI=M.CODCLI AND fechaop<=m.cualfec and !dele();
	     union;
		 select * from ccl 	;
		     where CODCLI=M.CODCLI AND fechaop<=m.cualfec AND comprre#"SD" and comprre#"SA" and !dele();
	    	 into cursor tmp0
else
	select * from cclh 	;
	     where CODCLI=M.CODCLI AND fechaop<=m.cualfec and (empty(numerore) OR alltr(numerore)#elreci) and !dele();
	     union;
		 select * from ccl 	;
		     where CODCLI=M.CODCLI AND fechaop<=m.cualfec and (empty(numerore) OR alltr(numerore)#elreci) and comprre#"SD" and comprre#"SA" and !dele();
	    	 into cursor tmp0
endif
TMP1=gentmp()
sele tmp0
SORT ON FECHAOP, COMPRRE TO (TMP1)
use in tmp0

USE (TMP1) IN 0 ALIAS TMP
SELE TMP
m.elarea = sele()
REPL ALL GY_DEBE WITH 0,GY_HABER WITH 0
REPL GY_DEBE WITH MONTO ;
	FOR COMPRRE="FA" .OR. COMPRRE="ND" 
REPL GY_HABER WITH ABS(MONTO) FOR EMPTY(GY_DEBE)
CALC SUM(GY_DEBE), SUM(GY_HABER) TO TGY_DEBE, TGY_HABER 
STORE TGY_DEBE-TGY_HABER TO TGY_SALDO 
TOTPAGO=TGY_HABER
SCAN FOR !EMPTY(GY_DEBE) 
	IF GY_DEBE>TOTPAGO
		EXIT
	ENDIF
	TOTPAGO = TOTPAGO - GY_DEBE
ENDSCAN
LACOMI = 0
LACOMIP= 0
tcontado = 0
IF !EOF()
	REPL GY_DEBE WITH GY_DEBE - TOTPAGO
	M.PAGARA = M.MONTO
	
	if !empty(elreci)
		tmp2=gentmp()
		copy stru to (tmp2)
		use (tmp2) in 0 alias tmp2
	endif	
	DO WHILE !EOF()
		IF !EMPTY(GY_DEBE) 
			IF M.PAGARA > GY_DEBE
				LACOMI = LACOMI + (GY_DEBE * COMISION)/ MONTO
				LACOMIP = LACOMIP + (GY_DEBE * COMISIP)/ MONTO
				if !empty(elreci)
					scatter memvar
					m.equivale = (GY_DEBE * COMISION)/ MONTO
					insert into tmp2 from memvar
				endif
				if fechaop+7 > date()
					tcontado = tcontado + GY_DEBE
				endif
				M.PAGARA = M.PAGARA - GY_DEBE
			ELSE
				LACOMI = LACOMI + (M.PAGARA * COMISION)/ MONTO				
				LACOMIP = LACOMIP + (M.PAGARA * COMISIP)/ MONTO
				if !empty(elreci)
					scatter memvar
					m.equivale = (M.PAGARA * COMISION)/ MONTO
					insert into tmp2 from memvar
				endif
				if fechaop+7 > date()
					tcontado = tcontado + M.PAGARA
				endif
				EXIT
			ENDIF
		ENDIF
		SKIP
	ENDDO
ENDIF
=OFF_TMP(m.elarea) 
m.comision=LACOMI 
M.COMISIP =LACOMIP
return

function gentmp
return sys(3)

function oFF_TMP
para aa
if used("tmp") 
	use in tmp
endif
if used("tmp0") 
	use in tmp0
endif
if used("tmp1") 
	use in tmp1
endif
if used("tmp2") 
	use in tmp2
endif
return
