********************************************************************************
*-- Programa: QUERYREC.PRG
*-- Fecha   : 08-27-92 05:47pm
*-- Version : G. REINER
*-- Notas   : GENERA QUERY PARA LISTADO DE REMITOS DE COMPRA
*-- Version NOVOGAR
********************************************************************************
FUNCTION QUERYREC
parameter porpa,conmer,PARAQ
=MOVEWIN(1,1,22,79,'WREC',' L¡mites del Listado de Remitos de Compra - [ESC] para Men£ ')
store '' to ttemp,ttREC,ttpro,ttfee,ttori,ttPEC,ttmer,ttrec,ttFPE,ttffa,ttfec,TTFAC,ttfaf && que se lista
store '.T.' to queemp,queREC,quepro,quefee,queori,quePEC,quemer,querec,queFPE,queffa,quefec,QUEFAC,quefaf && que se lista
store 1 to filemp,filREC,filpro,filfee,filori,filPEC,filmer,FILART,filrec,filFPE,filffa,filfec,FILFAC,filfaf
***
for m.i=nul to 1
   =rad_bot(1,2,'filREC','*RT Todos los Remitos;Un Remito;Opciones',19,m.i=1)
   if m.i=1
      read cycle
   endif
      if last()#27 .or. (last()=27 .and. m.i=0)
      IF FILREC=3 .OR. M.I=0
         IF PARAQ
            =rad_bot(1,27,'filfee','*RT Todas las Fechas;Entre Fechas',19,m.i=1)
         ELSE
            =rad_bot(1,27,'filfee','*RT Todas las Fechas;Entre Fechas;Res£men',19,m.i=1)
         ENDIF
         read cycle when last()#27 .and. m.i=1 .and. FILREC=3
         IF PARAQ .OR. FILFEE=3
            =rad_bot(1,50,'filpro','*RT Todos los Proveedores;Opciones',19,m.i=1)
         ELSE
            =rad_bot(1,50,'filpro','*RT Todos los Proveedores;Opciones;Resumen',19,m.i=1)
         ENDIF
         read cycle when last()#27 .and. m.i=1 .and. FILREC=3

         =rad_bot(6,2,'filori','*RT Todos los Remitos;Origen Remito;Origen Pedido',19,m.i=1)
         read cycle when last()#27 .and. m.i=1 .and. FILREC=3

         IF PARAQ .OR. FILFEE=3 .OR. FILPRO=3
            =rad_bot(6,27,'filPec','*RT Todos los Pedidos;Un Pedido',19,m.i=1)
         ELSE
            =rad_bot(6,27,'filPec','*RT Todos los Pedidos;Un Pedido;Resumen',19,m.i=1)
         ENDIF
         read cycle when last()#27 .and. m.i=1 .and. FILREC=3 .AND. FILORI#2

         IF PARAQ .OR. FILFEE=3 .OR. FILPRO=3 .OR. FILPRO=3 .OR. FILPEC=3
            =rad_bot(6,50,'filFPE','*RT Todas las F. Pedido;Entre Fechas',19,m.i=1)
         ELSE
            =rad_bot(6,50,'filFPE','*RT Todas las F. Pedido;Entre Fechas;Resumen',19,m.i=1)
         ENDIF
         read cycle when last()#27 .and. m.i=1 .and. FILREC=3 .AND. FILPEC#2

         =rad_bot(11,2,'filFaf','*RT Todas los Remitos;Facturados;No Facturados',19,m.i=1)
         read cycle when last()#27 .and. m.i=1 .and. FILREC=3 .AND. FILPEC#2

         IF PARAQ .OR. FILFEE=3 .OR. FILPRO=3 .OR. FILPRO=3 .OR. FILPEC=3 .OR. FILFPE=3
            =rad_bot(11,27,'filFAC','*RT Todas las Facturas;Una Factura',19,m.i=1)
         ELSE
            =rad_bot(11,27,'filFAC','*RT Todas las Facturas;Una Factura;Resumen',19,m.i=1)
         ENDIF
         read cycle when last()#27 .and. m.i=1 .and. FILREC=3 .AND. FILPEC#2 .AND. FILFAF#3

         IF PARAQ .OR. FILFEE=3 .OR. FILPRO=3 .OR. FILPRO=3 .OR. FILPEC=3 .OR. FILFPE=3 .OR. FILFAC=3
            =rad_bot(11,50,'filffa','*RT Todas las F. Factura;Entre Fechas',19,m.i=1)
         ELSE
            =rad_bot(11,50,'filffa','*RT Todas las F. Factura;Entre Fechas;Resumen',19,m.i=1)
         ENDIF
         read cycle when ;
         last()#27 .and. ;
         m.i=1 .and. ;
         FILREC=3 .AND. ;
         FILPEC#2 .AND. ;
         FILFAC#2 .AND. ;
         FILFAF#3
