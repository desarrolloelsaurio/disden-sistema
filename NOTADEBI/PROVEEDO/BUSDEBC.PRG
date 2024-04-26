********************************************************************************
*-- Programa: BUSDEBC.PRG
*-- Fecha   : 10-16-92 03:21pm
*-- Version : g. reiner
*-- Notas   : devuelve variables para trabajo con NOTA DEBITO PROVEEDORES
********************************************************************************
function BUSDEBC
=movewin(10,20,15,70,'win'," Nota D‚bito de Proveedor ")
SCAT MEMV BLAN
@ 1,1 SAY "N§ NOTA DEBITO : "
@ 2,1 SAY "PROVEEDOR      : "
store SPACE(14) to m.factura
@ 1,15 GET m.FACTURA PICT "@!";
  MESS 'Ingrese N§ Nota D‚bito Proveedor [ENTER] p/menu'
READ
M.FACTURA=Q_FAC(M.FACTURA)
@ 1,15 GET m.FACTURA PICT "@!"
CLEA GETS
IF RIGHT(M.FACTURA,8)#'00000000'
   STOR NUL TO respuesta
   IF !EMPTY(eliPRO(' [ESC] para Men£ ',2,25))
      NADA=PRO.PROVEEDOR
      @ 2,15 GET NADA
      CLEA GETS
      =RELEWIN("WIN")
      SELE FAR
      SEEK(M.FACTURA+PRO.PROCOD)
			RETURN (FOUND() .AND. TIPO='ND')
   ENDIF
else
   =relewin("WIN")
   return .F.
ENDIF
=relewin("WIN")
return .F.
