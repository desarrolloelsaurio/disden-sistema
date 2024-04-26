* ÚÄ FUNCTIONÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    File Name: QW_FISCO.PRG                                               ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 10-25-92                                                   ³
* ³ Time created: 09:45:03pm                                                 ³
* ³ QUE HACE    : DEVUELVE EL FISC PARA LISTADOS                             ³
* ³ modificado  : BATA 26/10/92                                              ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION QW_FISCO
PARAMETER EL_FISC,EL_NUEVO
PRIVATE EL_FISC,EL_NUEVO,F_SALIDA
IF EMPTY(EL_FISC) .OR. ;
   EL_FISC=='.T.' .OR. EL_FISC=='.t.' .OR. ;
   EL_FISC=='.F.' .OR. EL_FISC=='.f.'
   IF EMPTY(EL_NUEVO) .OR. ;
      EL_NUEVO=='.T.' .OR. EL_NUEVO=='.t.' .OR. ;
      EL_NUEVO=='.F.' .OR. EL_NUEVO=='.f.'
       F_SALIDA=''
   ELSE
       F_SALIDA=EL_NUEVO
   ENDIF
ELSE
   IF EMPTY(EL_NUEVO) .OR. ;
     EL_NUEVO=='.T.' .OR. EL_NUEVO=='.t.' .OR. ;
     EL_NUEVO=='.F.' .OR. EL_NUEVO=='.f.'
       F_SALIDA=EL_FISC
   ELSE
      F_SALIDA=EL_FISC+' .OR. '+EL_NUEVO
   ENDIF
ENDIF
RETURN F_SALIDA
