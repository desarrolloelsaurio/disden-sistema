********************************************************************************
*-- Programa: lhissi1.prg
*-- Fecha   : 04/26/91 07:01pm
*-- Version : g. reiner
*-- Notas   : deriva a listados historicos de sueldos
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=1
   SELE emp
   SET ORDER TO
   SELE sue
   SET RELA TO empleado INTO emp
   IF jodesh1=jodesh2
      IF jamesh='A'
         jamesh1=VAL(jamesh)
         IF ordlis=1
            INDEX ON emp->apynom TO tmp FOR mes=jodesh1
         ELSE
            INDEX ON emp->legajo TO tmp FOR mes=jodesh1
         ENDIF
      ELSE
         IF ordlis=1
            INDEX ON emp->apynom TO tmp FOR mes=jodesh1 .AND. quincena=jamesh1
         ELSE
            INDEX ON emp->legajo TO tmp FOR mes=jodesh1 .AND. quincena=jamesh1
         ENDIF
      ENDIF
   ELSE
      IF ordlis=1
         INDEX ON emp->apynom TO tmp FOR mes<=jodesh2 .AND. mes>=jodesh1
      ELSE
         INDEX ON emp->legajo TO tmp FOR mes<=jodesh2 .AND. mes>=jodesh1
      ENDIF
   ENDIF
   GOTO TOP
   IF .NOT. EOF()
      tt="Hist¢rica de Sueldos Pagados"
      DO lhissi2
   ENDIF
CASE BAR()=3
   STORE 0 TO respuesta
   IF elicat(" a Listar")<>0
      GOTO respuesta
      xcos=RECNO()
      SELE emp
      SET ORDER TO
      SELE sue
      SET RELA TO empleado INTO emp
      IF jodesh1=jodesh2
         IF jamesh='A'
            jamesh1=VAL(jamesh)
            IF ordlis=1
               INDEX ON emp->apynom TO tmp FOR mes=jodesh1 .AND. emp->cat=xcos
            ELSE
               INDEX ON emp->legajo TO tmp FOR mes=jodesh1 .AND. emp->cat=xcos
            ENDIF
         ELSE
            IF ordlis=1
               INDEX ON emp->apynom TO tmp FOR mes=jodesh1 .AND. quincena=jamesh1 .AND. emp->cat=xcos
            ELSE
               INDEX ON emp->legajo TO tmp FOR mes=jodesh1 .AND. quincena=jamesh1 .AND. emp->cat=xcos
            ENDIF
         ENDIF
      ELSE
         IF ordlis=1
            INDEX ON emp->apynom TO tmp FOR mes<=jodesh2 .AND. mes>=jodesh1 .AND. emp->cat=xcos
         ELSE
            INDEX ON emp->legajo TO tmp FOR mes<=jodesh2 .AND. mes>=jodesh1 .AND. emp->cat=xcos
         ENDIF
      ENDIF
      GOTO TOP
      IF .NOT. EOF()
         tt="Hist¢rica de Sueldos Pagados - por Categor¡a "+cat->categoria
         DO lhissi2
      ENDIF
   ENDIF
CASE BAR()=4
   STORE 0 TO respuesta
   IF elicon(" a Listar")<>0
      GOTO respuesta
      xcos=RECNO()
      SELE emp
      SET ORDER TO
      SELE sue
      SET RELA TO empleado INTO emp
      IF jodesh1=jodesh2
         IF jamesh='A'
            jamesh1=VAL(jamesh)
            IF ordlis=1
               INDEX ON emp->apynom TO tmp FOR mes=jodesh1 .AND. emp->con=xcos
            ELSE
               INDEX ON emp->legajo TO tmp FOR mes=jodesh1 .AND. emp->con=xcos
            ENDIF
         ELSE
            IF ordlis=1
               INDEX ON emp->apynom TO tmp FOR mes=jodesh1 .AND. quincena=jamesh1 .AND. emp->con=xcos
            ELSE
               INDEX ON emp->legajo TO tmp FOR mes=jodesh1 .AND. quincena=jamesh1 .AND. emp->con=xcos
            ENDIF
         ENDIF
      ELSE
         IF ordlis=1
            INDEX ON emp->apynom TO tmp FOR mes<=jodesh2 .AND. mes>=jodesh1 .AND. emp->con=xcos
         ELSE
            INDEX ON emp->legajo TO tmp FOR mes<=jodesh2 .AND. mes>=jodesh1 .AND. emp->con=xcos
         ENDIF
      ENDIF
      GOTO TOP
      IF .NOT. EOF()
         tt="Hist¢rica de Sueldos Pagados - por Convenio "+con->convenio
         DO lhissi2
      ENDIF
   ENDIF
