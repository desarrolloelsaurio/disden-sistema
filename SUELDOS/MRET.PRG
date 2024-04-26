********************************************************************************
*-- Programa: MRET.PRG
*-- Fecha   : 17/9/90
*-- Version : G. REINER
*-- Notas   : MUESTRA RETENCIONES
********************************************************************************
PARAMETER cosa
IF ulpr<>"LR" .AND. ulpr<>"MR"
   me1=2
ELSE
   me1=0
ENDIF
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10) COLOR I
DEFI WIND win FROM 4-me1,1 TO 21,78 TITL " "+cosa+" Retenciones " SHAD COLO SCHE 8
ACTI WIND win
STORE ' '+cosa+' Retenciones - ' TO me1
SCATTER MEMVAR
formmes=''
formqui=''
@ 1,1 SAY "Denominaci¢n Retenci¢n" COLOR SCHE 3
@ 2,1 SAY "Texto Retenci¢n para Liquidaci¢n" COLOR SCHE 3
@ 3,1 SAY "Forma de Pago" COLOR SCHE 3
@ 4,1 SAY "Monto" COLOR SCHE 3
@ 5,1 SAY "F¢rmula para Quincenales" COLOR SCHE 3
@ 6,1 SAY "F¢rmula para Mensuales" COLOR SCHE 3
@ 7,1 SAY "Per¡odo del Pago" COLOR SCHE 3
@ 8,1 SAY "Mes de la retroactividad" COLOR SCHE 3
@ 9,1 SAY "Quincena de la retroactividad" COLOR SCHE 3
@ 10,1 SAY "Cantidad de veces por a¤o ?" COLOR SCHE 3
@ 11,1 SAY "Contador de veces" COLOR SCHE 3
@ 12,1 SAY "Vencimiento de la Retenci¢n" COLOR SCHE 3
@ 13,1 SAY "Reset en cada liquidaci¢n ?" COLOR SCHE 3
@ 14,1 SAY "Empresa" COLOR SCHE 3
@ 1,35 GET m->retencion PICTURE "XXXXXXXXXXXXXXXXXXXX"
@ 2,35 GET m->rettexto PICTURE "XXXXXXXXXXXXXXXXXXXX"
m->rettipo=IIF(m->rettipo='P',"Porcentual","Fijo      ")
@ 3,35 GET m->rettipo
@ 4,35 GET m->retmonto PICTURE "99999999999.99"
STORE ALLTRIM(retformqui) TO fq
@ 5,35 GET fq
STORE ALLTRIM(retformmes) TO fm
@ 6,35 GET fq
m->retper=rper(m->retper)
@ 7,35 GET m->retper
@ 8,35 GET m->retmes PICTURE "99"
@ 9,35 GET m->retqui PICTURE "99"
@ 10,35 GET m->retvez PICTURE "99"
@ 11,35 GET m->retcont PICTURE "99"
@ 12,35 GET m->retvenc
@ 13,35 GET m->retreset
IF m->retempresa<>0
   GOTO m->retempresa IN jan
   es=jan->empresa
ELSE
   es='Todas las Empresas'
ENDIF
@ 14,35 GET es
CLEAR GETS
RETURN
*: EOF: MRET.PRG
