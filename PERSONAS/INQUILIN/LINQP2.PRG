********************************************************************************
*-- Programa: LinqP.PRG
*-- Fecha   : 06/10/91 11:28am
*-- Version : R. 'EL BATA'
*-- Notas   : LISTADO DE inquilinos POR PANTALLA
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	 SELE PER
   =WIN0()
   pag=1
   =cabpan()
   STORE nul TO casos
   acla=paip+PADC("INQUILINO",30)+paip+PADC("COD.",4)+'|DOC|'+PADC("NUMERO",10)+paip+PADC("LOCALIDAD",10)+paip+PADC("TELEFONO",12)+paip
   linea=REPL("=",LEN(acla))
   tt='Listado de inquilinos'
   =tit_lin(1)
   SCAN
      IF ROW()>21
         IF !fin_lin(1,0)
            EXIT
         ENDIF
         CLEA
         STOR pag+1 TO pag
         =cabpan()
         =tit_lin(2)
      ENDIF
      ? paip
      ?? PER.CLIENTE
      ?? paip
      ?? PER.CODCLI
      ?? paip
      ?? PER.tipodoc
      ?? paip
      set sepa to '.'
      ?? trans(PER.nrodoc,"@J 99,999,999")
      set sepa to ','
      ?? paip
      sele mix
      ?? iif (busciu(PER.LOCALIDAD),left(mix.texto1,10),space(10))
      ?? paip
			??PER.telefono
      ?? paip
			SELE PER
      store casos+1 to casos
   ENDSCAN
   =fin_lin(2,casos)
   =RELEWIN("win")
	 =iaud("")
ELSE
   =iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)
