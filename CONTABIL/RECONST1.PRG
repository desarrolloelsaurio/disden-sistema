* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : RECONST1.PRG                                             บ
* บ COMENTARIO    : RECONSTRUYE SALDOS SOLO PARA UN MES                      บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 10-18-93                                                    บ
* บ HORA       : 03:20:45pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
PARAMETER QUEMES
store "RECONSTRUCCION DE SALDOS" to TITULO
if haymov()
	WAIT "BORRANDO SALDOS ANTERIORES..." WIND NOWA
	SELE BAL
	SET ORDER TO
	QM=ALLTRIM(STR(QUEMES))
	D1="DEBE"+QM
	H1="HABER"+QM
	REPL ALL ;
	&D1 WITH 0 ;
	&H1 WITH 0 
	INDEX ON CODIGO TAG IMPUT FOR IMPUTABLE="N"
	WAIT CLEA
	RELE QM,D1,H1
	=RECUADRO(10,10,17,70)
	*********** IMPUTABLES
	SELE MOV
	SET ORDER TO
	GO TOP
	@ 1,1 say "Mes       :"
	@ 2,1 SAY "Asiento   :"
	@ 3,1 say "Movimiento:"
	@ 4,1 say "Cuenta    :"
	SELE BAL
	SET ORDER TO
	SCAN FOR IMPUTABLE="I" 
		@ 4,20 SAY NOMBRE
		COD1=BAL.CODIGO
		SELE MOV
		DIME D[12],H[12]
		STORE 0 TO D,H
		SCAN FOR CODIGO=COD1 .AND. PERIODO=QUEMES
			@ 1,20 say PERIODO
			@ 2,20 SAY ASIENTO
			@ 3,20 SAY movimiento
			D[MOV.PERIODO]=D[MOV.PERIODO]+MOV.DEBE
			H[MOV.PERIODO]=H[MOV.PERIODO]+MOV.HABER
		ENDSCAN
		SELE BAL
		SCAT TO NADA
		FOR A=QUEMES TO QUEMES
			POSIC=(A+2)*2
			NADA[POSIC]=D[A]
			NADA[POSIC+1]=H[A]
		NEXT
		GATH FROM NADA
		SELE BAL
	ENDSCAN

	******* NO IMPUTABLES
	SELE BAL
	SET ORDER TO
	SCAN FOR IMPUTABLE="N"
		@ 4,20 SAY NOMBRE
		COD1=CODIGO
		COD2=SINCEROS(STR(CODIGO,8))
		COD2=ALLTRIM(STR(VAL(COD2)+1))
		COD2=VAL(LEFT(COD2+"0000000",8))
		SELE MOV
		DIME D[12],H[12]
		STORE 0 TO D,H
		SCAN FOR CODIGO>COD1 .AND. CODIGO<COD2 .AND. PERIODO=QUEMES
			@ 1,20 say PERIODO
			@ 2,20 SAY ASIENTO
			@ 3,20 SAY movimiento
			D[MOV.PERIODO]=D[MOV.PERIODO]+MOV.DEBE
			H[MOV.PERIODO]=H[MOV.PERIODO]+MOV.HABER
		ENDSCAN
		SELE BAL
		SCAT TO NADA
		FOR A=QUEMES TO QUEMES
			POSIC=(A+2)*2
			NADA[POSIC]=D[A]
			NADA[POSIC+1]=H[A]
		NEXT
		GATH FROM NADA
		SELE BAL
	ENDSCAN
	SELE BAL
    DELETE TAG IMPUT
	SET ORDER TO TAG CODIGO
	SELE MOV
	SET ORDER TO TAG MOVIMIE
ENDIF
RELE WIND WIN
=MEN_LIN(SYSNOMBRE)
return
