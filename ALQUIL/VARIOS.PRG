* ษอออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : VARIOS.PRG                        บ
* บ COMENTARIO    : DERIVA A GESTION DE PROGRAMAS MIX บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                          บ
* บ FECHA      : 09-08-93                             บ
* บ HORA       : 09:15:35am                           บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER              บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออออออผ
V_DIJO=ALLTRIM(PROMPT())
=CABPAN1()
DO CASE
CASE V_DIJO="Bancos"
   =BAN()
CASE V_DIJO="Ciudades"
	=OPPRV()
	=OPCIU()
	DO GRL1 WITH 4,5,'Menฃ de Ciudades'
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
CASE V_DIJO="Tipo de Actualizaciขn"
	=OPACT() .AND. ACT()
CASE V_DIJO="Impuestos"
	=IMP()
CASE V_DIJO="Conceptos de Imputaciขn"
	=GAS()
CASE V_DIJO="Indices de Actualizaciขn"
	=OPIAC()
	DO GRL WITH 9,5,'Menฃ de Indices de Actualizaciขn'
	ON SELE POPU GRL DO IAC
	ACTI POPU GRL
	RELE POPU GRL
CASE V_DIJO="Tipos de Documento"
	=DNI()
CASE V_DIJO="Control Impresoras"
	=OPCIMP()
CASE V_DIJO="Envกa Mensaje"
	=SEND()
ENDCASE
RETURN MEN_LIN(BOTOM)
