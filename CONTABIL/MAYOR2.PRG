*
*                           LIBRO MAYOR POR PANTALLA
*
* MAYOR2.PRG
*
PARAMETER PORFEC
IF HAYCUE()
   IF HAYMOV()
      SELE BAL
      STORE " " TO T1,T2,RES,TR,AP,FISC,FISC1
      STORE .F. TO COMPLETO
      STORE 0 TO INICIO,FINAL,SI,MNIV,ARRASMES,ARRASANIO,SB,PERINI,PERFIN,SM,MLIM      
      STORE {} TO FECINI,FECFIN      
      ******


      IF LISMAY(IIF(PORFEC,"LIBRO MAYOR POR FECHA","LIBRO MAYOR POR PANTALLA"),.F.,PORFEC)
         TIT="LIBRO MAYOR "+IIF(PORFEC,"ENTRE FECHAS ","")+QUEAP()
         WAIT "TRABAJANDO..." WIND NOWA
         =LISTADO3(.T.)
         =LISTADO4()
         SELE BAL1
         STORE 1 TO NPAG,C
         STORE PADC("LIBRO MAYOR "+IIF(PORFEC,"ENTRE FECHAS ","")+QUEAP(),79) TO TIT
         WAIT CLEA
         =WIN0()
         SCAN
            SELE MOV1
            IF SEEK(BAL1.CODIGO)
               SELE BAL1
               STORE CODIGO TO MCOD
               STORE NOMBRE TO MNOM
               DO TITM2
               DO ACMAYOR
               SALDO=0
               STORE 0 TO LINEAS

               IF ARRASANIO .AND. !EMPTY(SB)
                  =MY2SI("SALDO BALANCE ANTERIOR",.F.,.F.,.F.,SB)
                  STORE C+1 TO C
                  STORE 1 TO LINEAS
               ENDIF

               IF ARRASMES .AND. !EMPTY(SI)
                  =MY2SI("SALDO INICIAL")
                  C=C+1
                  LINEAS=LINEAS+1
               ENDIF

               SALDO=SI+SB
               SI=SALDO

               DO CASE
               CASE LINEAS=2
                  =MY2SI("TOTAL ARRASTRE",.T.,.T.,.F.,SALDO)
                  STORE C+3 TO C
               CASE LINEAS=1
                  ? REPL("-",79)
                  STORE C+1 TO C
               ENDCASE

               SELE MOV1
               STORE 0 TO SDEU,SHAB

               SCAN FOR BAL1.CODIGO=MOV1.CODIGO
                  STORE SDEU+DEBE  TO SDEU
                  STORE SHAB+HABER TO SHAB
                  STORE SALDO+DEBE-HABER TO SALDO
                  ? STR(ASIENTO,4)
                  ?? " "
                  ?? STR(MOVIMIENTO,4)
                  ?? " "
                  ?? LEFT(CONCEPTO,10)
                  ?? " "
                  ?? TRAN(FECHA,PICFEC)
                  ?? " "
                  ?? STR(DEBE,11,2)
                  ?? " "
                  ?? STR(HABER,11,2)
                  ?? " "
                  IF SALDO<0
                     ?? STR(0,12,2)
                     ?? " "
                     ?? STR(ABS(SALDO),12,2)
                  ELSE
                     ?? STR(ABS(SALDO),12,2)
                     ?? " "
                     ?? STR(0,12,2)
                  ENDIF
                  STORE C+1 TO C
                  IF C>14
                     C=MY2TR("TRANSPORTE",.T.,.T.,.T.)
                     IF C=70 .OR. C=102
                        SELE BAL1
                        GO BOTT
                        EXIT
                     ENDIF
                     CLEAR
                     STORE NPAG+1 TO NPAG
                     STORE 1 TO C
                     DO TITM2
                  ENDIF
               ENDS
               SELE BAL1
               IF C=70 .OR. C=102
                  EXIT
               ELSE
                  C=MY2TR("SALDO FINAL",.T.,.T.,.T.)
                  IF C=70 .OR. C=102
                     EXIT
                  ENDIF
                  STOR NPAG+1 TO NPAG
                  STOR 1 TO C
               ENDIF
            ENDIF
         ENDSCAN
         RELE WIND WIN0
         SELE BAL1
         =OFF_TMP()
         SELE MOV1
         =OFF_TMP()
      ENDIF
   ENDIF
ENDIF
RELE WIND WIN0
RELE WIND WIN
=MEN_LIN(SYSNOMBRE)
RETURN

FUNCTION MY2TR
PARAMETERS MY_TEX,MY_UNO,MY_DOS,MY_TEC
IF MY_UNO
   ? REPL("-",79)
ENDIF
? PADR(MY_TEX,30)
?? STR(SDEU,11,2)
?? " "
?? STR(SHAB,11,2)
?? " "
IF SALDO<0
   ?? STR(0,12,2)
   ?? " "
   ?? STR(ABS(SALDO),12,2)
ELSE
   ?? STR(ABS(SALDO),12,2)
   ?? " "
   ?? STR(0,12,2)
ENDIF
IF MY_DOS
   ? REPL("-",79)
ENDIF
RETURN IIF(MY_TEC,TECLA(24,.F.,'<F> FIN'),0)

FUNCTION MY2SI
PARAMETER MY_TX,MY_1,MY_2,MY_TEC,MY_VAR
MY_VAR=IIF(TYPE("MY_VAR")="L",SI,MY_VAR)
IF MY_1
   ? REPL("-",79)
ENDIF
? PADR(MY_TX,54)
IF MY_VAR>0
   ?? STR(MY_VAR,12,2)
   ?? " "
   ?? STR(0,12,2)
ELSE
   ?? STR(0,12,2)
   ?? " "
   ?? STR(ABS(MY_VAR),12,2)
ENDIF
IF MY_2
   ? REPL("-",79)
ENDIF
RETURN IIF(MY_TEC,TECLA(24,.F.,'<F> FIN'),0)
