FUNCTION LCCB2
	PARAMETER L_TEX,L_MON
	FUNCTION LCCB1
		#DEFINE PAIP   "|"                         && PAIP
		RETURN PAIP+;
			SPACE(8)+;
			PAIP+;
			PADR(L_TEX,15)+;
			PAIP+;
			SPACE(15)+;
			PAIP+;
			SPACE(15)+;
			PAIP+;
			SPACE(15)+;
			PAIP+;
			TRAN(L_MON,"@9999,999.99")+;
			PAIP

