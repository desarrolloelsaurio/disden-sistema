* зд Program ддддддддддддддддддддддддд©
* Ё    File Name: LFACU.PRG           Ё
* Ё       Author: G. REINER           Ё
* Ё Date created: 12-25-92            Ё
* Ё    Copyright: 1992 by GOYO REINER Ё
* юддддддддддддддддддддддддддддддддддды
EXTERNAL REPORT LFACPU
PARAMETER PORPAN
=WORKING()
SELE FAC
TMP=GENTMP()
SET ORDER TO TAG CODCLI IN PER
SET RELA TO CODCLI INTO PER
FISC="empty(tipo) .or. tipo='FA'"
if ELTIPO='A' .OR. ELTIPO='B'
   IF TYPE("ORDCLI")#'L' .OR. ORDCLI
      INDEX ON CODCLI TO (TMP) ;
        FOR LEFT(FAC.FACTURA,1)=ELTIPO .AND. (empty(tipo) .or. tipo='FA') ;
        COMP
   ELSE
      INDEX ON PER.CLIENTE TO (TMP) ;
        FOR LEFT(FAC.FACTURA,1)=ELTIPO .AND. (empty(tipo) .or. tipo='FA') ;
        COMP
   ENDIF
   TT=TIT_INVOS
ELSE
   IF TYPE("ORDCLI")#'L' .OR. ORDCLI
      SET ORDER TO TAG CODCLI
   ELSE
      INDEX ON CODCLI TO (TMP) COMP
   ENDIF
ENDIF
IF PORPAN
   =REPORTE("LFACPU",FISC)
ELSE
   repo form LFACIU TO PRIN NOCONSOLE PDSETUP
ENDIF
RETURN
