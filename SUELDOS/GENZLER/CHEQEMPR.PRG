function cheqempr
	STORE .T. TO SALIDA
	IF RECC()=14
		RELE prs
		DIME prs[14]
		PRS[5]=CHR(77)+CHR(46)+CHR(32)+CHR(77)+CHR(46)+CHR(32)+CHR(82)+CHR(69)+CHR(80)+CHR(85)+CHR(69)+CHR(83)+CHR(84)+CHR(79)+CHR(83)+CHR(32)+CHR(83)+CHR(46)+CHR(65)+CHR(46)
		PRS[1]=CHR(77)+CHR(79)+CHR(84)+CHR(69)+CHR(76)+CHR(32)+CHR(76)+CHR(65)+CHR(83)+CHR(32)+CHR(66)+CHR(82)+CHR(85)+CHR(74)+CHR(65)+CHR(83)+CHR(32)+CHR(83)+CHR(46)+CHR(82)+;
		CHR(46)+CHR(76)+CHR(46)
		PRS[3]=chr(71)+chr(85)+chr(73)+chr(80)+chr(69)+chr(82)+chr(32)+chr(83)+chr(46)+chr(82)+chr(46)+chr(76)+chr(46)
		PRS[4]=CHR(80)+CHR(65)+CHR(76)+CHR(65)+CHR(68)+CHR(69)+CHR(77)+CHR(32)+CHR(83)+CHR(46)+CHR(82)+CHR(46)+CHR(76)+CHR(46)
		PRS[6]=CHR(82)+CHR(85)+CHR(66)+CHR(73)+CHR(79)+CHR(32)+CHR(65)+CHR(78)+CHR(84)+CHR(79)+CHR(78)+CHR(73)+CHR(79)+CHR(32)+CHR(69)+CHR(46)
		PRS[8]=chr(80)+chr(69)+chr(68)+chr(82)+chr(79)+chr(32)+chr(68)+chr(46)+chr(32)+chr(67)+chr(73)+chr(67)+chr(67)+chr(73)+chr(79)+chr(76)+chr(73)
		PRS[9]=chr(83)+chr(79)+chr(82)+chr(82)+chr(69)+chr(81)+chr(85)+chr(73)+chr(69)+chr(84)+chr(65)+chr(32)+chr(74)+chr(85)+chr(65)+chr(78)+chr(32)+chr(67)+chr(65)+chr(82)+;
		chr(76)+chr(79)+chr(83)+chr(32)+chr(89)+chr(32)+chr(79)+chr(84)+chr(82)+chr(79)
		PRS[2]=chr(84)+chr(69)+chr(72)+chr(78)+chr(79)+chr(83)+chr(32)+chr(83)+chr(46)+chr(82)+chr(46)+chr(76)+chr(46)
		PRS[7]=chr(84)+chr(69)+chr(77)+chr(65)+chr(32)+chr(67)+chr(79)+chr(76)+chr(79)+chr(82)+chr(32)+chr(83)+chr(46)+chr(82)+chr(46)+chr(76)+chr(46)
		PRS[10]=chr(71)+chr(85)+chr(82)+chr(87)+chr(73)+chr(67)+chr(90)+chr(32)+chr(80)+chr(65)+chr(66)+chr(76)+chr(79)+chr(32)+chr(89)+chr(32)+chr(78)+chr(73)+chr(83)+chr(84)+;
		chr(79)+chr(82)+chr(32)+chr(79)+chr(82)+chr(78)+chr(65)+chr(32)+chr(83)+chr(46)+chr(72)+chr(46)
		PRS[11]=chr(65)+chr(76)+chr(71)+chr(79)+chr(68)+chr(79)+chr(78)+chr(69)+chr(82)+chr(65)+chr(32)+chr(82)+chr(79)+chr(83)+chr(65)+chr(82)+chr(73)+chr(78)+chr(65)+chr(32)+;
		chr(83)+chr(46)+chr(82)+chr(46)+chr(76)+chr(46)
        PRS[12]=chr(71)+chr(85)+chr(73)+chr(76)+chr(76)+chr(69)+chr(82)+chr(77)+chr(79)+chr(32)+chr(87)+chr(46)+chr(32)+chr(68)+chr(69)+chr(77)+chr(79)+chr(78)+chr(84)+chr(73)  && GUILLER
		PRS[13]=chr(79)+chr(83)+chr(86)+chr(65)+chr(76)+chr(68)+chr(79)+chr(32)+chr(70)+chr(82)+chr(65)+chr(78)+chr(67)+chr(73)+chr(83)+chr(67)+chr(85)+chr(84)+chr(84)+chr(73)  && FRANCIS
		PRS[14]=chr(80)+chr(69)+chr(82)+chr(79)+chr(90)+chr(90)+chr(73)+chr(32)+chr(89)+chr(32)+chr(65)+chr(83)+chr(79)+chr(67)+chr(73)+chr(65)+chr(68)+chr(79)+chr(83)+chr(32)+;
		chr(83)+chr(46)+chr(82)+chr(46)+chr(76)+chr(46)																															 && PEROZZI Y ASOCIADOS
		
		SCAN
			IF prs[recno()]<>ALLTRIM(empresa)
				QUIT
			ENDIF
		ENDSCAN
	else
		store .F. TO SALIDA
	ENDIF
RETURN SALIDA
