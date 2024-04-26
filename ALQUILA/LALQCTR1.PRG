* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LALQCTR1.PRG                                             บ
* บ COMENTARIO    : LISTADO DE CONTROL DE ALQUILERES GENERADOS               บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 11-01-93                                                    บ
* บ HORA       : 01:50:15pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
#DEFINE FOUR   4                                 && FOUR
#DEFINE TWO    2                                 && TWO

STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	M.MESANIO=MESANIO("Mes y Aคo de la Liquidaciขn",.T.,.T.)
	IF !EMPTY(M.MESANIO)
		M.ESBOSS=ESJEFE()
		IF CARTEL("USTED HA SELECCIONADO UN LISTADO QUE REQUIERE",;
			"HOJAS ANCHAS. POR FAVOR, REALICE LOS CAMBIOS NECESARIOS Y",;
			"PULSE [ENTER] PARA CONTINUAR O",;
			"[ESC] PARA ANULAR EL LISTADO")#27
			=WORKING()
			=DOTALK()
			STORE VAL(LEFT(M.MESANIO,TWO)) TO M.XMES
			STORE VAL(RIGHT(M.MESANIO,FOUR)) TO M.XANIO
			SET ORDER TO TAG CODINM IN INM
			SELE ALQ
			SET ORDER TO TAG CODINM
			SET RELA TO CODINM INTO INM
			SELE CCL
			SET ORDER TO TAG CODINM
			SET RELA TO CODINM INTO ALQ ADDI
			GO TOP
			STOR NUL TO CASOS,M.LASUMA,M.LASUMA1
			ACLA=PAIP+;
			" INMUEBLE "+PAIP+;
			PADC("DOMICILIO",40)+PAIP+;
			"C. PROPIET"+PAIP+;
			PADC("PROPIETARIO",30)+PAIP+;
			"C. INQUIL."+PAIP+;
			PADC("INQUILINO",30)+PAIP+;
			PADC("MONTO",XACDIGI)+PAIP+;
			"V.CONTR."+PAIP+;
			IIF(ESBOSS,PADC("COMISION",XACDIGI)+PAIP,"")+;
			"CTL"+PAIP
			LINEA=REPL("=",LEN(ACLA))
			TT="Listado de Control de Generaciขn de Deuda"+chr(13)+chr(10)+;
			"Mes:"+upper(qmes(m.xmes))+" Aคo:"+str(m.xanio,5)
			TMP=GENTMP()
			SELE CCL
			SORT ON CODCLI ;
			TO (TMP) ;
			FIELDS ;
			CCL.CODINM ,;
			INM.DOMICILIO,;
			INM.PROCOD,;
			PER.CLIENTE,;
			CCL.CODCLI,;
			CCL.DETALLE,;
			ALQ.FECHAVENC ,;
			CCL.FECHAVE ,;
			MIX.FILTRO ,;
			CCL.C_COMIS ,;
			CCL.MONTO ;
			FOR CCL.C_MES=M.XMES .AND. ;
				CCL.C_ANIO=M.XANIO .AND. ;
				CCL.COMPRRE="FA"
				=REOPALQ()
				=REOPINM()

				SELE CCL
				USE (TMP) ALIAS CCL
				REPL ALL FILTRO WITH IIF(FECHAVE<=FECHAVENC,"0",IIF(SIGUEALQ(CODCLI,CODINM),"2","1")) ,;
				CLIENTE WITH SAYPER(CODCLI,"INQCOD") ,;
				DETALLE WITH SAYPER(PROCOD,"PRPCOD")
				INDEX ON CLIENTE TAG CLIENTE
				SET ORDER TO TAG CLIENTE
				=UNTALK()
				=UNWORK()
				=CABPRI()
				_PCOPIES=1
				PRINTJOB
				=CABPRI1()
				=TIT_LIN(3)
				SCAN
					IF _PLINENO>63
						=FIN_LIN(3,NUL,;
						PARSE("|SUBTOTAL",;
						STR(M.LASUMA,XACDIGI,TWO)+PAIP+;
						IIF(ESBOSS,STR(M.LASUMA1,XACDIGI,TWO)+PAIP,""),;
						LEN(ACLA)))
						=CABPRI1()
						=TIT_LIN(FOUR)
					ENDI
					? PAIP
					?? CODINM
					?? PAIP
					?? DOMICILIO
					?? PAIP
					?? PROCOD
					?? PAIP
					?? LEFT(DETALLE,30)
					?? PAIP
					?? ALQ.CODCLI
					?? PAIP
					?? CLIENTE
					?? PAIP
					?? STR(MONTO,XACDIGI,TWO)
					?? PAIP
					?? FECHAVENC
					?? PAIP
					M.LASUMA=M.LASUMA+MONTO
					IF ESBOSS
						M.LS=MONTO*C_COMIS/100
						M.LASUMA1=M.LASUMA1+M.LS
						?? STR(M.LS,XACDIGI,TWO)
						?? PAIP
					ENDIF
					?? PADR(REPL("*",VAL(FILTRO)),3)
					?? PAIP
				ENDSCAN
				=FIN_LIN(FOUR,CASOS,;
				PARSE("|TOTAL",;
				STR(M.LASUMA,XACDIGI,TWO)+PAIP+;
				IIF(ESBOSS,STR(M.LASUMA1,XACDIGI,TWO)+PAIP,""),;
				LEN(ACLA)))
				ENDP
				=FINIMP()
				=IAUD(M.MESANIO)
				=REOPCCL()
			ENDIF
		ENDIF
		=RELEWIN("WIN")
	ELSE
		=IAUDI()
	ENDIF
RETURN MEN_LIN(BOTOM)
