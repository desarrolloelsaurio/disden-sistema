PROCEDURE LCAJI
M.FECINI=INFEC("win","Fecha a Listar")
if last()#27 .and. !empty(m.fecini) 
=working()
=dotalk()
DO OPCAJ
DO OPINQ
tmp=gentmp()
SELE CAJ
=FLOCK("CAJ") .OR. FLOK("CAJ")
SORT ON NUMERE FOR ;
FECHAOP=M.FECINI ;
TO (TMP)
UNLO IN CAJ
=PRXAREA(.T.)
USE (TMP) ALIAS TMP
=LCAJI0()
=untalk()
=unwork()
=BORTEMP(DBF("TMP"))
endif
return men_lin(botom)
