********************************************************************************
*-- Programa: IPRO.PRG
*-- Fecha   : 06/04/91 11:01am
*-- Version : G. REINER
*-- Notas   : INGRESA PROVEEDORES
*-- Modificaci¢n GOYO 06-28-92 06:04pm
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=movewin(ipror,iproc,ipror+iprola,iproc+iproan,'win'," Ingreso Proveedores ")
	SELE pro
	STOR " Ingreso Codigo del Proveedor - " TO me1
	STOR 20 TO COL
	STOR 0 TO kok
	DO WHIL .T.
		ACTI WIND win
		CLEA
		SCAT MEMV BLAN
		do mpro
		@ 1,COL GET m.procod PICT "@!" ;
		MESS me1+'[ENTER] para Men£' ;
		valid !YAESTABA(m.procod,ALIAS(),"PROCOD",.F.,.F.) ;
		error 'CODIGO DE PROVEEDOR EXISTENTE'
		READ
		@ 2,COL GET m.Proveedor PICT '@!' ;
		valid !YAESTABA(m.PROVEEDOR,ALIAS(),"PROVEEDOR",.F.,.F.) ;
		error 'PROVEEDOR EXISTENTE' ;
		MESS 'Raz¢n Social Proveedor '
		READ WHEN !EMPTY(M.PROCOD) .AND. LAST()#27
		IF LAST()#27 .AND. !EMPTY(M.PROCOD) .AND. !EMPTY(M.PROVEEDOR)
			@ 3,COL GET m.encventas PICT '@!' ;
			MESS 'Encargado de Ventas '
			@ 4,COL GET m.domicilio PICT '@!';
			MESS 'Domicilio del Proveedor '
			@ 5,COL GET m.localidad PICT '@!' ;
			MESS 'Localidad del Proveedor '
			@ 6,COL GET m.telefono PICT  '@!';
			MESS 'Telefono del Proveedor '
			@ 7,COL GET m.FAX PICT  '@!';
			MESS 'Fax del Proveedor '
			@ 8,COL GET m.finop ;
			MESS 'Fecha de la Primera Operaci¢n '
			READ
			=AGRABAR("PRO")
			=iaud(ALLTRIM(M.PROCOD)+'-'+M.PROVEEDOR)
		ELSE
			EXIT
		ENDIF
	ENDDO
	=RELEWIN("win")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
