*************************************************************************
*-- Programa: cmer.prg
*-- Fecha   : 11/29/91
*-- Version : V.LEEGSTRA
*-- Notas   : DERIVA A OPERACIONES DE CORRECCION de mercaderias
*-- Modificaci¢n GOYO 25/06/92
********************************************************************************
stor bar() to dijo
stor nul TO respuesta
IF elimer("a Corregir",-1,1)
DO CASE
CASE dijo=1
ULPR='CMERT'
   ARX[3,6]="!YAESTABA(AGX[3],'MER','ARTICULO',.f.,.t.)"
   ARX[4,6]="!YAESTABA(AGX[4],'MER','MERCA',.t.,.t.)"
   ON KEY LABEL Ctrl+F3 DO THELAST WITH 'MER','Base de Mercader¡as',30,'articulo','ARTICULO','ARTICULO'
   DO CORRIGE WITH 'MER',cmerR,cmerC,cmerR+cmerLA,cmerC+cmerAN,'Correcci¢n Mercader¡a - Completo','MMER(.t.,col1)'
   ON KEY LABEL Ctrl+F3
CASE dijo=2
=ACOPY(ARX,ARXANT)
ULPR='CMERR'
   FOR XA=3 TO LARGO
      ARX[XA,16]=.T.
   NEXT
   DO CORRIGE WITH 'MER',cmerR,cmerC,cmerR+cmerLA,cmerC+cmerAN,'Correcci¢n Mercader¡a - Rubro','MMER(.t.,col1)'
=ACOPY(ARXANT,ARX)
CASE dijo=3
=ACOPY(ARX,ARXANT)
ULPR='CMERP'
   FOR XA=1 TO 7
      ARX[XA,16]=.T.
   NEXT
   FOR XA=11 TO LARGO
      ARX[XA,16]=.T.
   NEXT
   DO CORRIGE WITH 'MER',cmerR,cmerC,cmerR+cmerLA,cmerC+cmerAN,'Correcci¢n Mercader¡a - Proveedores ','MMER(.t.,col1)'
=ACOPY(ARXANT,ARX)
CASE dijo=4
=ACOPY(ARX,ARXANT)
ULPR='CMERM'
   FOR XA=1 TO LARGO
      ARX[XA,16]=.T.
   NEXT
arx[6,16]=.f.
   DO CORRIGE WITH 'MER',cmerR,cmerC,cmerR+cmerLA,cmerC+cmerAN,'Correcci¢n Mercader¡a - Marca ','MMER(.t.,col1)'
=ACOPY(ARXANT,ARX)
ENDCASE
endif
ulpr=PROGRAM()
=men_lin(botom)
return
