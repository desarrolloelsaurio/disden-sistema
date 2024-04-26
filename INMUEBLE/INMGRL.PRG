*****************************************************************************
*-- Programa: inmgrl.prg
*-- Fecha   : 10-25-92 06:08pm
*-- Version : G. REINER
*-- Notas   : GENERA QUERY PARA LISTADO DE INMUEBLES
*-- Modif. GOYO 10-25-92 06:09pm de QWeryfac a QWmer
*-- Modif. de Tapiplast a Rafuls
********************************************************************************
FUNCTION inmgrl
PARAMETER ELTEXTO,EXTRA_FISC,PALISTAR
ULPR=HORA_ULP(PROGRAM())
=MOVEWIN(1,1,22,79,'win',' Inmuebles -'+eltexto+' ',' [ESC] para Men£ ')
store '' to ttinm,ttuni,ttciu,ttpro,tting,ttest,ttalq,ttven,ttcli,ttgar,ttfin,ttact,ttmon,ttequ,tttip,ttemi
store '.t.' to queinm,queuni,queciu,quepro,queing,queest,quealq,queven,quecli,quegar,quefin,queact,quemon,queequ,quetip,queemi
store 1 to filinm,FILTIP,filciu,filpro,filing,filest,filalq,filven,filcli,filgar,filfin,filact,filmon,filequ,filtip,filemi
**
for m.i=nul to 1
   =rad_bot(1,2,'filinm','*RT Todos los Inmuebles;Un Inmueble;Opciones',19,m.i=1)
   if m.i=1
      read cycle
   endif
   if m.i=0 .or. (m.i=1 .and. filinm=3)
      =rad_bot(1,26,'filequ','*RT Todas las Unidades;Alquiladas;Vac¡as',19,m.i=1)
      read cycle when last()#27 .and. m.i=1 .and. FILINM=3
      =rad_bot(1,52,'FILTIP','*RT Todas lo  t. Unidad;Opciones;Resumen',19,m.i=1)
      read cycle when last()#27 .and. m.i=1 .and. FILINM=3
      =rad_bot(5,2,'filciu','*RT Todas las Ciudades;Opciones;Resumen',19,m.i=1)
      read cycle when last()#27 .and. m.i=1 .and. FILINM=3
      =rad_bot(5,26,'filpro','*RT Todos los Props;Un Propietario;Query',19,m.i=1)
      read cycle when last()#27 .and. m.i=1 .and. FILINM=3
      =rad_bot(5,52,'filing','*RT Todas las F. Ingreso;Una Fecha',19,m.i=1)
      read cycle when last()#27 .and. m.i=1 .and. FILINM=3
      =rad_bot(9,2,'filest','*RT Todos los Estados;Opciones;Resumen',19,m.i=1)
      read cycle when last()#27 .and. m.i=1 .and. FILINM=3
      =rad_bot(9,26,'filalq','*RT Todas las F. Alquiler;Una Fecha',19,m.i=1)
      read cycle when last()#27 .and. m.i=1 .and. FILINM=3
      =rad_bot(9,52,'filven','*RT Todas las F. Pago;Una Fecha',19,m.i=1)
      read cycle when last()#27 .and. m.i=1 .and. FILINM=3
      =rad_bot(13,2,'filpro','*RT Todos los Inquil.;Un Inquilino;Query',19,m.i=1)
      read cycle when last()#27 .and. m.i=1 .and. FILINM=3
      =rad_bot(13,26,'filpro','*RT Todas las Garant¡as;Una Garant¡a;Query',19,m.i=1)
      read cycle when last()#27 .and. m.i=1 .and. FILINM=3
      =rad_bot(13,52,'filfin','*RT Todas las F. Venc. ;Una Fecha',19,m.i=1)
      read cycle when last()#27 .and. m.i=1 .and. FILINM=3
      =rad_bot(17,2,'filact','*RT Todas los C. Actualiz;Un C. Actualiz',19,m.i=1)
      read cycle when last()#27 .and. m.i=1 .and. FILINM=3
      =rad_bot(17,52,'filmon','*RT Todos los Montos;Un Monto',19,m.i=1)
      read cycle when last()#27 .and. m.i=1 .and. FILINM=3
   endif
