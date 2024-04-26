* ษอออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LRESMEDI.PRG            บ
* บ COMENTARIO    : LIQUIDACION MED INTERNOSบ
* ฬอออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                บ
* บ FECHA      : 11-01-93                   บ
* บ HORA       : 01:50:15pm                 บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER    บ
* ศอออออออออออออออออออออออออออออออออออออออออผ
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
PARAMETER CODMED
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
     PAIP

   STOR NUL TO CASOS
   LINEA=REPL("=",LEN(ACLA))
   =CABPRI(.F.,"36")
   _PCOPIES=1
   PRINTJOB
      =CABPRI1(.T.)
      ?
      ??? CHR(14)
      ?? 'IMAGENES MEDICAS S.A.'
      ?
      ??? CHR(14)
      ?? "TUCUMAN 1888            - TEL: 25-3248"
      ?
      ??? CHR(14)
      ?? "2000-ROSARIO"
      ?
      ? "Mdico:"
      ?? sayper(CODMED,"MEDCOD")
      =_LIN(.T.)
      STORE NUL TO TOT1,TOT2
      SELE LIQ
      SCAN FOR MEDICO=CODMED
         IF !EMPTY(LIQ.MES) .AND. ;
              (LIQ.ANO<m.x_ANIO .OR. ;
              LIQ.ANO=M.X_ANIO .AND. ;
              LIQ.mes<=M.X_MES)
            =XSEEK(LIQ.PRACTICA,"PRA","CODPRA")
            IF PRA.LISTA="SI"
               IF _PLINENO>32
                  =FIN_LIN(3,NUL)
                  =cabpri1()
                  =TIT_LIN(FOUR)
               ENDI
               IF XSEEK(LIQ.TPR+STR(LIQ.NUMERO)+LIQ.PRACTICA+LIQ.PRXCOD,"LIX","NUMER1")
                  IF !LIX.PAGADA .AND. !LIX.DIFIERE .AND. LIX.PAGA
                      REPL LIX.PAGA WITH .F.
                      REPL LIX.L_MES WITH MONTH(DATE())
                      REPL LIX.L_ANIO WITH YEAR(DATE())
                      REPL LIX.PAGADA WITH .T.
                     =XSEEK(LIX.PRACTICA,"PRA","CODPRA")
                     ? PAIP
                     ?? LIQ.FECHAIN
                     ?? PAIP
                     ?? SAYPER(LIQ.PACIENTE,"PACCOD")
                     ?? PAIP
                     ?? LEFT(SAYGRL(PER.TEXTO1,"MUT","CODMUT","MUT.MUTUALABR"),20)
                     ?? PAIP
                     ?? LEFT(SAYGRL(LIQ.PRACTICA,"PRA","CODPRA","PRA.PRACTICABR"),20)
                     ?? PAIP
                     P1=LIX.T_GAS+LIX.T_GAL
                     TOT1=TOT1+P1
                     P1=P1*PORPAR
                     TOT2=TOT2+P1
                     ?? STR(P1,XACDIGI,2)
                     ?? PAIP
                  ENDIF
               ENDIF
            ENDIF
         ENDIF
      ENDSCAN
      ? M.LINEA
      ? PADL(PAIP+PADC("TOTAL",20)+PAIP+STR(TOT2,XACDIGI,2)+PAIP,LEN(ACLA))
      =FIN_LIN(FOUR,CASOS)
   ENDP
   =FINIMP()
   =IAUD("")
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
