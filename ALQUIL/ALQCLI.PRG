* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : ALQPER.PRG                          �
* � COMENTARIO    : GESTION DE CLIENTES PARA ALQUILERES �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER                            �
* � FECHA      : 11-06-93                               �
* � HORA       : 03:02:14am                             �
* � COPYRIGHT  : 1993 by GREGORIO REINER                �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様�
#DEFINE BOTOM "  "+repl("�",78)                  && BOTOM
=cabpan1()
C_DIJO=ALLTRIM(PROMPT())
=OPCIU()
DO CASE
CASE C_DIJO="Inquilinos"
	=OPINQ()
	RESPUESTA='INQ#5#16#Gesti�n de Inquilinos#3;
#\<Datos Generales;
#\<Legajo de Inquilino'
	=DEFPOP()
	ON SELE POPU INQ DO INQ
	ACTI POPU INQ
	RELE POPU INQ
CASE C_DIJO="Propietarios"
	=OPPRP()
	RESPUESTA='PRP#5#16#Gesti�n de Propietarios#3;
#\<Datos Generales;
#\<Legajo de Propietario'
	=DEFPOP()
	ON SELE POPU PRP DO PRP
	ACTI POPU PRP
	RELE POPU PRP
CASE C_DIJO="Garant�as"
	=OPGAR()
	respuesta='GAR#5#16#Gesti�n de Garant�as#3;
#\<Datos Generales;
#Datos del \<Inmueble;
#\<Legajo de Garant�a'
	=DEFPOP()
	ON SELE POPU GAR DO GAR
	ACTI POPU GAR
	RELE POPU GAR
CASE C_DIJO="Empleados"
=OPEMP()
DO EMPL
ENDCASE
RETURN MEN_LIN(BOTOM)
