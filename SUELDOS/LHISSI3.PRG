********************************************************************************
*-- Programa: lhissi3.prg
*-- Fecha   : 09/03/91 00:54am
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
   IF ordlis=1
      INDEX ON emp.apynom TO tmp FOR mes=jodesh1
   ELSE
      INDEX ON emp.legajo TO tmp FOR mes=jodesh1
   ENDIF
   GOTO TOP
   IF !EOF()
      tt="Hist¢rica de Sueldos Pagados"
      DO lhissi4
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
      IF ordlis=1
         INDEX ON emp.apynom TO tmp FOR mes=jodesh1 .AND. emp.cat=xcos
      ELSE
         INDEX ON emp.legajo TO tmp FOR mes=jodesh1 .AND. emp.cat=xcos
      ENDIF
      GOTO TOP
      IF !EOF()
         tt="Hist¢rica de Sueldos Pagados - por Categor¡a "+cat.categoria
         DO lhissi4
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
      IF ordlis=1
         INDEX ON emp.apynom TO tmp FOR mes=jodesh1 .AND. emp.con=xcos
      ELSE
         INDEX ON emp.legajo TO tmp FOR mes=jodesh1 .AND. emp.con=xcos
      ENDIF
      GOTO TOP
      IF !EOF()
         tt="Hist¢rica de Sueldos Pagados - por Convenio "+con.convenio
         DO lhissi4
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
      IF ordlis=1
         INDEX ON emp.apynom TO tmp FOR mes=jodesh1 .AND. emp.ccos=xcos
      ELSE
         INDEX ON emp.legajo TO tmp FOR mes=jodesh1 .AND. emp.ccos=xcos
      ENDIF
      GOTO TOP
      IF !EOF()
         tt="Hist¢rica de Sueldos Pagados - por Centro de Costos "+ccos.cencos
         DO lhissi4
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
      IF ordlis=1
         INDEX ON emp.apynom TO tmp FOR mes=jodesh1 .AND. emp.esp=xcos
      ELSE
         INDEX ON emp.legajo TO tmp FOR mes=jodesh1 .AND. emp.esp=xcos
      ENDIF
      GOTO TOP
      IF !EOF()
         tt="Hist¢rica de Sueldos Pagados - por Especialidad "+esp.especiali
         DO lhissi4
      ENDIF
   ENDIF
ENDCASE
SELE emp
do opemp
ulpr=PROGRAM()
@ 24,0 SAY SPACE(80)
RETURN
