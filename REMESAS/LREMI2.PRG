********************************************************************************
*-- Programa: LREMI2.PRG
*-- Fecha   : 12/18/91
*-- Version : V.LEEGSTRA
*-- Notas   : IMPRESION DE REMESA, POR IMPRESORA
********************************************************************************
IF CHEQSEG()
   =impresor()
   acla=PAIP+padc("PROVEEDOR",20)+PAIP+' REMESA '+PAIP+PADC("ZONA",15)+PAIP+PADC("OBSERVACIONES",20)+PAIP+PADC("ENVASE",20)+PAIP+'CANT. BULTOS'+PAIP+' Kg.x BULTO '+PAIP+'  TOTAL Kg. '+PAIP
   STORE REPL("=",LEN(acla)) TO lns
   STORE nul TO CASOS
   STORE LEN(acla) TO largo
   STORE MIN(xacancho,xachoja) TO largoim
   =men_lin(imprimiendo)
   tt='Listado de Remesas por Producto '+alltrim(mer.palpopup)
   IF (largoim=80 .AND. largo>132) .OR. (largoim=132 .AND. largo>233)
      A=LEFT(sincosas(janname),8)+'.TXT'
      =men_lin("Imprimiendo Listado en Archivo "+ALLTRIM(A))
      SET PRINTER TO (A)
      IF largoim>80
         mxrn=50
      ELSE
         mxrn=48
      ENDIF
   ENDIF
   =cabpri()
   _PCOPIES=1
   PRINTJOB
   =cabpri1()
   =TIT_LIN(3)
	IF largo>largoim
		_rmargin=iif(largoim>80,232,132)
		??? CHR(15)
	ENDIF
	SELE REM
	 SCAN  FOR &fisc
	    IF _PLINENO>63
            =FIN_LIN(3,NUL)
			_RMARGIN=80
			_WRAP=.F.
			?
			=CABPRI1()
            =TIT_LIN(4)
		ENDI
         ?PAIP
         ?? iif(xseek(rem.proveedor,'pro','procod'),left(pro.proveedor,20),"Proveedor Inexisten.")
         ?? PAIP
         ?? rem.remesa
         ?? PAIP
         ?? iif(XSEEK(REM.ZONA,'MIX','ZONCOD'),left(mix.texto1,15),space(15))
         ?? PAIP
         ?? rem.tamano
         ?? PAIP
         ?? iif(XSEEK(REM.ENVASE,'MIX','ENVCOD'),mix.texto1,space(20))
         ?? PAIP
         sele rem
         ?? str(rem.bultos,12)
         ?? PAIP
         ?? str(rem.kgbulto,12,2)
         ?? PAIP
         ?? str(rem.bultos*rem.kgbulto,12,2)
         ?? PAIP
      ENDSCAN
      =FIN_LIN(4,CASOS)
	  ENDP
	=FINIMP()
	=IAUD(fisc)
ELSE
   DO IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
