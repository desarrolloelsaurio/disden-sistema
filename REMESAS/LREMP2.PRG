********************************************************************************
*-- Programa: LREMP2.PRG
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
   acla=paip+padc("PROVEEDOR",13)+paip+' REMESA '+paip+PADC("ZONA",7)+paip+PADC("FECHA",8)+paip+PADC("OBSERVACIONES",15)+paip+PADC("ENVASE",6)+paip+PADC("CAN.BU",6)+paip+PADC("Kg.x BU",7)+paip
   linea=REPL("=",LEN(acla))
   tt='Listado de las Remesas para '+alltrim(mer.palpopup)
   _WRAP=.f.
   _ALIGNMENT='CENTER'
   SELE rem
=tit_liN(1)
   _WRAP=.f.
   sele rem
   SCAN FOR &fisc
      IF ROW()=21
         IF !fin_lin(1,nul)
            EXIT
         ENDIF
         CLEA
         STOR pag+1 TO pag
         DO CABPAN
         =tit_lin(2)
      ENDIF
      ?paip
      sele pro
      set order to 1
      go top
      ?? iif(seek(rem.proveedor),left(pro.proveedor,13),"Prov.Inexist.")
      ?? paip
      sele rem
      ?? rem.remesa
      ?? paip
      ?? iif(xseek(rem.zona,'mix','zoncod'),left(mix.texto1,7),space(7))
      ?? paip
      ?? DTOC(rem.fechaop)
      ?? paip
      ?? left(rem.tamano,15)
      ?? paip
      ?? iif(xseek(rem.envase,'mix','envcod'),left(mix.texto1,6),space(6))
      ?? paip
      ?? str(rem.bultos,6)
      ?? paip
      ?? str(rem.kgbulto,7,2)
      ?? paip
   ENDSCAN
   =fin_lin(2,nul)
   =RELEWIN('win')
ELSE
   =iaudi()
ENDIF
=men_lin(botom)
RETURN
