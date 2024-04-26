*****************************************************************************
*-- Programa: IMER.PRG
*-- Fecha   : 06/13/91
*-- Version : G. REINER
*-- Notas   : INGRESA MERCADERIA
*-- Modificaci¢n GOYO 07-23-92 01:11am marca -> empresa
********************************************************************************
parameter decual
ULPR=HORA_ULP(PROGRAM())
if CHEQSEG()
   stor !decual to repite
   sele mer
   set order to TAG ARTICULO
   stor " Ingreso Mercader¡a - " to me1
   stor 23 to col
   stor 16 to col1
   define window win1 from 5,col1 to 15,70 titl " Descripci¢n Completa " shad color sche 8
   stor nul to kok
   do whil .t.
      stor nul to nada
      stor space(9) to nada1,nada2
      =win0()
      clea
      if !repite
         scat memv blan
         do mmer with .f.
      else
      sele mer
         scat memv
         do mmer with .t.
         m.rubro=zero(m.rubro,3)
         m.subrubro=zero(m.subrubro,3)
      endif
      @ 2,55 get m.articulo
      clear gets
      if !repite
         stor NUL to respuesta
         m.rubro=iif(empty(elirub(" del Producto",2,col)),'',zero(rub.codrub,3))
         if !empty(m.rubro)
            nada=rub.rubro
            acti wind win
            @ 1,col1 get nada
            clear gets
            stor 0 to respuesta
            m.subrubro=iif(empty(elisru1(" del Producto",2,col,val(m.rubro))),"",zero(rub.codsrub,3))
            if !empty(m.subrubro)
               nada=rub.rubro
               acti wind win
               @ 2,col1 get nada
               clear gets
               @ 3,col1 get m.modelo pict '@!' mess me1+'[ESC] para Finalizar'
               read
               if lastkey()#27 .and. !empty(m.modelo)
                  m.articulo=m.rubro+'.'+m.subrubro+'.'+alltrim(m.modelo)
                  @ 2,55 get m.articulo
                  clea gets
                  sele mer
                  @ 5,col1 get m.merca pict '@!' mess me1+' Denominacion Comercial - [ESC] Para Men£'
                  read
                  if lastkey()#27 .and. !empty(m.merca)
                     set dele off
                     set order to TAG ARTICULO
                     seek m.articulo
                     set dele on
                     acti scre
                     if found()
                        @ 24,nul say padc('Mercader¡a '+alltrim(m.articulo)+ten,80) colo sche 19
                        acti wind win
                        do existe with ' MERCADERIA'
                        =inkey(0)
                        clea
                     else
                        acti wind win
                        stor nul to respuesta
                        m.marca=iif(empty(elimar(" del Producto",7,col1)),"",left(mi1.texto2,2))
                        if !empty(m.marca)
                           acti wind win
                           nada=mi1.texto1
                           acti wind win
                           sele mer
                           @ 7,col1 get nada
                           clea gets
                           @ 8,col1 get m.medidas pict "@!" mess me1+"Medidas del Producto"
                           read
                           *** PROVEEDORES
                           rele nada
                           dime nada[3]
                           stor "" to nada
                           for a=1 to 3
                              do while .t.
                                 stor nul to respuesta
                                 nada[a]=iif(empty(elipro(" del Producto",9+a,col)),"",pro.procod)
                                 acti wind win
                                 if a#1 .or. !empty(nada[a])
                                    if !empty(nada[A])
                                       nada1=pro.proveedor
                                       @ 9+a,col get nada1
                                       clea gets
                                    endif
                                    exit
                                 endif
                              enddo
                              if a#1 .and. empty(nada[a])
                                 exit
                              endif
                           endfor
                           m.pro1=nada[1]
                           m.pro2=iif(nada[1]#nada[2],nada[2],'')
                           m.pro3=iif(!empty(nada[3]) .and. nada[3]#nada[2] .and. nada[3]#nada[1],nada[3],'')
                           rele nada
                           *** CARACTERISTICAS
                           rele nada
                           dime nada[3]
                           stor "" to nada
                           for a=1 to 3
                              do while .t.
                                 stor nul to respuesta
                                 nada[a]=iif(empty(elicar(" del Producto",13+a,col)),"",left(mi1.texto2,2))
                                 acti wind win
                                 if a#1 .or. !empty(nada[a])
                                    if !empty(nada[A])
                                       nada1=mi1.texto1
                                       @ 13+a,col get nada1
                                       clea gets
                                    endif
                                    exit
                                 endif
                              enddo
                              if a#1 .and. empty(nada[a])
                                 exit
                              endif
                           endfor
                           m.car1=nada[1]
                           m.car2=iif(nada[1]#nada[2],nada[2],'')
                           m.car3=iif(!empty(nada[3]) .and. nada[3]#nada[2] .and. nada[3]#nada[1],nada[3],'')
                           rele nada
                           *******
                           stor nul to respuesta
                           m.grupo=iif(empty(eligru(" del Producto",18,col)),"",left(mix.texto2,2))
                           acti wind win
                           if !empty(m.grupo)
                              nada=mix.texto1
                              @ 18,col get nada
                              clea gets
                              stor nul to respuesta
                              m.linea=iif(empty(elilin(" del Producto",19,col)),"",left(mix.texto2,2))
                              acti wind win
                              if !empty(m.linea)
                                 nada=mix.texto1
                                 @ 19,col get nada
                                 clea gets
                                 stor nul to respuesta
                                 m.alim=iif(empty(eliali(" del Producto",20,col)),"",left(mi1.texto2,2))
                                 acti wind win
                                 if !empty(m.alim)
                                    nada=mi1.texto1
                                    @ 20,col get nada
                                    clea gets
                                    stor space(15) to nada
                                    @ 21,col get nada pict "@M Primavera,Verano,Oto¤o,Invierno,Todas";
                                       mess "Ingrese la temporada en la que se usa"
                                    read
                                    m.temporada=qtem(nada)
                                    nada1=iif(m.jean,'SI','NO')
                                    stor nul to respuesta
                                    m.color=iif(empty(elicol(" del Producto",22,col)),"",left(mix.texto2,2))
                                    acti wind win
                                    if !empty(m.color)
                                       nada=mix.texto1
                                       @ 22,col get nada
                                       clea gets
                                       @ 23,col get nada1 picture '@M SI,NO' mess 'Es una Prenda del Grupo JEAN ?'
                                       read
                                       m.jean=(m.nada1='SI')
                                       stor " " to nada
                                       if confirma(" los Datos Ingresados",.t.,18,nul)
                                          @ 23,nul say grabando colo sche 19
                                          =flock("mer") .or. flok("mer")
                                          sele mer
                                          appe blan
                                          m.rubro=val(m.rubro)
                                          m.subrubro=val(m.subrubro)
                                          m.enlista=.t.
                                          gath memv
                                          do repuse
                                          registro=str(recno())
                                          unlo in mer
                                          =lock("mer") .or. lok("mer")
                                          acti wind win
                                          @ 23,nul say padc("[TAB] para Grabar - [ESC] para Anular",80)
                                          on key label tab keyboard chr(23)
                                          MODI MEMO merca1 WINDOW win1
                                          DEAC WIND win1
                                          ON KEY LABEL TAB
                                          unlo in mer
                                          stor 'NO' to respuesta
                                          repite=(pregunta("Repite Producto ? ",.t.,18,nul,'@M NO,SI')='SI')
                                       endif
                                    endif
                                 endif
                              endif
                           endif
                        endif
                     endif
                  else
                     exit
                  endif
               endif
            else
               exit
            endif
         else
            exit
         endif
      else
         @ 3,col1 get m.modelo pict '@!' mess me1+'[ESC] para Finalizar'
         read
         if lastkey()#27 .and. !empty(m.modelo)
            m.articulo=m.rubro+'.'+m.subrubro+'.'+alltrim(m.modelo)
            @ 2,55 get m.articulo
            clea gets
            @ 5,col1 get m.merca pict '@!' mess me1+' Denominacion Comercial - [ESC] Para Men£'
            read
            if lastkey()#27 .and. !empty(m.merca)
               set dele off
               set order to TAG ARTICULO
               seek m.articulo
               set dele on
               acti scre
               if found()
                  @ 24,nul say padc('Mercader¡a '+alltrim(m.articulo)+ten,80) colo sche 19
                  acti wind win
                  do existe with ' MERCADERIA'
                  =inkey(0)
                  clea
               else
                  acti wind win
                  if confirma(" los Datos Ingresados",.t.,18,nul)
                     @ 23,nul say grabando colo sche 19
                     =flock("MER") .OR. flok("mer")
                     sele mer
                     appe blan
                     m.rubro=val(m.rubro)
                     m.subrubro=val(m.subrubro)
                     m.enlista=.t.
                     gath memv
                     do repuse
                  endif
                  stor 'NO' to respuesta
                  repite=(pregunta("Repite Producto ? ",.t.,18,nul,'@M NO,SI')='SI')
               endif
            endif
         endif
      endif
      if !decual
         exit
      endif
   enddo
   if !empty(kok)
      =iaud(iif(decual,'ING ','REPITE ')+alltrim(str(kok))+' Productos')
   endif
   =relewin("WIN")
else
   =IAUDI()
endif
DEAC WIND ALL
return MEN_LIN(BOTOM)
