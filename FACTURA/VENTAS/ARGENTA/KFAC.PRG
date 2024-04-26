********************************************************************************
*-- Programa: kfac.prg
*-- Fecha   : 01-12-92 05:17pm
*-- Version : G. REINER
*-- Notas   : BORRA FACTURAS
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   DO MENSAJE WITH 'CUIDADO CON LO QUE HACE'
   acti scre
   if CONFIRMA("Borrar Archivo de Facturas Emitidas",.t.,10,10)
      STOR NUL TO respuesta
      do infic1 with 'Mes a Borrar - (0 Todos / 13 Anula)',2
      if lastkey()#27 .and. val(respuesta)<13
         mes=val(respuesta)
         tmes=iif(mes=NUL,'Todos los Meses','el Mes de '+qmes(mes))
         if confirma("Borrar las facturas de "+tmes,.t.,10,10)
            =men_lin(padc("Borrando las Facturas de "+tmes,80))
            if mes=NUL
               sele fac
               dele all
               sele fax
               dele all
            else
               sele fac
               scan for month(fechaem)=mes
                  sele fax
                  dele for factura=fac.factura
                  SELE FAC
                  DELE
               endscan
            endif
         endif
      endif
   endif
ELSE
   =iaudi()
ENDIF
=men_lin(BOTOM)
RETURN
