FUNCTION TER_SMO1
	PARAMETER XXXX
	PRIVATE XXXX,XXXA,XXXC1,XXXC2
	XXXC1=CHR(221)
	XXXC2=CHR(219)
	FOR XXXA=1 TO XXXX
		IF CNTR<COUNT
			CNTR=CNTR+1
			Z=INT((CNTR/COUNT)*100)
			IF Z>LAST_NUM
				LAST_NUM=Z
				IF Z/2 # INT(Z/2)
					@ 3,C SAY XXXC1
				ELSE
					@ 3,C SAY XXXC2
					C=C+1
				ENDIF
			ENDIF
		ENDIF
	NEXT 
RETURN .T.
