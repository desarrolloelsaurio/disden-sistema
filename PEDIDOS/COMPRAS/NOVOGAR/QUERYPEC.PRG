********************************************************************************
*-- Programa: QUERYPEC.PRG
*-- Fecha   : 08-27-92 05:47pm
*-- Version : G. REINER
*-- Notas   : GENERA QUERY PARA LISTADO DE NOTAS DE PEDIDO DE COMPRA
*-- Version NOVOGAR
********************************************************************************
FUNCTION QUERYPEC
parameter porpa,conmer,PARAQ
EXTERNAL ARRAY HABILITADO
=MOVEWIN(5,1,22,79,'WPEC',' L¡mites del Listado de Notas de Pedido de Compra - [ESC] para Men£ ')
store '' to ttemp,ttpec,ttpro,ttfee,ttvia,ttpag,ttmon,ttmer,ttrec,ttfre,ttfpr,ttfec && que se lista
store '.T.' to queemp,quepec,quepro,quefee,quevia,quepag,quemon,quemer,querec,quefre,quefpr,quefec && que se lista
store 1 to filemp,filpec,filpro,filfee,filvia,filpag,filmon,filmer,FILART,filrec,filfre,filfpr,filfec
***
for m.i=nul to 1
   =rad_bot(1,2,'filpec','*RT Todos los Pedidos;Una Nota;Opciones',19,m.i=1)
   if m.i=1
      read cycle
   endif
      if last()#27 .or. (last()=27 .and. m.i=0)
      IF FILPEC=3 .OR. M.I=0
         IF PARAQ
            =rad_bot(1,27,'filfee','*RT Todas las Fechas;Entre Fechas',19,m.i=1)
         ELSE
            =rad_bot(1,27,'filfee','*RT Todas las Fechas;Entre Fechas;Res£men',19,m.i=1)
         ENDIF
         read cycle when last()#27 .and. m.i=1 .and. FILPEC=3
         IF PARAQ .OR. FILFEE=3
            =rad_bot(1,50,'filpro','*RT Todos los Proveedores;Opciones',19,m.i=1)
         ELSE
            =rad_bot(1,50,'filpro','*RT Todos los Proveedores;Opciones;Resumen',19,m.i=1)
         ENDIF
         read cycle when last()#27 .and. m.i=1 .and. FILPEC=3
         IF PARAQ .OR. FILFEE=3 .OR. FILPRO=3
            =rad_bot(6,2,'filpag','*RT Todas las Condic.;Opciones',19,m.i=1)
         ELSE
            =rad_bot(6,2,'filpag','*RT Todas las Condic.;Opciones;Res£men',19,m.i=1)
         ENDIF
         read cycle when last()#27 .and. m.i=1 .and. FILPEC=3
         =rad_bot(6,27,'filrec','*RT Todos los Pedidos;Recibidos;Pendientes',19,m.i=1)
         read cycle when last()#27 .and. m.i=1 .and. FILPEC=3
         IF PARAQ .OR. FILFEE=3 .OR. FILPRO=3 .OR. FILPRO=3
            =rad_bot(6,50,'filFre','*RT Todas las F. Recepci¢n;Entre Fechas',19,m.i=1)
         ELSE
            =rad_bot(6,50,'filFre','*RT Todas las F. Recepci¢n;Entre Fechas;Resumen',19,m.i=1)
         ENDIF
         read cycle when last()#27 .and. m.i=1 .and. FILPEC=3 .and. filrec=2
         IF PARAQ .OR. FILFEE=3 .OR. FILPRO=3 .OR. FILPRO=3 .OR. FILFRE=3
            =rad_bot(11,2,'filFPR','*RT Todas las F. Promesa;Entre Fechas',19,m.i=1)
         ELSE
            =rad_bot(11,2,'filFPR','*RT Todas las F. Promesa;Entre Fechas;Resumen',19,m.i=1)
         ENDIF
         read cycle when last()#27 .and. m.i=1 .and. FILPEC=3
         ENDIF
         =rad_bot(11,27,'filmer','*RT Toda la Mercad.;Opciones',19,m.i=1)
         read cycle when last()#27 .and. m.i=1 .and. conmer .AND. FILPEC#2
         =rad_bot(11,50,'filart','*RT Rubro-Subrubro-Modelo;Rubro-Subrubro;Rubro',19,m.i=1)
         read cycle when last()#27 .and. m.i=1 .and. ((FILPEC=3 .AND. FILMER#1) .OR. PARAQ)
   ELSE
      EXIT
   endif
