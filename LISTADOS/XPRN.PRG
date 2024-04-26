FUNCTION XPRN
PARAMETER X_CUAN
X_TEX="Por \<Pantalla;Por \<Impresora;"
IF X_CUAN#2
  X_TEX=X_TEX+"\<Archivo ASCII;\<Otras Impresoras;"
  IF FILE("F:\PUBLIC\!NETWARE.NFO")
	 M.X_TEX=M.X_TEX+"Impresi¢n Local;Impresi¢n al Server;"		        			
  ELSE
 	 M.X_TEX=M.X_TEX+"\\Impresi¢n Local;\\Impresi¢n al Server;"		        			
  ENDIF
	 M.X_TEX=M.X_TEX+"\<Base de Datos;"
ENDIF  
M.X_TEX=M.X_TEX+"\<Men£ Anterior"
RETURN ALGUN(30," Salida del Listado ",M.X_TEX)
