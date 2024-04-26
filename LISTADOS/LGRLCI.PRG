* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LGRLCI.PRG                                               บ
* บ COMENTARIO    : LISTADO "GENERAL" PARA CONCEPTOS SIN PROBLEMAS           บ
* บ                 CON UN CORTE DE CONTROL                                  บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-20-93                                                    บ
* บ HORA       : 00:45:57am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
* L_ALIAS   : ALIAS DE LA BASE A LISTAR
* L_LISTADO : NOMBRE DEL PROGRAMA QUE IMPRIME (EJ: "LCIU0()")
* L_CAMPO   : NOMBRE DEL CAMPO DE CORTE (EJ: "PROCOD")
* L_LABEL   : TEXTO DEL TITULO
* L_AUDI    : TEXTO A CARGAR A LA AUDITORIA
* ULPR      : NOMBRE DEL PROGRAMA PARA EL CHEQSEG Y EL IAUD
* SINEJECT  : NO SALTA PAGINA
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
 
PARAMETER L_ALIAS,L_LISTADO,L_CAMPO,L_LABEL,L_AUDI,ULPR,SINEJECT,RE_PETIR
IF CHEQSEG()
   STOR NUL TO CASOS,LARGO,LARGOIM,TOTAL,STOTAL
   TOTALIZA=IIF(TYPE("TOTALIZA")="U",.F.,TOTALIZA)
   =CABPRI()
   _PCOPIES=IIF(EMPTY(RE_PETIR),1,RE_PETIR)
   TTA=TT
   PRINTJOB
      SELE (L_ALIAS)
      GO TOP
      ELCONTROL=EVAL(L_CAMPO)
      TT=TTA+;
        CRLF+;
        EVAL(L_LABEL)
      =CABPRI1()
      =TIT_LIN(3)
	LEBELANT=EVAL(L_LABEL)
      SCAN
         IF ELCONTROL#EVAL(L_CAMPO)
            IF SINEJECT
               ? M.LINEA
               IF TOTALIZA
                  ? PARSE("| TOTAL "+LEBELANT,STR(STOTAL,XACDIGI,2)+PAIP,LEN(ACLA))
                  ? M.LINEA
               ENDIF
               ELCONTROL=EVAL(L_CAMPO)
               TT=TTA+;
                 CRLF+;
                 EVAL(L_LABEL)
               M.TOTAL=M.TOTAL+STOTAL
               STORE 0 TO STOTAL
				LEBELANT=EVAL(L_LABEL)	
            ELSE
               =FIN_LIN(3,NUL,;
                 IIF(TOTALIZA,PARSE("| TOTAL "+LEBELANT,STR(STOTAL,XACDIGI,2)+PAIP,LEN(ACLA)),.F.))
               ELCONTROL=EVAL(L_CAMPO)
               TT=TTA+;
                 CRLF+;
                 EVAL(L_LABEL)
               =CABPRI1()
               =TIT_LIN(3)
               M.TOTAL=M.TOTAL+STOTAL
               STORE 0 TO STOTAL
	        	LEBELANT=EVAL(L_LABEL)			
            ENDIF
         ENDIF
         IF _PLINENO>63
            =FIN_LIN(3,NUL,;
		   	IIF(TOTALIZA,PARSE("| SUBTOTAL "+LEBELANT,STR(STOTAL,XACDIGI,2)+PAIP,LEN(ACLA)),.F.))
            =cabpri1()
            =TIT_LIN(FOUR)
        	LEBELANT=EVAL(L_LABEL)			
         ENDI
         =EVAL(L_LISTADO)
      ENDSCAN
      IF TOTALIZA
         ? M.LINEA
         ? PARSE("| TOTAL "+LEBELANT,STR(STOTAL,XACDIGI,2)+PAIP,LEN(ACLA))
         M.TOTAL=M.TOTAL+STOTAL
      ENDIF
      =FIN_LIN(FOUR,CASOS,IIF(TOTALIZA,;
        PARSE("| GRAN TOTAL ",STR(TOTAL,XACDIGI,2)+PAIP,LEN(ACLA)),.F.))
   ENDP
   =FINIMP()
   TT=TTA
   =IAUD(L_AUDI)
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
