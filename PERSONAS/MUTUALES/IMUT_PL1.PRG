SELE MUX
=AFIELDS("PIPO")
SELE 0
CREATE CURSOR TEMPO.DBF FROM ARRAY PIPO
USE TEMPO
APPE BLAN
APPE FROM DBF("MUT") FOR ;
MUT.CODMUT=M.CODMUT .AND. ;
MUT.CODPLAN=M.CODPLAN
DO IMUT_PL1
RETURN .T.

