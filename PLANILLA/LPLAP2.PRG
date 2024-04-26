********************************************************************************
*-- Programa: LPLAP2.PRG
*-- Fecha   : 01/02/91
*-- Version : V.LEEGSTRA
*-- Notas   : LISTADO DE PLANILLA,POR PANTALLA
********************************************************************************
		STORE HORA_ULP(PROGRAM()) to ULPR
		IF CHEQSEG()
   =WIN0()
   PAG=1
   =CABPAN()
   STORE 0 TO cantotal,pretotal
   acla=PAIP+padc("CLIENTE",11)+PAIP+PADC("MERCADERIA",15)+PAIP+PADC("CANTIDAD",12)+PAIP+PADC("PRECIO UNITA.",12)+PAIP+PADC("PRECIO TOTAL",14)+'|  FECHA |'
   lineas=REPL("=",LEN(acla))
   tt='Listado de la Planilla '
   _WRAP=.f.
   _ALIGNMENT='CENTER'
   ? tt
   ? lineas
   ? acla
   ? lineas
   _WRAP=.f.
   sele pla
   SCAN FOR &fisc
      IF ROW()=21
         ? LEFT(lineas,LEN(lineas)-4)
         ?? '\\\\'
         IF INKEY(0)=27
            EXIT
         ENDIF
         CLEA
         STOR pag+1 TO pag
         DO CABPAN
         ? tt
         ? lineas
         ? acla
         ? lineas
      ENDIF
      ?PAIP
		SELE PER
      set order to 2
      ?? iif(seek(pla.cliente),left(PER.cliente,11),"NO existe  ")
      ?? PAIP
      SELE mer
      ?? iif(seek(pla.merca),padl(LEFT(CHRTRAN(mer.palpopup," ",""),15),15),"Mer.Inexistente")
      ?? PAIP
      sele pla
      ?? pla.cantidad
      cantotal=cantotal+pla.cantidad
      ?? PAIP
      ?? pla.punitario
      ?? PAIP
      nada=pla.cantidad*pla.punitario
      ?? str(nada,14,2)
      pretotal=pretotal+nada
      ?? PAIP
      ?? pla.fecha
      ?? PAIP
   ENDSCAN
   ? lineas
   ? " Totales:"+space(19)+PAIP+str(cantotal,12,2)+PAIP+space(12)+PAIP+str(pretotal,14,2)+PAIP
   ? lineas
   ? " Promedio: "+alltrim(str(pretotal/cantotal,14,2))
   ? lineas
   _WRAP=.F.
   =INKEY(0,"HM")
   =RELEWIN("win")
ELSE
   =iaudI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
