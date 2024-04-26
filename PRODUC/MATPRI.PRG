* ษออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : MATPRI.PRG                 บ
* บ COMENTARIO    : GESTION DE MATERIAS PRIMAS บ
* ฬออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                   บ
* บ FECHA      : 09-08-93                      บ
* บ HORA       : 11:16:43am                    บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER       บ
* ศออออออออออออออออออออออออออออออออออออออออออออผ
ULPR=PROGRAM()
=CABPAN1()
DO CASE
CASE BAR()=1
	=OPPRO()
	=OPGRU()
	=OPAVIS()
RESPUESTA='grl#4#15#Menฃ de '+abios+'#3;
#\<Datos Generales;
#\<Caracterกsticas;
#Lega\<jo;
#-;
#\<Stock;
#\<Kardex;
#\<En qu Orden ?;
#-;
#Avกo \<Madre'
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
RESPUESTA='grl#4#15#Menฃ de '+TELLAs+'#3;
#\<Datos Generales;
#Lega\<jo;
#-;
#\<Stock;
#\<Kardex;
#\<En qu Orden ?;
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
