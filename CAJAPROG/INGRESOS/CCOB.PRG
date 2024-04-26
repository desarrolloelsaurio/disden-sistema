*********************************
*-- Programa: CCOB
*-- Fecha   : 01-27-93 04:48pm
*-- Version : G. REINER
*-- Notas   : CORRECCION COBROS
********************************
ULPR=HORA_ULP(PROGRAM())
IF cheqseg()
   STORE NUL TO RESPUESTA
   DO WHILE .T.
      IF ELIRECI()
         M.ELRECIBO=RECI.RECIBO
         IF CONFIRMA("Anular Recibo N§ "+alltrim(m.elrecibo)+;
         " de "+alltrim(sayper(reci.codcli,"codcli")),.t.,10,0)
           =WORKING()
           =DOTALK()
           SELE RECI
           SCAT MEMV
           =LOCK() .OR. LOK()
           REPL RECI.PESOS WITH NUL
           REPL RECI.DOLARES WITH NUL
           REPL RECI.TARJETAS WITH NUL
           REPL RECI.CHEQUES WITH NUL
           UNLO IN RECI            
           =OPCAJD()
           GO BOTT
           =LOCK() .OR. LOK()
          REPL CAJD.S_PESOS WITH CAJD.S_PESOS+M.PESOS
          REPL CAJD.S_DOLARES WITH CAJD.S_DOLARES+M.DOLARES 
          REPL CAJD.S_TARJETA WITH CAJD.S_TARJETA+M.TARJETAS
          REPL CAJD.S_CHEQUE3 WITH CAJD.S_CHEQUE3+M.CHEQUES
           UNLO IN CAJD
           SELE CCL
           SET ORDER TO            
           =FLOCK() .OR. FLOK()
           TMPREMI=GENTMP()
           COPY TO (TMPREMI) FOR NUMERORE=M.RECIBO
           =UNLO_PRX("CCL",TMPREMI,"TMPREMI")
           SELE TMPREMI
           SCAN
           SELE CCL
           SET ORDER TO TAG COD_OPER
           IF SEEK(TMPREMI.COD_OPER1)
              =LOCK() .OR. LOK()
              REPL CCL.CUOTA WITH CCL.CUOTA-TMPREMI.GY_HABER
              REPL CCL.PAGADA WITH .F.
              UNLO IN CCL
              IF SEEK(TMPREMI.COD_OPER)
              =LOCK() .OR. LOK()
              DELE 
              UNLO IN CCL
              ENDIF
           ENDIF
           SELE TMPREMI
           ENDSCAN
           =OFF_TMP()
           =UNTALK()
           =UNWORK()
         ENDIF
      ELSE
         =NOSELEC("RECIBO")
         EXIT
      ENDIF
   ENDDO
ELSE
   =Iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)

