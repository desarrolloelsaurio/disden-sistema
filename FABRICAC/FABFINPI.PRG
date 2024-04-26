* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : FABFINPI.PRG                                             บ
* บ COMENTARIO    : LISTADO DE O.C. POR FECHA DE FIN PREV POR IMPRESORA      บ
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

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
   =CABPRI()
   _PCOPIES=1
   PRINTJOB
      =CABPRI1()
      =TIT_LIN(3)
      SELE COR
      SCAN
      IF ELRUBRO#LEFT(ARTICULO,3)
         IF !FIN_LIN(3,NUL,FABFINP2("Tot "+ELRUBTEX,TOTRUB,.T.))
            EXIT
         ENDIF
         =CABPRI1()
         ELRUBRO=LEFT(ARTICULO,3)
         ELRUBTEX=ALLTRIM(SAYMIX(ELRUBRO,"RUBCOD"))
         ELARTICULO=ARTICULO
         =TIT_LIN(3,ELRUBTEX)
      ELSE
         IF ELARTICULO#ARTICULO
            ? M.LINEA
            ELARTICULO=ARTICULO
         ENDIF
      ENDIF
      IF _PLINENO>63
          =FIN_LIN(3,NUL,FABFINP2("Subt "+ELRUBTEX,TOTRUB)))
          =cabpri1()
          =TIT_LIN(FOUR,ELRUBTEX)
      ENDI
         =FABFINP1()
      ENDSCAN
      =FIN_LIN(3,NUL,FABFINP2(ELRUBTEX,TOTRUB,.T.),.T.)
      =FIN_LIN(FOUR,CASOS,FABFINP2("TOTAL",TOTTOT))
      EJECT PAGE
   ENDP
   =FINIMP()
   =IAUD("")
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
