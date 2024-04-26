********************************************************************************
*-- Programa: QUERYfar.PRG
*-- Fecha   : 04-16-92 01:05pm
*-- Version : G. REINER
*-- Notas   : GENERA QUERY PARA LISTADO DE FACTURAS
*-- Modificaci¢n GOYO 07-23-92 00:25am marca -> empresa
*-- VERSION NOVOGAR
********************************************************************************
FUNCTION QUERYFAR
PARAMETER PORP
PRIVATE PORP
ULPR=HORA_ULP(PROGRAM())
=MOVEWIN(6,1,22,79,'win',' L¡mites del Listado de '+tit_invos,' [ESC] para Men£ ')
store '' to ttemp,ttfac,TTPRO,ttfec,ttGAS,ttpag,ttmon,ttmer,ttven,ttfev && que se lista
store '.T.' to queemp,quefac,QUEPRO,quefec,queGAS,quepag,quemon,quemer,queven && que se lista
store 1 to filemp,filfac,filpro,filfec,filGAS,filpag,filmon,filmer,filven
***
for m.i=nul to 1
   =rad_bot(1,2,'filemp','*RT Empresa;Anula Listado',19,m.i=1)
   if m.i=1
      read cycle
   endif
   if m.i=0 .or. (m.i=1 .and. filemp=1)
      if last()#27 .or. (last()=27 .and. m.i=0)
         =rad_bot(1,25,'filfac','*RT Todas las '+abr_invo+';Una '+abr_invo+';Resumen por '+abr_invo,19,m.i=1)
         read cycle when last()#27 .and. m.i=1
         =rad_bot(1,50,'filpro','*RT Todos los Proveedores;Un Proveedor;Res£men por Proveedor',19,m.i=1)
         read cycle when last()#27 .and. m.i=1 .and. filfac#2
         =rad_bot(6,2,'filfec','*RT Todas las Fechas;Por Fec. Emisi¢n;Res£men por Fecha',19,m.i=1)
         read cycle when last()#27 .and. m.i=1 .and. filfac#2
         =rad_bot(6,25,'filven','*RT Todas las Fechas;Por Fec. Vencimiento;Res£men por Fecha',19,m.i=1)
         read cycle when last()#27 .and. m.i=1 .and. filfac#2
         =rad_bot(6,50,'filGAS','*RT Todos Tipos de Gasto;Un Tipo;Res£men por Tipo',19,m.i=1)
         read cycle when last()#27 .and. m.i=1 .and. filfac#2
         =rad_bot(11,2,'filpag','*RT Todas las Condic.;Una Condici¢n;Res£men por Condic.',19,m.i=1)
         read cycle when last()#27 .and. m.i=1 .and. filfac#2
         =rad_bot(11,50,'filmon','*RT Todos los Montos;Montos Mayores a...;Montos Menores a...',19,m.i=1)
         read cycle when last()#27 .and. m.i=1 .and. filfac#2
*         =rad_bot(11,50,'filmer','*RT Sin Mercader¡a;Resumen por Producto',19,m.i=1)
*         read cycle when last()#27 .and. m.i=1 .and. filfac#2 .AND. ULPR#'LFPR'
      endif
   ELSE
      EXIT
   endif
next
if lastkey()#27 .and. filemp=1
   ** ELIGE EMPRESA
   store nul TO RESPUESTA
   IF !empty(ELIEMP("a Listar",4,2))
      DO OPFAR
      =OPMER()
      @ 4,2 say janname
      *** elige factura
      if filfac=2
         store 0 to respuesta
         if (INVOICE='FA' .AND. !empty(ELIFAR())) .OR. (INVOICE="NC" .AND. !EMPTY(BUSCREC())) .OR. (INVOICE="ND" .AND. !EMPTY(BUSDEBC()))
            IF PORP
            DO OPCCP
			SELE FAR
			SCAT MEMV
			ABR=M.TIPO
			TIT_SIN=IIF(ABR='FA','Factura',iif(abr='NC',"Nota de Cr‚dito","Nota de D‚bito"))
			DO MFAR WITH .F.
			=INKEY(0)
		=RELEWIN("win10")
		=RELEWIN("win11")
		=RELEWIN("win2")
            ENDIF
         ELSE
            store 1 to FILfac
         endif
      ELSE
         HABILITADO[5]=qw_pro(4,50,'far.codcli')
         HABILITADO[6]=qw_GAS(9,25,'far.GASTO')
         IF ULPR#'LFAK' .AND. ULPR#'LFPR'
            HABILITADO[7]=qw_pag(9,50,'far.condpago')
            HABILITADO[14]=qw_mon(14,2,'far.montonet')
         ELSE
            IF ULPR='LFPR'
               FISC=FIL_INVO+' .AND. fax.MONTO#fax.MONTO1'
            ENDIF
         ENDIF
         if filmer=2
            =qw_mer(14,50,'fax.articulo')
         endif
         FISC=IIF(!EMPTY(FISC),FISC,FIL_INVO)
         FISC=qw_fisc(FISC,quefac)
         FISC=qw_FISC(FISC,QUEPRO)
         IF FILFEC=2
            HABILITADO[2]=qw_fec(9,2,'far.fechaem')
            FISC=qw_FISC(FISC,quefec)
            store 'Fecha de Factura '+ttfec to ttfec,ttfe1
         ENDIF
         IF FILVEN=2
            HABILITADO[3]=qw_fec(9,40,'far.fechave')
            FISC=qw_FISC(FISC,queven)
            ttfev='Fecha de Vencimiento '+ttfec
            ttfec=ttfe1
         ENDIF
         FISC=qw_FISC(FISC,queGAS)
         FISC=qw_FISC(FISC,quePAG)
         FISC=qw_FISC(FISC,queMON)
         FISC=qw_FISC(FISC,queMer)
         FISC=IIF(EMPTY(FISC),'.T.',FISC)
         store "Resumen por " to ressu
         ttfac=iif(filfac=3,RESSU+'Factura',ttfac)
         TTPRO=iif(filpro=3,RESSU+'Proveedor',TTPRO)
         ttfec=iif(filfec=3,RESSU+'Fecha',ttfec)
         ttGAS=iif(filGAS=3,RESSU+'Tipo de Gasto',ttGAS)
         ttPAG=iif(filPAG=3,RESSU+'Condici¢n de Venta',ttPAG)
         TTQUE=QW_TT(TTfac)+QW_TT(TTPRO)+QW_TT(TTfec)+qw_tt(ttfev)+QW_TT(TTGAS)+QW_TT(TTPAG)+QW_TT(TTMON)+QW_TT(TTMer)
      ENDIF
   endif
endif
IF !EMPTY(WONTOP())
   =releWIN('win')
ENDIF
RETURN last()#27 .AND. FILFAC#2 .AND. FILEMP#2
