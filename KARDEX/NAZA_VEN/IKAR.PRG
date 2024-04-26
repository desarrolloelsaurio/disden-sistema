********************************************************************************
*-- Programa: IKAR.PRG
*-- Fecha   : 12-16-91 06:32pm
*-- Version : G. REINER
*-- Notas   : INGRESA KARDEX
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
defi wind win FROM ikarr,ikarc TO ikarr+ikarla,ikarc+ikaran TITL " Ingreso Kardex " SHAD colo sche 8
SELE kar
STOR " Ingreso Kardex - " TO me1
STOR 24 TO COL
STOR NUL TO kok,talle,cantidad
DO WHIL .T.
ACTI WIND win
CLEA
SCAT MEMV BLAN
@ 1,2 SAY "Art¡culo              " COLO SCHE 3
@ 3,2 SAY "Talle                 " COLO SCHE 3
@ 2,2 SAY "Descripci¢n Art¡culo  " COLO SCHE 3
@ 4,2 SAY "Fecha de la Operaci¢n " COLO SCHE 3
@ 5,2 SAY "Operaci¢n de Kardex   " COLO SCHE 3
@ 6,2 SAY "Detalle               " COLO SCHE 3
@ 7,2 say "Documento             " colo sche 3
@ 8,2 say "N§ Documento          " colo sche 3
@ 9,2 SAY "Cantidad              " COLO SCHE 3
STOR NUL TO RESPUESTA
IF !EMPTY(EliMER(" Art¡culo",1,COL))
STORE alltrim(MER->ARTICULO) TO m->articulo
nada=mer->merca
SELE kar
ACTI WIND win
@ 1,COL GET m->articulo
@ 2,COL GET nada
CLEA GETS
@ 3,col get m->talle mess me1+" Talle del Art¡culo"
read
if m->talle<=xatalmax .and. m->talle>=xatalmin
m->ARTICULO=m->ARTICULO+ZERO(M->talle*10,3)
@ 4,COL GET m->fechaop;
 MESS "Ingrese la fecha de la operaci¢n - [ESC] para Men£"
read
STOR NUL TO respuesta
if !empty(eliopk("",5,col))
acti wind win
m->opk=recno()
nada=opk->operacion
@ 5,col get nada
clea gets
signo=iif(opk->consecu="S",1,-1)
m->detalle=left(opk->detalle+m->detalle,30)
@ 6,col get m->detalle pict "@!" mess me1+" Detalle de la Operaci¢n"
@ 7,col get m->docref pict "@!" mess me1+' Tipo de Documento Respaldatorio'
@ 8,col get m->nrodocref pict "@9" mess me1+' N§ de Documento Respaldatorio'
@ 9,col get m->cantidad pict '999999999.99' mess me1+" Cantidad de Unidades"
read
if m->cantidad#0
if signo=1
m->entrada=m->cantidad
else
m->salida=m->cantidad
endif
m->cliente='CONTADO'
M->SUCURSAL=SUCU
SELE KAR
DO FLOK WITH "KAR"
APPE BLAN
gath MEMV
=REPUSE()
KOK=KOK+1
UNLO IN KAR
ENDIF
else
exit
endif
else
exit
endif
else
exit
endif
enddo
IF !EMPTY(kok)
DO iaud WITH 'ING '+ALLTRIM(STR(kok))+' Operaciones Kardex'
ENDIF
else
=iaudi()
ENDIF
DEAC WIND ALL
=MEN_LIN(BOTOM)
RETURN
* EOF - INDENT
