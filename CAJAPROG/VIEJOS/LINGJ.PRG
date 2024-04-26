********************************************************************************
*-- Programa: LINGq.PRG
*-- Fecha   : 01-27-92 07:37pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE INGRESOS DE CAJA
********************************************************************************
ulpr=PROGRAM()
quefec=bar()
DO CASE
CASE BAR()=1
   respuesta='NADAmon#10#6#Listados de Ingreso de Caja por Impresora#3#\<Archivo Completo#Operaciones en \<'+ALLTRIM(xauss)+'#Operaciones en \<'+ALLTRIM(xadols)
	=DEFPOP()
   ON SELE POPU nadamon DO lingk
   ACTI POPU nadamon
   RELE POPU nadamon
OTHERWISE
   STORE {} TO FECINI,FECFIN
	 IF ENTRE_FE()
			ELFEC='FECHAOP>=FECINI .AND. FECHAOP<=FECFIN'
      respuesta='NADAmon#10#6#Listados de Ingreso de Caja por Impresora#3#\<Archivo Completo#Operaciones en \<'+ALLTRIM(xauss)+'#Operaciones en \<'+ALLTRIM(xadols)
		=DEFPOP()
      ON SELE POPU nadamon DO lingk
      ACTI POPU nadamon
      RELE POPU nadamon
   ENDIF
ENDCASE
ulpr=PROGRAM()
=men_lin(botom)
RETURN
*: EOF: FAC.PRG
