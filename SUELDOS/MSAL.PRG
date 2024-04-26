********************************************************************************
*-- Programa: MSAL.PRG
*-- Fecha   : 02/11/90 / 16:37:10
*-- Version : G. REINER - GENERADOR
*-- Notas   : MUESTRA DATOS DE SALARIO FAMILIAR
********************************************************************************
PARAMETER cosa
IF ulpr<>"LS" .AND. ulpr<>"MS"
   me1=2
ELSE
   me1=0
ENDIF
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10) COLOR I
DEFINE WINDOW win FROM 6,15 TO 16+me1,75 TITL " "+cosa+" Salario Familiar " SHAD COLO SCHE 8
me1=" "+cosa+" Salario Familiar "
ACTI WIND win
SCATTER MEMVAR
@ 1,1 SAY "Rubro Salario Familiar" COLOR SCHE 3
@ 2,1 SAY "Monto" COLOR SCHE 3
@ 3,1 SAY "Per¡odo de Pago" COLOR SCHE 3
@ 4,1 SAY "Vencimiento del Adicional" COLOR SCHE 3
@ 5,1 SAY "Se Borra cada Per¡odo" COLOR SCHE 3
@ 1,35 GET m->salario
m->salper=rper(m->salper)
@ 2,1 SAY "Monto" COLOR SCHE 3
@ 2,35 GET m->salmonto PICTURE "99999999999.99"
@ 3,1 SAY "Per¡odo de Pago" COLOR SCHE 3
@ 3,35 GET m->salper
@ 4,1 SAY "Vencimiento del Adicional" COLOR SCHE 3
@ 4,35 GET m->salvenc
@ 5,1 SAY "Se Borra cada Per¡odo" COLOR SCHE 3
@ 5,35 GET m->salreset
@ 6,1 SAY "Mes de la Retroactividad" COLOR SCHE 3
@ 7,1 SAY "Quincena de la Retroactividad" COLOR SCHE 3
@ 6,35 GET m->salmes PICTURE '99'
@ 7,35 GET m->salqui PICTURE "9" RANGE 1,2
CLEAR GETS
RETURN
*: EOF: MSAL.PRG
