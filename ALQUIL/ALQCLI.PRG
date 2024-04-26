* ษอออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : ALQPER.PRG                          บ
* บ COMENTARIO    : GESTION DE CLIENTES PARA ALQUILERES บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                            บ
* บ FECHA      : 11-06-93                               บ
* บ HORA       : 03:02:14am                             บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM "  "+repl("ฐ",78)                  && BOTOM
=cabpan1()
C_DIJO=ALLTRIM(PROMPT())
=OPCIU()
DO CASE
CASE C_DIJO="Inquilinos"
	=OPINQ()
	RESPUESTA='INQ#5#16#Gestiขn de Inquilinos#3;
#\<Datos Generales;
#\<Legajo de Inquilino'
	=DEFPOP()
	ON SELE POPU INQ DO INQ
	ACTI POPU INQ
	RELE POPU INQ
CASE C_DIJO="Propietarios"
	=OPPRP()
	RESPUESTA='PRP#5#16#Gestiขn de Propietarios#3;
#\<Datos Generales;
#\<Legajo de Propietario'
	=DEFPOP()
	ON SELE POPU PRP DO PRP
	ACTI POPU PRP
	RELE POPU PRP
CASE C_DIJO="Garantกas"
	=OPGAR()
	respuesta='GAR#5#16#Gestiขn de Garantกas#3;
#\<Datos Generales;
#Datos del \<Inmueble;
#\<Legajo de Garantกa'
	=DEFPOP()
	ON SELE POPU GAR DO GAR
	ACTI POPU GAR
	RELE POPU GAR
CASE C_DIJO="Empleados"
=OPEMP()
DO EMPL
ENDCASE
RETURN MEN_LIN(BOTOM)
