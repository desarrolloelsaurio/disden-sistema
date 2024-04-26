************************************************
*-- Programa: OPRES.PRG
*-- Fecha   : 08/25/91 07:08pm
*-- Version : R. 'EL BATA'
*-- Notas   : ABRE ARCHIVO DE EXPENSAS GASTOS
*************************************************
SELE 14
=men_lin(ABA+'Expensas')
varia=SUBSTR(dbf(),RAT("\",dbf())+1)
nombre=q_ccres(cns.concod)
IF left(varia,at(".",varia)-1)#nombre
   USE (pathcns+'\'+nombre) ALIAS res excl
ENDIF
RETURN men_lin(BOTOM)
