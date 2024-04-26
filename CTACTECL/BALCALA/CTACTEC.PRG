*********************************************************************************
*-- Programa: ctactec.prg
*-- Fecha   : 11-08-91 12:21pm
*-- Version : G. REINER
*-- Notas   : MENU cuenta corriente de clientes
*-- Modificaci¢n GOYO 07-22-92 11:37pm marca -> empresa
*-- Modificaci¢n GOYO
********************************************************************************
ulpr=program()
=cabpan1()
DIJO=ALLTRIM(PROMPT())
DO CASE
CASE BAR()=1
   do OPEMP
   stor nul to respuesta
   if !empty(ELIEMP('',-1,1))
		=OPVIA()
		=OPOPK()
		=OPCIU()
		=OPPAG()

		=OPCLI()
      =OPKAR() with jannro
      =OPMER() with jannro
      =OPCCL() with jannro
      =OPFAC() with jannro
      respuesta='ALGO#4#40#Gesti¢n de Notas de D‚bito#3#Emite Nota de D‚bito#-#\<Lista por Impresora#Lista \<por Pantalla#-#\<Anula'
		=DEFPOP()
      ON SELE POPU ALGO DO NDEB
      ACTI POPU ALGO
      RELE POPU ALGO
   endif
CASE BAR()=2
   do OPEMP
   stor nul to respuesta
   if !empty(ELIEMP('',-1,1))
		=OPVIA()
		=OPOPK()
		=OPCIU()
		=OPPAG()

		=OPCLI()
      =OPKAR() with jannro
      =OPMER() with jannro
      =OPCCL() with jannro
      =OPFAC() with jannro
      respuesta='ALGO#4#40#Gesti¢n de Notas de Cr‚dito#3#Emite Nota de Cr‚dito#-#\<Lista por Impresora#Lista \<por Pantalla#-#\<Anula'
		=DEFPOP()
      ON SELE POPU ALGO DO NCRE
      ACTI POPU ALGO
      RELE POPU ALGO
   endif
CASE BAR()=3
	=OPCLI()
   DO ICOB
CASE BAR()=4
	respuesta='nadx#6#42#Estado de Cuenta#3#\<Por Pantalla#Por \<Impresora#\<Salda Cta. Cte. (Saldo 0)#\<Salda Cta. Cte.#\<Reimputa Cobros'
		=DEFPOP()
      ON SELE POPU nadx DO lcta
      ACTI POPU nadx
      RELE POPU nadx
CASE DIJO="Restaura el Archivo"
   =OPCCL() WITH JANNRO
   DO OPCCH WITH JANNRO
   DO rndx WITH 9,40
   ON SELE POPU rndx DO XCCL
   ACTI POPU rndx
   RELE POPU rndx
ENDCASE
RETURN MEN_LIN(BOTOM)
