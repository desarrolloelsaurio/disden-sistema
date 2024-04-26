********************************************************************************
*-- Programa: LREMI.PRG
*-- Fecha   : 02-10-92 10:45am
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTATOS POR IMPRESORA DE REMESAS
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
QUEFEC=.T.
filfec=2
fisc=.T.
STORE "" TO TTFEC
=movewin(10,15,12,35,'win1','*')
=qw_fec(0,1,'REM.fechaop')
=relewin('win1')
fisc=quefec
cosa=bar()
do case
case bar()=1
store nul to respuesta
if !empty(elipro("a Listar",-1,1))
fisc=fisc+ '.and. rem.proveedor=pro.procod'
naprove=pro.procod
do lremI1
endif
case bar()=4
do lremp4
otherwise
store nul to respuesta
if !empty(elimer("a Listar",-1,1,.F.))
fisc=fisc+ '.and. rem.merca=mer.rubro+mer.variedad+mer.calidad'
if cosa=2
   do lremI2
else
   do lremI3
endif
endif
endcase
return
