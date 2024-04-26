********************************************************************************
*-- Programa: TKAR.PRG
*-- Fecha   : 01/29/92
*-- Version : V.LEEGSTRA
*-- Notas   : MANTENIMIENTO DE KARDEX
********************************************************************************
SELE seg
STORE PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   =iaud('INGRESO '+ulpr)
   =HORA_ULP()
   CLEA
   stor 0 to kok,respuesta
   =MOVEWIN(10,10,15,60,'WIN'," Mantenimiento de Kardex ")
   @ 1,5 say "Marcando los registros de Kardex      "
   @ 2,5 say "correspondientes a una remesa agotada."
   SELE kar
   SET ORDER TO
   =Flock('kar') .or. flok("kar")
   SELE rem
   SCAN FOR !empty(rem->agotada)
      SELE kar
      DELE ALL FOR kar->remesa=rem->remesa .AND. kar->cliente=rem->proveedor .AND. kar->articulo=rem->merca
      SELE rem
   ENDSCAN
   UNLO IN kar
   =relewin('win')
   SELE kar
   SET ORDER TO 1
ELSE
   =iaudI()
ENDIF
ACTI SCREE
=MEN_LIN(SPACE(80))
RETURN
*: EOF: TKAR.PRG
