PROCEDURE QUEBASES
PARAMETER EL_DIRECTORIO,LA_SALIDA
CLOSE DATA
CLEA
SET SAFE OFF
IF EMPTY(EL_DIRECTORIO)
   EL_DIRECTORIO=GETDIR("DIRECTORIO A ANALIZAR")
ENDIF
IF LAST()#27 .AND. !EMPTY(EL_DIRECTORIO)
   =ADIR(PIPO,(EL_DIRECTORIO+"\*.DBF"))
   SELE 0
   USE STRUBASE
   FOR A=1 TO ALEN(PIPO,1)
      WAIT EL_DIRECTORIO+"\"+PIPO[A,1] WIND NOWA
      SELE 0
      USE (EL_DIRECTORIO+"\"+PIPO[A,1]) ALIAS BAS
      RELE ESTRU
      COPY STRU TO TEMPORAL EXTE
      SELE 0
      USE TEMPORAL
      SELE STRUBASE
      LA_BASE=LEFT(PIPO[A,1],AT(".",PIPO[A,1])-1)
      M.FIELD_NAME=LA_BASE
      M.FIELD_TYPE="B"
      M.FIELD_LEN=-1
      M.FIELD_DEC=-1
      INSERT INTO STRUBASE FROM MEMV
      WAIT "COPIANDO ESTRUCTURA" WIND NOWA
      APPE FROM TEMPORAL.DBF
      REPL FIELD_BASE WITH LA_BASE FOR EMPTY(FIELD_BASE)
      USE IN TEMPORAL
      USE IN BAS
   ENDF
   CLOSE DATA
   STORE .F. TO OK
   IF EMPTY(LA_SALIDA)
      STORE SPACE(8) TO LA_SALIDA
      SET TALK OFF
      CLEA
      @ 10,10 SAY "NOMBRE DE LA BASE DE SALIDA"
      @ 10,40 GET M.LA_SALIDA
      READ
      CLEA
      IF LAST()#27 .AND. !EMPTY(M.LA_SALIDA)
         STORE .T. TO OK
      ENDIF
   ELSE
      STORE .T. TO OK
      LA_SALIDA=LEFT(LA_SALIDA,AT(".",LA_SALIDA)-1)
   ENDIF
   IF OK
      SELE 0
      USE STRUBASE
      WAIT "COPIANDO BASES" WIND NOWA
      COPY TO (EL_DIRECTORIO+"\"+LA_SALIDA)
      ZAP
      USE (EL_DIRECTORIO+"\"+LA_SALIDA)      
      INDEX ON FIELD_BASE TAG BASE FOR FIELD_TYPE="B"
      INDEX ON FIELD_BASE+FIELD_NAME TAG CAMPO
      ****
      SALAR1=ALLTRIM(RIGHT(ALLTRIM(LA_SALIDA)+"1",8))
      LIST MEMO TO (EL_DIRECTORIO+"\"+SALAR1+".TXT") 
      CLOSE DATA
      FOR A=1 TO ALEN(PIPO,1)
      WAIT EL_DIRECTORIO+"\"+PIPO[A,1] WIND NOWA
      SELE 0
      USE (EL_DIRECTORIO+"\"+PIPO[A,1]) 
      
      LIST STRU TO (EL_DIRECTORIO+"\"+SALAR1+".TXT") ADDI
      ENDF
      LIST STAT TO (EL_DIRECTORIO+"\"+LA_SALIDA+".TXT")
      CLOSE DATA
   ENDIF
ENDIF
RETURN EL_directorio
