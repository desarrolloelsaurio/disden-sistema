********************************************************************************
*-- Programa: LREM.PRG
*-- Fecha   : 05-02-92 10:46am
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE REMITO
********************************************************************************
PARAMETER PORPAN
PRIVATE PORPAN
ulpr=PROGRAM()
DO CASE
CASE BAR()=1
	STORE NUL TO RESPUESTA
	IF !EMPTY(ELIEMP("a Listar",-1,1))
		=OPMER() with jannro
		do oprem with jannro
		CANT_MAX=8
		DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], Habilitado[CANT_MAX],habilant[cant_max]
		TEXTO[1,1] ='REMITO'
		TEXTO[2,1] ='FECHA EMISION'
		TEXTO[3,1] ='CLIENTE'
		TEXTO[4,1] =UPPER(BIAJA)
		TEXTO[5,1] ='VALORIZACION       '
		TEXTO[6,1] ='FECHA FACT.'
		TEXTO[7,1] ='N§ FACTURA'
		TEXTO[8,1] ='USUARIO'
		TEXTO[1,2]=13
		TEXTO[2,2]=8
		TEXTO[3,2]=20
		TEXTO[4,2]=20
		TEXTO[5,2]=xacdigi
		TEXTO[6,2]=8
		TEXTO[7,2]=13
		TEXTO[8,2]=10
		STORE '' TO FISC
		store "" to ttque
store .t. to habilitado
		store 1 to filemp,filrem,filvia,filmer,filfec,filmon,filcli,filfac
		do while queryREM(PORPAN)
			IF FILREM=3 .or. filfec=3 .or. filvia=3
				IF M.PORPAN
					DO LRIMPR WITH .F.
				ELSE
					DO LRIMIR WITH .F.
				ENDIF
			ELSE
				if filmer=2
					IF M.PORPAN
						DO LRiMPY with .t.
					ELSE
						DO LRiMIy with .t.
					ENDIF
				else
					=acopy(habilitado,habilant)
					do while CFGFAC() .AND. FILREM#2
						IF M.PORPAN
							DO LREMPz
						ELSE
							DO LREMIz
						ENDIF
						store .f. to variable
					ENDdo
					store .f. to variable
					=acopy(habilant,habiitado)
				endif
			ENDIF
		ENDdo
	endif
CASE BAR()=2
	CANT_MAX=5
	DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], Habilitado[CANT_MAX],habilant[cant_max]
	TEXTO[1,1] ='REMITO'
	TEXTO[2,1] ='FECHA EMISION'
	TEXTO[3,1] =UPPER(BIAJA)
	TEXTO[4,1] ='VALORIZACION       '
	TEXTO[5,1] ='USUARIO'
	TEXTO[1,2]=13
	TEXTO[2,2]=8
	TEXTO[3,2]=20
	TEXTO[4,2]=xacdigi
	TEXTO[5,2]=10
	STORE '' TO FISC
	store .t. to ttque,habilitado
	store 1 to filemp,filrem,filvia,filval,filusu,filmer,filfec,filmon
	do while queryRIM(PORPAN)
		IF FILREM=3 .or. filfec=3 .or. filvia=3
			IF M.PORPAN
				DO LRIMPR WITH .F.
			ELSE
				DO LRIMIR WITH .F.
			ENDIF
		ELSE
			if filmer=2
				IF M.PORPAN
					DO LRIMPY with .f.
				ELSE
					DO LRIMIy with .f.
				ENDIF
			else
				=acopy(habilitado,habilant)
				do while CFGFAC() .AND. FILREM#2
					IF M.PORPAN
						DO LRIMPz
					ELSE
						DO LRIMIz
					ENDIF
					store .f. to variable
				ENDdo
				store .f. to variable
				=acopy(habilant,habiitado)
			endif
		ENDIF
	ENDdo
ENDCASE
=MEN_LIN(BOTOM)
RETURN
