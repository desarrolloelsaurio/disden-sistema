****************************************************************************
*-- Programa: BUSFAC.PRG
*-- Fecha   : 12-16-91 09:00pm
*-- Version : g. reiner
*-- Notas   : devuelve variables para trabajo con FACTURAS
*-- Modificaci¢n GOYO 07-23-92 01:11am marca -> empresa
********************************************************************************
function busFAC
=movewin(iremr,iremc,iremr+5,iremc+50,'win'," Facturas ")
SELE FAC
SCAT MEMV BLAN
@ 1,1 SAY "Nro FACTURA : "
@ 2,1 SAY "Empresa     : "
@ 1,25 GET m.FACTURA PICT "@Z 9999999999";
 MESS 'Ingrese Nro de Factura [ENTER] p/menu'
READ
IF !EMPTY(m.FACTURA)
   IF !EMPTY(eliemp(' [ESC] para Men£ ',2,53))
      m.marca = LEFT(MIX.TEXTO2,2)
      nada = mix.texto1
      ACTI WIND win
      @ 2,25 GET nada
      CLEA GETS
      SELE FAC
      IF SEEK(m.factura)
         if empty(fac.tipo)
         =relewin("WIN")
         return(.t.)
         else
         do cartel2 with 'El documento buscado fue encontrado',;
                         'pero no es una FACTURA',;
                         'sino una Nota de '+iif(fac.tipo='ND','D‚bito','Cr‚dito'),;
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
