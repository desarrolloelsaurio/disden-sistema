FUNCTION GETUNID
ELUND='UNID'
IF EMPTY(GETENV("EQUIPO")) .OR. ;
     GETENV("EQUIPO")="DESARROLLO" .OR. ;
     GETENV("EQUIPO")="MICASA"
   REST FROM UNID ADDI
ELSE
   IF GETENV("EQUIPO")="NAZALAP"
      REST FROM C:\PUBLIC\UNID.MEMM ADDI
   ELSE
      FA="F:\PUBLIC\"+ELUND+".MEM"
      IF FILE(FA)
         REST FROM (FA) ADDI
      ELSE
         FA="f:\USR\"+GETENV("USERNAME")+"\"+ELUND+".MEM"
         IF FILE(FA)
            REST FROM (FA) ADDI
         ELSE
            REST FROM (ELUND) ADDI
         ENDIF
      ENDIF
   ENDIF
ENDIF
RETURN .T.
