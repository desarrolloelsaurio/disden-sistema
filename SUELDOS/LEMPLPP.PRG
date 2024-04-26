********************************************************************************
*-- Programa: LEMPLpp
*-- Fecha   : 11/05/90 03:21am
*-- Version : G. REINER
*-- Notas   : Listado Empleados por Pantalla Parcializado
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
dijo=BAR()
STORE '.T.' TO fisc
SELE emp
SET ORDER TO ordlis
DO CASE
CASE BAR()=8
   MAX=3
   DECL co[MAX],ct[MAX]
   tt='Listado de Empleados - No Cobran Salario Familiar'
   co[2]='      Apellido y Nombre       '
   co[1]='  Legajo  '
   co[3]='Cobra Sal. Familiar '
   fisc='pagsal="NO"'
   DO lemplpp1
   RELE co,ct,fisc,tt,MAX
CASE BAR()=9
   MAX=3
   DECL co[MAX],ct[MAX]
   tt='Listado de Empleados - No Liquida'
   co[2]='      Apellido y Nombre       '
   co[1]='  Legajo  '
   co[3]=PADC("Liquida",20,' ')
   fisc='.NOT. NOLIQ'
   DO lemplpp1
   RELE co,ct,fisc,tt,MAX
CASE BAR()=1
   MAX=3
   DECL co[MAX],ct[MAX]
   tt='Listado de Empleados - Domicilio'
   co[1]='      Apellido y Nombre       '
   co[2]='        Domicilio         '
   co[3]='     Localidad     '
   DO lemplpp1
   SET ORDER TO ordlis
   RELE co,ct
CASE BAR()=2
   MAX=3
   DECL co[MAX],ct[MAX]
   co[1]='  Legajo  '
   co[2]='      Apellido y Nombre       '
   co[3]='    Tel‚fono   '
   tt='Listado de Empleados - Tel‚fonos'
   DO lemplpp1
   RELE co,ct
CASE BAR()=3
   MAX=4
   DECL co[MAX],ct[MAX]
   tt='Listado de Empleados - Documentos de Identidad'
   co[1]='  Legajo  '
   co[2]='      Apellido y Nombre       '
   co[3]='T.Doc.'
   co[4]='N§ Docum. '
   DO lemplpp1
   RELE co,ct
CASE BAR()=4
   MAX=3
   DECL co[MAX],ct[MAX]
   tt='Listado de Empleados - Puntaje'
   co[1]='  Legajo  '
   co[2]='      Apellido y Nombre       '
   co[3]='Puntaje'
   DO lemplpp1
   RELE co,ct
CASE BAR()=6 .OR. BAR()=7 .OR. BAR()=5
   MAX=3
   DECL co[MAX]
   tt='Listado de Empleados - '
   co[1]='  Legajo  '
   co[2]='      Apellido y Nombre       '
   IF BAR()=5
      co[3]='   Centro de Costo  '
      tt=tt+'Centros de Costo'
   ELSE
      IF BAR()=6
         co[3]='      Categor¡a     '
         tt=tt+'Categor¡as'
      ELSE
         co[3]='      Convenio      '
         tt=tt+'Convenios'
      ENDIF
   ENDIF
   DO lemplpp1
   RELE co,ct,gt,gto,ctt
ENDCASE
RETURN
