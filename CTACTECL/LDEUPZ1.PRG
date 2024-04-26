FUNCTION LDEUPZ1
?paip
=iif(variable[1],qout(DTOC(FECHAop)+paip),'')
=IIF(VARIABLE[2],QOUT(DTOC(FECHAVE)+PAIP),'')
=IIF(VARIABLE[3],QouT(left(detalle,texto[3,2])+PAIP),'')
=IIF(VARIABLE[4],QOUT(RIGHT(compr,texto[4,2])+PAIP),'')
IF VARIABLE[5]
   PARC=MONTO-CUOTA
   ?? STR(PARC,XACDIGI,2)
   ?? PAIP
   TTL[5]=TTL[5]+PARC
   PTL[5]=PTL[5]+PARC
endif
casos=casos+1
RETURN .T.
