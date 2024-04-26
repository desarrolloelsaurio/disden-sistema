********************************
*-- Programa: MERCAD.PRG
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
* 1 - Mercader¡as
* 2 - Precios
* 3 - Stock
* 4 - Kardex
* 5 - Consulta Precio
* 6 - Lee Precios Casa Central
* 7 - Genera Precios a Sucursales
* 8 - Impuestos Internos
* 9 - Excluye de Lista de Precios
* 10- Incluye en Lista de Precios
* en arroyo - Remitos
*********************************
M_DIJO=ALLTRIM(PROMPT())
ULPR=PROGRAM()
=CABPAN1()
=OPRUB()
=OPMAR()
DO OPCOL
=OPPRO()
=OPMER()
DO CASE
CASE M_DIJO="Popups a Utilizar"
do acpopu.spr
CASE M_DIJO="Partida"
DO MER_PART.SPR WITH " Partida de Importaci¢n ",.t.
CASE M_DIJO="Mercader¡as"
   DO MER.SPR WITH " Ingreso de Mercader¡as "
CASE M_DIJO="Precios"
	respuesta='grl#5#25#Men£ de Precios#3#\<Ingresa#\<Corrige#\<Actualiza#-#\<Lista por Impresora#Lista Por Impresora (\<Rubro por P gina)#Lista \<por Pantalla#-#Res\<taura el Archivo'
	=DEFPOP()
	ON SELE POPU grl DO pre
	ACTI POPU grl
	RELE POPU grl
CASE M_DIJO="Stock"
	=OPKAR()
	respuesta='grl#5#25#Men£ de Stock#3;
#\<Ingresa;
#\<Corrige;
#\<Actualiza;
#-;
#\<Lista por Impresora;
#Lista \<por Pantalla;
#-;
#Res\<taura el Archivo'
=defpop()
	ON SELE POPU grl DO STO
	ACTI POPU grl
	RELE POPU grl
CASE M_DIJO="Kardex"
	respuesta='nada#5#20#Kardex#3#\<Operaciones de Kardex#\<Kardex'
	=defpop()
	ON SELE POPU nada DO kardex
	ACTI POPU nada
	RELE POPU nada
CASE M_DIJO="Consulta Precio"
	respuesta='nada#6#28#Consultas de Precios#3#Popup \<Completo#\<Popup Parcial#Por \<Teclado'
	=defpop()
	popant=merpop
	pop1ant=merpop1
	ON SELE POPU nada DO CONSUL
	ACTI POPU nada
	RELE POPU nada
	merpop=popant
	merpop1=pop1ant
	=OPMER()
CASE M_DIJO="Lee Precios Casa Central"
	DO LEEPRE
CASE M_DIJO="Excluye de Lista de Precios" .or. M_DIJO="Incluye en Lista de Precios"
   B_PREF=IIF(left(m_dijo,2)="In",'IN','EX')
   do grl2 with 8,35,"L¡mites de la "+proper(b_pref)+"clusi¢n",.T.
   on sele popu nada do blis with b_pref="IN"
   acti popu nada
   rele popu nada
CASE M_DIJO="Remitos"
   acti popu remito
CASE M_DIJO="Impuestos Internos"
	respuesta='ANDA#9#35#Gesti¢n de Impuestos Internos#3;
#\<Generaliza;
#\<Corrige;
#Lista \<por Pantalla;
#Lista por \<Impresora'
	=defpop()
	ON SELE POPU ANDA DO impint
	ACTI POPU ANDA
	RELE POPU ANDA
ENDCASE
RETURN MEN_LIN(BOTOM)
