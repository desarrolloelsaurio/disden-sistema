*:*********************************************************************
*-- Programa: mliq3.PRG
*-- Fecha   : 25/04/92
*-- Version : R. 'EL BATA'
*-- Notas   : GENERA MOVIM. LIQ. CTACTE
*:*********************************************************************
ULPR=HORA_ULP(PROGRAM())
IF  CHEQSEG()
	m.fecliq=GETFELIQ(CNS.CONCOD)
	m.xmes=month(m.fecliq)
	m.xanio=year(m.fecliq)%100
	m.fevliq=GETVELIQ(CNS.CONCOD)
	NUM_LIQ=GETNULIQ(CNS.CONCOD)
	STORE 'EXP'+str(m.xmes,2)+STR(m.xanio,2) TO M.DETALLE
	sele tix
	INDE ON unicod to (GENTMP()) for tix.concod=cns.concod uniq COMP
	count to m.cuant
	DIME SSUM[M.CUANT],INDICE[M.CUANT]
	STORE NUL TO PUNTERO
	scan
		PUNTERO=PUNTERO+1
		INDICE[PUNTERO]=unicod
	endS
	use
	STORE NUL TO SSUM,PUNTERO,m.ttot
	sele liq
	scan
		PUNTERO=iif(PUNTERO<m.cuant,PUNTERO+1,1)
		ssum[PUNTERO]=ssum[PUNTERO]+monto
	ends
	sele CNX
	scan for CNX.concod=cns.concod
		scat memv
		m.codinm=cnx.denom
		m.cual=ascan(indice,tipo)
		m.monto=ssum[m.cual]*porcentaje/100
		m.fechaop=m.fecliq
		m.equivale=m.monto/xacotiz
		m.moneda=xausS
		m.fechave=M.FEVLIQ
		STORE "FA" TO m.COMPR, M.COMPRRE
		STORE .F. TO M.PAGADA
		STORE NUL TO M.CUOTA
		M.NUMERORE=ZERO(NUM_LIQ,8)
		NUM_LIQ=NUM_LIQ+1

		IF XSEEK(LEFT(M.DETALLE,7)+M.CODCLI+m.codinm,"CCL","EXPENSAS")
			IF !PAGADA
				REPLACE CCL.MONTO WITH M.MONTO
				REPLACE CCL.EQUIVALE WITH M.EQUIVALE
				replace ccl.fechaop with m.fecliq
				replace ccl.fechave with m.fevliq
				=REPUSE()
			ENDIF
		ELSE
			=AGRABAR("CCL")
		ENDIF
	ends
ELSE
	=iaudi()
ENDI
retu
