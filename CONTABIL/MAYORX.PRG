*
*                                   LIBRO MAYOR
*
* MAYOR1.PRG Y MAYOR 3 7 MAYOR 4
*
WAIT "TRABAJANDO..." WIND NOWA
=LISTADO3(.T.)
=LISTADO4()
SELE BAL1
STOR 1 TO NPAG,C
WAIT CLEA
IF PREGUNT1("Est n listos la Impresora y el Papel")
   STOR 0 TO C
   =TEST_IMP()
	 DO CABPRI
   STOR PADC(TIT,135) TO TIT

   ? chr(27)+chr(15)
   SCAN
      SELE MOV1
      SET ORDER TO TAG CODIGO
      IF SEEK(BAL1.CODIGO)
         SELE BAL1
         STOR CODIGO TO MCOD
         STOR NOMBRE TO MNOM
         DO TITM1
         STOR 0 TO SB,SI,SALDO
         IF PORFEC
            PERFIN=PERFIN-1
         ENDIF
         DO ACMAYOR
         STOR 0 TO LINEAS

         IF ARRASANIO .AND. !EMPTY(SB)
            =SI(135,"SALDO BALANCE ANTERIOR",.F.,.F.,SB)
            STOR C+1 TO C
            STOR 1 TO LINEAS
         ENDIF

         IF ARRASMES .AND. !EMPTY(SI)
            =SI(135,"SALDO INICIAL",.f.,.f.,si)
            C=C+1
            LINEAS=LINEAS+1
         ENDIF

         IF PORFEC .AND. !EMPTY(SM)
            =SI(135,"SALDO DESDE EL INICIO DEL MES",.f.,.f.,sm)
            STOR C+1 TO C
            LINEAS=LINEAS+1
         ENDIF

         SALDO=SALDO+SB+SI+SM
         SI=SI+SB+SM

         DO CASE
         CASE LINEAS>1
            =SI(135,"TOTAL ARRASTRE",.T.,.T.,SALDO)
            STOR C+3 TO C
         CASE LINEAS=1
            ? REPL("-",135)
            STOR C+1 TO C
         ENDCASE

         SELE MOV1
         IF PORFEC
            SET ORDER TO TAG CODIGO
         ENDIF
         STOR 0 TO SDEU,SHAB
         SCAN FOR BAL1.CODIGO=MOV1.CODIGO
            STOR SDEU+DEBE  TO SDEU
            STOR SHAB+HABER TO SHAB
            STOR SALDO+DEBE-HABER TO SALDO
            STOR SI+DEBE-HABER TO SI
            ? PAIPD
            ?? STR(ASIENTO,4)
            ?? PAIP2
            ?? STR(MOVIMIENTO,4)
            ?? PAIPI
            ?? LEFT(CONCEPTO,34)
            ?? PAIP
            ?? TRAN(FECHA,PICFEC)
            ?? PAIPD
            ?? tran(DEBE,PICU9)
            ?? PAIP2
            ?? tran(HABER,PICU9)
            ?? PAIP2
            IF SALDO<0
               ?? tran(0,PICU9)
               ?? PAIP2
               ?? tran(abs(SALDO),PICU9)
            ELSE
               ?? tran(abs(SALDO),PICU9)
               ?? PAIP2
               ?? tran(0,PICU9)
            ENDIF
            ?? PAIPI
            STOR C+1 TO C
            if _PLINENO>66
               =TR(135,"TRANSPORTE",.T.,.T.)
               STORE C+3 TO C
               DO LINF WITH 65
               STOR NPAG+1 to NPAG
               STOR 0 TO C
               DO TITM1
            ENDIF
         ENDS
         SELE BAL1
         =TR(135,"SALDO FINAL",.T.,.T.)
         STOR C+3 to C
         DO LINF WITH 65
         STOR NPAG+1 TO NPAG
      ENDIF
      STOR 0 TO C
   ENDSCAN
   DO FINIMP
ENDIF
SELE BAL1
=OFF_TMP()
SELE MOV1
=OFF_TMP()
WAIT CLEA
return
