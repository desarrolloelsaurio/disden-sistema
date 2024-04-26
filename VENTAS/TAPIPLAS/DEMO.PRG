PR=COSTODOL                  (COSTO EN DOLARES)
PR*COTIDOL                   (COSTO EN AUSTRALES)
PR=PR*PRO->COEFRES           (EL COSTO NETO DE CADA MERCADERIA SEGUN PROVEEDOR)
J=UBICA(PR)-1                (Ubica la posicion del precio EN EL ARRAY)

*********************************
***** PARA PRECIO MINORISTA *****
*********************************

IF PRO->POLIGONAL='SI'
	PCTJ=(PVP[J+1]*(PR-PC[J])+PVP[J]*(PC[J+1]-PR))/(PC[J+1]-PC[J])
ELSE
	PCTJ=VTAPUB
ENDIF
PCTJ=1+PCTJ/100
RSLT=PR*PCTJ*TIVA
STR(REDON(RSLT*COTIDOL),11,2)                    && EL REDONDEO ES PARA AUSTRALES EN u$s NO RED

*********************************
***** PARA PRECIO MAYORISTA *****
*********************************

IF PRO->POLIGONAL='SI'
	PCTJ=(PVM[J+1]*(PR-PC[J])+PVM[J]*(PC[J+1]-PR))/(PC[J+1]-PC[J])
ELSE
	PCTJ=VTAMAY
ENDIF
PCTJ=1+PCTJ/100
RSLT=PR*PCTJ
?? STR(REDON(RSLT*COTIDOL),11,2)
?? STR(RSLT*TIVA,11,2)
?? STR(RSLT*COTIDOL*TIVA,11,2)
