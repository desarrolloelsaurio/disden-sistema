FUNCTION CHEQEMPR
	STORE .T. TO SALIDA
	IF RECC()=16
		RELE PRS
		DIME prs[16]
		PRS[1]=CHR(66)+CHR(69)+CHR(76)+CHR(84)+CHR(82)+CHR(65)+CHR(77)+CHR(69)+CHR(32)+CHR(79)+CHR(76)+CHR(71)+CHR(65)+CHR(32)+CHR(67)+CHR(46)+CHR(32)+CHR(66)+CHR(69)+CHR(76)+;
		CHR(84)+CHR(82)+CHR(65)+CHR(77)+CHR(69)+CHR(32)+CHR(74)+CHR(85)+CHR(65)+CHR(78)
		PRS[2]=CHR(65)+CHR(83)+CHR(79)+CHR(67)+CHR(73)+CHR(65)+CHR(67)+CHR(73)+CHR(79)+CHR(78)+CHR(32)+CHR(67)+CHR(73)+CHR(82)+CHR(67)+CHR(85)+CHR(76)+CHR(79)+CHR(32)+CHR(77)+;
		CHR(65)+CHR(71)+CHR(73)+CHR(83)+CHR(84)+CHR(69)+CHR(82)+CHR(73)+CHR(79)+CHR(32)+CHR(68)+CHR(69)+CHR(32)+CHR(82)+CHR(79)+CHR(83)+CHR(65)+CHR(82)+CHR(73)+CHR(79)
		PRS[3]=CHR(66)+CHR(85)+CHR(89)+CHR(79)+CHR(78)+CHR(32)+CHR(38)+CHR(32)+CHR(69)+CHR(83)+CHR(67)+CHR(65)+CHR(66)+CHR(73)+CHR(79)+CHR(32)+CHR(83)+CHR(78)+CHR(65)+CHR(67)+;
		CHR(75)+CHR(32)+CHR(66)+CHR(65)+CHR(82)
        PRS[4]=CHR(74)+CHR(79)+CHR(82)+CHR(71)+CHR(69)+CHR(32)+CHR(76)+CHR(85)+CHR(73)+CHR(83)+CHR(32)+CHR(65)+CHR(78)+CHR(71)+CHR(69)+CHR(76)+CHR(73)+CHR(78)+CHR(73)
        PRS[5]=chr(66)+chr(69)+chr(76)+chr(84)+chr(82)+chr(65)+chr(77)+chr(69)+chr(32)+chr(74)+chr(85)+chr(65)+chr(78)+chr(32)+chr(67)+chr(65)+chr(82)+chr(76)+chr(79)+chr(83)
        PRS[6]=chr(83)+chr(46)+chr(80)+chr(46)+chr(67)+chr(46)+chr(32)+chr(82)+chr(79)+chr(84)+chr(85)+chr(76)+chr(65)+chr(67)+chr(73)+chr(79)+chr(78)+chr(32)+chr(67)+chr(79)+;
        chr(77)+chr(80)+chr(85)+chr(84)+chr(65)+chr(68)+chr(65)
        PRS[7]=chr(80)+chr(73)+chr(90)+chr(90)+chr(69)+chr(82)+chr(73)+chr(65)+chr(32)+chr(34)+chr(68)+chr(79)+chr(78)+chr(32)+chr(78)+chr(73)+chr(67)+chr(79)+chr(76)+chr(65)+;
        chr(34)+chr(32)+chr(68)+chr(69)+chr(32)+chr(79)+chr(46)+chr(32)+chr(77)+chr(79)+chr(82)+chr(79)+chr(83)+chr(73)+chr(78)
        PRS[8]=chr(65)+chr(71)+chr(69)+chr(78)+chr(67)+chr(73)+chr(65)+chr(32)+chr(34)+chr(72)+chr(65)+chr(76)+chr(67)+chr(79)+chr(78)+chr(34)
        PRS[9]=chr(83)+chr(69)+chr(82)+chr(86)+chr(73)+chr(67)+chr(73)+chr(79)+chr(83)+chr(32)+chr(73)+chr(78)+chr(84)+chr(69)+chr(71)+chr(82)+;
        chr(65)+chr(76)+chr(69)+chr(83)+chr(32)+chr(68)+chr(69)+chr(76)+chr(84)+chr(65)+chr(32)+chr(67)+chr(79)+chr(79)+chr(46)+chr(84)+chr(82)+;
        chr(65)+chr(66)+chr(46)+chr(76)+chr(84)+chr(68)+chr(65)
        PRS[10]=chr(65)+chr(71)+chr(69)+chr(78)+chr(67)+chr(73)+chr(65)+chr(32)+chr(72)+chr(65)+chr(76)+chr(67)+chr(79)+chr(78)
        PRS[11]=chr(83)+chr(69)+chr(82)+chr(86)+chr(73)+chr(67)+chr(73)+chr(79)+chr(32)+chr(65)+chr(71)+chr(82)+chr(79)+chr(32)+chr(80)+chr(79)+;
        chr(82)+chr(84)+chr(85)+chr(65)+chr(82)+chr(73)+chr(79)        
        PRS[12]=chr(74)+chr(85)+chr(65)+chr(78)+chr(32)+chr(67)+chr(65)+chr(82)+chr(76)+chr(79)+chr(83)+chr(32)+chr(82)+chr(79)+chr(68)+chr(82)+;
        chr(73)+chr(71)+chr(85)+chr(69)+chr(90)
        PRS[13]=chr(73)+chr(86)+chr(79)+chr(32)+chr(82)+chr(46)+chr(32)+chr(80)+chr(65)+chr(76)+chr(65)+chr(68)+chr(73)+chr(78)+chr(73)
        PRS[14]=chr(69)+chr(76)+chr(69)+chr(67)+chr(84)+chr(82)+chr(79)+chr(78)+chr(73)+chr(67)+chr(65)+chr(32)+chr(76)+chr(73)+chr(78)+chr(68)+;
        chr(69)+chr(76)+chr(32)+chr(83)+chr(46)+chr(82)+chr(46)+chr(76)+chr(46)
        PRS[15]=chr(84)+chr(65)+chr(86)+chr(73)+chr(77)+chr(65)+chr(82)+chr(32)+chr(83)+chr(46)+chr(82)+chr(46)+chr(76)+chr(46)
        PRS[16]=chr(83)+chr(79)+chr(76)+chr(85)+chr(67)+chr(73)+chr(79)+chr(78)+chr(69)+chr(83)+chr(32)+chr(76)+chr(65)+chr(66)+;
        chr(79)+chr(82)+chr(65)+chr(76)+chr(69)+chr(83)+chr(32)+chr(82)+chr(79)+chr(83)+chr(65)+chr(82)+chr(73)+chr(78)+chr(65)+;
        chr(83)+chr(32)+chr(67)+chr(79)+chr(79)+chr(80)+chr(32)+chr(84)+chr(82)+chr(65)+chr(66)
		SCAN
			IF PRS[RECNO()]<>ALLTRIM(EMPRESA)
				QUIT
            ELSE
               WAIT PRS[RECNO()]+" OK " WIND NOWA				
			ENDIF
		ENDSCAN
		WAIT CLEA
	ELSE
		STORE .F. TO SALIDA
	ENDIF
RETURN SALIDA
