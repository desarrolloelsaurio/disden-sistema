********************************************************************************
*-- Programa: CCUR.PRG
*-- Fecha   : 06/04/91 11:01am
*-- Version : g. reiner
*-- Notas   : modifica Curva
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	RESPUESTA='nada#3#60#Operaciones a Efectuar#3#\<Ingresa#A\<grega#\<Graba#\<Anula'
	=DEFPOP()
	ON SELE POPU nada DO resp1
	DEFINE WINDOW win FROM icurr,icurc TO icurr+icurla,icurc+icuran TITL " Modifica Curva " SHAD COLOR SCHE 8
	SELE cur
	STOR " Ingreso Curva - " TO me1
	STOR 17 TO COL
	STOR 0 TO kok
	DO WHILE .T.
		STORE 0 TO respuesta
		IF !empty(elicur(" a Modificar",-1,1))
			SCAT MEMVAR
			SET ORDER TO 1
			SET DELE OFF
			SEEK m.curva
			SET DELE ON
			ACTI SCRE
			RELE curve
			DIME curve[19,3]
			FOR A=1 TO 19
				STORE SPACE(10) TO curve[a,1]
				STORE 0 TO curve[a,2],curve[a,3]
			NEXT
			IF FOUND()
				COPY TO ARRAY curve FOR m.curva=curva
			ENDIF
			fincur=19
			DEFINE WINDOW win1 FROM 0,icurc+icuran-5 TO 24,21+icurc+icuran TITL " Modifica Curva "+alltrim(m.curva)+' ' SHAD COLOR SCHE 8
			ACTI WIND win1
			DO MCUR
			DO WHILE .T.
				FOR A=1 TO fincur
					@ A+2,5 GET curve[a,2]   PICT '99.99'
					@ A+2,16 GET curve [a,3] PICT '999.99'
				NEXT
				CLEA GETS
				STORE 0 TO respuesta
				ACTI SCRE
				ACTI POPU nada
				ACTI WIND win1
				DO CASE
				CASE BAR()=1
					FOR A=1 TO 19
						@ A+2,5 GET curve[a,2]   PICT '99.99'  MESS '[CTRL] Y - Borra'
						@ A+2,16 GET curve [a,3] PICT '999.99' MESS '[CTRL] Y - Borra'
					NEXT
					READ
				CASE BAR()=2
					FOR A=1 TO fincur
						@ A+2,5 GET curve[a,2]   PICT '99.99'  MESS '[CTRL] Y - Borra'
						@ A+2,16 GET curve [a,3] PICT '999.99' MESS '[CTRL] Y - Borra'
					NEXT
					READ
				CASE BAR()=3
					ACTI SCRE
					=floCk("CUR") .OR. FLOK("CUR")
					@ 24,0 SAY PADC(' Espere por Favor - Grabando Curvas ',80,'*') COLO SCHE 19
					DELE FOR curva=m.curva
					STORE "" TO ctrl
					FOR A=1 TO 19
						IF curve[A,2]#0 .AND. curve[A,3]#0
							IF AT(STR(curve[A,2],10,2),ctrl)=0
								ctrl=ctrl+STR(curve[A,2],10,2)
								APPE BLAN
								=repuse()
								REPL curva WITH m.curva
								REPL talle WITH curve[A,2]
								REPL cantidad WITH curve[A,3]
							ENDIF
						ENDIF
					NEXT
					UNLO IN CUR
					=RELEWIN("WIN1")
					EXIT
				CASE BAR()=4
					=RELEWIN("WIN1")
					EXIT
				ENDCASE
			ENDDO
		ELSE
			EXIT
		ENDIF
	ENDDO
	=IIF(EMPTY(KOK),.T.,iaud('ING '+ALLTRIM(STR(kok))+' Curvas'))
	=RELEWIN("win")
	RELE POPU nada
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
