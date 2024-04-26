FUNCTION SINULT
PARAMETER SIN_CO,SIN_LA
PRIVATE SIN_CO,SIN_LA
M.SIN_LA=IIF(PARAMETER()=1,1,M.SIN_LA)
IF SIN_CO='?' .OR. SIN_CO='HELP'
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
M.SIN_CO=XXTOCHAR(M.SIN_CO)
RETURN(LEFT(M.SIN_CO,LEN(M.SIN_CO)-M.SIN_LA))