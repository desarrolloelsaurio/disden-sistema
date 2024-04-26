******************************************************
*-- Programa: ELIGAS.PRG
*-- Fecha   : 03-23-92 04:50pm
*-- Version : R. 'EL BATA'
*-- Notas   : ELIGE EL TIPO DE GASTO
******************************************************
FUNCTION eliGAS
PARA msg,r1,c1
SELE mix
STORE SPACE(11) TO M.RESPUESTA
IF gaspop
   =men_lin('Tipo de Gasto '+msg)
   set order to tag gastex
   ACTI POPUP mixpop
   STOR !EMPTY(respuesta) TO respuesta
ELSE
   IF r1=-1
      #IF "FELIX" $ CURD()
         STORE SPACE(2)+".  .     " TO M.RESPUESTA
         RESPUESTA=PREGUNTA('INGRESE TIPO DE GASTO '+msg,.T.,10,0,'!!.!!.!!!!!')
      #ELSE
         STORE '00.00.00.00' TO RESPUESTA
         RESPUESTA=PREGUNTA('INGRESE TIPO DE GASTO '+msg,.T.,10,0,'99.99.99.99')
      #ENDIF
   ELSE
      @ r1,c1 GET respuesta PICTURE '@R 99.99.99.99'
      READ
   ENDIF
   IF EMPTY(respuesta) .OR. LASTKEY()=27
      STOR .f. TO respuesta
   ELSE
	  RESPUESTA=XSEEK(RESPUESTA,'MIX','GASCOD')
   ENDIF
ENDIF
RETURN respuesta
