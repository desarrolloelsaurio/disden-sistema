* ÚÄ FUNCTION ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³  Description: LFACPCD3.PRG                                               ³
* ³       AUTOR: G. REINER                                                   ³
* ³ Date created: 11-13-92                                                   ³
* ³ Time created: 12:51:29pm                                                 ³
* ³    Copyright: SISTEMAS INFORMATICOS S.R.L.                               ³
* ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
FUNCTION lfacpcd3
	tx=ABS(fax.cantidad*fax.monto1)
	if !EMPTY(fac.descuento)
		TX=TX*FAC.MONTOBRU/FAC.MONTO
	ENDIF
	IF PER.CONDIVA>0
		if xaciva[PER.condiva,3]='SI'
			gx=tx
			ix=gx*px[PER.condiva]
		else
			gx=tx/px[PER.condiva]
			ix=tx-gx
		endif
	ELSE
		gx=tx/px[2]
		ix=tx-gx
	ENDIF
	iva=iva+ix
	gra=gra+gx
	IF !ESDEBE(FAC.TIPO)
		IF HAYDISC .AND. MER.DISCRIM
			can=can-ABS(fax.UNIDADES)
			PES=PES-ABS(fax.cantidad)
		ELSE
			can=can-ABS(fax.cantidad)
		ENDIF
		cos=cos-ABS(mer.costo*fax.cantidad)
		tot=tot-TX
	ELSE
		IF HAYDISC .AND. MER.DISCRIM
			can=can+ABS(fax.UNIDADES)
			PES=PES+ABS(fax.cantidad)
		ELSE
			can=can+fax.cantidad
		ENDIF
		cos=cos+(mer.costo*fax.cantidad)
		tot=tot+TX
	ENDIF
RETURN .T.
