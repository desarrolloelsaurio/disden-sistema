function indexa
ulpr=HORA_ULP(PROGRAM())
IF CHEQSEG()
   =men_lin('Reindexando el Archivo de Mercader¡as')
   IF USED("MER")
   SELE mer
   =FLOCK("MER") .or. FLOK("MER")
   ENDIF
   =dotalk()
   =indexa1("0003")
   =indexa1("0007")
   =indexa1("0008")         
   IF ESARROYO
      =INDEXA1("0005")
   ELSE
      =INDEXA1("0004")   
   ENDIF
   =UNTALK()
ELSE
   =IAUDI()
ENDIF
RETURN men_lin(botom)
   
function indexa1
parameter dx_suc
   =opstos(dx_suc,.t.)
   SELE STOS
   INDE ON merca TAG MERCA
   INDE ON articulo TAG ARTICULO
   INDE ON MODELO TAG MODELO
   =OPREMS(DX_SUC,.T.)
   SELE REM
   INDEX ON REMITO TAG REMITO
   INDEX ON TIPO TAG TIPO
   USE
   SELE REX
   INDEX ON REMITO TAG REMITO
   USE
RETURN iaud(DX_SUC)