FUNCTION LSALCCB2
	PARAMETER LSAL_TEX
	#DEFINE PAIP   "|"                            && PAIP
	#DEFINE PICU "9999,999.99"
	LSAL_SAL=PAIP+;
		PADR(LSAL_TEX,20)+;
		PAIP+;
		SPACE(20)+;
		PAIP+;
		TRANS(DEBE,PICU)+;
		PAIP+;
		TRANS(HABER,PICU)+;
		PAIP+;
		TRANS(DEBE-HABER,PICU)+;
		PAIP
RETURN LSAL_SAL
