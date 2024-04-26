*********************************************************************************
*-- Programa: BESTT.PRG
*-- Fecha   : 06/20/91
*-- Version : V.LEEGSTRA
*-- Notas   : BORRA TODOS LOS PROCESOS DE UN PRODUCTO
********************************************************************************
PARA ARTIC
**STORE RECNO() TO ff
**SCAT memvar
STORE HORA_ulp(program()) to ulpr
if cheqseg()
   =men_lin("Buscando Estructura - Espere por Favor")
   SELE est
   =FLOCK("EST") .OR. FLOK("EST")
   GOTO TOP
   SCAN WHILE est.articulo#artic
   ENDSCAN
   IF !EOF()
      rr1=6
      rr2=14
      cc1=7
      cc2=56
      COL=17
      col1=30
      kok=0
****      =mmer1()
      IF confirma(" Producto para Borrar su Estructura",.T.,rr2-1,0)
         SET ORDER TO
         DELETE FOR EST.articulo=artic
         SET ORDER TO 1
         STORE kok+1 TO kok
         =IAUD(ARTIC)
      ENDIF
      =RELEwin("win")
   ENDIF
   UNLO in est
ELSE
   =iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)
