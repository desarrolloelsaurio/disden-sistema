* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : CLI_F2.PRG                                               �
* � COMENTARIO    : GENERA KEY F2 Y F3 PARA INGRESO DE DATOS CLIENTES        �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 09-09-93                                                    �
* � HORA       : 00:38:21am                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � PARAMETROS                                                               �
* � 2. TEXTO DEL POPUP                     }  PARA                           �
* � 3. RENGLON DEL INFIC SI NO HAY POPUP   }  POPUP                          �
* � 4. COLUMNA DEL INFIC SI NO HAY POPUP   }                                 �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � 10. RENGLON DEL SEEKTEC                                     } SEEKTEC    �
* � 11. COLUMNA DEL SEEKTEC                                     }            �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
FUNCTION CLI_F2
PARAMETER X_T1,X_R1,X_C1,X_R2,X_C2
SELE 0
STORE X_T1   TO MIX_T1
STORE X_R1   TO MIX_R1
STORE X_C1   TO MIX_C1
STORE X_R2   TO MIX_R2
STORE X_C2   TO MIX_C2
ON KEY LABEL F2 M.CODCLI=QUEPOPUP(MIX_T1,MIX_R1,MIX_C1)
ON KEY LABEL F3 M.CODCLI=SEEKTECX(30,'PER','CLIENTE','PER.CODCLI','CLIENTE',ALIAS(),ORDER(),MIX_R2,MIX_C2)
RETURN .T.
