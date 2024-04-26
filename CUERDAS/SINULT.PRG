FUNCTION SINULT
PARAMETER COSita,LARGOR
PRIVATE COSITA,LARGOR
M.LARGOR=IIF(PARAMETER()=1,1,M.LARGOR)
IF COSITA='?' .OR. COSITA='HELP'
CLEA
TEXT
*************************************************************************
* AUTOR     : G. REINER
* FECHA     : FEBRERO DE 1992
*************************************************************************
* FUNCION   : SINULT
* OBJETO    : DEVUELVE LA CUERDA QUE INGRESA SIN LOS ULTIMOS N CARACTERES
* PARAMETROS: STRING
* EJEMPLO   : =SINULT("PEPE")
*************************************************************************
ENDT
ENDIF
M.COSITA=XXTOCHAR(M.COSITA)
RETURN(LEFT(M.COSita,LEN(M.COSitA)-M.LARGOR))