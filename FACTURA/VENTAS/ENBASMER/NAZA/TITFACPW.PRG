FUNCTION TITFACPW
? PAIP
IF KTIPO='111'
   ?? PADC('CODIGO',10)
   ?? PAIP
   ?? PADC("CLIENTE",20)
ELSE
   IF KTIPO='231'
      ?? PADC("ARTICULO",13)
      ?? PAIP
      ?? PADC("DESCRIPCION",20)
   ELSE
      ?? PADC("RUBRO",20)
   ENDIF
ENDIF
?? PAIP
FOR A=1 TO CANT_EL
   ?? TIT[A]
   ?? PAIP
ENDF
?? padc("TOTAL",XACDIGI)
?? PAIP
RETURN .T.
