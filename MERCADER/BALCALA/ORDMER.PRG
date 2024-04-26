********************************************************************************
*-- Programa: ORDMER.PRG
*-- Fecha   : 02/13/91 10:01pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZA ORDEN DE LOS LISTADOS DE MERCADERIAS
********************************************************************************
ulpr=PROGRAM()
=HORA_ULP()
IF sstm='C'
=movewin(8,20,16,70,'win',' Orden de los Listados ')
ELSE
=movewin(8,20,13,70,'win',' Orden de los Listados ')
ENDIF
@ 1,1 SAY 'LISTA PRODUCTOS POR ' colo sche 3
@ 2,1 SAY 'LISTA PROVEEDORES POR ' colo sche 3
IF sstm='C'
@ 3,1 SAY 'LISTA '+UPPER(abios)+' POR ' colo sche 3
@ 4,1 SAY 'LISTA '+UPPER(tellas)+' POR ' colo sche 3
@ 5,1 SAY 'LISTA '+UPPER(zuelas)+' POR ' colo sche 3
ENDIF
vez=1
STORE SPACE(20) TO nada
pct=IIF(ordmer=1,'@M Art¡culo,Denominaci¢n','@M Denominaci¢n,Art¡culo')
DO WHILE vez=1
vez=2
@ 1,26 GET nada PICTURE pct;
 MESS 'Ingrese el Orden de Salida de los Listados de Mercader¡as'
READ
ENDDO
ordmer=IIF(nada='A',1,2)
STORE SPACE(20) TO nada
pct=IIF(ordpro=1,'@M C¢digo Proveedor,Raz¢n Social','@M Raz¢n Social,C¢digo Proveedor')
vez=1
DO WHILE vez=1
vez=2
@ 2,26 GET nada PICTURE pct;
 MESS 'Ingrese el Orden de Salida de los Listados de Proveedores'
READ
ENDDO
IF sstm='C'
ordpro=IIF(nada='C',1,2)
STORE SPACE(20) TO nada
pct=IIF(ordavi=1,'@M C¢digo,Denominaci¢n','@M Denominaci¢n,C¢digo')
vez=1
DO WHILE vez=1
vez=2
@ 3,26 GET nada PICTURE pct;
 MESS 'Ingrese el Orden de Salida de los Listados de '+abios
READ
ENDDO
ordavi=IIF(nada='C',1,2)
STORE SPACE(20) TO nada
pct=IIF(ordtel=1,'@M C¢digo,Denominaci¢n','@M Denominaci¢n,C¢digo')
vez=1
DO WHILE vez=1
vez=2
@ 4,26 GET nada PICTURE pct;
 MESS 'Ingrese el Orden de Salida de los Listados de '+tellas
READ
ENDDO
ordtel=IIF(nada='C',2,1)
vez=1
STORE SPACE(20) TO nada
pct=IIF(ordsue=2,'@M C¢digo,Denominaci¢n','@M Denominaci¢n,C¢digo')
DO WHILE vez=1
vez=2
@ 5,26 GET nada PICTURE pct;
 MESS 'Ingrese el Orden de Salida de los Listados de '+zuelas
READ
ENDDO
ordsue=IIF(nada='D',1,2)
ENDIF
=RELEWIN('win')
=men_lin(botom)
RETURN
*: EOF: ORDMER.PRG

