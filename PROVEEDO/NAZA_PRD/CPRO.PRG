********************************************************************************
*-- Programa: CPRO.PRG
*-- Fecha   : 06/07/91 12:52pm
*-- Version : E. BANALOTTI
*-- Notas   : CORRIGE PROVEEDORES
********************************************************************************
STOR RECNO("PRO") TO ff
registro=STR(ff)
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	DEFINE WINDOW win FROM cpror,cproc TO cpror+cprola,cproc+cproan TITL " Correcci¢n Proveedores " SHAD COLOR SCHE 8
	SELE pro
	=LOCK() .OR. LOK()
	GOTO FF
	SCAT MEMV
	STOR " Correcci¢n Proveedores - " TO me1
	STOR 22 TO COL
	STOR .F. TO kok,cambio
	STOR .T. TO sigue
	DO mpro
	@ 1,COL GET m.procod PICT "!!!!!!!!!!!";
	MESS me1+'[ESC] para Men£'
	READ
	IF LASTKEY()#27
		IF !EMPTY(m.procod)
			IF UPDATE()
				STOR .T. TO cambio
			ENDIF
			IF cambio
				SELE pro
				SET ORDER TO 1
				SET DELE OFF
				SEEK m.procod
				SET DELE ON
				IF FOUND()
					ACTI SCRE
					@ 24,0 SAY PADC('CODIGO PROVEEDOR '+ALLTRIM(m.procod)+existe,80) COLO SCHE 19
					ACTI WIND win
					DO existe WITH ' PROVEEDOR'
					=INKEY(0)
					CLEA
					STOR .F. TO sigue
				ENDIF
			ENDIF
			IF sigue
				ACTI WIND win
				@ 2,COL GET m.Proveedor PICT '@!';
				MESS "Raz¢n Social del Proveedor"
				READ
				IF UPDATE()
					SELE pro
					SET ORDER TO 2
					SET DELE OFF
					SEEK m.Proveedor
					SET DELE ON
					ACTI SCRE
					IF FOUND()
						@ 24,0 SAY PADC('PROVEEDOR '+ALLTRIM(m.Proveedor)+' existe - Enter para continuar',80) COLO SCHE 19
						ACTI WIND win
						DO existe WITH ' PROVEEDOR'
						=INKEY(NUL,'HM')
						CLEA
					ENDIF
				ENDIF
				IF !EMPTY(m.Proveedor)
					ACTI WIND win
					@ 3,COL GET m.encventas PICT '@!';
					MESS 'Encargado de ventas'
					@ 4,COL GET m.domicilio PICT '@!';
					MESS 'Domicilio del Proveedor'
					@ 5,COL GET m.localidad PICT '@!';
					MESS 'Localidad del Proveedor'
					@ 6,COL GET m.telefono PICT  '@!';
					MESS 'Tel‚fono del Proveedor'
					@ 7,COL GET m.fax PICT  '@!';
					MESS 'Fax del Proveedor'
					@ 8,COL GET m.finop;
					MESS 'Fecha de la Primera Operaci¢n'
					READ
					=MEN_LIN(GRABANDO)
					SELE pro
					GOTO ff
					GATH MEMV
					=repuse()
					=IAUD(M.PROCOD)
				ENDIF
			ENDIF
		ENDIF
	ENDIF
	=RELEWIN("win")
ELSE
	=IAUDI()
ENDIF
UNLO IN pro
RETURN MEN_LIN(BOTOM)
