********************************************************************************
*-- Programa: LinqJP.PRG
*-- Fecha   : 09/12/91 02:46pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE LEGAJOS DE Inquilinos
********************************************************************************
DO CASE
CASE BAR()=1
   fsc='.t.'
   ttu='Todos los Inquilinos'
   DO linqjp1
CASE BAR()=2
   STOR NUL TO respuesta
   IF !EMPTY(eliciu(" a Listar",-1,1))
      xcos=RECNO()
      fsc='localidad=xcos'
      ttu='Por Localidad:'+ALLTRIM(mix->texto1)
      DO linqjp1
   ENDIF
CASE BAR()=3
   STOR NUL TO respuesta
   IF !EMPTY(eliprv(" a Listar",-1,1))
      xcos=RECNO()
      fsc='provincia=xcos'
      ttu='Por Provincia:'+ALLTRIM(mix->texto1)
      DO linqjp1
   ENDIF
CASE BAR()=4
   STOR NUL TO respuesta
   IF !EMPTY(eliiva(" a Listar",-1,1))
      xcos=respuesta
      fsc='condiva=xcos'
      ttu='Por Condici¢n de I.V.A.:'+ALLTRIM(xaciva[respuesta,1])
      DO linqjp1
   ENDIF
CASE BAR()=7
   fsc='bloqueo'
   ttu='Inquilinos Bloqueados'
   DO linqjp1
ENDCASE
RETURN
*: EOF: LinqJP.PRG
