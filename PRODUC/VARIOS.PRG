*******************************
*-- Programa: VARIOS.PRG
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
*******************************
V_DIJO=ALLTRIM(PROMPT())
ULPR=PROGRAM()
=CABPAN1()
DO CASE
CASE V_DIJO='Tipo de Estructura'
	=OPTST() .AND. TST()
CASE V_DIJO='Tela Gen‚rica'
	=OPTEL() .AND. TEL()
CASE V_DIJO='Rubros'
	=OPRUB() .AND. RUB()
CASE V_DIJO='Etapas de Fabricaci¢n'
   =OPETA() .AND. ETA()
CASE V_DIJO='L¡neas'
	=OPEMP() .AND. OPLIN() .AND. LIN()
CASE V_DIJO='Talleres'
	=OPCIU() .AND. OPETA() .AND. OPTALS() .AND. TALS("Datos Administrativos")
CASE V_DIJO='Grupos de Compra'
	=OPGRU() .AND. GRU()
CASE V_DIJO='Proveedores'
	=OPPRO()
	DO grl1 WITH 6,5,'Men£ de Proveedores'
	ON SELE POPU GRL DO PRO
	ACTI POPU GRL
	RELE POPU GRL
case V_DIJO='Procesos de Fabricaci¢n'
	=opprc()
	EXTERNAL PROCEDURE LPRC1
	DO PRC.SPR
case V_DIJO='Curvas'
	=OPCUR()
	RESPUESTA='grl#11#10#Men£ de Curvas de Producci¢n#3#\<Ingresa#\<Modifica#-#Lista \<por Pantalla#-#Res\<taura el Archivo'
	=DEFPOP()
	ON SELE POPU GRL DO CUR
	ACTI POPU GRL
	RELE POPU GRL
case V_DIJO='Unidades'
	RESPUESTA='grl#7#15#Men£ de Unidades de Fraccionamiento#3#\<Ingresa#-#Lista \<por Pantalla'
	=DEFPOP()
	ON SELE POPU GRL DO UNI
	ACTI POPU GRL
	RELE POPU GRL
CASE V_DIJO='Control Impresoras'
	=OPCIMP()
CASE V_DIJO='Env¡a Mensaje'
	DO SEND
CASE V_DIJO='Agrupaci¢n'
    =OPCAG() .AND. CAG()
ENDCASE
UNLO ALL
RETURN MEN_LIN(BOTOM)
