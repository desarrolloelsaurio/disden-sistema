* ษอออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : CTACTE.PRG                  บ
* บ COMENTARIO    : CUENTA CORRIENTE ALQUILERES บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                    บ
* บ FECHA      : 11-24-93                       บ
* บ HORA       : 12:03:34pm                     บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER        บ
* ศอออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM

=CABPAN1()
DO CASE
CASE BAR()=1
	respuesta='CCRAF#4#43#Cta Cte Alquileres#3;
#\<Genera Alquiler;
#Emite \<Control;
#\<Emite Liquidaciขn Informal;
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
#Ajuste Cta Cte a Favor de la A\<dministraciขn;
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
#\<Nota de \<Crdito;
#Nota de \<Dbito;
#Ingreso de \<Gastos;
#-;
#\<Reimputa;
#-;
#Cta Cte por \<Pantalla;
#Cta Cte por \<Impresora;
#Pasa a \<Histขrico;
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
