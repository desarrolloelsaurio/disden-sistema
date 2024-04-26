#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
#DEFINE PAIP   "|"                               && PAIP
FUNCTION LDESN1
	? PAIP
	?? PADR(ARTICULO, 20)
	?? PAIP
	?? PADR(MERCA, 40)
	?? PAIP
	?? CANTIDAD PICT "99.999"
	?? PAIP
RETURN .T.