CLOSE ALL
SET TALK OFF
SET SAFE OFF
DO WHILE .T.
STORE 0 TO M.BORRADO
ELDIR=GETD()
IF EMPTY(ELDIR) .OR. LAST()=27
   EXIT
ENDIF
CLEA
CANT=ADIR(PIPO,(ELDIR+"\*.ICO"))
IF !EMPTY(CANT)

CREATE CURSOR TEMPORAL ;
(ARCHIVO C(12),;
LARGO N(10),;
CONTENIDO M)
APPE FROM ARRAY PIPO
SCAN
         ICOA=fOPEN((ELDIR+"\"+ALLTRIM(ARCHIVO)),0)
         REPL CONTENIDO WITH fREAD(ICOA,LARGO)
         =FCLOSE(ICOA)
ENDSCAN
COPY TO TEMPO2
SELE 0
USE TEMPO2
SELE TEMPORAL
SCAN FOR !EMPTY(ARCHIVO)
SELE TEMPO2
SCAN FOR RECNO("TEMPO2")>RECNO("TEMPORAL")  .AND. !EMPTY(ARCHIVO)
IF TEMPORAL.ARCHIVO#TEMPO2.ARCHIVO
IF TEMPORAL.LARGO=TEMPO2.LARGO
     IF TEMPORAL.CONTENIDO=TEMPO2.CONTENIDO
          CLEA
          WAIT TEMPORAL.ARCHIVO+" ES IGUAL A "+TEMPO2.ARCHIVO WIND NOWA
          @ 10,10 SAY (ELDIR+TEMPORAL.ARCHIVO) BITMAP
          @ 10,30 SAY (ELDIR+TEMPO2.ARCHIVO) BITMAP          
          @ 13,1 SAY ELDIR+TEMPORAL.ARCHIVO          
          @ 13,40 SAY ELDIR+TEMPO2.ARCHIVO
*          STORE "S" TO M.RESPUESTA
*          @ 14,10 SAY "BORRA ?" GET M.RESPUESTA
*          READ
*          IF M.RESPUESTA="S"
               ERASE (ELDIR+TEMPO2.ARCHIVO) 
               REPL TEMPO2.ARCHIVO WITH " "
               STORE BORRADO+1 TO BORRADO
               WAIT STR(BORRADO)+" ICONOS BORRADOS" WIND NOWA               
 *         ENDIF
     ENDIF
ENDIF
ENDIF
ENDSCAN
SELE TEMPORAL
ENDSCAN
ENDIF
CLOSE ALL
WAIT STR(BORRADO)+"ICONOS BORRADOS" WIND NOWA               
CLOSE DATA
ERASE TEMPO2.DBF
ERASE TEMPO2.FPT
ENDDO
