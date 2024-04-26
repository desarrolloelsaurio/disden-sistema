********************************************************************************
*-- Programa: LREMP3.PRG
*-- Fecha   : 12/18/91
*-- Version : V.LEEGSTRA
*-- Notas   : LISTADO DE REMESAS,proveedor,remesa,zona,observaciones,envase,bultos,kg.por bulto, POR PANTALLA
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   =WIN0()
   PAG=1
   =CABPAN()
   STORE 0 TO casos
   acla=paip+' REMESA '+paip+PADC("ZONA",7)+paip+PADC("FECHA",8)+paip+PADC("OBSERVACIONES",6)+paip+PADC("ENVASE",15)+paip+PADC("CAN.BUL",7)+paip+PADC("Kg.x BU",7)+'|  TOTAL Kg. |'
   linea=REPL("=",LEN(acla))
         tt='Listado de las Remesas para '+sinesp1(mer.palpopup)
   _WRAP=.f.
   _ALIGNMENT='CENTER'
   SELE rem
   =tit_lin(1)
   sele rem
   SCAN FOR &fisc
      IF ROW()=21
         IF !fin_lin(1,0)
            EXIT
         ENDIF
         CLEA
         STOR pag+1 TO pag
         =CABPAN()
         =tit_lin(2)
      ENDIF
      ?paip
      ?? rem.remesa
      ?? paip
      ?? iif(xseek(rem.zona,'mix','zoncod'),left(mix.texto1,7),space(7))
      ?? paip
      ?? dtoc(rem.fechaop)
      ?? paip
      ?? LEFT(rem.tamano,6)
      ?? paip
      ?? iif(xseek(rem.envase,'mix','envcod'),LEFT(mix.texto1,15),space(15))
      ?? paip
      ?? str(rem.bultos,7)
      ?? paip
      ?? str(rem.kgbulto,7,2)
      ?? paip
      ?? str(rem.bultos*rem.kgbulto,12,2)
      ?? paip
   ENDSCAN
   =fin_lin(2,0)
   =RELEWIN('win')
	 =iaud(fisc)
ELSE
    =iaudi()
ENDIF
=men_lin(botom)
RETURN
