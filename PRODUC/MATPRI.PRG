* 浜様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : MATPRI.PRG                 �
* � COMENTARIO    : GESTION DE MATERIAS PRIMAS �
* 麺様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                   �
* � FECHA      : 09-08-93                      �
* � HORA       : 11:16:43am                    �
* � COPYRIGHT  : 1993 by GREGORIO REINER       �
* 藩様様様様様様様様様様様様様様様様様様様様様夕
ULPR=PROGRAM()
=CABPAN1()
DO CASE
CASE BAR()=1
	=OPPRO()
	=OPGRU()
	=OPAVIS()
RESPUESTA='grl#4#15#Men� de '+abios+'#3;
#\<Datos Generales;
#\<Caracter�sticas;
#Lega\<jo;
#-;
#\<Stock;
#\<Kardex;
#\<En qu� Orden ?;
#-;
#Av�o \<Madre'
=DEFPOP()
	ON SELE POPU GRL DO AVIS
	ACTI POPU GRL
	RELE POPU GRL
	ULPR=HORA_ULP(PROGRAM())
case bar()=2
	=OPMER() .AND. OPSUE() .AND. SUE()
CASE BAR()=3
	=OPPRO()
	=OPGRU()
	=OPAVIS()
RESPUESTA='grl#4#15#Men� de '+TELLAs+'#3;
#\<Datos Generales;
#Lega\<jo;
#-;
#\<Stock;
#\<Kardex;
#\<En qu� Orden ?;
#-;
#Tela \<Madre'
=DEFPOP()
	ON SELE popu grl DO TELS
	ACTI popu grl
	rele popu grl
	ULPR=HORA_ULP(PROGRAM())
CASE BAR()=4
	=OPMER() .AND. OPMAT() .AND. MAT()
ENDCASE
UNLO ALL
RETURN MEN_LIN(BOTOM)
