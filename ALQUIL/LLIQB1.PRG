* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LLIQB1.PRG                                               บ
* บ COMENTARIO    :                                                          บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 11-01-93                                                    บ
* บ HORA       : 01:50:15pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
PARAMETER GRABA
SELE CCL
SET ORDER TO TAG CODCLI
SEEK ALQ.CODCLI
STORE NUL TO TOTREC
SCAN WHILE CODCLI=ALQ.CODCLI 
   IF CCL.CODINM=ALQ.CODINM
   IF !PAGADA .AND. ;
   EMPTY(CCL.NUMERO) .AND. ;
   FECHAVE<GOMONTH(FVENC1,1) .AND. ;
   MARKA
      TOTREC=TOTREC+IIF(COMPRRE="NC",0-MONTO,MONTO)
   ENDIF
   ENDIF
ENDSCAN
IF !empty(m.totrec)
   M.RECIBO=GETNU3("RECIBO","FOXGRL")
   M.RECI1=ZERO(M.RECIBO,8)   
   SELE ALQ
   FOR XX=1 TO IIF(GRABA,1,2)
      WAIT "RECIBO: 0000-"+ZERO(M.RECIBO,8) WIND NOWA
      ?
      ?
      ? DATE() AT 54
 
      * NOMBRE
      ?
      ?
      ?
      ?
      ?
      ?
      ?
      *
      ? SAYPER(ALQ.CODCLI,"INQCOD") AT COL1
      ?? ALQ.CODINM AT COL3
      ?? " " AT COX1
      ??? CHR(15)
      ?? SAYPER(ALQ.CODCLI,"INQCOD")
      ??? CHR(18)
      ?? "     "
      ?? ALQ.CODCLI
 
      * DOMICILIO
      ? SAYGRL(ALQ.CODINM,"INM","CODINM","INM.DOMICILIO") AT COL1
      ?? SAYMIX(INM.LOCALIDAD,"CIUCOD") AT COL2
      ?? SAYMIX(SUBS(MIX.TEXTO2,10,2),"PRVCOD") AT COL4
      ?? " " AT COX1
      ??? CHR(15)
      ?? INM.DOMICILIO
      ??? CHR(18)
      ? " " AT COX1
      ??? CHR(15)
      ?? SAYMIX(INM.LOCALIDAD,"CIUCOD")
      ??? CHR(18)
      ?
      ?
      STORE 0 TO M.REN
      =IMP_REN()
      SELE CCL
      SET ORDER TO TAG CODCLI
      SEEK ALQ.CODCLI
      SCAN WHILE CODCLI=ALQ.CODCLI
         IF CCL.CODINM=ALQ.CODINM
         IF !PAGADA .AND. ;
             EMPTY(CCL.NUMERO) .AND. ;         
              FECHAVE<GOMONTH(FVENC1,1) .AND. ;
              MARKA
            ? Q_TIPTEX(DETALLE)
            IF COMPRRE="NC"
               ?? 0-MONTO AT 50 PICT "99,999.99"
            ELSE
               ?? MONTO AT 50 PICT "99,999.99"
            ENDIF
            IF XX=2
 			=FLOCK("CCL") .OR. FLOK("CCL")
 			REPL CCL.NUMERO WITH M.RECI1
 			UNLO IN CCL
 			ENDIF
            =IMP_REN()
         ENDIF
         ENDIF
      ENDSCAN
      DO WHILE IMP_REN(.T.)
      ENDDO
      SELE ALQ
      EJECT PAGE
   NEXT
   **
   M.NUMERO=ZERO(M.RECIBO,8)
   M.CODCLI=ALQ.CODCLI
   M.CODINM=ALQ.CODINM
   M.F1=ARMA_FEC(VENC1,XMES,XANIO)
   M.F2=ARMA_FEC(VENC2,XMES,XANIO)
   M.F3=ARMA_FEC(VENC3,XMES,XANIO)
   M.MON1=PORCEN(TOTREC,MORA1)
   M.MON2=PORCEN(TOTREC,MORA2)
   M.MON3=PORCEN(TOTREC,MORA3)
   M.RMES=XMES
   M.RANIO=M.XANIO
   *IF M.RMES<1
   *  M.RMES=12
   * M.RANIO=M.XANIO-1
   *ELSE
   *  M.RANIO=M.XANIO
   *ENDIF
   IF !GRABA
   =AGRABAR("RECB",.F.,.F.,.T.)
   =PUTNU3("RECIBO",M.RECIBO+1)
   ENDIF
ENDIF
RETURN
 
FUNCTION IMP_REN
PARAMETER CONCR
DO CASE
CASE REN<0
   RETURN .F.
CASE REN=0
   ?? " " AT COL6
   ??? CHR(15)
   ?? INM.PROCOD
   ??? CHR(18)
CASE REN=1
   ?? " " AT COL5
   ??? CHR(15)
   ?? SAYPER(INM.PROCOD,"PRPCOD")
   ??? CHR(18)
CASE REN=2
   ?? "      " AT COL5
   ??? CHR(15)
   ?? SAYMIX(PER.CONDIVA,"IVACOD")
   ??? CHR(18)
CASE REN=3
   ?? "      " AT COL5
   ??? CHR(15)
   ?? PER.NROIVA
   ??? CHR(18)
CASE REN=5
   ?? "INICIO:" AT COL5
   ?? ALQ.FECHAALQ
CASE REN=6
   ?? "FINAL :" AT COL5
   ?? ALQ.FECHAVENC
CASE REN=9
   ?? STR(VENC1,2) AT COLFEC
   ?? " "
   ?? STR(XMES,2)
   ?? " "
   ?? STR(XANIO,4)
CASE REN=10
   ?? TOTREC PICT "99,999.99"  AT COL5
CASE REN=11
   ?? STR(VENC2,2) AT COLFEC
   ?? " "
   ?? STR(XMES,2)
   ?? " "
   ?? STR(XANIO,4)
CASE REN=12
   ?? PORCEN(TOTREC,MORA2) PICT "99,999.99"  AT COL5
   ?? STR(VENC1,2) AT COX1
   ?? " "
   ?? STR(XMES,2)
   ?? " "
   ?? STR(XANIO,4)
   ?? "  "
   ?? TOTREC PICT "99,999.99"
CASE REN=12
CASE REN=13
   ?? STR(VENC3,2) AT COLFEC
   ?? " "
   ?? STR(XMES,2)
   ?? " "
   ?? STR(XANIO,4)
 
   ?? STR(VENC2,2) AT COX1
   ?? " "
   ?? STR(XMES,2)
   ?? " "
   ?? STR(XANIO,4)
   ?? "  "
   ?? PORCEN(TOTREC,MORA2) PICT "99,999.99"
CASE REN=14
   ?? PORCEN(TOTREC,MORA3) PICT "99,999.99"  AT COL5
   ?? STR(VENC3,2) AT COX1
   ?? " "
   ?? STR(XMES,2)
   ?? " "
   ?? STR(XANIO,4)
   ?? "  "
   ?? PORCEN(TOTREC,MORA3) PICT "99,999.99"
   REN=-100
ENDCASE
IF CONCR
   ?
ENDIF
REN=REN+1
RETURN .T.
