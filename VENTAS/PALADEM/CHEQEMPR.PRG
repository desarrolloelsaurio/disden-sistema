FUNCTION CHEQEMPR
	M.CHEQ_SALIDA=.T.
	COUNT TO A
	GO TOP
	M.CHEQ_SALIDA=IIF(M.CANT_EMPRE#A,.F.,M.CHEQ_SALIDA)
	IF M.CHEQ_SALIDA
		DO CASE
		CASE LEFT(MIX.TEXTO1,5)='GUILL'              && GUILLERMO W. DEMONTI
			A=chr(71)+chr(85)+chr(73)+chr(76)+chr(76)+;
			chr(69)+chr(82)+chr(77)+chr(79)+chr(32)+chr(87)+;
			chr(46)+chr(32)+chr(68)+chr(69)+chr(77)+chr(79)+;
			chr(78)+chr(84)+chr(73)
			M.CHEQ_SALIDA=IIF(ALLTRIM(MIX.TEXTO1)#A,.F.,M.CHEQ_SALIDA)
			=POPCARTE("_*_"+CHR(13)+CHR(10)+"EMPRESA"+CHR(13)+CHR(10)+"-"+CHR(13)+CHR(10)+'GUILLERMO'+CHR(13)+CHR(10)+'DEMONTI'+CHR(13)+CHR(10)+"-*-"+CHR(13)+CHR(10)+"TECLA PARA CONTINUAR"+CHR(13)+CHR(10)+"-*-")
			=INKEY(0,'HM')
       RELE WIND POPCARTE
		CASE LEFT(MIX.TEXTO1,5)='PALAD'              && PALADEM S.R.L.
			A=CHR(80)+CHR(65)+CHR(76)+CHR(65)+CHR(68)+;
			CHR(69)+CHR(77)+CHR(32)+CHR(83)+CHR(46)+;
			CHR(82)+CHR(46)+CHR(76)+CHR(46)
			M.CHEQ_SALIDA=IIF(ALLTRIM(MIX.TEXTO1)#A,.F.,M.CHEQ_SALIDA)
			=POPCARTE("_*_"+CHR(13)+CHR(10)+"EMPRESA"+CHR(13)+CHR(10)+"-"+CHR(13)+CHR(10)+'PALADEM'+CHR(13)+CHR(10)+'S.R.L.'+CHR(13)+CHR(10)+"-*-"+CHR(13)+CHR(10)+"TECLA PARA CONTINUAR"+CHR(13)+CHR(10)+"-*-")
			=INKEY(0,'HM')
       RELE WIND POPCARTE
		CASE LEFT(MIX.TEXTO1,19)='DISTRIBUIDORA MELAC' && DISTRIBUIDORA MELAC
			A=chr(68)+chr(73)+chr(83)+chr(84)+chr(82)+chr(73)+;
			chr(66)+chr(85)+chr(73)+chr(68)+chr(79)+chr(82)+chr(65)+;
			chr(32)+chr(77)+chr(69)+chr(76)+chr(65)+chr(67)
			M.CHEQ_SALIDA=IIF(ALLTRIM(MIX.TEXTO1)#A,.F.,M.CHEQ_SALIDA)
		CASE LEFT(MIX.TEXTO1,6)="GUIPER"             && GUIPER DISTRIBUC SRL
			a=chr(71)+chr(85)+chr(73)+chr(80)+chr(69)+chr(82)+;
			chr(32)+chr(68)+chr(73)+chr(83)+chr(84)+chr(82)+;
			chr(73)+chr(66)+chr(85)+chr(67)+chr(32)+chr(83)+;
			chr(82)+chr(76)
			M.CHEQ_SALIDA=IIF(ALLTRIM(MIX.TEXTO1)#A,.F.,M.CHEQ_SALIDA)
		CASE LEFT(MIX.TEXTO1,5)="DEMOS"              && DEMOS
			a=chr(68)+chr(69)+chr(77)+chr(79)+chr(83)
			M.CHEQ_SALIDA=IIF(ALLTRIM(MIX.TEXTO1)#A,.F.,M.CHEQ_SALIDA)
		CASE LEFT(MIX.TEXTO1,8)="SISTEMAS"
			a=chr(83)+chr(73)+chr(83)+chr(84)+chr(69)+chr(77)+chr(65)+;
			chr(83)+chr(32)+chr(73)+chr(78)+chr(70)+chr(79)+chr(82)+;
			chr(77)+chr(46)+chr(32)+chr(83)+chr(82)+chr(76)
			M.CHEQ_SALIDA=IIF(ALLTRIM(MIX.TEXTO1)#A,.F.,M.CHEQ_SALIDA)
		CASE LEFT(MIX.TEXTO1,10)="PURALACTEA"
			a=chr(80)+chr(85)+chr(82)+chr(65)+chr(76)+chr(65)+chr(67)+;
			chr(84)+chr(69)+chr(65)+chr(32)+chr(83)+chr(46)+chr(82)+;
			chr(46)+chr(76)+chr(46)
			M.CHEQ_SALIDA=IIF(ALLTRIM(MIX.TEXTO1)#A,.F.,M.CHEQ_SALIDA)
		CASE LEFT(MIX.TEXTO1,11)="ALGO S.R.L."
			a=chr(65)+chr(76)+chr(71)+chr(79)+chr(32)+chr(83)+chr(46)+;
			chr(82)+chr(46)+chr(76)+chr(46)
			M.CHEQ_SALIDA=IIF(ALLTRIM(MIX.TEXTO1)#A,.F.,M.CHEQ_SALIDA)
		OTHERWISE
			M.CHEQ_SALIDA=.F.
		ENDCASE
	ENDIF
RETURN M.CHEQ_SALIDA
