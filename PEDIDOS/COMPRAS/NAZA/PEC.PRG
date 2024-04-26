*:*********************************************************************
*-- Programa: PEC.prg
*-- Fecha   : 06/06/91 04:30pm
*-- Version : R. 'EL BATA'
*-- Notas   : DERIVA A OPERACIONES DE NOTAS DE PEDIDO PROVEEDORES
*:**********************************************************************
=cabpan1()
DO oppec
=OPPRO()
DO OPEMP
=OPPAG()

DO opsue

c1=1
c2=18
c3=48
c4=54
c5=61
c6=72

DO CASE
CASE BAR()=1
     =OPMER()
     DO ipec
	 CASE BAR()=2
   IF elipec()
      IF productiva="T"
         DO optel
      ELSE
         IF productiva="A"
            DO opavi
         ELSE
            IF productiva="M"
               =OPMER()
            ENDIF
         ENDIF
      ENDIF
      DO zpec
   ENDIF
   RELE WIND win2
CASE BAR()=4
   IF elipec()
      IF productiva="T"
         DO optel
      ELSE
         IF productiva="A"
            DO opavi
         ELSE
            IF productiva="M"
               =OPMER()
            ENDIF
         ENDIF
      ENDIF
      DO rpec1
   ENDIF
   RELE WIND win2
CASE BAR()=5
   IF elipec()
      IF productiva="T"
         DO optel
      ELSE
         IF productiva="A"
            DO opavi
         ELSE
            IF productiva="M"
               =OPMER()
            ENDIF
         ENDIF
      ENDIF
      DO cpe11
   ENDIF
   RELE WIND win2
CASE BAR()=6
   IF elipec()
      IF productiva="T"
         DO optel
      ELSE
         IF productiva="A"
            DO opavi
         ELSE
            IF productiva="M"
               =OPMER()
            ENDIF
         ENDIF
      ENDIF
      DO cpec1
   ENDIF
   RELE WIND win2
CASE BAR()=8
   IF elipec()
      IF productiva="T"
         DO optel
      ELSE
         IF productiva="A"
            DO opavi
         ELSE
            IF productiva="M"
               =OPMER()
            ENDIF
         ENDIF
      ENDIF
      DO BPEC
   ENDIF
   RELE WIND win2
CASE BAR()=9
   IF elipec()
      IF productiva="T"
         DO optel
      ELSE
         IF productiva="A"
            DO opavi
         ELSE
            IF productiva="M"
               =OPMER()
            ENDIF
         ENDIF
      ENDIF
      DO apec
   ENDIF
   RELE WIND win2
CASE BAR()=11
   IF elipec()
      IF productiva="T"
         DO optel
      ELSE
         IF productiva="A"
            DO opavi
         ELSE
            IF productiva="M"
               =OPMER()
            ENDIF
         ENDIF
      ENDIF
      DO lpec
   ENDIF
   RELE WIND win2
ENDCASE
ulpr=PROGRAM()
RETURN MEN_LIN(BOTOM)

