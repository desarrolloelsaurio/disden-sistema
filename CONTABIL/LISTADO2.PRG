*
*                    LISTADO DE PLAN DE CUENTAS POR PANTALLA
*
* LISTADO2.PRG
* GOYO / OCT 1993
if haycue()
   store " " to T1,T2,RES,MIMP,FISC
   store "     " to MREP
   store 0 to INICIO,FINAL,MNIV,MLIM
   IF LISCUE()
      =LISTADO3()
      =WIN0()
      store " " to ESPACIO
      store "         " to ESPACIO2
      store 1 to NPAG,C
      store "LISTADO DE PLAN DE CUENTAS" to TIT
      DO TITC1
      SCAN
         C=C+LISTAD11()
         if C>17
            C=TECLA(23,.F.,'<F> FIN')
            IF C=70 .OR. C=102
               exit
            endif
            store 1 to C
            STORE NPAG+1 TO NPAG
            DO TITC1
         endif
      ENDSCAN
      IF C<70
         ? REPL("-",69)
         =TECLA(23)
      ENDIF
      =OFF_TMP()
   ENDIF
ENDIF
RELE WIND WIN0
=men_lin(sysnombre)
RETURN
