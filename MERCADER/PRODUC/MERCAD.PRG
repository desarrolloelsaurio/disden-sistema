**********************************
*-- Programa: MERCAD.PRG
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
*-- VERSION NAZA PRODUCCION
*********************************
ULPR=PROGRAM()
=CABPAN1()
=OPRUB()
=OPMER()
MC_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE MC_DIJO='Datos del Producto'
   CX=15
=OPRUB()
=OPMAT()
=OPEMP()
=OPSUE()
=OPLIN()
=OPTEL()
=OPMER()
   respuesta='grl#4#15#Men£ de Productos#3;
#\<Datos Generales;
#\<Caracter¡sticas;
#Lega\<jo;
#Rep\<ite;
#-;
#Res\<taura el Archivo'
   =DEFPOP()
   ON SELE POPU GRL DO MER
   ACTI POPU GRL
   RELE POPU GRL
	ULPR=HORA_ULP(PROGRAM())
CASE BAR()=2
   =OPPRC()
   =OPLIN()
   =OPEMP()
   =OPEST()
   RESPUESTA='grl#5#35#Men£ de Estructura de Producto#3;
#\<Ingresa;
#\<Corrige;
#-;
#\<Borra;
#\<Repite;
#-#'
   RESPUESTA=RESPUESTA+';
\<Listado;
#-;
#Res\<taura el Archivo'
   =DEFPOP()
   ON SELE POPU GRL DO EST
   ACTI POPU GRL
   RELE POPU GRL
CASE BAR()=3
   =OPLIN()
   =OPEMP()
   =OPAVIS()
   =OPTELS()
   =OPPRC()
   =OPEST()
   =OPDES()
   RESPUESTA="grl#5#35#Men£ de Despiece de "+abios+"#3;
#Ingresa Despiece \<Av¡os;
#Ingresa Despiece \<Telas;
#-;
#\<Repite Despiece;
#R\<eemplaza Despiece;
#\<Borra Despiece;
#Actualiza A\<v¡os;
#Actualiza Te\<las;
#-;
#Listado por \<Pantalla;
#Listado por \<Impresora;
#-;
#Restaura el Arc\<hivo"
=DEFPOP()
   ON SELE POPU GRL DO DES
   ACTI POPU GRL
   RELE POPU GRL
ENDCASE
UNLO ALL
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)
