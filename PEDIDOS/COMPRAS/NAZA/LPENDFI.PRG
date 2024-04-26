* ษออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LPENDFI.PRG          บ
* บ COMENTARIO    :                      บ
* ฬออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER             บ
* บ FECHA      : 11-01-93                บ
* บ HORA       : 01:50:15pm              บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER บ
* ศออออออออออออออออออออออออออออออออออออออผ
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
PARAMETER PLEIN
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
   =IMPRESOR()
   STOR NUL TO CASOS
   LINEA=REPL("=",LEN(ACLA))
   SELE TMP
   GO TOP
   ELPRO=TMP.USUARIO
   IF PLEIN
      TT=TT+;
        CRLF+;
        "RESUMEN"
   ELSE
      TTORI=TT
      TT=TTORI+;
        CRLF+;
        ALLTRIM("PROVEEDOR:"+SAYPER(ELPRO,"PROCOD"))
   ENDIF
   STORE NUL TO TOMON,TTOMON,ELTOT,ELTTOT,ELPEN,PPEN
   =CABPRI(.F.,"36")
   _PCOPIES=1
   PRINTJOB
      =CABPRI1()
      =TIT_LIN(3)
      SELE TMP
      SCAN
         IF TMP.USUARIO#ELPRO
            IF PLEIN
               =LPENDF0()
            ELSE
               =FIN_LIN(3,FOUR,;
                 PARSE(PAIP+SAYPER(ELPRO,"PROCOD"),;
                 PAIP+STR(ELPEN,XACDIGI)+PAIP+STR(ELTOT,XACDIGI)+PAIP+STR(TOMON,XACDIGI)+PAIP,LEN(ACLA)))
               STORE NUL TO M.TOMON,M.ELTOT,M.ELPEN
               ELPRO=TMP.USUARIO
               TT=TTORI+;
                 CRLF+;
                 ALLTRIM("PROVEEDOR:"+SAYPER(ELPRO,"PROCOD"))
               =CABPRI1()
               =TIT_LIN(3)
            ENDIF
         ENDIF
         IF _PLINENO>IIF(PLEIN,66,31)
            =FIN_LIN(3,NUL)
            =cabpri1()
            =TIT_LIN(FOUR)
         ENDI
         =LPEND1()
      ENDSCAN
      IF PLEIN
         =LPENDF0()
         =FIN_LIN(FOUR,NUL,;
           PARSE(PAIP+"TOTAL:",;
           PAIP+STR(PPEN,XACDIGI)+PAIP+STR(ELTTOT,XACDIGI)+PAIP+STR(TTOMON,XACDIGI)+PAIP,LEN(ACLA)))
      ELSE
         =FIN_LIN(FOUR,CASOS,;
           PARSE(PAIP+SAYPER(ELPRO,"PROCOD"),;
           PAIP+STR(ELPEN,XACDIGI)+PAIP+STR(ELTOT,XACDIGI)+PAIP+STR(TOMON,XACDIGI)+PAIP,LEN(ACLA)))
      ENDIF
   ENDP
   =FINIMP()
   =IAUD(DTOC(M.FECINI)+"/"+DTOC(M.FECFIN))
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
