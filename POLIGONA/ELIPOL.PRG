********************************************************************************
*-- Programa: ELIPOL.PRG
*-- Fecha   :
*-- Version : G. REINER
*-- Notas   : ELIGE LA POLIGONAL
*-- Modificaci¢n GOYO 05-17-92 00:49am (cambio por elimix1)
********************************************************************************
FUNCTION eliPOL
PARA msg,r1,c1
priv msg,r1,c1
STORE NUL TO RESPUESTA
IF !EMPTY(ELILIS(MSG,R1,C1))
   LIST=RESPUESTA
   nada=q_lis(list)
   =MOVEWIN(10,0,15,79,'WIN',' Elige la Poligonal a Corregir')
   @ 1,1 say "Precio:" colo sche 3
   @ 1,20 get nada
   clea gets
   lalis=0
   @ 2,1 say "N§ de Lista"
   @ 2,20 get lalis ;
     mess "N£mero de Lista "+alltrim(nada)
   read
   IF LAST()#27 .AND. LALIS>0 .AND. LALIS<5
      respuesta=str(list,2)+str(lalis,2)
   ELSE
      RESPUESTA=""
   ENDIF
   =relewin("win")
ELSE
   RESPUESTA=''
ENDIF
RETURN respuesta
