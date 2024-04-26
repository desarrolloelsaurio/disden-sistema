* ษอออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : SABANA.PRG                  บ
* บ COMENTARIO    : PREPARA LISTADO SABANA PARA บ
* บ                 MEDICOS                     บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                    บ
* บ FECHA      : 11-18-94                       บ
* บ HORA       : 09:58:28am                     บ
* บ COPYRIGHT  : 1994 by GREGORIO REINER        บ
* ศอออออออออออออออออออออออออออออออออออออออออออออผ
PROCEDURE SABANA
=OPMUT()
=OPMIX()
=OPPRA()
=OPLIQ()
M.MESANIO=MESANIO(" Mes Liquidado ",.t.,.t.)
m.x_mes=val(left(m.mesanio,2))
m.x_anio=val(right(m.mesanio,4))
IF !EMPTY(M.X_MES) .AND. !EMPTY(M.X_ANIO)
   if CONFIRMA("Listar "+qmes(m.x_mes)+" de "+str(m.x_anio,4),.t.,20,10)
      =WORKING()
      =DOTALK()
      SELE LIX
      REPL PASADA WITH .T. FOR !PAGADA
      TMP=GENTMP()
      SET ORDER TO TAG MEDCOD IN PER
      SELE LIQ
      SET RELA TO MEDICO INTO PER
      =FLOCK() .OR. FLOK()
      SORT ON PER.CLIENTE,FECHAIN ;
        TO (TMP) FOR ;
        PER.TEXTO3="SI" .AND. ;
        LIQUIDADO .AND. ;
        !EMPTY(MES) .AND. ;
        (ANO<M.X_ANIO .OR. ANO=M.X_ANIO .AND. MES<=M.X_MES)
      SET RELA OFF INTO PER
      =PRXAREA(.T.)
      USE (TMP) ALIAS TMP EXCL
      =MEN_LIN("CHEQUEANDO DATOS DE LIQUIDACION")
      SCAN
         SELE TMP
         IF !XSEEK(TMP.TPR+STR(TMP.NUMERO)+TMP.PRACTICA+TMP.PRXCOD,"LIX","NUMER1")
            WAIT TMP.TPR+STR(TMP.NUMERO)+TMP.PRACTICA+TMP.PRXCOD WIND NOWA
            SELE LIX
            =LIQUNPAC(TMP.PACIENTE,TMP.TPR,TMP.NUMERO,TMP.PRXCOD)
			ELSE
				REPL LIX.PASADA WITH .T.
				REPL LIX.PAGA WITH .T.
         ENDIF
         SELE TMP
      ENDSCAN
      =UNTALK()
      =UNWORK()
      DO LSAB
   ENDIF
ENDIF
RETURN RELEWIN("WIN") .AND. MEN_LIN(BOTOM)
