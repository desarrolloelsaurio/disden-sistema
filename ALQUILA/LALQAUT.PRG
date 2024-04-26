* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LALQAUT.PRG                                              บ
* บ COMENTARIO    : GENERA VARIABLES PARA LISTADO DE ALQ AUTOR Y NO AUTOR    บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
FUNCTION LALQAUT
	PARAMETER ALQ_PAN
	ACTI WIND XINM
	CLEA
	@ 1,4 GET mchoice FUNCTION '*RNH Autorizados;No Autorizados';
		SIZE 1, 12, 1 DEFAULT 'No Autorizados' ;
		MESS "Lกmites del Listado" ;
		VALID VAL_OBJ(.T.)
	READ CYCLE
	CLEA
	=WORKING()
	=DOTALK()
	FISC=IIF(mchoice='Autorizados',"","!")+"EMITE"
	TT="Listado de Contratos"+chr(13)+chr(10)+mchoice
	SELE INM
	SET RELA OFF INTO ALQ
	SET ORDER TO TAG CODINM INTO INM
	SELE ALQ
	SET RELA TO CODINM INTO INM
	TMP=GENTMP()

	SORT ON CODINM ;
		TO (TMP) FOR &FISC ;
		FIELD CODINM,;
		INM.DOMICILIO,;
		INM.PROCOD,;
		CODCLI,;
		FECHAALQ

	SELE ALQ
	USE
	USE (TMP) ALIAS ALQ EXCL

	ACLA="|  CODIGO  |"+;
		PADC("DOMICILIO",IIF(ALQ_PAN,30,40))+PAIP+;
		PADC("PROPIETARIO",IIF(ALQ_PAN,10,30))+PAIP+;
		PADC("INQUILINO",IIF(ALQ_PAN,10,30))+PAIP

	ACLA=ACLA+"F.ALQUI."+PAIP
	LINEA=REPL("=",LEN(ACLA))
	CASOS=NUL

	=UNTALK()
	=UNWORK()
	=LGRL2(ALQ_PAN,"TMP","LALQAUT0()","FISC","LALQAUTP")
	=REOPALQ()

	SET ORDER TO TAG CODINM
	SELE INM
	SET RELA TO CODINM INTO ALQ
RETURN .T.

FUNCTION LALQ
	IF READKEY()=15 .OR. READKEY()=271
		CLEA READ
	ENDIF
RETURN .T.
