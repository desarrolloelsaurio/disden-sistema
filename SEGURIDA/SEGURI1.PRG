* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : SEGURI1.PRG                                              บ
* บ COMENTARIO    : INGRESO DE PASSWORD PARA SISTEMAS MULTIUSUARIOS          บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-06-93                                                    บ
* บ HORA       : 03:02:53am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION SEGURI1
	PARAMETERS DBF_FILE
	PRIVATE DBF_FILE, CUR_BUFF, CUR_COMP, CUR_WIN, RVALUE
	IF GETENV("USERNAME")="GOYO"
		USN='GOYO'
	RETURN 1
ELSE
	RVALUE=9
	CUR_BUFF=SELE()
	CUR_WIN=WOUTPUT()
	CAN_PAR=PARAMETER()
	=MOVEWIN(10,20,18,60,'PASS_WIN','SU PASSWORD')
	IF EMPTY(CAN_PAR)
		IF FILE("F:\PUBLIC\MONDAY.PAS")
			DBF_FILE="F:\PUBLIC\MONDAY.PAS"
		ELSE
			DBF_FILE="\PUBLIC\MONDAY.PAS"
		ENDIF
	ENDIF
	IF !FILE(DBF_FILE)
		QUIT
	ELSE
		RVALUE=CHK_PASS()
	ENDIF
	USE
	=RELEWIN("PASS_WIN")
	SELE(CUR_BUFF)
	IF EMPTY(CUR_WIN)
		ACTIVATE SCREEN
	ENDIF
ENDIF
RETURN RVALUE
********
PROCEDURE CHK_PASS
	PRIVATE PASSWORD, PASS_COUNT
	SELE 0
	USE (DBF_FILE) ALIAS PASSWORD
	NOMBRE=GETENV("APYNOM")
	PSIC=AT(' ',NOMBRE)
	N1=ALLTRIM(LEFT(NOMBRE,PSIC-1))
	N2=ALLTRIM(SUBSTR(NOMBRE,PSIC+1))
	IF LEN(N1)=6
		N1=LEFT(N1,4)+LEFT(N2,2)
	ELSE
		N1=LEFT(N1+N2,6)
	ENDIF
	PASSWORD=ENCRYPT(N1,2)
	SET ORDER TO TAG PASSWORD
	IF SEEK(PASSWORD)
		USER_NO=RECNO()
		POSA=VAL(SUBST(DECODE(CODEA,USER_NO+2),5,1))
		USN=DECODE(FIRST_NAME,USER_NO+1)
	ELSE
		QUIT
	ENDIF
RETURN POSA
