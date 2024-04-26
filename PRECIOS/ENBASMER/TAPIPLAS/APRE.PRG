********************************************************************************
*-- Programa: apre.prg
*-- Fecha   : 09/10/91 03:21pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZACION DE PRECIOS
*-- VERSIOM TAPIPLAST
********************************************************************************
ulpr=hora_ulp(program())
IF cheqseg()
	=unwork()
	=POPCARTE("Actualizaciขn de Precios"+chr(13)+chr(10)+ttque)
	=MOVEwin(5,10,20,72,'WIN'," Actualizaciขn Precios ")
	stor SPACE(25) TO tipo
	@ 1,1 SAY "TIPO DE ACTUALIZACION" ;
	GET tipo ;
	PICT "@M Aplica Porcentaje,Suma,Cambia a Poligonal,Modifica a Porcentaje" ;
	MESS 'Tipo de Actualizaciขn'
	@ 2,1 SAY "MONTO                " COLO SCHE 3
	READ
	IF LASTKEY()#27
		m.tipo=LEFT(m.tipo,1)
		STOR NUL TO m.tomon
		IF m.tipo="M" .or. m.tipo="A"
			@ 2,1 SAY "PORCENTAJE           " GET m.tomon PICT '999999999.99'
		ELSE
			if m.tipo="S"
				@ 2,1 SAY "PORCENTAJE A SUMAR   " GET m.tomon PICT '999999999.99'
			ELSE
				@ 2,1 SAY "POLIGONAL A INGRESAR " GET m.tomon PICT '999999999.99'
			ENDIF
		ENDIF
		READ
		IF LASTKEY()#27 .AND. !empty(tomon)
			IF m.tipo='M' .or. m.tipo='A'
				m.tomon=1+(m.tomon/100)
			ELSE
				IF m.tipo="C"
					m.tomon=0-m.tomon
				ENDIF
			ENDIF
			stor 'NO' TO preci1,preci2,preci3,preci4
			@ 4,1 SAY "ษออออออออออออออออออออออออออหอออออออออออออออออออออออออออออป" COLO SCHE 3
			\ บ  CONCEPTO A ACTUALIZAR   บ  ACTUALIZA EL CONCEPTO ?    บ
			\ ฬออออออออออออออออออออออออออฮอออออออออออออออออออออออออออออน
			for m.a = 1 to 6
				\ บ                          บ                             บ
			NEXT
			\ ศออออออออออออออออออออออออออสอออออออออออออออออออออออออออออผ
			@ 7,4 SAY '% '+m.xalis1 COLO SCHE 3
			@ 8,4 SAY '% '+m.xalis2 COLO SCHE 3
			@ 9,4 SAY '% '+m.xalis3 COLO SCHE 3
			@ 10,4 SAY '% '+m.xalis4 COLO SCHE 3
			stor 40 TO COL
			@ 7,COL GET m.preci1 PICT "@M NO,SI" MESS 'Actualiza '+xalis1
			@ 8,COL GET m.preci2 PICT "@M NO,SI" MESS 'Actualiza '+xalis2
			@ 9,COL GET m.preci3 PICT "@M NO,SI" MESS 'Actualiza '+xalis3
			@ 10,COL GET m.preci4 PICT "@M NO,SI" MESS 'Actualiza '+xalis4
			READ
			IF LASTKEY()#27 .AND. CONFIRMA("Actualizaciขn",.f.,12,1)
				IF m.preci1="SI" .or. m.preci2="SI" .or. m.preci3="SI" .or. m.preci4="SI"
					SELE mer
					SCAN
						=MEN_LIN(MER.MERCA)
						REGISTRO=STR(RECNO())
						=LOCK() .OR. LOK("MER")
						DO CASE
						CASE m.tipo="A"
							REPL MER.PRECIO1 WITH IIF(APRECTRL(MER.PRECIO1,m.preci1,"A"),MER.PRECIO1*m.tomon,MER.PRECIO1)
							REPL MER.PRECIO2 WITH IIF(APRECTRL(MER.PRECIO2,m.preci2,"A"),MER.PRECIO2*m.tomon,MER.PRECIO2)
							REPL MER.PRECIO3 WITH IIF(APRECTRL(MER.PRECIO3,m.preci3,"A"),MER.PRECIO3*m.tomon,MER.PRECIO3)
							REPL MER.PRECIO4 WITH IIF(APRECTRL(MER.PRECIO4,m.preci4,"A"),MER.PRECIO4*m.tomon,MER.PRECIO4)
						CASE m.tipo="S"
							REPL MER.PRECIO1 WITH IIF(APRECTRL(MER.PRECIO1,m.preci1,"S"),MER.PRECIO1+m.tomon,MER.PRECIO1)
							REPL MER.PRECIO2 WITH IIF(APRECTRL(MER.PRECIO2,m.preci2,"S"),MER.PRECIO2+m.tomon,MER.PRECIO2)
							REPL MER.PRECIO3 WITH IIF(APRECTRL(MER.PRECIO3,m.preci3,"S"),MER.PRECIO3+m.tomon,MER.PRECIO3)
							REPL MER.PRECIO4 WITH IIF(APRECTRL(MER.PRECIO4,m.preci4,"S"),MER.PRECIO4+m.tomon,MER.PRECIO4)
						OTHERWISE
							REPL MER.PRECIO1 WITH IIF(APRECTRL(MER.PRECIO1,m.preci1,"C"),m.tomon,MER.PRECIO1)
							REPL MER.PRECIO2 WITH IIF(APRECTRL(MER.PRECIO2,m.preci2,"C"),m.tomon,MER.PRECIO2)
							REPL MER.PRECIO3 WITH IIF(APRECTRL(MER.PRECIO3,m.preci3,"C"),m.tomon,MER.PRECIO3)
							REPL MER.PRECIO4 WITH IIF(APRECTRL(MER.PRECIO4,m.preci4,"C"),m.tomon,MER.PRECIO4)
						ENDCASE
						=repuse()
						UNLO IN MER
					ENDSCAN
				ENDIF
			ENDIF
		ENDIF
		=iaud('ACTUALIZACION DE PRECIOS')
	ENDIF
	=REOPMER()
	=RELEWIN("POPCARTE")
	=RELEWIN("win")
ELSE
	=iaudI()
ENDIF
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
RETURN
FUNCTION APRECTRL
	PARAMETER DELABASE,DEMEMORIA,LETRA
	m.salida=.F.
	IF m.dememoria="SI"
		IF (m.letra="A" .or. m.letra="S") .and. SIGN(m.delabase)>-1
			m.salida=.T.
		ELSE
			IF m.letra="C" .OR. m.letra="M"
				m.salida=.T.
			ENDIF
		ENDIF
	ENDIF
RETURN m.salida
