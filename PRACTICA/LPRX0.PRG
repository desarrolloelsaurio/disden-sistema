FUNCTION LPRX0      
#DEFINE PAIP   "|"                               && PAIP
      ? PAIP
      ?? " "
      ?? PRX.TIPO
      ?? PAIP
      ?? " "
      ?? PRX.UNIDAD
      ?? " "
      ?? PAIP      
      if tipo="PRA"
         ?? SAYGRL(PRX.UNIPRA,"PRA","CODPRA","PRA.PRACTICABR")
      else
         ?? saymix(PRX.UNIDAD,PRX.TIPO+"COD")
      endif
      ?? paip
      ?? STR(CANTIDAD,4)
      ?? PAIP
RETURN .T.