CASE BAR()=5
   STORE 0 TO respuesta
   IF eliccos(" a Listar")<>0
      GOTO respuesta
      xcos=RECNO()
      SELE emp
      SET ORDER TO
      SELE sue
      SET RELA TO empleado INTO emp
      IF jodesh1=jodesh2
         IF jamesh='A'
            jamesh1=VAL(jamesh)
            IF ordlis=1
               INDEX ON emp->apynom TO tmp FOR mes=jodesh1 .AND. emp->ccos=xcos
            ELSE
               INDEX ON emp->legajo TO tmp FOR mes=jodesh1 .AND. emp->ccos=xcos
            ENDIF
         ELSE
            IF ordlis=1
               INDEX ON emp->apynom TO tmp FOR mes=jodesh1 .AND. quincena=jamesh1 .AND. emp->ccos=xcos
            ELSE
               INDEX ON emp->legajo TO tmp FOR mes=jodesh1 .AND. quincena=jamesh1 .AND. emp->ccos=xcos
            ENDIF
         ENDIF
      ELSE
         IF ordlis=1
            INDEX ON emp->apynom TO tmp FOR mes<=jodesh2 .AND. mes>=jodesh1 .AND. emp->ccos=xcos
         ELSE
            INDEX ON emp->legajo TO tmp FOR mes<=jodesh2 .AND. mes>=jodesh1 .AND. emp->ccos=xcos
         ENDIF
      ENDIF
      GOTO TOP
      IF .NOT. EOF()
         tt="Hist¢rica de Sueldos Pagados - por Centro de Costos "+ccos->cencos
         DO lhissi2
      ENDIF
   ENDIF
CASE BAR()=6
   STORE 0 TO respuesta
   IF eliesp(" a Listar")<>0
      GOTO respuesta
      xcos=RECNO()
      SELE emp
      SET ORDER TO
      SELE sue
      SET RELA TO empleado INTO emp
      IF jodesh1=jodesh2
         IF jamesh='A'
            jamesh1=VAL(jamesh)
            IF ordlis=1
               INDEX ON emp->apynom TO tmp FOR mes=jodesh1 .AND. emp->esp=xcos
            ELSE
               INDEX ON emp->legajo TO tmp FOR mes=jodesh1 .AND. emp->esp=xcos
            ENDIF
         ELSE
            IF ordlis=1
               INDEX ON emp->apynom TO tmp FOR mes=jodesh1 .AND. quincena=jamesh1 .AND. emp->esp=xcos
            ELSE
               INDEX ON emp->legajo TO tmp FOR mes=jodesh1 .AND. quincena=jamesh1 .AND. emp->esp=xcos
            ENDIF
         ENDIF
      ELSE
         IF ordlis=1
            INDEX ON emp->apynom TO tmp FOR mes<=jodesh2 .AND. mes>=jodesh1 .AND. emp->esp=xcos
         ELSE
            INDEX ON emp->legajo TO tmp FOR mes<=jodesh2 .AND. mes>=jodesh1 .AND. emp->esp=xcos
         ENDIF
      ENDIF
      GOTO TOP
      IF .NOT. EOF()
         tt="Hist¢rica de Sueldos Pagados - por Especialidad "+esp->especiali
         DO lhissi2
      ENDIF
   ENDIF
ENDCASE
SELE emp
SET ORDER TO 1
ulpr=PROGRAM()
@ 24,0 SAY SPACE(80)
RETURN

*: EOF: LHISSI.PRG
