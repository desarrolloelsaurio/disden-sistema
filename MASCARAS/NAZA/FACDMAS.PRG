********************************************************************************
*-- Name....: FACDMAS.PRG
*-- Date....: 8-13-91
*-- Version.: dBASE IV, Format 1.0
*-- Notes...: MASCARA FACTURA
********************************************************************************
CLEAR
@ 1,3  SAY "Cliente  : "
@ 1,45 SAY "Remito Interno N� : "
@ 2,45 SAY "Marca : "
@ 3,45 SAY "Viajante : "
@ 4,45 SAY "Fecha : "
@ 5,45 SAY "Cond. Pago : "
@ 4,53 SAY DTOC(DATE())
A="�"+REPL("�",16)+"�"+REPL("�",29)+"�"+REPL("�",12)+"�"+REPL("�",10)+"�"+REPL("�",7)+"�"
B="�"+SPACE(16)+"�"+SPACE(29)+"�"+SPACE(12)+"�"+SPACE(10)+"�"+SPACE(7)+"�"
C="�"+REPL("�",16)+"�"+REPL("�",29)+"�"+REPL("�",12)+"�"+REPL("�",10)+"�"+REPL("�",7)+"�"
D="�"+REPL("�",16)+"�"+REPL("�",29)+"�"+REPL("�",12)+"�"+REPL("�",10)+"�"+REPL("�",7)+"�"
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
