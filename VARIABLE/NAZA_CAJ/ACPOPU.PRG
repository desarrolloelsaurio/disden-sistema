********************************************************************************
*-- Programa: ACPOPU.PRG
*-- Fecha   : 11.8.90
*-- Version : G. REINER
*-- Notas   : ACTUALIZA POPUPS QUE SE UTILIZARAN
********************************************************************************
ulpr=PROGRAM()
=HORA_ULP()
cpp=14
=MOVEWIN(4,35,7+cpp,64,'WIN'," Popup's a Utilizar ")
STORE NUL TO REN
****** BANCOS
BANpo=IIF(BANpop,'SI','NO')
REN=REN+1
@ REN,1 SAY 'BANCOS' colo sche 3
@ REN,25 GET BANpo PICTURE '@M SI,NO';
 MESS 'Usa Popup de Bancos ?'
****** ciudades
ciupo=IIF(ciupop,'SI','NO')
REN=REN+1
@ REN,1 SAY 'CIUDADES' colo sche 3
@ REN,25 GET ciupo PICTURE '@M SI,NO';
  MESS 'Usa Popup de Ciudades ?'
****** colores
colpo=IIF(colpop,'SI','NO')
REN=REN+1
@ REN,1 SAY 'COLORES' colo sche 3
@ REN,25 GET colpo PICTURE '@M SI,NO';
 MESS 'Usa Popup de Colores ?'
****** curvas
curpo=IIF(curpop,'SI','NO')
REN=REN+1
@ REN,1 SAY 'CURVAS' colo sche 3
@ REN,25 GET curpo PICTURE '@M SI,NO';
 MESS 'Usa Popup de Curvas ?'
****** GRUPOS DE cOMPRA
grupx=IIF(grupop,'SI','NO')
REN=REN+1
@ REN,1 SAY 'GRUPOS DE COMPRA' colo sche 3
@ REN,25 GET grupx PICTURE '@M SI,NO';
 MESS 'Usa Popup de Grupos de Compra ?'
****** LINEAS
linpo=IIF(linpop,'SI','NO')
REN=REN+1
@ REN,1 SAY 'LINEAS' colo sche 3
@ REN,25 GET linpo PICTURE '@M SI,NO';
 MESS 'Usa Popup de L¡neas ?'
****** MARCAS
marpo=IIF(marpop,'SI','NO')
REN=REN+1
@ REN,1 SAY 'MARCAS' colo sche 3
@ REN,25 GET marpo PICTURE '@M SI,NO';
 MESS 'Usa Popup de Marcas ?'
****** MERcaderias
merpo=IIF(merpop,'SI','NO')
REN=REN+1
@ REN,1 SAY 'MERCADERIAS' colo sche 3
@ REN,25 GET merpo PICTURE '@M SI,NO';
 MESS 'Usa Popup de Mercader¡as ?'
****** OPERACIONES DE KARDEX
opkpo=IIF(opkpop,'SI','NO')
REN=REN+1
@ REN,1 SAY 'OPERACIONES KARDEX' colo sche 3
@ REN,25 GET opkpo PICTURE '@M SI,NO';
 MESS 'Usa Popup de Operaciones de Karddex ?'
****** PROVEEDORES
propo=IIF(propop,'SI','NO')
REN=REN+1
@ REN,1 SAY 'PROVEEDORES' colo sche 3
@ REN,25 GET propo PICTURE '@M SI,NO';
 MESS 'Usa Popup de Proveedores ?'
****** provincias
prvpo=IIF(prvpop,'SI','NO')
REN=REN+1
@ REN,1 SAY 'PROVINCIAS'colo sche 3
@ REN,25 GET prvpo PICTURE '@M SI,NO';
 MESS 'Usa Popup de Provincias ?'
****** RUBROS
rubpo=IIF(rubpop,'SI','NO')
REN=REN+1
@ REN,1 SAY 'RUBROS' colo sche 3
@ REN,25 GET rubpo PICTURE '@M SI,NO';
 MESS 'Usa Popup de Rubros ?'
****** SUElas
suepo=IIF(suepop,'SI','NO')
REN=REN+1
@ REN,1 SAY UPPER(zuelas) colo sche 3
@ REN,25 GET suepo PICTURE '@M SI,NO';
 MESS 'Usa Popup de '+zuelas+' ?'
****** TIPOS DE GASTO
GASpo=IIF(GASpop,'SI','NO')
REN=REN+1
@ REN,1 SAY "TIPO DE GASTO" colo sche 3
@ REN,25 GET GASpo PICTURE '@M SI,NO';
 MESS 'Usa Popup de Tipo de Gasto ?'
READ
ciupop=IIF(ciupo='SI',.T.,.F.)
curpop=IIF(curpo='SI',.T.,.F.)
grupop=IIF(grupx='SI',.T.,.F.)
linpop=IIF(linpo='SI',.T.,.F.)
marpop=IIF(marpo='SI',.T.,.F.)
prvpop=IIF(prvpo='SI',.T.,.F.)
merpop=IIF(merpo='SI',.T.,.F.)
opkpop=IIF(opkpo='SI',.T.,.F.)
colpop=IIF(colpo='SI',.T.,.F.)
propop=IIF(propo='SI',.T.,.F.)
rubpop=IIF(rubpo='SI',.T.,.F.)
suepop=IIF(suepo='SI',.T.,.F.)
banpop=IIF(banpo='SI',.T.,.F.)
gaspop=IIF(gaspo='SI',.T.,.F.)
=RELEWIN("win")
=MEN_LIN(BOTOM)
RETURN

