********************************************************************************
*-- Programa: ELIMER.PRG
*-- Fecha   : 05/26/91 09:26am
*-- Version : G. REINER -
*-- Notas   : ELIGE PROCESOS DE FABRICACION
********************************************************************************
FUNCTION elimer
PARA msg,r1,c1
antpr=ulpr
ulpr=program()
sele mer
IF merpop
   if merpop1
      SET ORDER TO tag merca
      ACTI POPUP merpop
      STOR !EMPTY(RESPUESTA) TO respuesta
   else
      stor nul to respuesta
      if elirub("del Producto",-1,1)
         ELRUB=ZERO(RUB.CODrub,3)
         stor nul to respuesta
         if elisru1(" del Producto",-1,1,RUB.CODrub)
            ELSUB=ZERO(RUB.CODSRUB,3)
            SELE MER
            SET ORDER TO TAG MERCA
            INDE ON MERCA TO (GENTMP()) FOR RUBRO=ELRUB .AND. SUBRUBRO=ELSUB comp
            STORE NUL TO RESPUESTA
            ACTI POPUP merpop
            RESPUESTA=!EMPTY(RESPUESTA)
            set INDEX TO
            SET ORDER TO TAG ARTICULO
         else
            stor .F. to respuesta
         ENDIF
      ELSE
         stor .F. TO RESPUESTA
      endif
   endif
ELSE
   IF r1=-1
      RESPUESTA=infic('ARTICULO '+msg,9999999)
   ELSE
      STORE NUL TO respuesta
      @ r1,c1 GET respuesta PICTURE '9999999'
      READ
   ENDIF
   IF EMPTY(respuesta) .OR. LASTKEY()=27
      STOR .F. TO RESPUESTA
   ELSE
      RESPUESTA=XSEEK(respuesta,'MER','ARTICULO')
   ENDIF
ENDIF
return respuesta
