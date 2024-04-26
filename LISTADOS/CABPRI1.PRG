*********************************
*-- Programa: CABPRI1
*-- Fecha   : 09/26/91 12:57pm
*-- Version : G. REINER
*-- Notas   : IMPRIME CABECERAS
*********************************
FUNCTION CABPRI1
PARAMETER SINNADA
IF GETENV("PRN")="LASER"
   =CH18()
ELSE
   ??? CHR(18)
ENDIF
IF !SINNADA
   ? 'PROGRAMA :'
   ?? ALLTRIM(ULPR)
   ?? SPACE(50-_PLOFFSET-LEN(ULPR))
   ??'Usuario  :'
   ?? M.usador
   ? 'FECHA    :'
   ?? DATE()
   ?? SPACE(13-_PLOFFSET/2)
   ?? 'HORA     :'
   ?? TIME()
   ?? SPACE(11-_PLOFFSET/2)
   ?? 'P g N§   :'
   ?? STR(_PAGENO,5)
   ?
ENDIF
IF LARGO>LARGOIM
   _RMARGIN=IIF(largoim>80,233,132)
   =COND(.T.)
ENDIF
RETURN .T.
