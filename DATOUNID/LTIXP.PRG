********************************************************************************
*-- Programa: ltixp.PRG
*-- Fecha   : 01-18-92 09:26am
*-- Version : R. 'EL BATA'
*-- Notas   : DERIVA PARA LISTADOS DE LA BASE DE DATOS DE UNIDADES
********************************************************************************
ACTI SCREE
ULPR=HORA_ULP(PROGRAM())
TIPOLIS=BAR()
DO CASE
CASE TIPOLIS=1
   DO LTIXP1
CASE TIPOLIS=2
   DO LTIXP2
CASE TIPOLIS=3
   DO LTIXP3
ENDCASE
DEAC WIND WIN
RETURN
