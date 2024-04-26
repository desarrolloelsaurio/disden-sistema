* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : SCCLPAR.PRG                          บ
* บ COMENTARIO    : SALDA CTA CTE UN CLIENTE POR PARTIDA บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                             บ
* บ FECHA      : 12-08-93                                บ
* บ HORA       : 07:55:12pm                              บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                 บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE NUL    0                                 && NUL
#DEFINE TEX_CALC "CALCULANDO - ESPERE POR FAVOR" && TEX_CALC
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
   SELE CCL
   SET ORDER TO TAG CODCLI
   IF SEEK(per.CODCLI)
      =CARTEL("SE SUGIERE AL USUARIO",;
        "EMITIR UN LISTADO DE ANALISIS DE LA",;
        "CUENTA CORRIENTE DEL CLIENTE ANTES DE BORRAR SU SALDO",;
        "[ENTER] PARA CONTINUAR")
      IF CONFIRMA("PROCESAR Cta. Cte. DE "+UPPER(ALLTRIM(per.CLIENTE)),.T.,10,0)
         =MEN_LIN(TEX_CALC)
         =LANACCL0()
         SELE TMP
         RELE A_ARR
         GO TOP
         STORE NUL TO M.SALDO,M.S_PUNT
         STORE TMP.COMPR TO M.S_CONTROL
         STORE TMP.FECHAOP TO LADATE
         STORE .F. TO M.VENCIDO
         SCAN
            IF TMP.COMPR#M.S_CONTROL
               STORE M.S_PUNT+1 TO M.S_PUNT
               DIME A_ARR[M.S_PUNT,5]
               STORE .F. TO A_ARR[M.S_PUNT,1]
               STORE M.S_CONTROL TO A_ARR[M.S_PUNT,2]
               STORE M.SALDO TO A_ARR[M.S_PUNT,3]
               STORE !M.VENCIDO TO A_ARR[M.S_PUNT,4]
               STORE M.LADATE TO A_ARR[M.S_PUNT,5]
               STORE NUL TO M.SALDO
               STORE TMP.COMPR TO M.S_CONTROL
               STORE TMP.FECHAOP TO LADATE
               STORE .F. TO M.VENCIDO
            ENDIF
            IF !EMPTY(TMP.FECHAVE) .AND. ;
                 TMP.DETALLE#"CORRECCION DE COBROS"
               STORE IIF(M.VENCIDO,.T.,TMP.FECHAVE>DATE()) TO M.VENCIDO
            ENDIF
            STORE M.SALDO+IIF(ESDEBE(TMP.COMPRRE),ABS(TMP.MONTO),0-ABS(TMP.MONTO)) TO M.SALDO
            * ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
            * บ AGREGAR CUANDO CORRESPONDA LA ACREDITACION DE LOS VALORES A FUTURO      บ
            * ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
         ENDSCAN
         STORE M.S_PUNT+1 TO M.S_PUNT
         DIME A_ARR[M.S_PUNT,5]
         STORE .F. TO A_ARR[M.S_PUNT,1]
         STORE M.S_CONTROL TO A_ARR[M.S_PUNT,2]
         STORE M.SALDO TO A_ARR[M.S_PUNT,3]
         STORE !M.VENCIDO TO A_ARR[M.S_PUNT,4]
         STORE M.LADATE TO A_ARR[M.S_PUNT,5]
         SELE TMP
         TMP=DBF()
         USE
         ERASE (TMP)
         CREATE CURSOR TEMPO;
           (BORRA L, COMPR C(20), MONTO N(14,2), HABIL L, FECHAOP D)
         SELE TEMPO
         APPE FROM ARRAY A_ARR
         DELE FOR !EMPTY(MONTO)
         CALC COUN() TO S_CAREG
         IF !EMPTY(S_CAREG)
            =UNWORK()
            =MEN_LIN("[ENTER] Selecciona-Deselecciona Partida / [ESC] para Finalizar Selecciขn")
            =MOVECENT(0,0,15,60,'WIN',' DEUDA CANCELADA DE '+ALLTRIM(per.CLIENTE)+" ")
            ON KEY LABEL ENTER DO SCCLPAR1
            ON KEY LABEL ESCAPE KEYB(CHR(23))
            GO TOP
            BROW FIELD ;
              "SALDA"=IIF(BORRA," [X] "," [ ] "):W=TEMPO.HABIL,;
              FECHAOP:H="  FECHA ":R:W=TEMPO.HABIL,;
              COMPR:H=PADC("COMPROBANTE",20):R:W=TEMPO.HABIL,;
              MONTO:R:P="99,999.99":H=PADC("MONTO",11):W=TEMPO.HABIL ,;
              HBL=IIF(TEMPO.HABIL," OK "," NO "):H="COND":R:W=TEMPO.HABIL ;
              FREEZE COMPR ;
              NOCLEAR ;
              IN WIN
            ON KEY LABEL ENTER
            ON KEY LABEL ESCAPE
            IF CONFIRMA("PARTIDAS A BORRAR",.T.,10,0)
               =WORKING()
               =DOTALK()
               =OPCCLH()
               SELE CCL
               SET ORDER TO
               SELE TEMPO
               STORE NUL TO VEZ
               SCAN FOR BORRA .AND. HABIL
                  SELE CCL
                  SET ORDER TO TAG CODCLI
                  SEEK PER.CODCLI
                  SCAN WHILE CCL.CODCLI=per.CODCLI 
                  IF CCL.COMPR=TEMPO.COMPR
                     =LOCK() .OR. LOK()
                     SCAT MEMV
                     =AGRABAR("CCLH")
                     SELE CCL
                     DELE
                  UNLO IN CCL
                  ENDIF
                  ENDSCAN
                  SELE per
                  =LOCK() .OR. LOK()
                  IF VEZ=NUL
                     STORE 2 TO VEZ
                     REPL per.LEGAJO WITH REPL("-",68)+CHR(13)+CHR(10) ADDI
                     REPL per.LEGAJO WITH "OPERACIONES SALDADAS - BORRADAS DE CTA CTE POR "+ALLTRIM(M.USADOR)+" EL DIA "+DTOC(DATE())+CHR(13)+CHR(10) ADDI
                     REPL per.LEGAJO WITH REPL("-",68)+CHR(13)+CHR(10) ADDI
                  ENDIF
                  REPL per.LEGAJO WITH "OPERACION "+TEMPO.COMPR+" DEL "+DTOC(TEMPO.FECHAOP)+CHR(13)+CHR(10) ADDI
                  UNLO IN per
                  =IAUD(ALLTRIM(per.CODCLI)+"/"+ALLTRIM(TEMPO.COMPR)+"/"+per.CLIENTE)
                  SELE TEMPO
               ENDSCAN
               IF VEZ=2
                  SELE per
                  =LOCK() .OR. LOK()
                  REPL per.LEGAJO WITH REPL("-",68)+CHR(13)+CHR(10) ADDI
                  UNLO IN per
               ENDIF
               =UNTALK()
               =UNWORK()
            ENDIF
         ELSE
            =UNWORK()
            =NOOPCLI("IMPOSIBLE SALDAR PARTIDAS","CANCELADAS")
         ENDIF
         SELE TEMPO
         USE
         =RELEWIN("WIN")
      ENDIF
   ELSE
      =UNWORK()
      =NOOPCLI("IMPOSIBLE SALDAR PARTIDAS")
   ENDIF
ELSE
   =IAUDI()
ENDIF
=CLOSDBF("CCLH")
UNLO ALL
RETURN MEN_LIN(BOTOM)
 
PROCEDURE SCCLPAR1
REPL BORRA WITH !BORRA
RETURN
