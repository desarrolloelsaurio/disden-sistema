FUNCTION FOR_SAY
	PARAMETER F_TEX,F_R1,F_R2,F_C1
	PRIVATE F_TEX,F_R1,F_R2,F_C1,RA
	FOR RA=F_R1 TO F_R2
		@ RA,F_C1 SAY F_TEX
	NEXT
RETURN .T.
