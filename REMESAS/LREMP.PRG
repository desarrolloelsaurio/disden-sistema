********************************************************************************
*-- Programa: LREMP.PRG
*-- Fecha   : 02-10-92 10:45am
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTATOS POR PANTALLA DE REMESAS
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
QUEFEC=.T.
STORE "" TO TTFEC
filfec=2
fisc=.T.
=movewin(10,15,12,35,'win1','*')
=qw_fec(0,1,'REM.fechaop')
fisc=quefec
=relewin('win1')
cosa=bar()
do case
case bar()=1
store nul to respuesta
if !empty(elipro("a Listar",-1,1))
fisc=fisc+ '.and. rem->proveedor=pro->procod'
do lremp1
endif
case bar()=4
do lremp4 with .t.
otherwise
store nul to respuesta
if !empty(elimer("a Listar",-1,1,.F.))
fisc=fisc+ '.and. rem->merca=mer->rubro+mer->variedad+mer->calidad'
if cosa=2
   do lremp2
else
   do lremp3
endif
endif
endcase
return