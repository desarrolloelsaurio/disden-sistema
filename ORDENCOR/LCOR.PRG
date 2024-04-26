* ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LCOR.PRG                              บ
* บ COMENTARIO    : DERIVA A LISTADOS DE ORDENES DE CORTE บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                              บ
* บ FECHA      : 11-20-93                                 บ
* บ HORA       : 09:12:43am                               บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                  บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
CANT_MAX=8
DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], HABILITADO[CANT_MAX],HABILANT[CANT_MAX]
TEXTO[1,2]=10
TEXTO[2,2]=8
TEXTO[3,2]=40
TEXTO[4,2]=20
TEXTO[5,2]=8
TEXTO[6,2]=8
TEXTO[7,2]=10
TEXTO[8,2]=10
texto[1,1]='Nง O. '+UPPER(KORTE)
texto[2,1]='F. ORDEN'
texto[3,1]="ARTICULO"
texto[4,1]="ESTRUCTURA"
texto[5,1]="F.IN.FAB"
texto[6,1]="F.FIN.FAB"
texto[7,1]="DOC. REF."
texto[8,1]="RESPONSABLE    "
STORE "" TO TTQUE,FISC
STORE .T. TO HABILITADO
STORE 1 TO FILCOR,FILFIN,FILART,FILFFA,FILFFI,FILINI
DO WHILE QUERYCOR(.T.)
	IF FILCOR=3
		=IIF(PORPAN,LCORPR(),LCORIR())
	ELSE
		=ACOPY(HABILITADO,HABILANT)
		STOR NUL TO CASOS,ACLA,LINEA,TT
		=LCORZ0()
		DO WHILE CFGFAC()
            STOR NUL TO CASOS		
			ACLA=HAZ_ACLA()
			LINEA=REPL("=",LEN(ACLA))
			=XPRN1(4,"TMP","LCORZ1()",FISC,"LCORZ")
			STORE .F. TO VARIABLE
		ENDDO
		=OFF_TMP()
		STORE .F. TO VARIABLE
		=ACOPY(HABILANT,HABILITADO)
		=OFF_RELA()
	ENDIF
ENDDO
SET ORDER TO TAG ARTICULO IN MER
RETURN
