function IREM1
DO WHIL .T.
   STOR NUL TO respuesta,TALE
   IF !empty(elimer(" a Ingresar - [ESC] para Salir - [TAB] Repite ",ren,c1)) && OJO
      @ REN,C1 SAY LEFT(MER.ARTICULO,10)
      ELARTI=LEFT(MER.ARTICULO,10)
      LAMERCA=MER.MERCA
      =MOVEWIN(1,4,22,75,'MER',ALLTRIM(MER.MERCA))
      REBL=CUADRO("8 0 15 0 2 20 5 5 5 5 5 5 10")
      @ 1,1 SAY PADC("COLOR",20)
      FOR TAL=1 TO 6
         @ 1,16+TAL*6 SAY 'T. '+ALLTRIM(STR(TAL))
      ENDF
      @ 1,60 SAY 'TOTAL'
      STORE '' TO COLOR
      STORE nul TO PUNTTAL,TOTTALG,CANREAL
      STORE MER.SUELA TO ELCOLOR
      DO WHILE .T.
         STORE NUL TO RESPUESTA
         @ punttal+3,1 GET ELCOLOR PICT '!!' MESS 'COLOR DE '+LAMERCA
         READ
         IF XSEEK(ELCOLOR,'MIX','SUECOD')
            IF XSEEK(ELARTI+'/'+ELCOLOR+'  ','MER','ARTICULO')
               @ PUNTTAL+3,1 SAY MIX.TEXTO2
               PUNTTAL=PUNTTAL+1
               DIME TALE[PUNTTAL,7]
               TALE[PUNTTAL,7]=ELCOLOR
               @ punttal+2,1 say MIX.TEXTO1
               FOR TAL=1 TO 6
                  STOR NUL TO TALE[PUNTTAL,TAL]
                  @ PUNTTAL+2,16+TAL*6 GET TALE[PUNTTAL,TAL] PICT '99999'
               ENDF
               READ
               IF LAST()#27
                  STORE NUL TO TOTTAL
                  FOR TAL=1 TO 6
                     IF TALE[PUNTTAL,TAL]>0
                        TOTTAL=TOTTAL+TALE[PUNTTAL,TAL]
                        CANREAL=CANREAL+1
                     ELSE
                        STORE NUL TO TALE[PUNTTAL,TAL]
                     ENDIF
                  ENDFOR
                  IF TOTTAL>0
                     @ PUNTTAL+2,62 SAY TOTTAL PICT '999999'
                     TOTTALG=TOTTALG+TOTTAL
                  ELSE
                     @ PUNTTAL+2,NUL SAY REBL
                     PUNTTAL=PUNTTAL-1
                  ENDIF
               ELSE
                  @ PUNTTAL+2,NUL SAY REBL
                  PUNTTAL=PUNTTAL-1
               ENDIF
            ELSE
               =MEN_LIN("NO EXISTE ARTICULO DE ESE COLOR")
            endif
         ELSE
            IF LAST()=27
               EXIT
            ENDIF
            =MEN_LIN("NO EXISTE COLOR")
         ENDIF
         STORE '  ' TO ELCOLOR
      ENDDO
      IF !EMPTY(PUNTTAL)
         CX=16
         @ CX,1 SAY 'CANTIDAD DE ARTICULOS:'
         @ CX,30 GET TOTTALG
         @ CX+1,1 SAY 'PRECIO:'
         store PORCEN(MER.COSTO,IIF(M.CLIPRE=1,MER.precio1,IIF(M.CLIPRE=2,MER.precio2,IIF(M.CLIPRE=3,MER.precio3,MER.precio4)))) to unix,unitario
         @ CX+1,30 GET UNITARIO PICT '9999999.99' mess 'Precio Unitario - [ESC] para anular'
         CLEA GETS
         store 0 to descu
         RELE WIND MER
         IF !EMPTY(PUNTTAL)
            @ REN,C1 SAY ELARTI
            @ REN,C2 SAY LEFT(MER.MERCA,23)
            @ REN,C4 SAY TOTTALG PICT '999999'
            FINAL=ROUND(UNITARIO,2)
            @ REN,C5 SAY final PICT "99999999.99"
            PARCIAL=FINAL*TOTTALG
            @ REN,C6 SAY PARCIAL PICT PICU
            IF CONFIRM1 ('Los Datos Ingresados',.T.,20,30)
               =MEN_LIN("ESPERE POR FAVOR")
               PRETOT=PRETOT+PARCIAL
               CANART=CANART+TOTTAL
               @ 8,C6 SAY PRETOT PICT PICU
               @ 8,C4 SAY CANART PICT '99999999'
               DIME FAXT[CANREAL+PUNTERO,11]
               FOR A=1 TO PUNTTAL
                  for b=1 to 6
                     if !empty(tale[a,b])
                        puntero=puntero+1
                        FAXT[PUNTERO,1]=NADREM
                        FAXT[PUNTERO,2]=1
												FAXT[PUNTERO,3]=.F.
                        FAXT[PUNTERO,4]=elarti+'/'+tale[a,7]+zero(b*10,3)
												FAXT[PUNTERO,5]=NUL
												FAXT[PUNTERO,6]=NUL
                        faxt[puntero,7]=B
												FAXT[PUNTERO,8]=TALE[A,B]
                        faxt[puntero,9]=tale[a,7]
                        =repuse1(@faxt,puntero,10)
                     endif
                  endfor
               ENDFOR
               REN=REN+1
               IF REN>22
                  =CUADRO("4 7 23 0 1 16 34 11 14")
                  @ 8,1 SAY "ARTICULO"
                  @ 8,18 SAY "MERCADERIA"
                  @ 8,36 SAY "TAL/CUR"
                  @ 8,44 SAY "CANTIDAD"
                  @ 8,53 SAY "PRECIO UNI."
                  @ 8,C6 SAY PRETOT PICT PICU
                  REN=10
               ENDIF
            ENDIF
         ELSE
            =RELEWIN("MER")
         ENDIF
      ELSE
         =RELEWIN('MER')
      ENDIF
   ELSE
      IF LAST()=27
         EXIT
      ELSE
         @ ren,nul SAY REBLA
      ENDIF
   ENDIF
ENDD
return .t.
