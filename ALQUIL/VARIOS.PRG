* 浜様様様様様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : VARIOS.PRG                        �
* � COMENTARIO    : DERIVA A GESTION DE PROGRAMAS MIX �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER                          �
* � FECHA      : 09-08-93                             �
* � HORA       : 09:15:35am                           �
* � COPYRIGHT  : 1993 by GREGORIO REINER              �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様�
V_DIJO=ALLTRIM(PROMPT())
=CABPAN1()
DO CASE
CASE V_DIJO="Bancos"
   =BAN()
CASE V_DIJO="Ciudades"
	=OPPRV()
	=OPCIU()
	DO GRL1 WITH 4,5,'Men� de Ciudades'
	ON SELE POPU GRL DO CIU
	ACTI POPU GRL
	RELE POPU GRL
CASE V_DIJO="I. V. A."
=IVA()
CASE V_DIJO="Provincias"
	=PRV()
CASE V_DIJO="Estado de Unidades"
	=EST()
CASE V_DIJO="Tipo de Unidades"
	=TIP()
CASE V_DIJO="Tipo de Actualizaci�n"
	=OPACT() .AND. ACT()
CASE V_DIJO="Impuestos"
	=IMP()
CASE V_DIJO="Conceptos de Imputaci�n"
	=GAS()
CASE V_DIJO="Indices de Actualizaci�n"
	=OPIAC()
	DO GRL WITH 9,5,'Men� de Indices de Actualizaci�n'
	ON SELE POPU GRL DO IAC
	ACTI POPU GRL
	RELE POPU GRL
CASE V_DIJO="Tipos de Documento"
	=DNI()
CASE V_DIJO="Control Impresoras"
	=OPCIMP()
CASE V_DIJO="Env�a Mensaje"
	=SEND()
ENDCASE
RETURN MEN_LIN(BOTOM)
