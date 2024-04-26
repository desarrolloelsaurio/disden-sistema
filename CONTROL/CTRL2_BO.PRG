* ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : CTRL2_BO.PRG                                  บ
* บ COMENTARIO    : DERIVA A OPERACIONES DE BORRADO DE REGISTROS  บ
* บ                 VIENE DEL SCREEN DE CONTROL                   บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                      บ
* บ FECHA      : 10-19-93                                         บ
* บ HORA       : 11:16:15pm                                       บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                          บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION CTRL2_BO
	EXTERNAL ARRAY TEXTO
	EXTERNAL ARRAY MENSAJE
	#DEFINE CRLF CHR(13)+CHR(10)                  && CRLF
	#DEFINE ENTERCON "PULSE [ENTER] PARA CONTINUAR" && ENTERCON
	DO CASE
		CASE WEXIST("IDATOTAL")
			=BORLEG("Datos Producciขn","DTT","BDTT",.F.,.T.)
		#IF "LABORAT" $ CURDIR()
		CASE WEXIST("LIQ")
			IF ALLTRIM(UPPER(WTITL("LIQ")))=UPPER("Ingreso de Pr cticas de Pacientes")
				=POPCARTE("!!!"+CRLF+;
					"USTED ESTA INTENTANDO BORRAR"+CRLF+;
					"LA PRACTICA "+TRANSFORM(LIQ.PRACTICA,'@R 99.99.99!')+CRLF+;
					ALLTRIM(PRA.PRACTICA)+CRLF+;
					IIF(EMPTY(LIQ.PRXCOD),"","SUBCODIGO "+LIQ.PRXCOD+CRLF)+;
					"DEL PACIENTE "+ALLTRIM(SAYPER(LIQ.PACIENTE,"PACCOD"))+CRLF+;
					"!!!")
				IF CONFIRMA("Borrar pr ctica",.t.,20,0)
					SELE LIQ
					=FLOCK() .OR. FLOK()
					DELE
					UNLO IN LIQ
					=IAUD(LIQ.PACIENTE+"-"+ALLTRIM(STR(LIQ.NUMERO))+"-"+ALLTRIM(LIQ.PRACTICA)+"-"+ALLTRIM(LIQ.PRXCOD)+"-"+ALLTRIM(PER.CLIENTE))
				ENDIF
				=RELEWIN("POPCARTE")
			ENDIF
		#ENDIF
	CASE WEXIST("PER")
		DO CASE
		CASE WEXIST("XPER")
			IF !EMPTY(AT("LEGAJO",UPPER(WTITL("XPER"))))
				=BORLEG("LEGAJO DE "+ALLTRIM(PER.CLIENTE),"PER","B"+LEFT(TEXTO[1],3)+"J")
			ELSE
				IF ALLTRIM(UPPER(WTITL("XPER")))='INGRESO DE MARCAS'
					=BORLEG("LAS MARCAS DE "+ALLTRIM(PER.CLIENTE),"PER","BMARSER","CAG")
				ENDIF
			ENDIF
		CASE WEXIST("INGPRS1")
 			=BORLEG("PROCESO "+M.PRCCOD+" DE ARTICULO "+;
 			ALLTRIM(M.ARTICULO),"PRS","BPRES1","",.T.)		
		OTHERWISE
			=BORLEG(TEXTO[1]+" "+ALLTRIM(PER.CLIENTE),"PER","B"+LEFT(TEXTO[1],3),.F.,.T.)
		ENDCASE
	CASE WEXIST("PRA")
		IF WEXIST("XPRA")
			IF !EMPTY(AT("INSTRUCCIONES",UPPER(WTITL("XPRA"))))
				=BORLEG("INSTRUCCIONES DE "+ALLTRIM(PRA.PRACTICA),"PRA","BPRAJ")
			ELSE
				IF ALLTRIM(UPPER(WTITL("XPRA")))=UPPER("Componentes de la Pr ctica") .AND. ;
						!EMPTY(PRX.CODPRX)
					** BORRA COMPONENTE DE PRACTICA
					=BORLEG("COMPONENTE SUBCODIGO "+ALLTRIM(PRX.CODPRX),"PRX","BPRX",.F.,.T.)
				ELSE
					IF ALLTRIM(UPPER(WTITL("XPRA")))=UPPER("Ingresa Pr cticas en Pr cticas")
						** BORRA P[RACTICA EN PRACTICA
						=BORLEG("COMPONENTE PRACTICA "+ALLTRIM(PRX.CODPRX),"PRX","BPRX",.F.,.T.)
					ENDIF
				ENDIF
			ENDIF
		ENDIF
		#IF "LABORAT" $ CURDIR()
		CASE WEXIST("MUT")
			IF WEXIST("XMUT")
				IF !EMPTY(AT("LEGAJO",UPPER(WTITLE("XMUT"))))
					=BORLEG("LEGAJO DE "+ALLTRIM(MUT.MUTUALABR),"MUT","BMUTJ")
				ELSE
					IF !EMPTY(AT("PORCENTAJES",UPPER(WTIT("XMUT"))))
						DO BMUX
					ENDIF
				ENDIF
			ELSE
				=BORLEG("Mutual "+ALLTRIM(MUT.MUTUALABR),"MUT","BMUT",.F.,.T.)
			ENDIF
		#ENDIF
		#IF "ALQUI" $ CURDIR()
		CASE WEXIST("INM")
			=BINM()
		#ENDIF
		#IF "PROD" $ CURDIR()
		CASE WEXIST("REQ")
			IF XSEEK(M.NUMERO,"REQX","NUMERO")
				=CARTEL("LA ORDEN DE REQUERIMIENTO Nง "+ALLTRIM(STR(M.NUMERO)),;
					"TIENE PRODUCTOS CARGADOS, Y ES IMPOSIBLE DARLE DE BAJA EN ESAS CONDICIONES",;
					"BORRE LOS PRODUCTOS Y REINTENTE",;
					ENTERCON)
			ELSE
				=BORLEG("Orden de Requerimiento Nง "+ALLTRIM(str(m.numero)),"REQ","BREQ",.F.,.T.)
			ENDIF
		CASE WEXIST("TAL")
			=BORLEG("Talleres ","TAL","BTAL",.F.,.T.)
		CASE WEXIST("PRC")
			=BORLEG("Procesos de Fabricaciขn ","PRC","BPRC",.F.,.T.)
		CASE WEXIST("INGPRS")
			=BORLEG("Presupuesto "+ALLTRIM(PRS.NUMERO),"PRS","BPRS",.F.,.T.)
		CASE WEXIST("AVIS")
			IF WEXIST("XAVIS")
				=BORLEG("Legajo de Avกos","AVIS","BAVISJ")
			ELSE
				=BORLEG("Avกo "+ALLTRIM(AVIS.AVIO),"AVIS","BAVIS",.F.,.T.)
			ENDIF
		CASE WEXIST("TELS")
			IF WEXIST("XTELS")
				=BORLEG("Legajo de Telas","TELS","BTELSJ")
			ELSE
				=BORLEG("Avกo "+ALLTRIM(TELS.TELA),"TELS","BTELS",.F.,.T.)
			ENDIF
		CASE WEXIST("COMS")
			IF WEXIST("XCOMS")
				=BORLEG("Legajo de Productos Terminados","COMS","BCOMSJ")
			ELSE
				=BORLEG("Avกo "+ALLTRIM(COMS.COMPRA),"COMS","BCOMS",.F.,.T.)
			ENDIF
		CASE WEXIST("OTRS")
			IF WEXIST("XOTRS")
				=BORLEG("Legajo de Otros Productos","OTRS","BOTRSJ")
			ELSE
				=BORLEG("Otro Prod. "+ALLTRIM(OTRS.OTRO),"OTRS","BOTRS",.F.,.T.)
			ENDIF
		#ENDIF
	CASE WEXIST("MER")
		IF WEXIST("XMER")
			DO CASE
			CASE "PUBLICIDAD" $ UPPER(WTIT("XMER"))
				=BORLEG("Texto de Publicidad del Artํculo","mer","BMERPUBL","PROPAG")
			CASE "TULO" $ UPPER(WTIT("XMER"))
				=BORLEG("Texto de Tํtulo del Artํculo","mer","BMERTITU","PREPAG")
			CASE "LEGAJO" $ UPPER(WTIT("XMER"))
				=BORLEG("Legajo del Artํculo","mer","BMERLEGA","LEGAJO")
			CASE ALLTRIM(WTIT("XMER"))="Descripciขn del Artกculo"
				=BORLEG("Descripciขn Compl. del Artกculo","mer","BMERLEGA","MERCA1")
			ENDCASE
		ELSE
			IF "PARTIDA" $ UPPER(WTIT("MER"))
				=BORLEG("Partida del Artํculo","mer","BMERPAR","PARTIDA")
			ELSE
				=BORLEG(IIF(_WINDOWS,"Artํculo ","Artกculo")+ALLTRIM(MER.ARTICULO),"mer","BMER",.F.,.T.)
			ENDIF
		ENDIF
	CASE WEXIST("TMA")
	     IF "HIJOS" $ UPPER(WTIT("TMA"))
				IF CONFIRMA("Borrar relaciขn",.t.,20,0)
				   IF XSEEK(THI.TELCODPRO,"TELS","TELCODPRO") .AND. ;
				      TELS.TELCODPRO=M.TELCODPRO
				      SELE TELS
				      =LOCK() .OR. LOCK()
				      REPL TELS.MADRE WITH ""
				      UNLO IN TELS
				      SELE THI
				      =LOCK() .OR. LOCK()
				   DELE 
				   UNLO IN THI
				   ENDIF
	        ENDIF
	     ELSE
			=BORLEG("Tela Madre ","TMA","BTMA",.F.,.T.)	
         ENDIF
	CASE WEXIST("MIX")
		=BORLEG(PROP(MENSAJE[3])+ALLTRIM(MIX.TEXTO1),"MIX","B"+LEFT(OTROS[1],3),.F.,.T.)
	ENDCASE
RETURN .T.
