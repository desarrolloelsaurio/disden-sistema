********************************************************************************
*-- Programa: LEMPLIP
*-- Fecha   : 11/05/90 02:41am
*-- Version : G. REINER
*-- Notas   : Listado Empleados por Impresora Parcializado
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
dijo=BAR()
SELE emp
SET ORDER TO ordlis
DO CASE
CASE BAR()=9
   tt='Listado de Empleados - No Cobran Sal. Familiar'
   MAX=3
   DECL co[MAX]
   co[2]='      Apellido y Nombre       '
   co[1]='  Legajo  '
   co[3]='Cobra Sal. Familiar '
   fisc='pagsal="NO"'
   DO lempli2
   RELE co,fisc,tt,MAX
CASE BAR()=11
   tt='Listado de Empleados dados de Baja'
   MAX=3
   DECL co[MAX],ct[MAX]
   co[2]='      Apellido y Nombre       '
   co[1]='  Legajo  '
   co[3]='  Baja  '
   SET DELE OFF
   fisc='deleted()'
   DO lempli2
   SET DELE ON
   RELE co,fisc,tt,MAX
CASE BAR()=10
   MAX=3
   DECL co[MAX],ct[MAX]
   tt='Listado de Empleados - No Liquida'
   co[2]='      Apellido y Nombre       '
   co[1]='  Legajo  '
   co[3]=PADC("Liquida",20,' ')
   fisc='.NOT. NOLIQ'
   DO lempli2
   RELE co,fisc,tt,MAX
CASE BAR()=1
   MAX=4
   DECL co[MAX],ct[MAX]
   tt='Listado de Empleados - Domicilio'
   co[1]='  Legajo  '
   co[2]='      Apellido y Nombre       '
   co[3]='          Domicilio           '
   co[4]='     Localidad      '
   fisc='.t.'
   DO lempli2
   RELE co,tt,fisc
CASE BAR()=2
   MAX=3
   DECL co[MAX]
   tt='Listado de Empleados - Tel‚fonos'
   co[1]='  Legajo  '
   co[2]='      Apellido y Nombre       '
   co[3]='    Tel‚fono   '
   fisc='.t.'
   DO lempli2
   RELE co,tt,fisc
CASE BAR()=3
   MAX=4
   DECL co[MAX],ct[MAX]
   tt='Listado de Empleados - Documentos de Identidad'
   co[1]='  Legajo  '
   co[2]='      Apellido y Nombre       '
   co[3]='T.Doc.'
   co[4]='N§ Docum. '
   fisc='.t.'
   DO lempli2
   RELE co,tt,fisc
CASE BAR()=4
   MAX=3
   DECL co[MAX],ct[MAX]
   tt='Listado de Empleados - Puntaje'
   co[1]='  Legajo  '
   co[2]='      Apellido y Nombre       '
   co[3]='Puntaje'
   fisc='.t.'
   DO lempli2
   RELE co,tt,fisc
CASE BAR()=6 .OR. BAR()=7 .OR. BAR()=5 .OR. BAR()=8
   MAX=3
   fisc='.T.'
   DECL co[MAX],ct[MAX],gt[MAX],gto[MAX],ctt[MAX]
   tt='Listado de Empleados - '
   co[1]='  Legajo  '
   co[2]='      Apellido y Nombre       '
   IF BAR()=5
      tt=tt+'Centros de Costo'
      co[3]='   Centro de Costo  '
   ELSE
      IF BAR()=6
         tt=tt+'Categor¡as'
         co[3]='     Categor¡as     '
      ELSE
         IF BAR()=7
            tt=tt+'Convenios'
            co[3]='     Convenios      '
         ELSE
            tt=tt+'Especialidades'
            co[3]='   Especialidades   '
         ENDIF
      ENDIF
   ENDIF
   DO lempli2
   RELE co,tt,fisc
ENDCASE
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
RETURN