next
FISC=".T."
if lastkey()#27
   if filinm=1
      store '.T.' TO SALQWMER
   else
      if filinm=2
         store nul to respuesta
         if eliinm("",-1,1)
            SALQWMER='.t.'
         else
            salqwmer='.F.'
         endif
      else
         IF FILEQU=2
            QUEEQU="!EMPTY(INM.CODCL)"
            TTEQU='Inmuebles Alquilados'
         ELSE
            IF FILEQU=2
               QUEEQU="EMPTY(INM.CODCL)"
               TTEQU='Inmuebles Vac¡os'
            endif
         endif
         * tipo de Unidad
         HABILITADO[2]=qw_tip(4,52,'inm.tipounid')
         * localidad
         HABILITADO[4]=QW_CIU('INM.LOCALIDAD')
         * propietario
         *ABILITADO[5]=QW_PRO('INM.PROCOD')
         * Estado
         HABILITADO[1]=qw_est('inm.estado')
         * fecha de emision
         IF M.FILEMI=1
            HABILITADO[8]=.T.
            FISC=""
         ELSE
            HABILITADO[8]=.F.
            FISC=IIF(M.FILEMI=2,"","!")+"EMITE"
            TTEMI="Inmuebles "+iif(m.filemi=2,"","NO ")+"Autorizados"
         ENDIF
         RESSU='Resumen por '
         FISC=QW_FISC(FISC,QUETIP)
         FISC=QW_FISC(FISC,QUECIU)
         FISC=QW_FISC(FISC,QUEest)
         FISC=IIF(EMPTY(FISC),'.T.',FISC)
         SALQWMER=FISC
         tttip=iif(filtip=3,ressu+'Tipo de Unidad',tttip)
         ttciu=iif(filciu=3,ressu+'Localidad',ttciu)
         ttest=iif(filest=3,ressu+'Estado',ttest)
         TTQUE=QW_TT(ttinm)+QW_TT(tttip)+QW_TT(TTCIU)+QW_TT(TTEST)
      endif
   endif
   if m.palistar
      if filtip=3
         salqwmer='.f.'
         CANT_MAX=2
         DIME TEXTO[2,3]
         TEXTO[1,1]='TIPO DE UNIDAD'
         TEXTO[1,2]=20
         texto[1,3]="eltexto"
         TEXTO[2,1]='CANTIDAD'
         TEXTO[2,2]=10
         texto[2,3]="TOTAL"
         TT='Listado de Inmuebles'+chr(13)+chr(10)+ttque
         SELE MIX
         set order to tag tipcod in mix
         sele inm
         set rela to tipounid into mix
         DO LRESP WITH "LINMPR","INM","MIX.TEXTO1","INM.TIPOUNID","MIX.TEXTO1",'"|"+STR(GTOTAL)+"|"'
         =REOPINM()
      ELSE
         IF filCIU=3
            salqwmer='.f.'
            CANT_MAX=2
            DIME TEXTO[2,3]
            TEXTO[1,1]='CIUDAD'
            TEXTO[1,2]=20
            texto[1,3]="eltexto"
            TEXTO[2,1]='CANTIDAD'
            TEXTO[2,2]=10
            texto[2,3]="TOTAL"
            TT='Listado de Inmuebles'+ttque
            SELE MIX
            set order to tag ciucod in mix
            sele inm
            set rela to LOCALIDAD into mix
            DO LRESP WITH "LINMPR","INM","MIX.TEXTO1","INM.localidad","MIX.TEXTO1",'"|"+STR(GTOTAL)+"|"'
            =REOPINM()
         ELSE
            IF filEST=3
               salqwmer='.f.'
               CANT_MAX=2
               DIME TEXTO[2,3]
               TEXTO[1,1]='ESTADO'
               TEXTO[1,2]=20
               texto[1,3]="eltexto"
               TEXTO[2,1]='CANTIDAD'
               TEXTO[2,2]=10
               texto[2,3]="TOTAL"
               TT='Listado de Inmuebles'+ttque
               SELE MIX
               set order to tag ESTcod in mix
               sele inm
               set rela to ESTADO into mix
               DO LRESP WITH "LINMPR","INM","MIX.TEXTO1","INM.ESTADO","MIX.TEXTO1",'"|"+STR(GTOTAL)+"|"'
               =REOPINM()
            ENDIF
         ENDIF
      endif
   endif
ENDIF
IF !EMPTY(WONTOP()) 
   =releWIN('win')
ENDIF
RETURN SALQWMER
