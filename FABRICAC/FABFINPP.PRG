* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : FABFINPP.PRG                                             �
* � COMENTARIO    : LISTADO DE O.C. POR FECHA PREVISTA POR PANTALLA          �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 02-14-94 06:18pm                                            �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
#DEFINE ONE    1                                 && ONE
#DEFINE TWO    2                                 && TWO
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   =WIN0()
   PAG=ONE
   =CABPAN()
   =TIT_LIN(ONE,ELRUBTEX)
   SELE COR
   SCAN

      IF ELRUBRO#LEFT(ARTICULO,3)
         IF !FIN_LIN(ONE,NUL,FABFINP2(ELRUBTEX,TOTRUB,.T.))
            EXIT
         ENDIF
         CLEA
         STOR PAG+ONE TO PAG
         =CABPAN()
         ELRUBRO=LEFT(ARTICULO,3)
         ELRUBTEX=ALLTRIM(SAYMIX(ELRUBRO,"RUBCOD"))
         ELARTICULO=ARTICULO
         =TIT_LIN(ONE,ELRUBTEX)
ELSE
      IF ELARTICULO#ARTICULO
         ? M.LINEA
         ELARTICULO=ARTICULO
      ENDIF
ENDIF

      IF ROW()>21
         IF !FIN_LIN(ONE,NUL)
            EXIT
         ENDIF
         CLEA
         STOR PAG+ONE TO PAG
         =CABPAN()
         =TIT_LIN(TWO,ELRUBTEX)
      ENDIF
      =FABFINP1()
   ENDSCAN
   =FIN_LIN(ONE,NUL,FABFINP2(ELRUBTEX,TOTRUB,.T.),.T.)
   =FIN_LIN(TWO,CASOS,FABFINP2("TOTAL",TOTTOT))
   =RELEWIN("WIN")
   =IAUD("")
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
