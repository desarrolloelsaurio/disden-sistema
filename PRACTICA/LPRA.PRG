#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
=OPTAR()
=OPPRA()
l_dijo=UPPER(alltrim(prompt()))
porpan=("ntal" $ l_dijo)
store nul to m.respuesta
if elitar("a Listar",-1,1)
   eltar=left(mix.texto2,2)
   eltTAR=alltrim(mix.texto1)
   store nul to m.respuesta
   if elitpr("a Listar")
      eltpr=left(mix.texto2,2)
      eltTpr=alltrim(mix.texto1)
      sele pra
      TT="Lista de Precios"+crlf+;
      "Pr cticas de "+alltrim(elTtpr)+crlf+;
      "Arancel "+alltrim(elttar)
      IF "PANTALLA" $ L_DIJO
          DO LPREPRAP
      ELSE
          DO LPREPRAI      
      ENDIF
   endif
endif
return men_lin(botom)