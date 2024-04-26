*****************************************************************************
*-- PROGRAMA: LMER2.PRG
*-- FECHA   : 06/21/91 05:09PM
*-- VERSION : G. REINER
*-- NOTAS   : DERIVA A OPERACIONES DE LISTADO DE MERCADER¡AS
*-- MODIFICACION GOYO 05-13-92 07:16PM A QWMER
********************************************************************************
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
* 1. Nombres
* 2. Descripciones
* 3. Caracter¡sticas
* 4. Agrupaci¢n
* 5. Sin Agrupaci¢n

EXTERNAL PROCEDURE LMERX0.PRG
=HORA_ULP()
DIJO1=BAR()
tt=''
IF DIJO1=4		&& AGRUPACION
	DO LMERAGR
ELSE
	STORE "" TO TT,FISC,TTQUE
	DO QWMERCA.SPR
	IF !EMPTY(FISC) .AND. FISC#'.F.'
		IF dijo1=5		&& SIN AGRUPACION
			FISC=FISC+' .AND. EMPTY(CHRTRAN(MER.CAG,"/ ",""))'
			TTQUE=TTQUE+;
				CRLF+;
				"Art¡culos sin Caracter¡sticas"
		ENDIF
		tt='Listado de Mercader¡as'+ttQUE
		=WORKING()
		=DOTALK()
		TMP=GENTMP()
		SELE MER
		SET ORDER TO
		=FLOCK() .OR. FLOK()
		IF TYPE("ORDCLI")#'L' .OR. ORDMER
			SORT ON ARTICULO TO (TMP) FOR &FISC
		ELSE
			SORT ON MERCA TO (TMP) FOR &FISC
		ENDIF
		USE
		USE (TMP) ALIAS MER
		=UNTALK()
		=UNWORK()
		DO WHILE .T.
			#IF "LISTADO" $ CURD()
				M.PORDONDE=ALGUN(30," Salida del Listado ",;
					"Por \<Pantalla;Por \<Impresora;\<Archivo ASCII;\<Men£ Anterior")
				DO CASE
				CASE M.PORDONDE=1
					PORPAN=.T.
				CASE M.PORDONDE=2
					PORPAN=.F.
				CASE M.PORDONDE=3
					STORE .T. TO M.ENASCII
					STORE .F. TO M.PORPAN
				OTHERWISE
					EXIT
				ENDCASE
			#ENDIF
			IF PORPAN
				DO CASE
				CASE DIJO1=1 .OR. DIJO1=5
					acla=paip+;
						padc("ARTICULO",10)+;
						PAIP+;
						PADC("DENOMINACION",30)+;
						PAIP
					=lgrlp("MER","LMERX0()","","LMERNOMP")
				CASE DIJO1=2
					=LMERPM()
				OTHERWISE
					=LMERPP()
				endcase
			ELSE
				IF DIJO1=1
					=LMERIM()
				ELSE
					CANT_MAX=12
					DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], HABILITADO[CANT_MAX],HABILANT[CANT_MAX]
					TEXTO[1,2]=15
					TEXTO[2,2]=30
					TEXTO[3,2]=5
					TEXTO[4,2]=4
					TEXTO[5,2]=15
					TEXTO[6,2]=15
					TEXTO[7,2]=15
					TEXTO[8,2]=15
					TEXTO[9,2]=15
					TEXTO[10,2]=15
					TEXTO[11,2]=2
					TEXTO[12,2]=10

					TEXTO[1,1]="ARTICULO"
					TEXTO[2,1]="DESCRIPCION"
					TEXTO[3,1]="TEMP."
					TEXTO[4,1]="SEXO"
					TEXTO[5,1]="MARCA"
					TEXTO[6,1]="LINEA"
					TEXTO[7,1]="RUBRO"
					TEXTO[8,1]=MADER
					TEXTO[9,1]=ZUELA
					TEXTO[10,1]=TELLA
					TEXTO[11,1]="JEAN"
					TEXTO[12,1]="USUARIO"

					STORE .T. TO HABILITADO
					=ACOPY(HABILITADO,HABILANT)
					DO WHILE CFGFAC()
						=LMERI1()
						=ACOPY(HABILANT,HABILITADO)
					ENDDO
				ENDIF
			ENDIF
			#IF "LISTADO" $ CURD()
			#ELSE
				EXIT
			#ENDIF
		ENDDO
	ENDIF
ENDIF
=REOPMER()
RETURN MEN_LIN(BOTOM)
