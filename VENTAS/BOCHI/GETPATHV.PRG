FUNCTION GETPATHv
RELE PATH,PATHPRO,PATHCOM,PATHVEN,PATHCPR,PATHCAJ,PATHTMP
PUBL  PATH,PATHPRO,PATHCOM,PATHVEN,PATHCPR,PATHCAJ,PATHTMP
STORE "F:\SISTEMAS\VENTAS\VENTASA" TO PATH,PATHPRO,PATHCOM,PATHVEN,PATHCAJ
STORE "F:\SISTEMAS\COMPRAS\COMPRASA" TO PATHCPR
STORE IIF(EMPTY(GETENV("TEMP")),"C:\TMP",GETENV("TEMP")) TO PATHTMP         
IF GETE("EQUIPO")="BATA"
	STORE "c:\ARCHIVOS\SISTEMAS\VENTAS\VENTASA" TO PATH,PATHPRO,PATHCOM,PATHVEN,PATHCAJ
	STORE "c:\ARCHIVOS\SISTEMAS\COMPRAS\COMPRASA" TO PATHCPR
	STORE "C:\TMP" TO PATHTMP
	store path to camino, camino2
ENDIF
RETURN .T.