ENDIF
         =rad_bot(16,2,'filmer','*RT Toda la Mercader¡a;Opciones',19,m.i=1)
         read cycle when last()#27 .and. m.i=1 .and. conmer .AND. FILREC#2

         =rad_bot(16,50,'filart','*RT Rubro-Subrubro-Modelo;Rubro-Subrubro;Rubro',19,m.i=1)
         read cycle when last()#27 .and. m.i=1 .and. ((FILREC=3 .AND. FILMER#1) .OR. PARAQ)

   ELSE
      EXIT
   endif
next
if lastkey()#27
   store nul TO RESPUESTA
   DO OPREC
   =OPMER()
   @ 4,2 say janname
   *** elige Remito
   if filREC=2
      store 0 to respuesta
      if !empty(busREC())
         IF PORPA
            DO LRECP
         ELSE
            do lRECi
         ENDIF
      ELSE
         STORE 1 TO FILREC
      endif
   ELSE
      if filmer#1
         =qw_mer(14,25,'RE1.articulo')
      endif
      IF FILFee=2
         filfec=2
         HABILITADO[2]=QW_FEC(4,27,'REC.fecharem')
         FILFee=FILFEC
         TTFee="Fecha Remito:"+TTFEC
         QUEFee=QUEFEC
      ENDIF
*
      HABILITADO[3]=QW_PRO(4,50,'REC.PROCOD')
*
      if filori=2
         queori="empty(REC.pedido)"
         ttori="Remitos de Origen Remito"
         store .f. to habilitado[4],habilitado[5]
      else
         if filori=3
            queori="!empty(REC.pedido)"
            ttori="Remitos de Origen Nota de Pedido"
         endif
      endif
 *
      IF FILPEC=2
         IF ELIPEC()
            TTPEC="Pedido N§ "+Pec.pedido+" / Proveedor: "+alltrim(pro.proveedor)
            QUEPEC='REC.PEDIDO="'+PEC.PEDIDO+'" .AND. PEC.PROCOD="'+PRO.PROCOD+'"'
            STORE .F. TO HABILITADO[3],HABILITADO[4],HABILITADO[5]
         ELSE
            FILPEC=1
         ENDIF
      ELSE
         IF FILPEC=3
            QUEPEC="!EMPTY(REC.PEDIDO)"
         ENDIF
      ENDIF
  *
      IF FILFPE=2
         filfec=2
         HABILITADO[5]=QW_FEC(9,50,'REC.FECHAPED')
         FILFPE=FILFEC
         TTFPE="Fecha Nota de Pedido:"+TTFEC
         QUEFPE=QUEFEC
      ENDIF
*
      if filfaf=2
         quefaf="!empty(REC.factura)"
         ttfaf="Remitos Facturados"
      else
         if filfaf=3
            quefaf="empty(REC.factura)"
         ttfaf="Remitos No Facturados"
           STORE .F. TO HABILITADO[6],HABILITADO[7]
         endif
      endif
*
      IF FILFAC=2
         IF ELIFAR()
            TTFAC="Factura N§ "+FAC.FACTURA+" / Proveedor: "+alltrim(pro.proveedor)
            QUEFAC='REC.FACTURA="'+FAC.FACTURA+'" .AND. FAC.PROCOD="'+PRO.PROCOD+'"'
            STORE .F. TO HABILITADO[3],HABILITADO[6],HABILITADO[7]
         ELSE
            FILFAC=1
         ENDIF
      ELSE
         IF FILFAC=3
            QUEFAC="!EMPTY(REC.FACTURA)"
         ENDIF
      ENDIF
*
      IF FILffa=2
         filfec=2
         HABILITADO[7]=QW_FEC(14,2,'REC.FECHAFAC')
         FILffa=FILFEC
         TTffa="Fecha Factura:"+TTFEC
         QUEffa=QUEFEC
      ENDIF
