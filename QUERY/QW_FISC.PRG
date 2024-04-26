* ÚÄ FUNCTIONÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    File Name: QW_FISC.PRG                                                ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 10-25-92                                                   ³
* ³ Time created: 09:45:03pm                                                 ³
* ³ QUE HACE    : DEVUELVE EL FISC PARA LISTADOS                             ³
* ³ modificado  : BATA 26/10/92                                              ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION QW_FISC
PARAMETER FICS,COZ
PRIVATE FICS,COZ,FISC_SAL
IF EMPTY(FICS) .OR. FICS=='.T.' .OR. FICS=='.t.'
   IF EMPTY(COZ) .OR. COZ=='.T.' .OR. COZ=='.t.'
       FISC_SAL='.T.'
   ELSE
       FISC_SAL=COZ
   ENDIF
ELSE
   IF EMPTY(COZ) .OR. COZ=='.T.' .OR. COZ=='.t.'
       FISC_SAL=FICS
   ELSE
       FISC_SAL=FICS+' .AND. '+COZ
   ENDIF
ENDIF
RETURN FISC_SAL
