CLEA
SET TALK ON
use merca
INDE ON left(articulo,10) to nada uniq
copy to nada
use nada
repl all merca with left(merca,25)+SPACE(5)
REPL ALL ARTICULO WITH LEFT(ARTICULO,11)+'00'
REPL ALL SUELA WITH '00'
REPL ALL MERCA1 WITH ''
REPL ALL FECHA WITH DATE()
REPL ALL USUARIO WITH 'AUTOMATICO'
PACK
PACK MEMO
BROW
USE
USE MERCA
APPE FROM NADA
USE F:\SISTEMAS\PRODUC\MIXTA
APPE BLAN
REPL FILTRO WITH 'S'
REPL TEXTO1 WITH 'GENERAL'
REPL TEXTO2 WITH '00'
REPL FECHA  WITH DATE()
REPL USUARIO WITH 'AUTOMATICO'
RETURN
