* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : FABFINPI.PRG                                             �
* � COMENTARIO    : LISTADO DE O.C. POR FECHA DE FIN PREV POR IMPRESORA      �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 11-01-93                                                    �
* � HORA       : 01:50:15pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
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
