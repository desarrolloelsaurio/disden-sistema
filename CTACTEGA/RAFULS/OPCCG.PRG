************************************
*-- Programa: OPCCG.PRG
*-- Fecha   : 08/25/91 07:08pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE CUENTA CORRIENTE GASTOS
**************************************
SELE 11
=men_lin(ABA+'Cuenta De Gastos')
varia=SUBSTR(dbf(),RAT("\",dbf())+1)
nombre=q_ccgas(cns.concod)
IF left(varia,at(".",varia)-1)#nombre
   USE (pathcns+'\'+nombre) ALIAS CCG
ENDIF
RETURN men_lin(BOTOM)
