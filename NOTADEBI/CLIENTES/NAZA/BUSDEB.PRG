********************************************************************************
*-- Programa: BUSDEB.PRG
*-- Fecha   : 12-16-91 09:00pm
*-- Version : g. reiner
*-- Notas   : devuelve variables para trabajo con notas de debito
*-- Modificaci¢n GOYO 06-25-92 03:57pm
*-- Modificaci¢n GOYO 07-22-92 11:37pm marca -> empresa
********************************************************************************
function busDEB
=movewin(iremr,iremc,iremr+5,iremc+50,'win'," Notas de D‚bito ")
SELE FAC
SCAT MEMV BLAN
@ 1,1 SAY "Nro NOTA DEBITO: "
@ 2,1 SAY "EMPRESA         : "
@ 1,20 GET m.FACTURA PICT "@Z 9999999999";
 MESS 'Ingrese Nro de Nota de D‚bito [ENTER] p/menu'
READ
IF !EMPTY(m.FACTURA)
   SELE MIX
   STOR NUL TO respuesta
   IF !EMPTY(ELIEMP(' [ESC] para Men£ ',2,53))
      m.marca = LEFT(MIX.TEXTO2,2)
      nada = JANNAME
      ACTI WIND win
      @ 2,20 GET nada
      CLEA GETS
      SELE FAC
      IF SEEK(m.factura)
         if fac.tipo='ND'
         =relewin("WIN")
         return(.t.)
         else
         do cartel2 with 'El documento buscado fue encontrado',;
                         'pero no es una NOTA DE DEBITO',;
                         'sino una '+iif(fac.tipo='NC','Nota de Cr‚dito','Factura'),;
                         'Por favor reintente'
         endif
      ENDIF
   else
      =relewin("WIN")
      return(.f.)
   ENDIF
else
   =relewin("WIN")
   return(.f.)
ENDIF
=relewin("WIN")
return(.F.)
