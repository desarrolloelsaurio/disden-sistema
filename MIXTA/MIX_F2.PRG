* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : MIX_F2.PRG                                               �
* � COMENTARIO    : GENERA KEY F2 Y F3 PARA INGRESO DE DATOS                 �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 09-09-93                                                    �
* � HORA       : 00:38:21am                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � PARAMETROS                                                               �
* � 1. VARIABLE A LEER                     }                                 �
* � 2. TEXTO DEL POPUP                     }  PARA                           �
* � 3. RENGLON DEL INFIC SI NO HAY POPUP   }  POPUP                          �
* � 4. COLUMNA DEL INFIC SI NO HAY POPUP   }                                 �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � 5. CLAVE DE BUSQUEDA BASE (LA QUE DEVUELVE A LA VARIABLE)  } "left(mix.texto2,2)"            �
* � 6. ORDER TAG DEL TEXTO A TIPEAR                            } PARA        �
* � 7. RENGLON DEL SEEKTEC                                     } SEEKTEC     �
* � 8. COLUMNA DEL SEEKTEC                                     }             �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
FUNCTION MIX_F2
PARAMETER X_VARI,X_T1,X_R1,X_C1,X_COD,X_IND,X_R2,X_C2,XX_ALIAS
STORE X_VARI TO MIX_VARI
STORE X_T1   TO MIX_T1
STORE X_R1   TO MIX_R1
STORE X_C1   TO MIX_C1
STORE X_COD  TO MIX_COD
STORE X_IND  TO MIX_IND
STORE X_R2   TO MIX_R2
STORE X_C2   TO MIX_C2
ON KEY LABEL F2 STORE QUEPOPUP(MIX_T1,MIX_R1,MIX_C1) TO &MIX_VARI
ON KEY LABEL RIGHTMOUSE STORE QUEPOPUP(MIX_T1,MIX_R1,MIX_C1) TO &MIX_VARI


***WAIT "*"+X_COD+"*" WIND
***WAIT "*"+MIX_COD+"*" WIND
***FOR ZI=1 TO 10
***WAIT PROGRAM(ZI)
***NEXT


ON KEY LABEL F3 ;
	STORE SEEKTECX(20,"MIX","TEXTO1",MIX_COD,MIX_IND,ALIAS(),ORDER(),MIX_R2,MIX_C2) ;
TO &MIX_VARI
RETURN .T.
* S_LARGO  -> CANTIDAD DE CARACTERES A INGRESAR
* LABASE   -> BASE SOBRE LA QUE SE EFECTUA LA BUSQUEDA
* LOBUSCO  -> NOMBRE DEL CAMPO QUE SE BUSCA (PER.CLIENTE)
* LOBUSCO1 -> CAMPO QUE DEVUELVE (EL QUE SE USARA EN EL SEEK DE VALIDACION)
* ELORDEN  -> ORDER TAG DEL CAMPO DE BUSQUEDA (LOBUSCO)
* BASEANT  -> BASE A LA QUE SE DEBE VOLVER
* ORDENANT -> ORDER TAG DE LA BASE BASEANT
* S_REN    -> RENGLON PARA ESCRIBIR EL TEXTO
* S_COL    -> COLUMNA INICIAL DE INPUT DE TEXTO
* S_NOK    -> MANDA UN ENTER DE COLITA ?
* EN_VENTANA -> HACE EL INGRESO EN UNA VENTANA
