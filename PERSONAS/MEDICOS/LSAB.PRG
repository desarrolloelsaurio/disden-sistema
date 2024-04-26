* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LSAB.PRG                                                 บ
* บ COMENTARIO    : LISTADO SABANA DE MEDICOS                                บ
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
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
   M.PORPAR=GETNU1("PORPART","FOXGRL")/100
   ACLA=PAIP+;
     " FECHA  "+;
     PAIP+;
     PADC("PACIENTE",30)+;
     PAIP+;
     PADC("OBRA SOCIAL",20)+;
     PAIP+;
     PADC("PRACTICA",20)+;
     PAIP+;
     PADC("MONTO",XACDIGI)+;
     PAIP+;
     PADC("PARTICIPACION",XACDIGI)+;
     PAIP
   STOR NUL TO CASOS
   LINEA=REPL("=",LEN(ACLA))
   =CABPRI()
   _PCOPIES=1
   PRINTJOB
      SELE TMP
      GO TOP
      ELMED="!!"
      STORE "Listado de Mdicos" to m.tt,m.tta
      =CABPRI1()
      =TIT_(3)
      STORE NUL TO TOT1,TOT2
      STORE 1 TO VEZ
      SCAN
         =XSEEK(TMP.TPR+STR(TMP.NUMERO)+TMP.PRACTICA+TMP.PRXCOD,"LIX","NUMER1")
         IF LIX.PASADA .AND. LIX.PAGA .AND. !LIX.PAGADA
         =XSEEK(TMP.PRACTICA,"PRA","CODPRA")
         IF PRA.LISTA="SI"
            IF ELMED#TMP.MEDICO
               IF VEZ=2
                  ? LINEA
                  ? PAIP
                  ?? PADR("TOTALES",LEN(ACLA)-2*XACDIGI-3)
                  ?? STR(TOT1,XACDIGI,2)
                  ?? PAIP
                  ?? STR(TOT2,XACDIGI,2)
                  ?? PAIP
                  ?
               ELSE
                  VEZ=2
               ENDIF
               =sayper(TMP.MEDICO,"MEDCOD")
               ? "Mdico:"
               ?? PER.CLIENTE
               =_LIN(.T.)
               ELMED=TMP.MEDICO
               tt=tta+;
                 crlf+;
                 "Mdico:"+;
                 alltrim(PER.CLIENTE)
               STORE NUL TO TOT1,TOT2
            ENDIF
            ? PAIP
            ?? TMP.FECHAIN
            ?? PAIP
            ?? SAYPER(PACIENTE,"PACCOD")
            ?? PAIP
            ?? LEFT(SAYGRL(PER.TEXTO1,"MUT","CODMUT","MUT.MUTUALABR"),20)
            ?? PAIP
            ?? LEFT(SAYGRL(TMP.PRACTICA,"PRA","CODPRA","PRA.PRACTICABR"),20)
            ?? PAIP
            P1=LIX.T_GAS+LIX.T_GAL
            TOT1=TOT1+P1
            ?? STR(P1,XACDIGI,2)
            ?? PAIP
            P1=P1*PORPAR
            TOT2=TOT2+P1
            ?? STR(P1,XACDIGI,2)
            ?? PAIP
         ENDIF
         ENDIF
      ENDSCAN
      ? LINEA
      ? PAIP
      ?? PADR("TOTALES",LEN(ACLA)-2*XACDIGI+1)
      ?? STR(TOT1,XACDIGI,2)
      ?? PAIP
      ?? STR(TOT2,XACDIGI,2)
      ?? PAIP
   ENDP
   =FINIMP()
   =IAUD("")
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
