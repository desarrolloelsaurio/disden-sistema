#DEFINE TEX_EFES " - [F2] Popup - [F3] B£squeda" && TEX_EFES
PROCEDURE IIDES
PARA TIPPO
DEFINE WINDOW IIDES ;
  FROM 3, 2 TO 23,78 ;
  TITLE " Despiece de "+IIF(TIPPO="A","Av¡os ","Telas ") +;
  		alltr(mer.merca)+" "+allt(mix.texto1) ;
  NOFLOAT NOCLOSE SHADOW NOMINIMIZE 
ACTIVATE WINDOW IIDES
STORE RECNO() TO FF
M.ARTAN=M.ARTICULO
SCAT MEMVAR
M.ARTICULO=M.ARTAN
CANT_TAL=(XATALMAX-XATALMIN+1)*XATALSTEP
DIME TLL[CANT_TAL]
REBLA=CUADRO("5 0 17 0 1 29 5 17 9 8")
@ 1,2 SAY TELLA+" - "+ABIO
@ 1,31 SAY "POSIC"
@ 1,41 SAY "TALLES"
@ 1,55 SAY "CANTIDAD"
@ 1,66 SAY "UNIDAD"
REN=3
DO WHILE .T.
   IF LASTKEY()#27
      STORE 0 TO RESPUESTA
      STORE .F. TO SIGUE
      STORE SPACE(20) TO M.AVI,M.TEL
      IF TIPPO="A"
         @ REN,1 GET m.avi ;
           PICTURE "@!" ;
           WHEN grl_f2("M.AVI","a Ingresar",ren,1,40,"AVIS","AVIO","AVICODPRO","AVIO",ren,1) ;
           MESSAGE "C¢digo del Av¡o seg£n el Proveedor"+tex_efes
         READ
         =OFF_F2()
         IF XSEEK(M.AVI,"AVIS","AVICODPRO")
            M.AVICODPRO=AVIS.AVICODPRO
            M.AVI=M.AVICODPRO
            @ REN,1  SAY LEFT(AVIS.AVIO,29)
            @ REN,65 SAY SAYMIX(AVIS.UNIDAD,"MDDCOD",8)
            STORE .T. TO SIGUE
         ENDIF
      ELSE
         @ REN,1 GET m.TEL ;
           PICTURE "@!" ;
           WHEN grl_f2("M.TEL","a Ingresar",ren,1,40,"TELS","TELA","TELCODPRO","TELA",ren,1) ;
           MESSAGE "C¢digo de la Tela seg£n el Proveedor"+tex_efes
         READ
         =OFF_F2()
         IF XSEEK(M.TEL,"TELS","TELCODPRO")
            M.TELCODPRO=TELS.TELCODPRO
            M.AVI=M.TELCODPRO
            @ REN,1  SAY LEFT(TELS.TELA,29)
            @ REN,65 SAY SAYMIX(TELS.UNIDAD,"MDDCOD",8)
            STORE .T. TO SIGUE
         ENDIF
      ENDIF
      IF SIGUE
         STORE .F. TO SIGUE
         ON KEY LABEL F2 DO DES_EST
         @ REN,32 GET M.PSC PICT '999' ;
           VALID M.PSC>0 .AND. M.PSC=INT(M.PSC) ;
           ERROR "LA POSICION RELACIONADA NO ES CORRECTA" ;
           MESS 'Posici¢n de la Estructura Relacionada - [F2] Ayuda' ;
           DEFA 10
         READ
         ON KEY LABEL F2
         IF LAST()#27
            STORE .F. TO TLL
            IF ELITALL(@TLL)
               NADA=''
               FOR A=1 TO CANT_TAL
                  NADA=NADA+IIF(TLL[A],ALLTRIM(STR(Q_TALL(A)))+'/','')
               NEXT
               @ REN,37 SAY LEFT(NADA, 17)
               @ REN,56 GET m.cantidad pict '999.999';
                 MESS 'Cantidad Utilizada' DEFA 0
               READ
               IF M.CANTIDAD>0
                  IF LAST()#27
                     REN=REN+1
                     SELE DES
                     =MEN_LIN(GRABANDO)
                     FOR A=1 TO CANT_TAL
                        IF TLL[A]
                           M.TALLE=Q_TALL(A)
                           IF M.TIPPO="A"
                              M.TIPO="A"
                              NADA=M.ARTICULO+M.AVICODPRO+STR(M.TALLE)
                              IF !XSEEK(NADA,'DES',"DESPAVI"))
                                 =AGRABAR("DES")
                              ELSE
                                 GATH MEMV
                                 =REPUSE()
                              ENDIF
                           ELSE
                              M.TIPO="M"
                              NADA=M.ARTICULO+M.TELCODPRO+STR(M.TALLE)
                              IF !XSEEK(NADA,'DES',"DESPTEL"))
                                 =AGRABAR("DES")
                              ELSE
                                 GATH MEMV
                                 =REPUSE()
                              ENDIF
                           ENDIF
                        ENDIF
                     NEXT
                     IF REN>16
                        =FOR_SAY(REBLA,3,17,0)
                        REN=3
                     ENDIF
                     STORE .T. TO SIGUE
                  ENDIF                          && CANTIDAD
               ENDIF                             && ELITALL
            ENDIF                                && POSICION
         ENDIF                                   && ELIAVI/ELITEL
      ENDIF
      =IIF(SIGUE, .T. ,FOR_SAY(REBLA,REN,REN,0))
   ELSE
      EXIT
   ENDIF
ENDDO
RETURN MEN_LIN(BOTOM)
