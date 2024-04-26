********************************************************************************
*-- Name....: FACDMAS.PRG
*-- Date....: 8-13-91
*-- Version.: dBASE IV, Format 1.0
*-- Notes...: MASCARA FACTURA
********************************************************************************
CLEAR
@ 1,3  SAY "Cliente  : "
@ 1,45 SAY "Remito Interno N§ : "
@ 2,45 SAY "Marca : "
@ 3,45 SAY "Viajante : "
@ 4,45 SAY "Fecha : "
@ 5,45 SAY "Cond. Pago : "
@ 4,53 SAY DTOC(DATE())
A="Ú"+REPL("Ä",16)+"Â"+REPL("Ä",29)+"Â"+REPL("Ä",12)+"Â"+REPL("Ä",10)+"Â"+REPL("Ä",7)+"¿"
B="³"+SPACE(16)+"³"+SPACE(29)+"³"+SPACE(12)+"³"+SPACE(10)+"³"+SPACE(7)+"³"
C="Ã"+REPL("Ä",16)+"Å"+REPL("Ä",29)+"Å"+REPL("Ä",12)+"Å"+REPL("Ä",10)+"Å"+REPL("Ä",7)+"´"
D="À"+REPL("Ä",16)+"Á"+REPL("Ä",29)+"Á"+REPL("Ä",12)+"Á"+REPL("Ä",10)+"Á"+REPL("Ä",7)+"Ù"
@ 6,nul SAY A
@ 7,nul SAY B
@ 8,nul SAY C
FOR ren=9 TO 21
   @ ren,nul SAY B
ENDFOR
@ ren,nul SAY D
@ 7,5 SAY "ARTICULO"
@ 7,27 SAY "DESCRIPCION"
@ 7,48 SAY "CURVA/TALLE"
@ 7,62 SAY "CANTIDAD"
@ 7,73 SAY "COLOR"
=cabpan1()
RETURN
*: EOF: FACDMAS.PRG
