********************************************************************************
*-- Name....: FACTMASK.PRG
*-- Date....: 9-26-89
*-- Version.: dBASE IV, Format 1.0
*-- Notes...: MASCARA FACTURA
********************************************************************************
=cabpan1()
A="Ú"+REPL("Ä",16)+"Â"+REPL("Ä",36)+"Â"+REPL("Ä",9)+"Â"+REPL("Ä",14)+"¿"
B="³"+SPACE(16)+"³"+SPACE(36)+"³"+SPACE(9)+"³"+SPACE(14)+"³"
C="Ã"+REPL("Ä",16)+"Å"+REPL("Ä",36)+"Å"+REPL("Ä",9)+"Å"+REPL("Ä",14)+"´"
D="À"+REPL("Ä",16)+"Á"+REPL("Ä",36)+"Á"+REPL("Ä",9)+"Á"+REPL("Ä",14)+"Ù"
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
