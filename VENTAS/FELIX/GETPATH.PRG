FUNCTION GETPATH
RELE PATH,PATHPRO,PATHCOM,PATHVEN
PUBL M.PATH,M.PATHPRO,M.PATHCOM,M.PATHVEN
IF FILE('C:\SISTEMAS\VENTAS\VENTASA\MIXTA.DBF')
   STORE 'C:\SISTEMAS\VENTAS\VENTASA' TO M.PATH,M.PATHPRO,M.PATHCOM,M.PATHVEN
ELSE
   STORE 'D:\SISTEMAS\VENTAS\VENTASA' TO M.PATH,M.PATHPRO,M.PATHCOM,M.PATHVEN
ENDIF
RETURN .T.