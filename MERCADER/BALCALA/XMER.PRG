********************************************************************************
*-- Programa: XMER.PRG
*-- Fecha   : 06/11/91
*-- Version : V.LEEGSTRA
*-- Notas   : RESTAURA BASE DE Mercader¡as
********************************************************************************
ulpr=PROGRAM()
=HORA_ULP()
STORE "" TO tx
SELE mer
DO CASE
CASE BAR()=1
=MEN_LIN('Reindexando el Archivo de Mercader¡as',80)
=floCk("MER") .OR. FLOK("MER")
=DOTALK()
=OPMERX()
REINDEX
=REOPMER()
=UNTALK()
tx='REINDEX '
CASE BAR()=2
=MEN_LIN('Generando Nuevo Indice de Mercader¡as')
=floCk("MER") .OR. FLOK("MER")
INDE ON merca TO (PATHPRO+"\MERCA")
INDE ON articulo TO (PATHPRO+"\ARTICULO")
UNLO IN mer
tx='CREA INDICE '
USE
=OPMER()
ENDCASE
IF tx#''
=iaud(tx+' Mercader¡as')
ENDIF
RETURN
*: EOF: XMER.PRG
