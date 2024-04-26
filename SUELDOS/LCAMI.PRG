********************************************************************************
*-- Programa: lcami.PRG
*-- Fecha   : 01/19/91 04:19am
*-- Version : G. REINER
*-- Notas   : imprime listado de cambios
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=1
   fisc='.t.'
   tt='Listado de Cambios'
   DO lcami1
CASE BAR()=2
   respuesta=0
   IF elicat(" a Listar")#0
      GOTO respuesta
      cosa=RECNO("cat")
      fisc='emp.cat=cosa'
      tt='Listado de Cambios por Categor¡a '+ALLTRIM(cat.categoria)
      DO lcami1
   ENDIF
CASE BAR()=3
   respuesta=0
   IF elicon(" a Listar")#0
      GOTO respuesta
      cosa=RECNO("con")
      fisc='emp.con=cosa'
      tt='Listado de Cambios por Convenio '+ALLTRIM(con.convenio)
      DO lcami1
   ENDIF
CASE BAR()=4
   respuesta=0
   IF eliccos(" a Listar")#0
      GOTO respuesta
      cosa=RECNO("ccos")
      fisc='emp.ccos=cosa'
      tt='Listado de Cambios por Centro de Costos '+ALLTRIM(ccos.cencos)
      DO lcami1
   ENDIF
ENDCASE
ulpr=PROGRAM()
RETURN
