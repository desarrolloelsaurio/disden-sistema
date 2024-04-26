********************************************************************************
*-- Programa: LREMP1.PRG
*-- Fecha   : 12/18/91
*-- Version : V.LEEGSTRA
*-- Notas   : LISTADO DE REMESAS,POR PANTALLA
********************************************************************************
IF CHEQSEG()
    =win0()
    PAG=1
   =CABPAN()
   STORE 0 TO casos
   acla=paip+padc("MERCADERIA",19)+paip+PADC("OBSERVACIONES",15)+paip+PADC("ENVASE",15)+paip+PADC("CAN.BU",6)+paip+PADC("Kg.x BU",7)+paip+PADC("ZONA",10)+paip
   linea=REPL("=",LEN(acla))
   naprove=pro.procod
   naremes=0
   naproved=pro.proveedor
   tt='Remesa '+alltrim(str(naremes))+" del Proveedor: "+alltrim(naproved)+'  Fecha:'+dtoc(rem.fechaop)
   =tit_lin(1)
   vez=1
   sele rem
   SCAN for &fisc
      IF ROW()=21 .OR. (rem.proveedor#naprove .or. rem.remesa#naremes)
         if vez#1
            IF !fin_lin(1,nul)
               EXIT
            ENDIF
         else
             vez=2
         endif
         CLEA
         STOR pag+1 TO pag
         =CABPAN()
         naremes=rem.remesa
         sele rem
         tt='Remesa '+alltrim(str(naremes))+" del Proveedor: "+alltrim(pro.proveedor)+'  Fecha:'+dtoc(rem.fechaop)
         =tit_lin(1)
      ENDIF
      ?paip
      SELE mer
      ?? iif(xseek(rem.merca,'mer','merca'),left(mer.palpopup,19),"Mercad. Inexistente")
      ?? paip
      SELE rem
      ?? left(rem.tamano,15)
      ?? paip
      ?? iif(xseek(rem.envase,'mix','envcod'),left(mix.texto1,15),space(15))
      ?? paip
      sele rem
      ?? str(rem.bultos,6)
      ?? paip
      ?? str(rem.kgbulto,7,2)
      ?? paip
      ?? iif(xseek(rem.zona,'mix','zoncod'),left(mix.texto1,10),space(10))
      ?? paip
      sele rem
   ENDSCAN
   =fin_lin(2,nul)
   =RELEWIN('win')
	 =iaud(fisc)
ELSE
   =iaudi()
ENDIF
=men_lin(botom)
RETURN
