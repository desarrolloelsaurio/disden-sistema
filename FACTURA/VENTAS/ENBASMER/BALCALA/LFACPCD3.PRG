* 旼 FUNCTION 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
* �  Description: LFACPCD3.PRG                                               �
* �       AUTOR: G. REINER                                                   �
* � Date created: 11-13-92                                                   �
* � Time created: 12:51:29pm                                                 �
* �    Copyright: SISTEMAS INFORMATICOS S.R.L.                               �
* 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
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
