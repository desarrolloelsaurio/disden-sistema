**********************************************************************
*-- Programa: RECD.PRG
*-- Fecha   : 06/06/91 04:30pm
*-- Versi¢n : R. 'EL BATA'
*-- Notas   : REMITO DE COMPRA DIRECTO
*--           MODIFICACION 26-03-92
*-- Modificaci¢n GOYO 07-23-92 00:25am marca -> empresa
*-- Modificaci¢n GOYO 07-27-92 06:43pm RECORTE TIPOFAC.
*-- Modificaci¢n GOYO 08-10-92 06:40pm adaptaci¢n ipec -> recd
*:**********************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=MOVEWINN(0,0,24,79,'WIN2')
	REBLA=RECmask()
	SELE REC
	SCAT MEMV BLAN
	SELE pro
	STORE nul TO respuesta,puntero,pexito
	IF !EMPTY(elipro("",1,13))
		m.procod=pro.procod
		@ 1,2 SAY ALLTRIM(pro.procod) + " " + ALLTRIM(pro.proveedor)
		@ 2,nul SAY ALLTRIM(pro.domicilio) + " T.E." + ALLTRIM(pro.telefono)
		@ 3,nul SAY pro.localidad
		SELE REC
		@ 1,60 GET M.NUMERO PICT "@!";
		MESS 'Ingrese Nro de Remito [ENTER] p/menu'
		READ
		M.NUMERO=Q_FAC(M.NUMERO)
		@ 1,60 GET M.NUMERO
		CLEA GETS
		IF !EMPTY(M.NUMERO) .AND. RIGHT(M.NUMERO,8)#'00000000'
			SELE REC
			IF !SEEK(M.NUMERO+m.procod)
				STORE nul TO respuesta
				IF !EMPTY(ELIEMP(' [ESC] para Men£ ',2,53))
					m.marca=MIX.NU1
					nada=MIX.TEXTO1
					ACTI WIND win2
					@ 2,53 GET nada
					CLEA GETS
					m.fechaem=DATE()
					@ 3,53 GET m.fechaem
					READ
					RELE CONDPAGO,PRESUP
					DIME CONDPAGO[3],PRESUP[3]
					STORE '' TO CONDPAGO
					STORE NUL TO PRESUP
					FOR A=1 TO 3
						STORE nul TO respuesta
						IF !EMPTY(elipag("",4,15))
							CONDPAGO[A]=LEFT(MIX.TEXTO2,2)
							nada=mix.texto1
							@ 3+A,15 GET nada PICT "@R 999-999-999-999-999-999"
							CLEAR GETS
							@ 3+A,53 GET PRESUP[A] PICT "999,999,999,999.99"
							READ
						ELSE
							EXIT
						ENDIF
					NEXT
					M.CONDPAGO1=CONDPAGO[1]
					M.CONDPAGO2=CONDPAGO[2]
					M.CONDPAGO3=CONDPAGO[3]
					M.PRESUP1=PRESUP[1]
					M.PRESUP2=PRESUP[2]
					M.PRESUP3=PRESUP[3]
					ren=10
					IF IREC1()
						IF confirma("Grabar Remito",.T.,17,10)
							=AGRABAR("REC")
							=AGRABAR("RE1",@PEXITO)
							=IAUD(M.NUMERO+"/"+M.PROCOD)
						ENDIF
					ENDIF
				ENDIF
			ELSE
				=cartel2("EL REMITO N§ "+ALLTRIM(M.NUMERO)," DEL PROVEEDOR "+ALLTRIM(pro.proveedor)," YA FUE INGRESADA","SOLO SE PUEDE MODIFICAR")
			ENDIF
		ENDIF
	ENDIF
	=RELEWIN("win2")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
