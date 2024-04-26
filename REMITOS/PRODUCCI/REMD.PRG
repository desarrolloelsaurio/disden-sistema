************************************************************
*-- Programa: REMD.PRG
*-- Fecha   : 07/05/91 04:18pm
*-- Version : ELINA BANALOTTI (de ventas)
*-- Notas   : GENERACION REMITO SIN NOTA DE PEDIDO
*-- Modificaci¢n 08/04/92 14:33 GOYO
*-- Adaptacion a Produccion
*-- Modificaci¢n 07-22-92 07:51pm GOYO marca-> empresa
******************************************************************
#DEFINE NUL    0                                 && NUL
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   STOR NUL TO kok
   DO WHILE .T.
      STOR NUL TO numarca,pago,PRETOT,NUmot
      c1=1
      c2=34
      c3=45
      c4=55
      COL=20
      =moveWIN(5,10,11,62,'win'," Emisi¢n de Remitos ")
      @ 1,1 SAY "EMPRESA  " COLO SCHE 3
      @ 2,1 SAY "N§ REMITO" COLO SCHE 3
      @ 3,1 SAY "TALLER  " COLO SCHE 3
      nada=' '
      store nul to montotal,respuesta
      IF !EMPTY(ELIEMP('Del Remito - [ESC] Para salir ',1,COL))
         stor 1 TO numarca
         stor mix.texto1 TO nada
         ACTI WIND win
         @ 1,COL GET nada
         PUNMAR=(numarca-1)*20+20
         GOTO PUNMAR IN DOC
         STOR DOC.NUMERO TO nurem,nuremi
         CLEAR GETS
         @ 2,COL GET nurem
         READ
         IF LASTKEY()#27 .AND. !EMPTY(NUREM)
            ELR=Q_FAC(" 0000-"+ALLTRIM(STR(NUREM)))
            IF !XSEEK(ELR,'REM','REMITO')
            store nurem to m.nuremi
            m.remito=ELR
            respuesta=NUL
            IF EMPTY(eliTAL('Del Remito - [ESC] Para salir ',3,COL))
               EXIT
            ENDI
            stor tal.talcod to m.taller
            stor TAL.TALLERES TO nada
            ACTI WIND win
            @ 3,COL GET nada
            CLEAR GETS
            IF CONFIRM1(" los Datos Ingresados",.T.,10,NUL)
               casos=NUL
               =WIN0()
               REBLA=CUADRO("5 6 22 0 1 1 30 10 9 14")
               @ 7,C1+2 SAY PADC(ALLTRIM(TELLA)+'-'+ALLTRIM(ABIO),30)
               @ 7,C2 SAY PADC("UNIDAD",10)
               @ 7,C3 SAY PADC("CANTIDAD",9)
               @ 7,C4 SAY PADC("MONTO",14)
               nada4=TAL.LOCALIDAD
               @ 1,4 SAY ALLTRIM(TAL.TALLERES)
               @ 2,nul SAY TAL.domicilio
               @ 3,nul SAY nada4
               @ 1,45 SAY 'REMITO N§: '+ ELR
               @ 2,45 SAY 'EMPRESA:'+ALLTRIM(mix.texto1)
               @ 5,45 SAY 'FECHA' COLO SCHE 3
               fechaop=date()
               @ 5,NUL SAY 'N§ O. Fab:'
               @ 5,10 GET NUmot;
                 MESS 'N§ de Orden de Fabricaci¢n'
               @ 5,51 GET m.fechaop;
                 MESS ' Confirme fecha de Emisi¢n - [ESC] para salir '
               READ
               IF LAST()#27
                  puntero=1
                  ren=9
                  dime qt[2]
                  qt[1]=abios
                  qt[2]=tellas
                  do while .t.
                     IF REN>21
                     FOR DDR=9 TO 21
                           @ DDR,NUL say rebla
                     NEXT
                        REN=9
                     ENDIF
                     dime rexito[puntero,4]
                     rexito[puntero,1]=ELR
                     store 1 to respuesta
                     rexito[puntero,2]=qt[pop_list(ren,c1,@qt,'Tipo de Producto a Remitir',.t.)]
                     if last()#27
                        @ ren,c1 say left(rexito[puntero,2],1)
                        salida=iif(rexito[puntero,2]='A',eliaviS("a Remitir",ren,c2),elitelS("a Remitir",ren,c2))
                        if !empty(salida)
                           rexito[puntero,3]=iif(rexito[puntero,2]='A',AVIS.avicodpro,TELS.telcodpro)
                           @ ren,c1+2 say iif(rexito[puntero,2]='A',AVIS.avio,TELS.tela)
                           @ REN,C2 SAY SAYMIX(iif(rexito[puntero,2]='A',AVIS.unidad,TELS.unidad),"MDDCOD",10)
                           store 0 to rexito[puntero,4]
                           @ ren,c3 get rexito[puntero,4] pict '999999.99'
                           read
                           if !empty(rexito[puntero,4]) .and. last()#27
                              if confirm1("los datos ingresados",.t.,10,NUL)
                                 PARCIAL=MONTO*REXITO[PUNTERO,4]
                                 MONTOTAL=MONTOTAL+PARCIAL
                                 @ REN,C4 SAY PARCIAL pict '99,999,999.99'
                                 ren=ren+1
                                 puntero=puntero+1
                              else
                                 @ ren,NUL say rebla
                              endif
                           else
                              @ ren,NUL say rebla
                           endif
                        else
                           @ ren,NUL say rebla
                        endif
                     else
                        if puntero>1
                           if confirm1("el Remito",.t.,10,NUL)
                              =AGRABAR("REM")
                              dime rexito[puntero-1,4]
                              =AGRABAR("REX",@REXITO)
                              =lock() .or. lok(str(recno("doc")),"doc")
                              repl DOC.NUMERO with m.NUREM+1
                              unlo in doc
                              SET ORDER TO TAG AVICODPRO IN avis
                              SET ORDER TO TAG TELCODPRO IN tels
                              for a=1 to puntero-1
                                 if rexito[a,2]='A'
                                    sele aviS
                                    =seek(rexito[a,3])
                                    xun=AVIS.unidad
                                    =loCk(str(recno()),"avis") .or. lok(str(recno()),"avis")
                                    repl stock with stock-rexito[a,4]
                                    unlo in aviS
                                 else
                                    sele tels
                                    =seek(rexito[a,3])
                                    xun=TELS.unidad
                                    =loCk(str(recno()),"tels") .or. lok(str(recno()),"tels")
                                    repl stock with stock-rexito[a,4]
                                    unlo in tels
                                 endif
                                 sele kar
                                 =flock() .or. flok("kar")
                                 appe blan
                                 repl fechaop with m.fechaop
                                 repl tipo with rexito[a,2]
                                 repl articulo with rexito[a,3]
                                 repl unidad with xun
                                 repl taller with m.taller
                                 repl detalle with 'Rem '+ELR
                                 repl salida with rexito[a,4]
                                 repl opk with 'RD'
                                 repl numero with numot
                                 unlo in kar
                              endf
						IF IMPRIME("EL REMITO",.T.,10,10)
                              do lremi
						ENDIF
                           ENDIF
                        endif
                        exit
                     endif
                  enddo
               ENDIF
            ELSE
               sigue=.F.
               EXIT
            ENDI
            ELSE
            =CARTEL("EL REMITO "+ELR,'EXISTE','IMPOSIBLE GENERARLO NUEVAMENTE','POR FAVOR REINTENTE')
            EXIT
            ENDIF
         ELSE
            EXIT
         ENDI
      ELSE
         EXIT
         DEAC WIND WIN
      ENDI
   ENDDO
ELSE
   =iaudi()
ENDI
DEAC WIND ALL
RETURN
