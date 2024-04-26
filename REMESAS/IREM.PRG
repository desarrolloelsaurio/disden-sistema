********************************************************************************
*-- Programa: IREM.PRG
*-- Fecha   : 12/14/91
*-- Version : V.LEEGSTRA
*-- Notas   : INGRESA REMESA
*-- Modificaci¢n GOYO 12-29-92 10:39am
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   =movewin(0,nul,23,79,'win'," Ingreso Remesa ")
   rebla=cuadro("6 3 21 0 1 19 20 10 6 7 10 ")
   @ 4,1 SAY "MERCADERIA"
   @ 4,21 SAY "OBSERVACIONES"
   @ 4,42 SAY "TIPO DE"
   @ 4,53 SAY "CANTI."
   @ 4,60 SAY "Kg. por"
   @ 4,68 SAY "PESO TOTAL"
   @ 5,42 SAY "ENVASE "
   @ 5,53 SAY "BULTOS"
   @ 5,60 SAY " BULTO "
   c1=1
   c2=21
   c3=42
   c4=53
   c5=60
   c6=68
   @ 1,1  SAY "Proveedor:"
   @ 2,1  SAY "N§ Remesa:"
   @ 1,45 SAY "Zona :"
   @ 2,45  SAY "Fecha:"
   stor " Ingreso Mercader¡a - " to me1
   stor nul to kok,respuesta
   sele pro
   set order to 1
   naprove=iif(empty(elipro(" de la Remesa - [ESC] para Salir ",1,12)),nul,pro.procod)
   if !empty(naprove) .and. lastkey()#27
      registro=str(recno())
      acti wind win
      m.NAREMES=pro.remesa+1
      @ 1,12 get pro.proveedor
      clea gets
      @ 2,12 get m.NAREMES
      read
      if !EMPTY(m.NAREMES) .AND. !xseek(pro.procod+str(m.NAREMES),"rem","remesa")
         stor nul to respuesta
         SELE MIX
         SET ORDER TO TAG ZONTEX
         GO TOP
         nazona=iif(empty(elizon(" de la Remesa - [ESC] para Salir ",1,51)),nul,left(mix.texto2,2))
         if !empty(nazona) .and. lastkey()#27
            acti wind win
            nada=mix.texto1
            @ 1,52 get nada
            clea gets
            nafecha=date()
            @ 2,52 get nafecha
            READ
            ren=7
            stor 0 to natobul
            do whil .t.
               @ ren,nul say rebla
               sele REM
               scat memv blan
               m.proveedor=naprove
               m.remesa=m.NAREMES
               m.zona=nazona
               m.fechaop=nafecha
               stor space(17) to nada
               acti wind win
               @ ren,c1 get nada
               clear gets
               SELE MER
               stor nul to respuesta
               napalpo=iif(empty(elimer(" de la Remesa - [ESC] para Salir ",ren,c1,.F.)),nul,left(SINESP1(mer.palpopup),19))
               IF LAST()#27
                  if !empty(napalpo)
                     stor mer.rubro+mer.variedad+mer.calidad to M.MERCA
                     sele mer
                     @ ren,c1 get napalpo
                     clear gets
                     @ ren,c2 get m.tamano picture x20 mess "Observaciones"
                     read
                     nada=space(10)
                     @ ren,c3 get nada
                     clea gets
                     stor nul to respuesta
                     IF elienv(" del Producto",ren,c3)
                        m.envase=left(mix.texto2,2)
                        nada=LEFT(mix.texto1,10)
                        acti wind win
                        @ ren,c3 get nada
                        clear gets
                        nada=nul
                        @ ren,c4 get nada PICTURE "999999" ;
                          VALID !EMPTY(NADA) ;
                          ERROR "DEBE INGRESAR UNA CANTIDAD" ;
                          mess "Cantidad de Bultos"
                        read
                        IF !EMPTY(NADA)
                           m.bultos=nada
                           nada=nul
                           @ ren,c5 get nada PICTURE "9999.99" ;
                             VALID !EMPTY(NADA) ;
                             ERROR "DEBE INGRESAR UNA CANTIDAD" ;
                             mess "Kg. por Bulto"
                           read
                           IF !EMPTY(NADA)
                              m.kgbulto=nada
                              @ ren,c6 say str(m.bultos*m.kgbulto,10,2)
                              if confirma(" los Datos Ingresados",.t.,20,nul)
                                 KOK=KOK+1
                                 natobul=natobul+m.bultos
                                 DIME FAXT[KOK,13]
                                 FAXT[KOK,1]=PRO.PROCOD
                                 FAXT[KOK,2]=m.NAREMES
                                 FAXT[KOK,3]=NAFECHA
                                 FAXT[KOK,4]=M.MERCA
                                 FAXT[KOK,5]=M.NAZONA
                                 FAXT[KOK,6]=M.TAMANO
                                 FAXT[KOK,7]=M.ENVASE
                                 FAXT[KOK,8]=M.BULTOS
                                 FAXT[KOK,9]=M.KGBULTO
                                 FAXT[KOK,10]=0
                                 FAXT[KOK,11]=' '
                                 FAXT[KOK,12]=DATE()
                                 FAXT[KOK,13]=USADOR
                                 ren=iif(ren<20,ren+1,7)
                              endif
                           ENDIF
                        ENDIF
                     ENDIF
                  ELSE
                     =CARTEL("ESA MERCADERIA YA HA SIDO INGRESADA",;
                       "POR FAVOR VERIFIQUE",;
                       "EN CASO DE SER NECESARIO",;
                       "BORRE TODA LA REMESA E INGRESELA NUEVAMENTE")
                  ENDIF
               ELSE
                  EXIT
               ENDIF
            enddo
            IF !EMPTY(KOK) .AND. confirma(" la Remesa Ingresada",.t.,20,nul)
               =AGRABAR("REM",@FAXT)
               M.opk="01"
               M.docref="RE"
               M.nrodocref=m.remesa
               M.cliente=PRO.PROCOD
               M.remesa=m.NAREMES
               sele mex
               set order to tag merca
               FOR A=1 TO ALEN(FAXT,1)
                  SELE MEX
                  COSA=FAXT[A,4]+FAXT[A,1]+STR(FAXT[A,2])
                  if !seek(COSA)
                     =flock('mex') .or. flok("mex")
                     appe blan
                     REPL articulo with FAXT[A,4]
                     REPL proveedor with FAXT[A,1]
                     REPL remesa with FAXT[A,2]
                     unlo in mex
                  endif
                  SELE KAR
                  =flock('kar') .or. flok("kar")
                  sele kar
                  =XSEEK(FAXT[A,4],'MER','MERCA')
                  M.detalle="ING. "+LEFT(MER.PALPOPUP,10)
                  M.proveedor=.T.
                  M.FECHAOP=FAXT[A,3]
                  M.ARTICULO=FAXT[A,4]
                  M.entrada=FAXT[A,8]
                  M.kilos=FAXT[A,9]
                  =AGRABAR("KAR")
               NEXT
               acti wind win
               =cartel2('Total de Bultos','',str(natobul,10,2),'')
               =lock(registro,'pro') .or. lok("pro")
               sele pro
               goto val(registro)
               repl pro.remesa with m.NAREMES
               do repuse
               unlo in pro
               =iaud(ALLTRIM(PRO.PROCOD)+"/"+ALLTRIM(STR(m.NAREMES))+"/"+PRO.PROVEEDOR)
            ENDIF
         endif
      else
         =cartel("LA REMESA EXISTE",;
           "SI DESEA CORREGIRLA",;
           "DEBERA BORRARLA",;
           "Y LUEGO INGRESARLA NUEVAMENTE POR COMPLETO")
      ENDIF
   ENDIF
   =RELEWIN("WIN")
else
   =iaudi()
endif
=men_lin(botom)
return
