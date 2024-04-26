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
	=OPCLI()
	=OPCCL()
	 do cccc
CASE BAR()=2
	=OPCIU()
	=OPPAG()

   do OPEMP
	=OPCLI()
	=OPCCL()
   DO opDOC with 14
	=OPFAC()
   respuesta='nada#4#30#Gesti¢n de Notas de D‚bito#3#Emite Nota de D‚bito#-#\<Lista por Impresora#Lista \<por Pantalla#-#\<Anula'
	=DEFPOP()
   ON SELE POPU nada DO ndeb
   ACTI POPU nada
   RELE POPU nada
CASE BAR()=3
	 =OPOPK()
	 =OPKAR()
	 =OPMER()
	 =OPVIA()
	 DO OPDOC with 14
	=OPCIU()
	=OPPAG()

   do OPEMP
	=OPCLI()
	=OPCCL()
	=OPFAC()
   respuesta='ALGO#4#30#Gesti¢n de Notas de Cr‚dito#3#Emite Nota de Cr‚dito#-#\<Lista por Impresora#Lista \<por Pantalla#-#\<Anula'
	=DEFPOP()
   ON SELE POPU ALGO DO nCRE
   ACTI POPU ALGO
   RELE POPU ALGO
CASE BAR()=4
     respuesta='nadx#6#42#Estado de Cuenta#3#\<Por Pantalla#Por \<Impresora'
		=DEFPOP()
      ON SELE POPU nadx DO lcta
      ACTI POPU nadx
      RELE POPU nadx
CASE BAR()=6
	=OPCIU()
	=OPPAG()

   do OPEMP
	=OPCLI()
	=OPCCL()
   do opcaj
   DO ICOB
ENDCASE
=MEN_LIN(BOTOM)
RETURN
