FUNCTION GETPATH
RELE PATH,PATHPRO,PATHCOM,PATHVEN,PATHCPR,PATHCAJ
PUBL  PATH,PATHPRO,PATHCOM,PATHVEN,PATHCPR,PATHCAJ
IF GETENV("EQUIPO")="MICASA"
   STORE "D:\SISTEMAS\VENTAS\VENTASA" TO PATH,PATHPRO,PATHCOM,PATHVEN
   STORE "D:\SISTEMAS\COMPRAS\COMPRASA" TO PATHCPR
ELSE
   IF FILE("G:\MIXTA.DBF")
      STORE "G:" TO PATH,PATHPRO,PATHCOM,PATHVEN,PATHCAJ
      STORE "H:" TO PATHCPR
   ELSE
      STORE "C:\SISTEMAS" TO PATH,PATHPRO,PATHCOM,PATHVEN
      STORE "C:\SISTEMAS" TO PATHCPR
   ENDIF
ENDIF
RETURN .T.
