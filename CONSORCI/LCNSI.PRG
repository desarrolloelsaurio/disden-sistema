* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : LCNSI.PRG                           �
* � COMENTARIO    : LISTADO DE CONSORCIOS POR IMPRESORA �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER                            �
* � FECHA      : 12-29-93                               �
* � HORA       : 08:18:57pm                             �
* � COPYRIGHT  : 1993 by GREGORIO REINER                �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様�
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
STORE HORA_ULP(PROGRAM()) to ULPR
IF CHEQSEG()
	SELE CNS
	SET ORDER TO TAG CONCOD
	STORE NUL TO CASOS
	acla=paip+PADC("CONSORCIO",20)+paip+PADC("COD.",4)+paip+PADC("DIRECCION",40)+paip+PADC("LOCALIDAD",9)+"|FECHA IN|  USUARIO |"
	tt='Listado de Consorcios'
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,0)
			=CABPRI1()
			=TIT_LIN(4)
		ENDI
		=LCNS1()
	ENDSCAN
	=FIN_LIN(4,CASOS)
	ENDP
	=FINIMP()
	=IAUD('')
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