*
      FISC=''
      FISC=qw_FISC(FISC,quepro)
      FISC=qw_FISC(FISC,quefeE)
      FISC=qw_FISC(FISC,queori)
      FISC=qw_FISC(FISC,quePEC)
      FISC=qw_FISC(FISC,quefPe)
      FISC=qw_FISC(FISC,quefaf)
      FISC=qw_FISC(FISC,queMer)
      FISC=IIF(EMPTY(FISC),'.T.',FISC)
      store "Resumen por " to ressu
      ttpro=iif(filpro=3,RESSU+'Proveedor',ttpro)
      ttfee=iif(filfee=3,RESSU+'Fecha de Remito',ttfee)
      ttpec=iif(filPeC=3,RESSU+'Nota de Pedido',ttpec)
      ttfPe=iif(filfPe=3,RESSU+'Fecha de Nota de Pedido',ttfpe)
      ttFAc=iif(filFAc=3,RESSU+'Factura',ttfac)
      ttfFA=iif(filfFA=3,RESSU+'Fecha de Factura',ttffa)
      TTQUE=QW_TT(TTREC)+QW_TT(TTpro)+QW_TT(TTfee)+QW_TT(TTori)+qw_tt(ttpec)+qw_tt(ttfpe)+qw_tt(ttfaf)+qw_tt(ttfac)+qw_tt(ttffa)
      IF FILFEE=3 .OR. FILPRO=3 .OR. FILPEC=3 .OR. FILFPE=3 .OR. FILFFA=3
         CANT_MAX=2
         DIME TEXTO[2,3],variable[2]
         store .t. to variable
         TEXTO[2,1]='CANTIDAD'
         TEXTO[2,2]=10
         texto[2,3]="TOTAL"
         TT='Listado de Remitos'+ttque
         sele REC
         IF FILFEE=3 .OR. FILFPE=3 .OR. FILFFA=3
            TEXTO[1,1]='FECHA'
            TEXTO[1,2]=8
            texto[1,3]="eltexto"
            Q_CAMPOS=IIF(FILFPE=3,"REC.FECHAPED",IIF(FILffa=3,"REC.FECHAfac","REC.FECHAREM"))
            IF PORPAN
               DO LRESP WITH "LRECPR","REC",Q_CAMPOS,Q_CAMPOS,Q_CAMPOS,'"|"+STR(GTOTAL)+"|"'
            ELSE
               DO LRESI WITH "LRECIR","REC",Q_CAMPOS,Q_CAMPOS,Q_CAMPOS,'"|"+STR(GTOTAL)+"|"'
            ENDIF
         ELSE
            IF FILPRO=3
               SET ORDER TO TAG PROCOD IN PRO
               SET RELA TO PROCOD INTO PRO
               TEXTO[1,1]='PROVEEDOR'
               TEXTO[1,2]=30
               texto[1,3]="eltexto"
               IF PORPAN
                  DO LRESP WITH "LRECPR","REC","PRO.PROVEEDOR","REC.PROCOD","PRO.PROVEEDOR",'"|"+STR(GTOTAL)+"|"'
               ELSE
                  DO LRESI WITH "LRECIR","REC","PRO.PROVEEDOR","REC.PROCOD","PRO.PROVEEDOR",'"|"+STR(GTOTAL)+"|"'
               ENDIF
            ELSE
               IF FILPEC=3
                  SET ORDER TO TAG PROCOD IN PRO
                  SET RELA TO PROCOD INTO PRO
                  TEXTO[2,1]='C. REMITOS'
                  TEXTO[1,1]=PADC("NOTA PEDIDO",14)+PAIP+PADC("PROVEEDOR",30)
                  TEXTO[1,2]=45
                  texto[1,3]="eltexto"
                  IF PORPAN
                     DO LRESP WITH "LRECPR","REC","PRO.PROVEEDOR+REC.PEDIDO",;
                     "PRO.PROVEEDOR+REC.PEDIDO",;
                     "REC.PEDIDO+PAIP+PRO.PROVEEDOR",;
                     '"|"+STR(GTOTAL)+"|"'
                  ELSE
                     DO LRESI WITH "LRECPR","REC","PRO.PROVEEDOR+REC.PEDIDO",;
                     "PRO.PROVEEDOR+REC.PEDIDO",;
                     "REC.PEDIDO+PAIP+PRO.PROVEEDOR",;
                     '"|"+STR(GTOTAL)+"|"'
                  ENDIF
               ENDIF
            ENDIF
         ENDIF
         =REOPREC()
         FILREC=2
      ENDIF
   ENDIF
endif
IF !EMPTY(WONTOP())
   =releWIN('WREC')
ENDIF
RETURN last()#27 .AND. FILREC#2
