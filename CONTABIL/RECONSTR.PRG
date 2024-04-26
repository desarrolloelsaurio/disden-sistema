* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : RECONSTR.PRG                                             บ
* บ COMENTARIO    :                                                          บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 10-18-93                                                    บ
* บ HORA       : 03:20:49pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
PARAMETER SIGUE
store "RECONSTRUCCION DE SALDOS" to TITULO
if haymov()
   IF SIGUE .OR. CONFIRM1("RECONSTRUIR SALDOS")
      WAIT "BORRANDO SALDOS ANTERIORES..." WIND NOWA
      SELE BAL
      SET ORDER TO
      REPL ALL DEBE1 with 0,DEBE2 with 0,DEBE3 with 0,DEBE4 with 0,DEBE5 with 0,DEBE6 with 0,DEBE7 with 0,DEBE8 with 0,DEBE9 with 0,DEBE10 with 0,DEBE11 with 0,DEBE12 with 0
      REPL ALL HABER1 with 0,HABER2 with 0,HABER3 with 0,HABER4 with 0,HABER5 with 0,HABER6 with 0,HABER7 with 0,HABER8 with 0,HABER9 with 0,HABER10 with 0,HABER11 with 0,HABER12 with 0
      INDEX ON CODIGO TAG IMPUT FOR IMPUTABLE="N"
      WAIT CLEA
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
      SCAN FOR CODIGO=COD1
         @ 1,20 say PERIODO
         @ 2,20 SAY ASIENTO
         @ 3,20 SAY movimiento
         D[MOV.PERIODO]=D[MOV.PERIODO]+MOV.DEBE
         H[MOV.PERIODO]=H[MOV.PERIODO]+MOV.HABER
      ENDSCAN
      SELE BAL
      SCAT TO NADA
      FOR A=1 TO 12
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
      SCAN FOR CODIGO>COD1 .AND. CODIGO<COD2
         @ 1,20 say PERIODO
         @ 2,20 SAY ASIENTO
         @ 3,20 SAY movimiento
         D[MOV.PERIODO]=D[MOV.PERIODO]+MOV.DEBE
         H[MOV.PERIODO]=H[MOV.PERIODO]+MOV.HABER
      ENDSCAN
      SELE BAL
      SCAT TO NADA
      FOR A=1 TO 12
      POSIC=(A+2)*2
      NADA[POSIC]=D[A]
      NADA[POSIC+1]=H[A]
      NEXT
      GATH FROM NADA
      SELE BAL
      ENDSCAN
      *********************

      SELE BAL
      SET ORDER TO
      REPL DEBE0 WITH 0,HABER0 WITH 0 FOR IMPUTABLE="N"
      SET ORDER TO TAG CODIGO

      TMP=GENTMP()
      SORT ON CODIGO ;
      FOR IMPUTABLE="I" ;
      FIELDS CODIGO,NOMBRE,DEBE0,HABER0 ;
      TO &TMP

      SELE 0
      USE (TMP) ALIAS TMP

      SELE BAL
      SET ORDER TO
      SCAN FOR IMPUTABLE="N"
      @ 4,20 SAY NOMBRE
      COD1=CODIGO
      COD2=SINCEROS(STR(CODIGO,8))
      COD2=ALLTRIM(STR(VAL(COD2)+1))
      COD2=VAL(LEFT(COD2+"0000000",8))
      SELE TMP
      STORE 0 TO D,H
      SCAN FOR CODIGO>COD1 .AND. CODIGO<COD2
         D=D+TMP.DEBE0
         H=H+TMP.HABER0
      ENDSCAN
      SELE BAL
      REPL DEBE0 WITH D
      REPL HABER0 WITH H
      ENDSCAN
      *********************
      SELE TMP
      =OFF_TMP()
      SELE BAL
      DELETE TAG IMPUT
      SET ORDER TO TAG CODIGO
      SELE MOV
      SET ORDER TO TAG MOVIMIE
   ENDIF
ENDIF
RELE WIND WIN
=MEN_LIN(SYSNOMBRE)
return
