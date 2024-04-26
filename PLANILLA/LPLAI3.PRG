********************************************************************************
*-- Programa: LPLAI3.PRG
*-- Fecha   : 01/02/91
*-- Version : V.LEEGSTRA
*-- Notas   : IMPRESION DE PLANILLA, POR IMPRESORA
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   =Impresor()
   acla=PAIP+padc(upper(biaja),20)+PAIP+PADC("CLIENTE",20)+PAIP+PADC("CANTIDAD",12)+PAIP+PADC("PRECIO UNITA.",12)+PAIP+PADC("PRECIO TOTAL",14)+'|  FECHA |  USUARIO |'
   STORE REPL("=",LEN(acla)) TO lns
   STORE 0 TO casos,cantotal,pretotal
   STORE LEN(acla) TO largo
   STORE MIN(xacancho,xachoja) TO largoim
	 mxrn=66
   @ 24,0 SAY IMPRIMIENDO COLO SCHE 19
   IF (largoim=80 .AND. largo>132) .OR. (largoim=132 .AND. largo>233)
      A=LEFT(sincosas(janname),8)+'.TXT'
      ACTI SCRE
      @ 24,0 SAY PADC("Imprimiendo Listado en Archivo "+ALLTRIM(A),80) COLO SCHE 19
      SET PRINTER TO (A)
      mxrn=IIF(largoim>80,50,48)
   ENDIF
   tt='Listado de la Planilla'
   DO CABPRI
   _PCOPIES=1
   sele pla
   PRINTJOB
      DO CABPRI1
      IF largo>largoim
         _RMARGIN=IIF(largoim>80,233,132)
         ??? CHR(15)
      ENDIF
      ? tt STYLE 'u'
      ? ALLTRIM(janname) STYLE 'u'
      ?
      ? lns
      ? acla
      ? lns
      SCAN FOR &fisc
         IF _PLINENO>63
            ? LEFT(lns,largoim-3)
            ?? '///'
            EJECT PAGE
            _RMARGIN=80
            _WRAP=.F.
            ?
            DO CABPRI1
            IF largo>largoim
               _RMARGIN=IIF(largoim>80,233,132)
               ??? CHR(15)
            ENDIF
            ? tt+' - Continuaci¢n' STYLE 'u'
            ? ALLTRIM(janname) STYLE 'u'
            ?
            ? lns
            ? acla
            ? lns
         ENDI
         ?PAIP
         SELE via
         ?? iif(seek(pla->codvia),left(via->viajante,20),padr("NO existe",20))
         ?? PAIP
			SELE PER
         set order to 2
         ?? iif(seek(pla->cliente),left(PER.cliente,20),PADL("NO existe",20))
         ?? PAIP
         sele pla
         ?? pla->cantidad
         cantotal=cantotal+pla->cantidad
         ?? PAIP
         ?? pla->punitario
         ?? PAIP
         nada=pla->cantidad*pla->punitario
         ?? str(nada,14,2)
         pretotal=pretotal+nada
         DO IMPUSE
      ENDSCAN
      ? lns
      ? " Totales:"+space(33)+PAIP+str(cantotal,12,2)+PAIP+space(12)+PAIP+str(pretotal,14,2)+PAIP
      ? lns
      ? " Promedio: "+str(pretotal/cantotal,14,2)
      ? lns
      _WRAP=.F.
      ?
      EJECT PAGE
      ?
   ENDP
   DO FINIMP
   DO IAUD WITH 'LISTADO de Planillas por IMPRESORA'
ELSE
   =IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
