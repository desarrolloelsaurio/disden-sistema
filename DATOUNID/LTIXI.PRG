********************************************************************************
*-- Programa: ltixi.PRG
*-- Fecha   : 01-18-92 09:26am
*-- Version : R. 'EL BATA'
*-- Notas   : DERIVA PARA LISTADOS DE % part (IMPRESORA)
********************************************************************************
acti scree
ULPR=HORA_ULP(PROGRAM())
TIPOLIS=BAR()
DO CASE
CASE TIPOLIS=1
   DO LTIXI1
CASE TIPOLIS=2
   DO LTIXI2
CASE TIPOLIS=3
   DO LTIXI3
ENDCASE
DEAC WIND WIN
RETURN
