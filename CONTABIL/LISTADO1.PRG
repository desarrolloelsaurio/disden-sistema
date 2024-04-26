*
*                        LISTADO DE PLAN DE CUENTAS
*
* LISTADO1.PRG
* GOYO / OCT 1993
if haycue()
   store " " to T1,T2,RES,MIMP,FISC
   store "     " to MREP
   store 0 to INICIO,FINAL,MNIV,MLIM
   IF LISCUE()
      IF PREGUNT1("Est  Lista la Impresora")
         =LISTADO3()
         store " " to ESPACIO
         store "         " to ESPACIO2
         store 1 to NPAG,C
         do TEST_IMP
				 =cabpri()
         STORE "LISTADO DE PLAN DE CUENTAS" to TIT
         DO TITC1
         SCAN
            C=C+LISTAD11()
            IF _plineno>66
               ? REPL("-",69)
               STORE NPAG+1 TO NPAG
               DO LINF WITH 66
               STORE 1 TO C
               DO TITC1
            ENDIF
         ENDSCAN
         ? REPL("-",69)
         DO FINIMP
         =OFF_TMP()
         WAIT CLEA
      ENDIF
   ENDIF
ENDIF
=MEN_LIN(SYSNOMBRE)
RETURN
