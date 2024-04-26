*:*********************************************************************
*-- Programa: idebc.prg
*-- Fecha   : 12-10-91 09:10am
*-- Version : R. 'EL BATA'
*-- Notas   : deriva a devolucion de facturas
**:*********************************************************************
=cabpan1()
=OPPRO()
DO OPEMP
=OPPAG()

DO oppec
DO opcol
DO opfar
DO opccp

d1=1
d2=15
d3=24
d4=30
d5=35
d6=46
d7=63
DO CASE
CASE BAR()=1
   c1=1
   c2=18
   c3=48
   c4=54
   c5=61
   c6=72
   IF elifco()
      IF productiva="T"
         DO optel
         =OPKAR()1
      ELSE
         IF productiva="A"
            DO opavi
            =OPKAR()1
         ELSE
            IF productiva="M"
               DO oppre
               =OPKAR()
               =OPMER()
            ELSE
               =OPKAR()
            ENDIF
         ENDIF
      ENDIF
      DO idebc1
   ENDIF
   RELE WIND win2
CASE BAR()=2
   c1=1
   c2=18
   c3=48
   c4=54
   c5=61
   c6=72
   IF elifco()
      IF productiva="T"
         DO optel
         =OPKAR()1
      ELSE
         IF productiva="A"
            DO opavi
            =OPKAR()1
         ELSE
            IF productiva="M"
               =OPMER()
               =OPKAR()
               DO oppre
            ELSE
               =OPKAR()
            ENDIF
         ENDIF
      ENDIF
      DO idebc2
   ENDIF
   RELE WIND win2
CASE BAR()=3
   c1=1
   c2=18
   c3=48
   c4=54
   c5=61
   c6=72
   IF elifco()
      DO optel
      DO opavi
      =OPMER()
      DO idebc3
   ENDIF
   RELE WIND win2
ENDCASE
ulpr=PROGRAM()
@ 24,nul say botom
RETURN
*: EOF: IDEBC.PRG

