*
*                    BALANCE DE SUMAS Y SALDOS POR PANTALLA
*
* BALANCE2.PRG
* GOYO / 10-12-93 04:08pm
IF HAYCUE()
   STORE 0 TO MNIV,MES,MES2,INICIO,FINAL,FISC,FISC1,PERINI,PERFIN,ARRASANIO,ARRASMES,MLIM
   STORE " " TO AP,TR
   STORE 1 TO NPAG
   STORE .F. TO PORFEC
   IF LISBAL("BALANCE DE SUMAS Y SALDOS",.F.)
      =LISTADO3(.T.)
      IF CONFIRM1("EL LISTADO")
         SELE BAL1
         GO TOP
         =WIN0()
         STORE 1 TO C
         TIT="BALANCE DE SUMAS Y SALDOS "+QUEAP()
         DO TIT2
         STORE 0 TO DPAR,HPAR,DFIN,HFIN,T1,T2,T3,T4
         SCAN
            DO ACBALAN1
            store DPAR-HPAR to SALDO
            ? STR(BAL1.CODIGO,8)
            ?? " "
            ?? LEFT(BAL1.NOMBRE,18)
            ?? "|"
            ?? TRAN(DPAR,"@Z #########.##")
            ?? "|"
            ?? TRAN(HPAR,"@Z #########.##")
            ?? "|"
            IF SALDO>0
               ?? TRAN(SALDO,"@Z #########.##")
               ?? "|"
               ?? TRAN(0,"@Z #########.##")
               STORE T3+SALDO TO T3
            ELSE
               STORE ABS(SALDO) TO SALDO
               ?? TRAN(0,"@Z #########.##")
               ?? "|"
               ?? TRAN(SALDO,"@Z #########.##")
               STORE T4+SALDO TO T4
            ENDIF
            STORE T1+DPAR TO T1
            STORE T2+HPAR TO T2
            STORE C+1 TO C
            IF C>16
               ? REPL("-",79)
               ? "      TRANSPORTE            "+TRAN(T1,"@Z #########.##")+"|"+TRAN(T2,"@Z #########.##")+"|"+TRAN(T3,"@Z #########.##")+"|"+TRAN(T4,"@Z #########.##")
               ? REPL("-",79)
               C=TECLA(24,.F.,'<F> FIN')
               IF C=70 .OR. C=102
                  EXIT
               ENDIF
               STORE NPAG+1 TO NPAG
               STORE 1 TO C
               DO TIT2
            ENDIF
         ENDSCAN
         IF C<70
            ? REPL("-",79)
            ? "      SALDOS  FINALES       "+TRAN(T1,"@Z #########.##")+"|"+TRAN(T2,"@Z #########.##")+"|"+TRAN(T3,"@Z #########.##")+"|"+TRAN(T4,"@Z #########.##")
            ? REPL("-",79)
            ?
            =TECLA(24)
         ENDIF
         RELE WIND WIN0
      ENDIF
      SELE BAL1
      =OFF_TMP()
      RELE WIND WIN0
      RELE WIND WIN
   ENDIF
ENDIF
=MEN_LIN(SYSNOMBRE)
RETURN
