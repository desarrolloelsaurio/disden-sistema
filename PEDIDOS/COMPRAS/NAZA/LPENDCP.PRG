* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LPENDCP.PRG                                              �
* � COMENTARIO    : LISTADO DE PENDIENTES DE COMPRAS / AGRUPA POR ARTICULO   �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 08-20-93                                                    �
* � HORA       : 00:45:57am                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
#DEFINE ONE    1                                 && ONE
#DEFINE TWO    2                                 && TWO
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
PARAMETER PLEIN 
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   STOR NUL TO CASOS
   LINEA=REPL("=",LEN(ACLA))
   =UNWORK()
   =WIN0()
   PAG=ONE
   =CABPAN()
   =TIT_LIN(ONE)
   SELE TMP
   SCAN
      =IIF(M.ELCOD=TMP.COMCODPRO .AND. M.LAPROM=REQ.FECHAPROM,.T.,LPENDC1())
      #IF "Win" $ vers()
         IF ROW()>(WROWS()-4)
            #ELSE
            IF ROW()>21
            #ENDIF
            IF !FIN_LIN(ONE,NUL)
               EXIT
            ENDIF
            CLEA
            STOR PAG+ONE TO PAG
            =CABPAN()
            =TIT_LIN(TWO)
         ENDIF
         STORE TMP.PEDIDO+M.TPEDIDO TO M.TPEDIDO
         STORE TMP.RECIBIDO+M.TRECIBIDO TO M.TRECIBIDO
      ENDSCAN
      =LPENDC1()      
      =FIN_LIN(TWO,CASOS)
      =RELEWIN("WIN")
      =IAUD("")
   ELSE
      =IAUDI()
   ENDIF
   RETURN MEN_LIN(BOTOM)

