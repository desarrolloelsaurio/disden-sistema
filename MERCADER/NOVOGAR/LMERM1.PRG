* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LMERM1.PRG                                               บ
* บ COMENTARIO    : GENERA CUERPO DEL LISTADO MERCADERIAS (DETALLE)          บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-30-93                                                    บ
* บ HORA       : 03:24:16am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION LMERM1
STORE .T. TO L_OTRA
=LMERM1_1()
IF MEMLINES(MERCA1)>1
   FOR LM_A= 2 TO MEMLINES(MERCA1)
      IF !EMPTY(MLINE(MERCA1,LM_A))
         IF L_OTRA
            ? PAIP
            ?? SPACE(LEN(ARTICULO))
            ?? PAIP
            ?? SPACE(20)
            ?? PAIP
            ?? PADR(ALLTRIM(MLINE(MERCA1,LM_A)),LARMEM)
            ?? PAIP
         ELSE
         =LMERM1_1()
         STORE .T. TO L_OTRA
         ENDIF
         IF PORPAN
            IF ROW()>21
               IF !FIN_LNS(1,NUL)
                  EXIT
               ENDIF
               CLEA
               STOR pag+1 TO pag
               =cabpan()
               =LMERM2(2)
               STORE .F. TO L_OTRA
            ENDIF
         ELSE
           IF _PLINENO>63
              =fin_lns(3,nul)
              =CABPRI1()
         	  =LMERM2(4)            
          ENDI
         ENDIF
      ENDIF
   NEXT
ENDIF
RETURN LAST()=27

FUNCTION LMERM1_1
?PAIP
?? ARTICULO
?? PAIP
?? TEXTO1
?? PAIP
?? PADR(ALLTRIM(MLINE(MERCA1,1)),LARMEM)
?? PAIP
RETURN .T.