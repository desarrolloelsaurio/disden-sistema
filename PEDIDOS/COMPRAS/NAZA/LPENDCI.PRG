* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : LPENDCI.PRG                                     �
* � COMENTARIO    : LISTADO DE PENDIENTES POR IMPRESORA (AGRUPADOS) �
* 麺様様様様様様様様様様様様様様様様様様曜様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER             �
* � FECHA      : 11-01-93                �
* � HORA       : 01:50:15pm              �
* � COPYRIGHT  : 1993 by GREGORIO REINER �
* 藩様様様様様様様様様様様様様様様様様様夕
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
   STOR NUL TO CASOS
   LINEA=REPL("=",LEN(ACLA))
   =CABPRI()
   _PCOPIES=1
   PRINTJOB
      =CABPRI1()
      =TIT_LIN(3)
      SELE TMP
      SCAN
      =IIF(M.ELCOD=TMP.COMCODPRO .AND. M.LAPROM=REQ.FECHAPROM,.T.,LPENDC1())
         IF _PLINENO>63
            =FIN_LIN(3,NUL)
            =cabpri1()
            =TIT_LIN(FOUR)
         ENDI
         STORE TMP.PEDIDO+M.TPEDIDO TO M.TPEDIDO
         STORE TMP.RECIBIDO+M.TRECIBIDO TO M.TRECIBIDO
      ENDSCAN
      =LPENDC1()
      =FIN_LIN(FOUR,CASOS)
   ENDP
   =FINIMP()
   =IAUD("")
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
