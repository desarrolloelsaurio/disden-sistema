* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LISTADO4.PRG                                             บ
* บ COMENTARIO    : GENERA BASE TRUCHA DE MOVIMIENTOS AS/BAL Y A FISC1       บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 10-07-93                                                    บ
* บ HORA       : 08:12:42pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
PARAMETER CMPLT,PARADIARIO
IF PARADIARIO
   SELE BAL
   SET ORDER TO TAG CODIGO
ELSE
   SELE BAL1
   GO TOP
   INDEX ON CODIGO TAG CODIGO
ENDIF

SELE MOV
SET ORDER TO

IF PARADIARIO
   SET RELA TO CODIGO INTO BAL
ELSE
   SET RELA TO CODIGO INTO BAL1
ENDIF

TMP=GENTMP()
IF CMPLT
   SORT TO &TMP ;
   FOR &FISC1 ;
   ON CODIGO,FECHA,ASIENTO,MOVIMIENTO
ELSE
   IF PARADIARIO
      SORT TO &TMP ;
      FOR &FISC1 ;
      ON ASIENTO,MOVIMIENTO ;
      FIELDS CODIGO,BAL.NOMBRE,ASIENTO,MOVIMIENTO,CONCEPTO,FECHA,DEBE,HABER
   ELSE
      SORT TO &TMP ;
      FOR &FISC1 ;
      ON CODIGO,FECHA,ASIENTO,MOVIMIENTO
   ENDIF
ENDIF
SELE MOV

IF PARADIARIO
   SET RELA OFF INTO BAL
ELSE
   SET RELA OFF INTO BAL1
ENDIF

SELE 0
USE (TMP) ALIAS MOV1
IF PORFEC
   INDEX ON CODIGO ;
   FOR FECHA<FECINI TAG INICIO
   INDEX ON CODIGO TAG CODIGO ;
   FOR FECHA>=FECINI .AND. ;
   FECHA<=FECFIN
ELSE
   IF !PARADIARIO
      INDEX ON CODIGO TAG CODIGO
   ENDIF
ENDIF
RETURN
