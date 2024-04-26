*
*                          LIBRO DIARIO POR PANTALLA
*
* DIARIO2.PRG
*
if haymov()
   STORE " " TO T1,T2,RES,TR,AP,FISC,FISC1
   STORE 0 TO INICIO,FINAL,NPAG,MLIM
   STORE .F. TO PORFEC
   IF LISDIA("LIBRO DIARIO POR PANTALLA")
      WAIT "TRABAJANDO..." WIND NOWA
      =LISTADO4(.F.,.T.)
      IF CONFIRM1("El Listado Requerido")
         =WIN0()
         store 1 to C,NPAG
         store "LIBRO DIARIO "+QUEAP(.t.) to TIT
         DO TITD2
         go top
         store ASIENTO to NROASI
         STORE 0 TO DB,HB
         scan
            if nroasi#asiento
               ? REPL("-",37)+str(NROASI,4)+" "+REPL("-",37)
               =F_DIARIO3("TOTAL ASIENTO")
               STORE 0 TO DB,HB
               IF FDIARIO2()
                  exit
               ENDIF
               store ASIENTO to NROASI
            endif
            ? str(MOVIMIENTO,4)
            ?? " "
            ?? str(CODIGO,8)
            ?? " "            
            ?? LEFT(NOMBRE,10)
            ?? " "
            ?? LEFT(CONCEPTO,19)
            ?? " "
            ?? tran(FECHA,PICFEC)
            ?? " "
            ?? STR(DEBE,12,2)
            ?? " "
            ?? STR(HABER,12,2)
            STORE DEBE+DB TO DB
            STORE HABER+HB TO HB
            store C+1 to C
            if C>17
               ? REPL("-",79)
               =F_DIARIO3("TRANSPORTE")
               IF FDIARIO2()
                  exit
               ENDIF
            endif
         ENDS
         IF C<70
         ? REPL("-",37)+str(NROASI,4)+" "+REPL("-",37)
         =F_DIARIO3("TOTAL ASIENTO")         
         =TECLA(24)
         ENDIF
         RELE WIND WIN0
      ENDIF
      SELE MOV1
      =OFF_TMP()
   ENDIF
ENDIF
=men_lin(sysnombre)
return

FUNCTION FDIARIO2
C=TECLA(24,.F.,'<F> FIN')
IF C=70 .OR. C=102
   RETURN .T.
endif
store NPAG+1 to NPAG
store 1 to C
DO TITD2
RETURN .F.

FUNCTION F_DIARIO3
PARAMETER F_TEX
? PADC(F_TEX,55)
?? STR(DB,12,2)
?? " "
?? STR(HB,12,2)
RETURN .T.
