* 旼 PROGRAMA 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
* �    ARCHIVO: LFACPY3.PRG                                                  �
* �       AUTOR: G. REINER                                                   �
* � Date created: 11-26-92                                                   �
* � Time created: 04:42:30pm                                                 �
* �    Make File: DEMO.RMK                                                   �
* �    Exec File: INICIO.EXE                                                 �
* �    Copyright: 1992 by SISTEMAS INFORMATICOS S.R.L.                       �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
FUNCTION lfacpy3
	SUMA=ESDEBE(FAC.TIPO)
	IF SUMA
		IF HAYDISC .AND. MER.DISCRIM
		   PES=PES+FAX.CANTIDAD
		   CAN=CAN+FAX.UNIDADES
		ELSE
		   CAN=CAN+FAX.CANTIDAD
		ENDIF
	ELSE
		IF HAYDISC .AND. MER.DISCRIM
		   PES=PES-ABS(FAX.CANTIDAD)
		   CAN=CAN-ABS(FAX.UNIDADES)
		ELSE
		   CAN=CAN+FAX.CANTIDAD
		ENDIF
	ENDIF
 	tx=ABS(fax.cantidad*fax.monto1)
	if !EMPTY(fac.descuento)
        TX=TX*FAC.MONTOBRU/FAC.MONTO
   	ENDIF
	if xaciva[PER.condiva,3]='SI'
		gx=tx
		ix=gx*px[PER.condiva]
	else
		gx=tx/px[PER.condiva]
		ix=tx-gx
	endif
	IF SUMA
		iva=iva+ix
		gra=gra+gx
		tot=tot+gx+ix
	ELSE
		iva=iva-ix
		gra=gra-gx
		tot=tot-gx-ix
	ENDIF
RETURN .T.