next
if lastkey()#27
   store nul TO RESPUESTA
   DO OPpec
   =OPMER()
   @ 4,2 say janname
   *** elige pedido
   if filpec=2
      store 0 to respuesta
      if !empty(buspec())
         IF PORPA
            =ZPEC(.T.)
         ELSE
            do lpeci
         ENDIF
      ELSE
         STORE 1 TO FILpec
      endif
   ELSE
      if filmer#1
         =qw_mer(14,25,'PE1.articulo')
      endif
      if filrec=2
         querec="!empty(pec.fechaent)"
         ttrec="Notas de Pedido Recibidas"
      else
         if filrec=3
            querec="empty(pec.fechaent)"
            ttrec="Notas de Pedido Pendientes"
         endif
      endif
      IF FILFee=2
         filfec=2
         HABILITADO[2]=QW_FEC(4,27,'PEC.FECHAEM')
         FILFee=FILFEC
         TTFee="Fecha Emisi¢n:"+TTFEC
         QUEFee=QUEFEC
      ENDIF
      HABILITADO[3]=QW_PRO(4,50,'PEC.PROCOD')
      STORE QW_PAG3(9,2,"PEC.") TO HABILITADO[4],HABILITADO[6],HABILITADO[8]
      IF FILFre=2
         filfec=2
         HABILITADO[10]=QW_FEC(9,50,'PEC.FECHAENT')
         FILFre=FILFEC
         TTFre="Fecha Entrega:"+TTFEC
         QUEFre=QUEFEC
      ENDIF
      IF FILFPR=2
         filfec=2
         HABILITADO[11]=QW_FEC(14,2,'PEC.FECHAprom')
         FILFPR=FILFEC
         TTFPR="Fecha Promesa:"+TTFEC
         QUEFPR=QUEFEC
      ENDIF
      FISC=''
      FISC=qw_fisc(FISC,quepec)
      FISC=qw_FISC(FISC,quepro)
      FISC=qw_FISC(FISC,quefeE)
      FISC=qw_FISC(FISC,querec)
      FISC=qw_FISC(FISC,quefre)
      FISC=qw_FISC(FISC,quefpr)
      FISC=qw_FISC(FISC,quePAG)
      FISC=qw_FISC(FISC,queMer)
      FISC=IIF(EMPTY(FISC),'.T.',FISC)
      store "Resumen por " to ressu
      ttpro=iif(filpro=3,RESSU+'Proveedor',ttpro)
      ttfee=iif(filfee=3,RESSU+'Fecha',ttfee)
      ttPAG=iif(filPAG=3,RESSU+'Condici¢n de Venta',ttPAG)
      ttfre=iif(filfre=3,RESSU+'Fecha de Recepci¢n',ttfre)
      ttfpr=iif(filfpr=3,RESSU+'Fecha de Promesa',ttfpr)
      TTQUE=QW_TT(TTpec)+QW_TT(TTpro)+QW_TT(TTfee)+QW_TT(TTPAG)+QW_TT(TTREC)+QW_TT(TTfre)+QW_TT(TTfpr)+QW_TT(TTMer)
      IF FILFEE=3 .OR. FILPRO=3 .OR. FILPAG=3 .OR. FILFRE=3 .OR. FILFPR=3
         CANT_MAX=2
         DIME TEXTO[2,3],variable[2]
         store .t. to variable
         TEXTO[2,1]='CANTIDAD'
         TEXTO[2,2]=10
         texto[2,3]="TOTAL"
         TT='Listado de Notas de Pedido'+ttque
         sele pec
         IF FILFEE=3 .OR. FILFRE=3 .OR. FILFPR=3
            TEXTO[1,1]='FECHA'
            TEXTO[1,2]=8
            texto[1,3]="eltexto"
            Q_CAMPOS=IIF(FILFRE=3,"PEC.FECHAENT",IIF(FILFPR=3,"PEC.FECHAPROM","PEC.FECHA"))
            IF PORPAN
               DO LRESP WITH "LPECPR","pec",Q_CAMPOS,Q_CAMPOS,Q_CAMPOS,'"|"+STR(GTOTAL)+"|"'
            ELSE
               DO LRESI WITH "LPECIR","pec",Q_CAMPOS,Q_CAMPOS,Q_CAMPOS,'"|"+STR(GTOTAL)+"|"'
            ENDIF
         ELSE
            IF FILPRO=3
               SET ORDER TO TAG PROCOD IN PRO
               SET RELA TO PROCOD INTO PRO
               TEXTO[1,1]='PROVEEDOR'
               TEXTO[1,2]=30
               texto[1,3]="eltexto"
               IF PORPAN
                  DO LRESP WITH "LPECPR","pec","PRO.PROVEEDOR","pec.PROCOD","PRO.PROVEEDOR",'"|"+STR(GTOTAL)+"|"'
               ELSE
                  DO LRESI WITH "LPECIR","pec","PRO.PROVEEDOR","pec.PROCOD","PRO.PROVEEDOR",'"|"+STR(GTOTAL)+"|"'
               ENDIF
            ELSE
               IF FILPAG=3
                  SET ORDER TO TAG PAGCOD IN MIX
                  SET RELA TO CONDPAGO1 INTO MIX
                  TEXTO[1,1]='COND. PAGO 1'
                  TEXTO[1,2]=20
                  texto[1,3]="eltexto"
                  IF PORPAN
                     DO LRESP WITH "LPECPR","pec","MIX.TEXTO1","pec.CONDPAGO1","MIX.TEXTO1",'"|"+STR(GTOTAL)+"|"'
                  ELSE
                     DO LRESI WITH "LPECIR","pec","MIX.TEXTO1","pec.CONDPAGO1","MIX.TEXTO1",'"|"+STR(GTOTAL)+"|"'
                  ENDIF
               ENDIF
            ENDIF
         ENDIF
         =REOPPec()
         FILPEC=2
      ENDIF
   ENDIF
endif
IF !EMPTY(WONTOP())
   =releWIN('WPEC')
ENDIF
RETURN last()#27 .AND. FILPEC#2
