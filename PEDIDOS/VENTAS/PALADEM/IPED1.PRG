* ÚÄ PROGRAMA ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³  APLICACION: GESTION DE INGRESO DE NOTAS DE PEDIDO DE VENTA              ³
* ³    ARCHIVO: IPED1.PRG                                                    ³
* ³       AUTOR: G. REINER                                                   ³
* ³ Date created: 01-12-93                                                   ³
* ³ Time created: 01:54:02pm                                                 ³
* ³    Copyright: 1993 by SISTEMAS INFORMATICOS S.R.L.                       ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION iped1  
	DO WHILE .T.
		acti wind win
	STOR .T. TO conti
		SELE PEX
		SCAT memv BLANK
		m.PEDIDO=NADPED
		m.marca=nadmar
		ren=ren+1
		@ ren,nul SAY rebla		
		STOR NUL TO respuesta
		IF !empty(elimer(" Pedida - [ESC] para Salir - [TAB] Repite ",ren,c1)) && OJO
			STOR mer.articulo TO m.articulo
			store alltrim(m.articulo) to ARTANT
			acti wind win
			@ ren,c1 SAY LEFT(m.articulo,10)
			@ ren,c2 SAY LEFT(mer.merca,30)
			SELE PEX
			stor nul to m.PESO
			IF MER.DISCRIM
				@ ren,c3 GET m.cantidad PICTU '99999.99';
				MESS " Peso Pedido "
				READ
				stor nul to RESPUESTA,M.PESO
			ELSE
				@ ren,c3 GET m.cantidad PICTU '99999';
				MESS " Cantidad Pedida "
				READ
			ENDIF
			IF empty(m.cantidad)
				@ ren,nul SAY rebla
				ren=ren-1
				LOOP
			ENDI
			m.max=m.cantidad
			UNITARIO=PORCEN(MER.COSTO,IIF(M.CLIPRE=1,MER.precio1,IIF(M.CLIPRE=2,MER.precio2,IIF(M.CLIPRE=3,MER.precio3,MER.precio4))))
			STORE round(unitario,2) TO UNITARIO,MONTOOR
			m.cantidad=m.max
			STOR NUL TO nada
			UNITARIO=IIF(nada9#xamoneda,round(IiF(xamoneda=xauss,unitario/nada10,unitario*nada10),2),UNITARIO)
			m.monto=unitario
			store NUL to desx
			STORE M.UNITARIO TO NETX
			M.UNITARIO=NETX
			@ ren,c5 GET unitario PICT "9999999.99"
			CLEA GETS
			m.monto1=unitario
			NACA=m.cantidad*unitario
			@ ren,c6 SAY NACA PICT picu
			STOR naca TO nada
			IF conti
				IF confirm1('Los Datos Ingresados',.T.,20,30)
					STOR ROUND(pretot+nada,2) TO pretot
					STOR CANTOT+M.CANTIDAD TO CANTOT
					PUNTERO=PUNTERO+1
					DIME REXITO[PUNTERO,8]
					REXITO[PUNTERO,1]=NADPED
					REXITO[PUNTERO,2]=MER.ARTICULO
					REXITO[PUNTERO,3]=MONTO
					REXITO[PUNTERO,4]=M.MONTO1
					REXITO[PUNTERO,5]=M.CANTIDAD
					REXITO[PUNTERO,6]=Iif(mer.discrim,M.PESO,NUL)
					=REPUSE1(@REXITO,PUNTERO,7)
					@ 8,C6 SAY pretot pict picu
					@ 8,C3 SAY CANTOT PICT '9999999'
					store .t. to sigue,fuera
				ELSE
					@ ren,nul SAY rebla
					ren=ren-1
				ENDI                                     && confirma
				IF ren>22
					=remimask(.f.)
					ren=9
				ENDI
			ELSE
				IF LASTKEY()=27
					STOR .T. TO sigue,FUERA
					EXIT
				ELSE
					REN=REN-IIF(REN>9,1,NUL)
				ENDIF
			ENDI                                       && elige mercaderia
			IF ren>21
				=remimask(.f.)
				ren=9
			ENDI
		ELSE
			IF LAST()=27
				fuera=empty(PUNTERO)
				EXIT
			ELSE
				REN=REN-1
			ENDIF
		ENDIF
	ENDD                                           && WHIL .t.
RETURN fuera
