********************************************************************************
*-- Programa: lfabiii.prg
*-- Fecha   : 07/04/91 05:59pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE LISTADOS DE ORDENES DE fabricacion
********************************************************************************
ULPR=HORA_ULP(PROGRAM()
STORE DATE() TO RESPUESTA
DEFINE WINDOW fic FROM 14,0 TO 18,77 DOUBLE TITL 'Lista Ordenes de '+favri+' por Fecha '+dijo SHADOW COLOR SCHE 8
ACTI WINDOW fic
@ 1,10 SAY "INGRESE FECHA "+UPPER(dijo)+" " GET respuesta MESS 'Listado por Fecha '+dijo
READ
RELE WINDOW FIC
IF !EMPTY(RESPUESTA) .AND. LASTKEY()#27
   XCOS=RESPUESTA
   DO CASE
   CASE BAR()=1
      FISC=IIF(dijo='d','FECHAEM<XCOS','FECHAPR<XCOS')
      tt='Lista Ordenes de '+favri+' - Por Fecha Anterior al '+DTOC(respuesta)
      =LCORI2()
   CASE BAR()=2
      FISC=IIF(dijo='d','FECHAEM=XCOS','FECHAPR=XCOS')
      tt='Lista Ordenes de '+favri+' - Por Fecha '+DTOC(respuesta)
      =LCORI2()
   CASE BAR()=3
      FISC=IIF(dijo='d','FECHAEM>XCOS','FECHAPR>XCOS')
      tt='Lista Ordenes de '+favri+' - Por Fecha Posterior al '+DTOC(respuesta)
      =LCORI2()
   ENDCASE
ENDIF
ULPR=PROGRAM()
RETURN MEN_LIN(BOTOM)
