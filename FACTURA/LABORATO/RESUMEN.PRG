* ษอออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : RESUMEN.PRG                   บ
* บ COMENTARIO    : IMPRIME RESUMEN DE UNA MUTUAL บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                      บ
* บ FECHA      : 05-01-94                         บ
* บ HORA       : 10:08:33am                       บ
* บ COPYRIGHT  : 1994 by GREGORIO REINER          บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION RESUMEN
PARAMETER PORPAN
#DEFINE CRLF CHR(13)+CHR(10)                   && CRLF
#DEFINE ENTERCON "PULSE [ENTER] PARA CONTINUAR"  && ENTERCON

FA_DIJO=ALLTRIM(PROMPT())
FISC=""
DO CASE
CASE FA_DIJO="Completo"
   FISC=""
CASE FA_DIJO="C mara Gamma"
   FISC="LIQ.TPR='CG'"
CASE FA_DIJO="Ecografกa"
   FISC="LIQ.TPR='EG'"
CASE FA_DIJO="Tomografกa"
   FISC="LIQ.TPR='TG'"
ENDCASE
STORE NUL TO RESPUESTA
IF ELIMUT("a Liquidar",-1,1)
   =POPCARTE("_*_"+CRLF+;
     "OBRA SOCIAL:"+MUT.CODMUT+CRLF+;
     "-"+CRLF+;
     ALLTRIM(MUT.MUTUALABR)+CRLF+;
     "-*-")
   M.FECINI=INFEC("FIC","Fecha lกmite")
   IF LAST()#27 .AND. !EMPTY(M.FECINI)
      IF CONFIRMA("EMITIR RESUMEN DE "+;
           ALLTRIM(MUT.MUTUALABR)+" "+;
           "/ FECHA: "+;
           DTOC(M.FECINI),.T.,10,NUL)
         =RELEWIN("POPCARTE")
         =WORKING()
         =DOTALK()
         SELE PER
         SET ORDER TO TAG PACCOD
         SELE LIQ
         SET RELA TO PACIENTE INTO PER
         TMP=GENTMP()
         SELE LIQ
         =FLOCK("LIQ") .OR. FLOK("LIQ")
         FISC="PER.TEXTO1='"+;
         MUT.CODMUT+"' .AND. FECHAIN<={"+;
           DTOC(M.FECINI)+"} .AND. ;
           !LIQUIDADO .AND. ;
           !EMPTY(ORDEN)"+;
           IIF(EMPTY(FISC),""," .AND. "+FISC)
         SORT ON TPR,;
           FECHAIN,;
           NUMERO ;
           TO (TMP) FOR &FISC ;
           FIELD ;
           TPR,;
           NUMERO,;
           PACIENTE,;
           FECHAIN,;
           PRACTICA,;
           PRXCOD,;
           INTERNO,;
           ORDEN,;
           PER.CLIENTE,;
           PER.TEXTO1,;
           PER.TEXTO2,;
           PER.TEXTO3
         SELE LIQ
         USE
         USE (TMP) ALIAS LIQ
         IF !EMPTY(RECC("LIQ"))
            IF PORPAN
               =UNTALK()
               =UNWORK()
               DO LRESP
            ELSE
               DO LRESI
            ENDIF
            =OPLIQ(.T.)
            SELE PER
            SET ORDER TO TAG PACCOD
            SELE LIQ
            SET RELA TO PACIENTE INTO PER
            SET ORDER TO
            IF !PORPAN
               REPL PASADA WITH .F. FOR ;
                 PER.TEXTO1=MUT.CODMUT .AND. ;
                 !LIQUIDADO
               REPL PASADA WITH .T. FOR ;
                 PER.TEXTO1=MUT.CODMUT .AND. ;
                 FECHAIN<=M.FECINI .AND. ;
                 !LIQUIDADO .AND. ;
                 !EMPTY(ORDEN)
            ENDIF
         ELSE
            =CARTEL("NO SE HAN ENCONTRADO PACIENTES",;
              "DE LA OBRA SOCIAL "+ALLTRIM(MUT.CODMUT),;
              "PARA EL PARIODO SOLICITADO",;
              ENTERCON)
         ENDIF
         =OPLIQ(.T.)
         =UNTALK()
         =UNWORK()
      ENDIF
      =RELEWIN("POPCARTE")
   ENDIF
   =RELEWIN("POPCARTE")
ENDIF
RETURN MEN_LIN(BOTOM)
