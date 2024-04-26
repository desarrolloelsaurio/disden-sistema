********************************************************************************
*-- Programa: LMERP2.PRG
*-- Fecha   : 03-27-92 02:04am
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE listado de mercader¡as por PANTALLA
********************************************************************************
dijo1=BAR()
tt='Listado de Mercader¡as'
FISC=QWMER(DIJO)
IF FISC#".F."
   IF dijo1=1
      DO lmerpm
   ELSE
      DO lmerpp
   ENDIF
ENDIF
RETURN .T.
