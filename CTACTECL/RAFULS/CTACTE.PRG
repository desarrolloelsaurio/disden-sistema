* 浜様様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : CTACTE.PRG                  �
* � COMENTARIO    : CUENTA CORRIENTE ALQUILERES �
* 麺様様様様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER                    �
* � FECHA      : 11-24-93                       �
* � HORA       : 12:03:34pm                     �
* � COPYRIGHT  : 1993 by GREGORIO REINER        �
* 藩様様様様様様様様様様様様様様様様様様様様様様�
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM

=CABPAN1()
DO CASE
CASE BAR()=1
	respuesta='CCRAF#4#43#Cta Cte Alquileres#3;
#\<Genera Alquiler;
#Emite \<Control;
#\<Emite Liquidaci�n Informal;
#\<Recibos Bancarios;
#-;
#\<Reindexa'
	=DEFPOP()
	ON SELE POPU CCRAF DO CTACTEAL
	ACTI POPU CCRAF
	RELE POPU CCRAF
CASE BAR()=2
	respuesta='CCRAF#5#43#Cta Cte Propietarios#3;
#\<Ajuste Cta Cte a Favor del Propietario;
#Ajuste Cta Cte a Favor de la A\<dministraci�n;
#-'
respuesta=respuesta+';
#\<Calcula Saldo;
#-;
#Cta Cte por \<Pantalla;
#Cta Cte por \<Impresora;
#-;
#\<Reindexa'
	=DEFPOP()
	ON SELE POPU CCRAF DO CTACTEPP
	ACTI POPU CCRAF
	RELE POPU CCRAF
CASE BAR()=3
=OPCLI()
	respuesta='CCRAF#6#43#Cta Cte Inquilinos#3;
#\<Nota de \<Cr�dito;
#Nota de \<D�bito;
#Ingreso de \<Gastos;
#-;
#\<Reimputa;
#-;
#Cta Cte por \<Pantalla;
#Cta Cte por \<Impresora;
#Pasa a \<Hist�rico;
#-;
#\<Reindexa;
#C\<ompacta el Archivo'
=DEFPOP()
	ON SELE POPU CCRAF DO CTACTEIN
	ACTI POPU CCRAF
	RELE POPU CCRAF
USE IN PER
ENDCASE
ULPR=PROGRAM()
RETURN MEN_LIN(BOTOM)
