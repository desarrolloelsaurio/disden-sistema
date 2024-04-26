********************************************************************************
*-- Programa: ICHED1.PRG
*-- Fecha   : 02-26-93 05:20pm
*-- Version : G. REINER
*-- Notas   : GRABA INGRESOS DE VALORES DIFERIDOS
********************************************************************************
FUNCTION ICHED1
	PARAMETER I_TIPO
	SELE CCH
	SCAT MEMV BLAN
	STORE DATE() TO M.FECHAOP
	IF ICHED2()
	   =WORKING()
		STORE M.ELGASTO TO M.GASTO
		STORE M.I_TIPO TO M.TIPO
		STORE XAUSS TO M.MONEDA
		FOR I_A=1 TO ALEN(FAXT,1)
			STORE FAXT[I_A,5] TO M.BANCO
			STORE FAXT[I_A,4] TO M.NROCHE
			STORE FAXT[I_A,2] TO M.MONTO
			STORE FAXT[I_A,3] TO M.FECHADE
			STORE FAXT[I_A,6] TO M.DIASAC
			=AGRABAR("CCH")
			IF I_TIPO='TA'
               STORE 'TA' TO M.CAJA
               M.EQUIVALE=M.MONTO/M.XACOTIZ
			   =AGRABAR("CAJ")
			ENDIF
		NEXT
		=UNWORK()
	ENDIF
RETURN
