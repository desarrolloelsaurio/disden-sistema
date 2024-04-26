*:*********************************************************************
*-- Programa: mliq1.PRG
*-- Fecha   : 25/04/92
*-- Version : R. 'EL BATA'
*-- Notas   : MUESTRA CABEZA LIQ.
*:*********************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   =win0()
   pag=1
   =cabpan()
   store PADC("DESCRIPCION",40)+paip to acla
   store RIGHT('9999999,999,999.99',xacdigi) to picu
   sele tix
   INDE ON unicod to (GENTMP()) for tix.concod=cns.concod uniq COMP
   count to m.cuant
   dime ttot[m.cuant]
   store nul to ttot
   scan
      store acla+iif(XSEEK(tix.unicod,"MIX","TIPCOD"),;
      PADC(alltrim(mix.texto1),xacdigi),;
      tix.unicod)+paip to acla
   ends
   store acla+PADC("TOTALES",XACDIGI)+paip to acla
   use
   lns=REPL("=",min(len(acla),79))
   tt="Liquidaci¢n Consorcio:"+alltrim(cns.consorcio)
   =tit_lns(1)
   sele liq
   set relation to linea into res
   go top
   store nul to m.total
   store 1 to m.yavan
   ?res.lineliq
   ??paip
   scan
      if m.yavan>m.cuant
         =imp_numer(m.total)
         store nul to m.total
         store 1 to m.yavan
         ? res.lineliq
         ??paip
      endif
      IF ROW()>21
         if !fin_lns(1,nul)
            EXIT
         ENDIF
         CLEA
         STOR pag+1 TO pag
		 =cabpan()
		 =tit_lns(2)
      ENDIF
      =imp_numer(monto)
	  store m.total+monto to m.total
	  store ttot[m.yavan]+monto to ttot[m.yavan]
      store m.yavan+1 to m.yavan
   ends
   =imp_numer(m.total)
   ?lns
   ?padr('TOTALES',40)
   ??paip
   store nul to m.total
   for m.i=1 to m.cuant
      =imp_numer(ttot[m.i])
      store ttot[m.i]+m.total to m.total
   endf
   =imp_numer(m.total)
   =fin_lns(2,nul)
   =RELEWIN('win')
   =REOPLIQ()
ELSE
   =iaudi()
ENDI
retur

function imp_numer
para nro
priv nro
?? tran(nro,picu)
?? paip
RETURN .t.
