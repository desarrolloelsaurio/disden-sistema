*******************************************
*-- PROGRAMA: OPLIQ.PRG
*-- FECHA   : 08/25/91 07:08PM
*-- VERSION : G. REINER
*-- NOTAS   : ABRE ARCHIVO DE CUENTA CORRIENTE GASTOS
*******************************************************
SELE 2
=men_lin(ABA+'Liquidaci¢n')
varia=SUBSTR(dbf(),RAT("\",dbf())+1)
nombre=q_liqui(cns.concod)
IF left(varia,at(".",varia)-1)#nombre
   USE (pathcns+'\'+nombre) ALIAS liq excl
ENDIF
RETURN men_lin(BOTOM)
