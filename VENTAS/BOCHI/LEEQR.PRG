function leeqr
WAIT "UTILICE LAS LECTORA QR ..." WIND NOWAIT
qj = ""
qf = leecar()
DO WHILE qf<>"C"
	qj = qj + qf
	qf = leecar()
ENDDO
qj = qj + qf
FOR qI=1 TO 8
	qf = leecar()
	qj = qj + qf
NEXT qi

*********  codi es el codigo de articulo

m.codi = RIGHT(REPLICATE("0",10)+STRTRAN(SUBSTR(qj,2,AT("B",qj)-2),".",""),10)

*********  numero de lote

m.lote = SUBSTR(qj,AT("B",qj)+1,AT("C",qj)-AT("B",qj)-1)

*********  laf es fecha de vencimiento

m.laf = RIGHT(qj,8)
m.vence = CTOD(LEFT(laf,2)+"/"+SUBSTR(laf,3,2)+"/"+RIGHT(laf,4))
WAIT  CLEAR
return m.codi+"*"+m.lote+"*"+dtoc(m.vence) 

**  ==============

function leecar
qa=""
DO WHILE EMPTY(qa)
	qa=INKEY(0,"H")
ENDDO 
RETURN CHR(qa)


