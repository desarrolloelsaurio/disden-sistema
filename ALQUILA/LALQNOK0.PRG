* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LALQNOK0.PRG                                             บ
* บ COMENTARIO    : INMUEBLES CON PROBLRMAS - GENERA CABECERA                บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-20-93                                                    บ
* บ HORA       : 00:48:16am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
FUNCTION LALQNOK0
	=WORKING()
	TMP=GENTMP()
	SET ORDER TO TAG INQCOD IN PER
	SET ORDER TO TAG CODINM IN INM
	SET ORDER TO TAG CODINM IN ALQ
	SELE ALQ
	SET RELA TO CODCLI INTO PER
	SET RELA TO CODINM INTO INM ADDI
	STOR NUL TO CASOS
	LINEA=REPL("=",LEN(ACLA))
	ACLA=PAIP+;
		PADC("C. INM.",10)+PAIP+;
		PADC("DOMICILIO",IIF(PORPAN,25,40))+PAIP
	ACLA=ACLA+IIF(PORPAN,"",PADC("INQUILINO",30)+PAIP)
	ACLA=ACLA+PADC("PROBLEMA DETECTADO",30)+PAIP
	STORE NUL TO CASOS
	TT="Inmuebles con Contrato y con Problemas para Generar Alquiler"
RETURN UNWORK()
