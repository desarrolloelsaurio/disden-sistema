********************************************************************************
*-- Programa: ACPOPU.PRG
*-- Fecha   : 11.8.90
*-- Version : G. REINER
*-- Notas   : ACTUALIZA POPUPS QUE SE UTILIZARAN
********************************************************************************
ULPR=PROGRAM()
*nada
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') color i
cpp=12
DEFINE WINDOW win FROM 5,25 TO 9+cpp,64 TITL " Popup's a Utilizar " DOUBLE SHAD COLOR SCHE 8
ACTI WINDOW win
****** EMPRESAS
janpo=IIF(janpop,'SI','NO')
@ 1,1 SAY 'EMPRESAS' COLOR SCHE 3
@ 1,25 GET janpo PICTURE '@M SI,NO';
   MESS 'Usa Popup de Empresa ?'
****** CENTROS DE COSTO
cospo=IIF(cospop,'SI','NO')
@ 2,1 SAY 'CENTROS DE COSTO' COLOR SCHE 3
@ 2,25 GET cospo PICTURE '@M SI,NO';
   MESS 'Usa Popup de Centro de Costos ?'
****** CONVENIOS
conpo=IIF(conpop,'SI','NO')
@ 3,1 SAY 'CONVENIOS' COLOR SCHE 3
@ 3,25 GET conpo PICTURE '@M SI,NO';
   MESS 'Usa Popup de Convenios ?'
****** CATEGORIAS
catpo=IIF(catpop,'SI','NO')
@ 4,1 SAY 'CATEGORIAS' COLOR SCHE 3
@ 4,25 GET catpo PICTURE '@M SI,NO';
   MESS 'Usa Popup de Categorias ?'
****** ESPECIALIDADES
esppo=IIF(esppop,'SI','NO')
@ 5,1 SAY 'ESPECIALIDADES' COLOR SCHE 3
@ 5,25 GET esppo PICTURE '@M SI,NO';
   MESS 'Usa Popup de Especialidades ?'
****** PARENTESCOS
parpo=IIF(parpop,'SI','NO')
@ 6,1 SAY 'PARENTESCOS' COLOR SCHE 3
@ 6,25 GET parpo PICTURE '@M SI,NO';
   MESS 'Usa Popup de Parentescos ?'
****** EMPLEADOS
emppo=IIF(emppop,'SI','NO')
@ 7,1 SAY 'EMPLEADO' COLOR SCHE 3
@ 7,25 GET emppo PICTURE '@M SI,NO';
   MESS 'Usa Popup de Empleados ?'
****** VARIABLES
varpo=IIF(varpop,'SI','NO')
@ 8,1 SAY 'VARIABLES' COLOR SCHE 3
@ 8,25 GET varpo PICTURE '@M SI,NO';
   MESS 'Usa Popup de Variables ?'
****** TIPO DE HORAS
thorpo=IIF(thorpop,'SI','NO')
@ 9,1 SAY 'TIPO DE HORA' COLOR SCHE 3
@ 9,25 GET thorpo PICTURE '@M SI,NO';
   MESS 'Usa Popup de Tipo de Hora ?'
****** ADICIONALES
adipo=IIF(adipop,'SI','NO')
@ 10,1 SAY 'ADICIONALES' COLOR SCHE 3
@ 10,25 GET adipo PICTURE '@M SI,NO';
   MESS 'Usa Popup de Adicionales ?'
****** RETENCIONES
retpo=IIF(retpop,'SI','NO')
@ 11,1 SAY 'RETENCIONES' COLOR SCHE 3
@ 11,25 GET retpo PICTURE '@M SI,NO';
   MESS 'Usa Popup de Retenciones ?'
****** TIPO DE ADELANTO
gaspo=IIF(gaspop,'SI','NO')
@ 12,1 SAY 'TIPO DE ADELANTO' COLOR SCHE 3
@ 12,25 GET gaspo PICTURE '@M SI,NO';
   MESS 'Usa Popup de Tipo de Adelanto ?'
****** SALARIO FAMILIAR
SALpo=IIF(SALpop,'SI','NO')
@ 13,1 SAY 'SALARIO FAMILIAR' COLOR SCHE 3
@ 13,25 GET SALPO PICTURE '@M SI,NO';
   MESS 'Usa Popup de Tipo de Salario Familiar ?'
READ
janpop=IIF(janpo='SI',.T.,.F.)
cospop=IIF(cospo='SI',.T.,.F.)
conpop=IIF(conpo='SI',.T.,.F.)
catpop=IIF(catpo='SI',.T.,.F.)
esppop=IIF(esppo='SI',.T.,.F.)
parpop=IIF(parpo='SI',.T.,.F.)
emppop=IIF(emppo='SI',.T.,.F.)
varpop=IIF(varpo='SI',.T.,.F.)
thorpop=IIF(thorpo='SI',.T.,.F.)
adipop=IIF(adipo='SI',.T.,.F.)
retpop=IIF(retpo='SI',.T.,.F.)
gaspop=IIF(gaspo='SI',.T.,.F.)
salpop=IIF(salpo='SI',.T.,.F.)
rele wind win
@ 24,0 say space(80)
RETURN
