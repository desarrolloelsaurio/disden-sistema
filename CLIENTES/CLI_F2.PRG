* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : CLI_F2.PRG                                               บ
* บ COMENTARIO    : GENERA KEY F2 Y F3 PARA INGRESO DE DATOS CLIENTES        บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 09-09-93                                                    บ
* บ HORA       : 00:38:21am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ PARAMETROS                                                               บ
* บ 2. TEXTO DEL POPUP                     }  PARA                           บ
* บ 3. RENGLON DEL INFIC SI NO HAY POPUP   }  POPUP                          บ
* บ 4. COLUMNA DEL INFIC SI NO HAY POPUP   }                                 บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ 10. RENGLON DEL SEEKTEC                                     } SEEKTEC    บ
* บ 11. COLUMNA DEL SEEKTEC                                     }            บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
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
