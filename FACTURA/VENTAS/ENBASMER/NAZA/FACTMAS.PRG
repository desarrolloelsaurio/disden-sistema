********************************************************************************
*-- Name....: FACTMASK.PRG
*-- Date....: 9-26-89
*-- Version.: dBASE IV, Format 1.0
*-- Notes...: MASCARA FACTURA
********************************************************************************
=cabpan1()
A="�"+REPL("�",16)+"�"+REPL("�",36)+"�"+REPL("�",9)+"�"+REPL("�",14)+"�"
B="�"+SPACE(16)+"�"+SPACE(36)+"�"+SPACE(9)+"�"+SPACE(14)+"�"
C="�"+REPL("�",16)+"�"+REPL("�",36)+"�"+REPL("�",9)+"�"+REPL("�",14)+"�"
D="�"+REPL("�",16)+"�"+REPL("�",36)+"�"+REPL("�",9)+"�"+REPL("�",14)+"�"
@ 7,nul SAY A
@ 8,nul SAY B
@ 8,1 SAY "ARTICULO/CURVA"
@ 8,18 SAY "MERCADERIA"
@ 8,36 SAY "TALLE"
@ 8,42 SAY "PRECIO UNI."
@ 8,56 SAY "CANTIDAD"
@ 8,66 SAY "PRECIO TOTAL"
@ 9,nul SAY C
FOR REN=10 TO 22
   @ ren,nul SAY B
ENDFOR
@ ren,nul SAY D
RETURN
*: EOF: FACTMAS.PRG
