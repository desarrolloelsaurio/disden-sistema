PROCEDURE COMIHIST
DEFI WIND A FROM 20,20 TO 25,80
ACTI WIND A
SET TALK WINDOW A
SET ECHO ON
ON ERROR
ULPR=HORA_ULP(PROGRAM())

=OPAUD()
=opcclh()
set dele off
=opccl()
scan FOR comprre="SD"
	do while !lock()
		wait "REINTENTE" wind
		if lastkey()=27
			return
		endif
	enddo
	M.LACOMI  =  0	
	M.LACOMIP =  0
	= otracomi()
	newval  = M.LACOMI
	newvalp = M.LACOMIP
	?codcli, newval, newvalp
	repl comision with newval, comisip with newvalp
	unlock
ends
RELE WIND A
RETURN

function otracomi
sele cclh
TMP1=gentmp()
SORT ON FECHAOP /D, COMPRRE /D TO (TMP1) ;
	FOR (COMPRRE="FA" .OR. COMPRRE="ND") ;
	    .AND. CODCLI=ccl.CODCLI 
USE (TMP1) IN 0 ALIAS TMP
SELE TMP
m.elarea  = sele()
M.LACOMI  =  0
M.LACOMIP =  0
M.PAGARA  = ccl.MONTO
SCAN 
	if M.PAGARA > monto
		M.LACOMI  = M.LACOMI  + comision
		M.LACOMIP = M.LACOMIP + comisip
		M.PAGARA  = M.PAGARA  - monto
	else
		M.LACOMI  = M.LACOMI  + (M.PAGARA * comision)/ monto
		M.LACOMIP = M.LACOMIP + (M.PAGARA * comisip)/ monto
		exit
	endif
ENDSCAN
sele tmp
OFF_BASE=FULL(DBF())
USE
OFF_RAIZ=LEFT(OFF_BASE,RAT(".",OFF_BASE))
ERASE (OFF_BASE)
ERASE (OFF_RAIZ+"CDX")
ERASE (OFF_RAIZ+"IDX")
ERASE (OFF_RAIZ+"FPT")
ERASE (OFF_RAIZ+"BAK")
sele ccl
retu M.LACOMI


function unacomi
sele cclh
TMP1=gentmp()
m.codcli=ccl.codcli
m.monto=ccl.monto
SORT ON FECHAOP, COMPRRE TO (TMP1) ;
	FOR CODCLI=M.CODCLI 
USE (TMP1) IN 0 ALIAS TMP
SELE TMP
m.elarea = sele()
REPL ALL GY_DEBE WITH 0,GY_HABER WITH 0
REPL GY_DEBE WITH MONTO ;
	FOR COMPRRE="FA" .OR. ;   
		COMPRRE="ND" .OR. ;   
		COMPRRE="SD" 
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
LACOMI =  0
IF !EOF()
	REPL GY_DEBE WITH GY_DEBE - TOTPAGO
	M.PAGARA = M.MONTO
	
*******	tmp2=gentmp()
*******	copy stru to (tmp2)
*******	use (tmp2) in 0 alias tmp2

	DO WHILE !EOF()
		IF !EMPTY(GY_DEBE) 

			scatter memvar

			IF M.PAGARA > GY_DEBE
				LACOMI = LACOMI + (GY_DEBE * COMISION)/ MONTO
				
				m.equivale = (GY_DEBE * COMISION)/ MONTO
*******				insert into tmp2 from memvar

				M.PAGARA = M.PAGARA - GY_DEBE
			ELSE
				LACOMI = LACOMI + (M.PAGARA * COMISION)/ MONTO
				
				m.equivale = (M.PAGARA * COMISION)/ MONTO
*******				insert into tmp2 from memvar

				EXIT
			ENDIF
		ENDIF
		SKIP
	ENDDO
ENDIF
sele tmp
OFF_BASE=FULL(DBF())
USE
OFF_RAIZ=LEFT(OFF_BASE,RAT(".",OFF_BASE))
ERASE (OFF_BASE)
ERASE (OFF_RAIZ+"CDX")
ERASE (OFF_RAIZ+"IDX")
ERASE (OFF_RAIZ+"FPT")
ERASE (OFF_RAIZ+"BAK")
sele ccl
retu LACOMI
