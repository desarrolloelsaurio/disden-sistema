******************************************
*-- Programa: CCCOS.PRG
*-- Fecha   : 25/10/90 /  0:10:20
*-- Version : G. REINER - GENERADOR
*-- Notas   : CORRECCION CENTROS DE COSTOS
******************************************
ff=RECNO()
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
sigue=.T.
DEFINE WINDOW win FROM 7,15 TO 13,57 TITL " Correcci¢n Centro de Costos " SHAD COLOR SCHE 8
SELE ccos
me1=" Correcci¢n Centro de Costos "
ACTI WIND win
SCATTER MEMVAR
@ 1,1 SAY "CENTRO DE COSTOS" COLOR SCHE 3
@ 2,1 SAY "IDENTIFICACION" COLOR SCHE 3
@ 2,20 GET m.idcencos
@ 3,1 SAY "EMPRESA" COLOR SCHE 3
GOTO m.empresa IN jan
@ 3,20 GET jan.empresa PICTURE 'XXXXXXXXXXXXXXXXXXXX'
CLEAR GETS
@ 1,20 GET m.cencos;
PICTURE "XXXXXXXXXXXXXXXXXXX";
MESS me1+"- [ESC] para Men£"
READ
IF LASTKEY()#27
	@ 2,1 SAY "IDENTIFICACION" COLOR SCHE 3
	@ 2,20 GET m.idcencos;
	PICTURE "XXXXXXXXXX";
	MESS me1+"- Identificaci¢n o C¢digo"
	READ
	m.idcencos=UPPER(m.idcencos)
	respuesta=0
	SELECT jan
	GOTO m.empresa IN jan
	caca=jan.empresa
	@ 3,20 GET caca;
	MESS me1+"- Empresa - [Tecla y ENTER] para Corregir"
	READ
	IF caca#jan.empresa
		respuesta=0
		DO WHILE elijn(' del Centro de Costos')=0
		ENDDO
		GOTO respuesta
		ACTI WINDOW win
		@ 3,30 GET jan.empresa
		CLEAR GETS
		m.empresa=respuesta
	ENDIF
	SELECT ccos
	IF cencos#m.cencos
		IF ISALPHA(ALLTRIM(m.cencos))
			m.cencos=PROPER(m.cencos)
			SET DELE OFF
			SEEK ALLTRIM(m.cencos)
			SET DELE ON
			IF FOUND() .AND. m.empresa=ccos.empresa
				ACTI SCREEN
				@ 24,0 SAY PADC("CENTRO DE COSTOS "+ALLTRIM(m.cencos)+' existe - Enter para continuar',80,' ')
				ACTI WIND win
				DO existe WITH " CENTRO DE COSTOS"
				=INKEY(0)
				sigue=.F.
			ENDIF
		ELSE
			sigue=.F.
		ENDIF
	ENDIF
	GOTO ff
	IF idcencos#m.idcencos
		SCAN
			IF idcencos=m.idcencos .AND. m.empresa=empresa
				IF ff#RECNO()
					ACTI SCREEN
					@ 24,0 SAY PADC("IDENTIFICACION "+ALLTRIM(m.cencos)+' existe - Enter para continuar',80,' ')
					ACTI WIND win
					DO existe WITH " IDENTIFICACION"
					=INKEY(0)
					sigue=.F.
					EXIT
				ENDIF
			ENDIF
		ENDSCAN
	ENDIF
	IF sigue
		GOTO ff
		GATHER MEMVAR
	ENDIF
ENDIF
RELE WIND win
RELE cencos,idcencos,empresa,me1,ff,sigue,nada
@ 24,0 SAY SPACE(80)
RETURN
