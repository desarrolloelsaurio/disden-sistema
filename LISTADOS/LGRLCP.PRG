* ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LGRLCP.PRG                                              บ
* บ COMENTARIO    : LISTADO "GENERAL" PARA CONCEPTOS SIN PROBLEMAS          บ
* บ                 CON UN CORTE DE CONTROL                                 บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                บ
* บ FECHA      : 08-20-93                                                   บ
* บ HORA       : 00:45:57am                                                 บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                    บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
* L_ALIAS   : ALIAS DE LA BASE A LISTAR
* L_LISTADO : NOMBRE DEL PROGRAMA QUE IMPRIME (EJ: "LCIU0()")
* L_CAMPO   : NOMBRE DEL CAMPO DE CORTE (EJ: "PROCOD")
* L_LABEL   : TEXTO DEL TITULO
* L_AUDI    : TEXTO A CARGAR A LA AUDITORIA
* ULPR      : NOMBRE DEL PROGRAMA PARA EL CHEQSEG Y EL IAUD
* SINEJECT  : NO SALTA PAGINA
#DEFINE ONE    1                                 && ONE
#DEFINE TWO    2                                 && TWO
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
 
PARAMETER L_ALIAS,L_LISTADO,L_CAMPO,L_LABEL,L_AUDI,ULPR,SINEJECT
IF CHEQSEG()
   STOR NUL TO CASOS,LARGO,LARGOIM,TOTAL,STOTAL
   LINEA=REPL("=",LEN(ACLA))
   =UNWORK()
   =WIN0()
   TOTALIZA=IIF(TYPE("TOTALIZA")="U",.F.,TOTALIZA)
   PAG=ONE
   SELE (L_ALIAS)
   TTA=TT
   ELCONTROL=EVAL(L_CAMPO)
   TT=TTA+;
     CRLF+;
     EVAL(L_LABEL)
   =CABPAN()
   =TIT_LIN(ONE)
   LEBELANT=EVAL(L_LABEL)
   SCAN
      IF ELCONTROL#EVAL(L_CAMPO)
         IF SINEJECT
            ELCONTROL=EVAL(L_CAMPO)
            ? M.LINEA
            IF TOTALIZA
               ? PARSE("| TOTAL "+LEBELANT,STR(STOTAL,XACDIGI,2)+PAIP,LEN(ACLA))
               ? M.LINEA
            ENDIF
            TT=TTA+;
              CRLF+;
              EVAL(L_LABEL)
            M.TOTAL=M.TOTAL+STOTAL
            STORE 0 TO STOTAL
            LEBELANT=EVAL(L_LABEL)
         ELSE
            IF !FIN_LIN(ONE,NUL,;
                 IIF(TOTALIZA,PARSE("| TOTAL "+LEBELANT,STR(STOTAL,XACDIGI,2)+PAIP,LEN(ACLA)),.F.))
               EXIT
            ENDIF
            ELCONTROL=EVAL(L_CAMPO)
            TT=TTA+;
              CRLF+;
              EVAL(L_LABEL)
            CLEA
            STOR PAG+ONE TO PAG
            =CABPAN()
            =TIT_LIN(ONE)
            M.TOTAL=M.TOTAL+STOTAL
            STORE 0 TO STOTAL
            LEBELANT=EVAL(L_LABEL)
         ENDIF
      ENDIF
      IF ROW()>21
         IF !FIN_LIN(ONE,NUL,;
              IIF(TOTALIZA,PARSE("| SUBTOTAL "+LEBELANT,STR(STOTAL,XACDIGI,2)+PAIP,LEN(ACLA)),.F.))
            ***IIF(TOTALIZA,PARSE("| GRAN TOTAL PARCIAL ",STR(TOTAL,XACDIGI,2)+PAIP,LEN(ACLA)),.F.))
            EXIT
         ENDIF
         CLEA
         STOR PAG+ONE TO PAG
         =CABPAN()
         =TIT_LIN(TWO)
         LEBELANT=EVAL(L_LABEL)
      ENDIF
      =EVAL(L_LISTADO)
   ENDSCAN
   IF TOTALIZA
      ? M.LINEA
      ? PARSE("| TOTAL "+LEBELANT,STR(STOTAL,XACDIGI,2)+PAIP,LEN(ACLA))
      IF ELCONTROL#EVAL(L_CAMPO)
         M.TOTAL=M.TOTAL+STOTAL
      ENDIF
   ENDIF
   =FIN_LIN(TWO,CASOS,IIF(TOTALIZA,;
     PARSE("| GRAN TOTAL ",STR(TOTAL,XACDIGI,2)+PAIP,LEN(ACLA)),.F.))
   =RELEWIN("WIN")
   TT=TTA
   =IAUD(L_AUDI)
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
