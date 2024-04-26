* ÚÄ Program ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    File Name: LRIMPZ1.PRG                                                ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 12-26-92                                                   ³
* ³ Time created: 01:41:14am                                                 ³
* ³    Copyright: 1992 by SISTEMAS INFORMATICOS S.R.L.                       ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION LRIMPZ1
	?paip
	=iif(variable[1],qout(SUCU+'-'+ZERO(rem.Remito,8)+paip),'')
	=iif(variable[2],qout(DTOC(rem.FECHAEM)+paip),'')
	=IIF(VARIABLE[3],QOUT(left(VIA.VIAJANTE,texto[3,2])+PAIP),'')
	IF VARIABLE[4]
		?? str(valoriz,xacdigi,2)
		?? paip
		ttl[4]=ttl[4]+VALORIZ
		CTRL[4]=.T.
	endif
	=IIF(VARIABLE[5],QOUT(left(rem.usuario,texto[5,2])+PAIP),'')
	casos=casos+1
RETURN .T.
