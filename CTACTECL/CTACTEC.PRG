*********************************************************************************
*-- Programa: ctactec.prg
*-- Fecha   : 11-08-91 12:21pm
*-- Version : G. REINER
*-- Notas   : MENU cuenta corriente de clientes
********************************************************************************
ulpr=program()
=cabpan1()
DO CASE
CASE BAR()=1
	=OPCIU()
	=OPPAG()
	=OPEMP()
	=OPCLI()
	=OPCCL()
	=OPFAC()
	respuesta='nada#4#20#Gesti¢n de Notas de D‚bito#3#Emite Nota de D‚bito#-#\<Lista por Impresora#Lista \<por Pantalla#-#\<Anula'
	=DEFPOP()
	ON SELE POPU NADA DO NDEB
	ACTI POPU NADA
	RELE POPU NADA
CASE BAR()=2
	=OPOPK()
	=OPKAR()
	=OPMER()
	=OPVIA()
	=OPCIU()
	=OPPAG()
	do OPEMP
	DO OPPRE
	=OPCLI()
	=OPCCL()
	=OPFAC()
	respuesta='ALGO#4#30#Gesti¢n de Notas de Cr‚dito#3#Emite Nota de Cr‚dito#-#\<Lista por Impresora#Lista \<por Pantalla#-#\<Anula'
	=DEFPOP()
	ON SELE POPU ALGO DO NCRE
	ACTI POPU ALGO
	RELE POPU ALGO
CASE BAR()=3
	respuesta='nadx#6#42#Estado de Cuenta#3#\<Por Pantalla#Por \<Impresora#\<Salda Cuenta Corriente'
	=DEFPOP()
	ON SELE POPU NADX DO LCTA
	ACTI POPU NADX
	RELE POPU NADX
ENDCASE
RETURN MEN_LIN(BOTOM)
