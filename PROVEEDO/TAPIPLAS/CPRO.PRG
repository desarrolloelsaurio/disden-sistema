*****************************************************************************
*-- Programa: cmer.prg
*-- Fecha   : 11/29/91
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE CORRECCION de mercaderias
*-- Modificaci¢n GOYO 25/06/92
********************************************************************************
stor bar() to dijo
stor nul TO respuesta
IF !empty(elipro(" a Corregir",-1,1))
DO CASE
CASE dijo=1
ulpr='CPROT'
      ARX[1,6]="!yaestaba(agx[1],'pro','procod',.F.,.T.)"
      ARX[2,6]="!yaestaba(agx[2],'pro','proveedor',.T.,.T.)"
      ON KEY LABEL Ctrl+F3 DO THELAST WITH 'PRO','Base de Proveedores',50,'procod','CODIGO PROVEEDOR','PROCOD','PROVEEDOR','DENOMINACION PROVEEDOR','PROVEEDOR'
      DO CORRIGE WITH 'PRO',IPROR,IPROC,IPROR+IPROLA,IPROC+IPROAN,' Correcci¢n Proveedores - Completo ','MPRO(.T.,COL1)'
      ON KEY LABEL Ctrl+F3
CASE dijo=2
=ACOPY(ARX,ARXANT)
ULPR='CPROI'
   FOR XA=1 TO LARGO
      ARX[XA,16]=.T.
   NEXT
ARX[11,16]=.F.
ARX[12,16]=.F.
ARX[12,9]=.T.
      DO CORRIGE WITH 'PRO',IPROR,IPROC,IPROR+IPROLA,IPROC+IPROAN,' Correcci¢n Proveedores - I.V.A. ','MPRO(.T.,COL1)'
=ACOPY(ARXANT,ARX)
CASE dijo=3
=ACOPY(ARX,ARXANT)
ULPR='CPROD'
   FOR XA=1 TO LARGO
      ARX[XA,16]=.T.
   NEXT
ARX[13,16]=.F.
ARX[14,16]=.F.
      DO CORRIGE WITH 'PRO',IPROR,IPROC,IPROR+IPROLA,IPROC+IPROAN,' Correcci¢n Proveedores - Descuentos ','MPRO(.T.,COL1)'
=ACOPY(ARXANT,ARX)
ENDCASE
endif
ulpr=PROGRAM()
=men_lin(botom)
return
