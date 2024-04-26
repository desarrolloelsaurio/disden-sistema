***************************************
*-- PROGRAMA: GREM.PRG
*-- FECHA   : 07/12/91 01:30PM
*-- VERSION : G. REINER
*-- NOTAS   : GENERA REMITO DE TRANSPORTE
*-- DE TELAS Y AVIOS A FABRICAS Y TALLERES
*-- MODIFICACI¢N GOYO 08-03-92 01:48AM
***************************************
#DEFINE ENTERCON "PULSE [ENTER] PARA CONTINUAR"  && ENTERCON
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   IF EMPTY(COR.FECHAFIN)
      IF !EMPTY(COR.FECHAFAB)
         =MCORX(.F.,.T.)
         COL=21
         IF confirma("Generar Remito",.T.,20,0)
            =MOVEWIN(10,10,16,70,"WIN"," GENERA REMITO DE PRODUCCION ")
            @ 1,1 say 'REMITO N§'
            @ 2,1 SAY 'TALLER'
            @ 3,1 SAY 'FECHA'
            SELE DOC
            =FLOCK() .OR. FLOK()
            PUNMAR=20
            GOTO PUNMAR IN DOC
            STOR DOC.NUMERO TO M.nurem,M.nuremi
            UNLO IN DOC
            @ 1,20 get m.nurem
            read
            if last()#27
               ELCOSO=Q_FAC(ALLTRIM(STR(M.NUREM)))
               if !xseek(ELCOSO,"rem","REMITO")
                  sele co1
                  seek cor.numero
                  STORE NUL TO RESPUESTA
                  IF ELITALS("DEL REMITO",-1,1)
                     NADA=PER.CLIENTE
                     @ 2,20 GET NADA
                     CLEA GETS
                     IF CONFIRMA("EL TALLER DE DESTINO",.T.,15,5)
                        @ 3,20 GET LAFECHA MESS 'Fecha del Remito' defa date()
                        read
                        if last()#27 .and. ;
                            !empty(lafecha) .AND. ;
                            CONFIRMA("GENERAR REMITO",.T.,18,10)
                           =men_lin("GENERANDO REMITO - ESPERE POR FAVOR")
                           COSA=LEFT(MER.ARTICULO,11)+CO1.COLOR+'  '+STR(COR.PROCESO+1)
                           SET EXAC OFF
                           SET NEAR ON
                           SELE EST
                           SET ORDER TO TAG HOJARUT
                           SEEK COSA
                           IF LEFT(MER.ARTICULO,11)=LEFT(EST.ARTICULO,11)
                              SELE COR
                              =LOCK() .OR. LOK()
                              REPL COR.PROCESO WITH EST.POSICION
                              UNLO IN COR
                              SET ORDER TO TAG ARTICULO IN DES
                              SELE FAX
                              =FLOCK() .OR. FLOK()
                              APPE BLAN
                              REPL NUMERO WITH COR.NUMERO
                              REPL POSIC WITH COR.PROCESO
                              REPL REMITO WITH Q_FAC(ALLTRIM(STR(M.NUREM)))
                              REPL TIPO WITH "@"
                              REPL PRC WITH EST.PRC
                              REPL TALLER WITH PER.CODCLI
                              =REPUSE()
                              UNLO IN FAX
                              SELE CO1
                              SET ORDER TO TAG NUMERO
                              SEEK(COR.NUMERO)
                              SCAN WHILE CO1.NUMERO=COR.NUMERO
                                 RTCL=LEFT(MER.ARTICULO,11)+CO1.COLOR+'  '
                                 SELE DES
                                 SEEK RTCL
                                 SCAN WHILE ARTICULO=RTCL
                                    IF DES.PSC=COR.PROCESO .AND. DES.TALLE=CO1.TALLE
                                       SELE FAX
                                       =FLOCK() .OR. FLOK()
                                       APPE BLAN
                                       REPL NUMERO WITH COR.NUMERO
                                       REPL COLOR WITH CO1.COLOR
                                       REPL POSIC WITH DES.PSC
                                       REPL REMITO WITH Q_FAC(ALLTRIM(STR(M.NUREM)))
                                       REPL TIPO WITH DES.TIPO
                                       REPL AVI WITH DES.AVI
                                       REPL TALLER WITH PER.CODCLI
                                       REPL TALLE WITH DES.TALLE
                                       REPL CANTIDAD WITH CO1.CANTCOR*(DES.CANTIDAD/DES.FRACCION)
                                       =REPUSE()
                                       UNLO IN FAX
                                    ENDIF
                                    SELE DES
                                 ENDSCAN
                                 SELE CO1
                              ENDSCAN
                           ENDIF
                           SET EXACT ON
                           =men_lin("GENERANDO REMITO - ESPERE POR FAVOR")
                           COSA=Q_FAC(ALLTRIM(STR(M.NUREM)))
                           STORE COSA TO m.REMITO
                           STORE m.lafecha TO m.FECHAOP
                           STORE PER.codCLI TO m.TALLER
                           STORE cor.numero TO m.NUMOT
                           =agrabar("REM")
                           STORE REM.REMITO TO M.ELREMITOK
                           STORE M.NUREM TO m.REMITO
                           SELE FAX
                           SET ORDER TO TAG REMITO
                           =SEEK(COSA)
                           STORE M.COSA TO M.REMITO
                           PUNTERO=1
                           RELE KSA
                           DIME KSA[2]
                           SCAN WHILE FAX.REMITO=cosa
                              IF TIPO#'@'
                                 PTR=ASCAN(KSA,AVI)
                                 IF !EMPTY(PTR)
                                    KSA[PTR+1]=KSA[PTR+1]+CANTIDAD
                                 ELSE
                                    DIME KSA[PUNTERO,7]
                                    KSA[PUNTERO,1]=COSA
                                    KSA[PUNTERO,2]=TIPO
                                    KSA[PUNTERO,3]=AVI
                                    KSA[PUNTERO,4]=CANTIDAD
                                    KSA[PUNTERO,5]=DATE()
                                    KSA[PUNTERO,6]=USADOR
                                    PUNTERO=PUNTERO+1
                                 ENDIF
                              ENDIF
                              SELE FAX
                           ENDSCAN
                           IF PUNTERO#1
                              SELE REX
                              =AGRABAR("REX",@KSA)
                              RELE KSA
                           ENDIF
                           ************
                           **** DAR DE BAJA EN STOCK
                           ***********
                           =PRXAREA(.T.)
                           =CLOSDBF("OCO")
                           IF !OPOCO(COR.NUMERO)
                              WAIT "NO ENCONTRO LA BASE" WIND NOWA
                              =PRXAREA(.T.)
                              LABASE=PATH+"\XC"+ZERO(COR.NUMERO,6)+".DBF"
                              CREATE TABLE (LABASE) (;
                                AVICOD C(10),;
                                AVICODPRO C(20),;
                                CANTIDAD N(12,4),;
                                MEDIDA C(20),;
                                ENVIADA N(12,4),;
                                DESCRIPCIO C(30),;
                                TALLER C(30),;
                                CODCLI C(10),;
                                AVIANT C(20),;
                                TALCOD C(10),;
                                FECHA D,;
                                USUARIO C(10))
                              WAIT "BASE CREADA" WIND NOWA
                              USE
                              =OPOCO(COR.NUMERO)
                           ENDIF
                           SELE REX
                           SET ORDER TO TAG REMITO
                           IF SEEK(M.ELREMITOK)
                              SCAN WHILE REMITO=M.ELREMITOK
                                 ****
                                 * INSERTADO NUEVO PARA REMITOS DE DEPOSITO
                                 *   24 DE MAYO DE 1995.-
                                 ****
                                 ELA=RIGHT(SPACE(10)+ALLTRIM(REX.TELCOD),10)
                                 IF REX.TIPO="A"
                                    SELE AVI
                                    SET ORDER TO TAG AVICOD
                                    SEEK(ELA)
                                    M.AVICOD=ELA
                                    M.CANTIDAD=REX.CANTIDAD
                                    M.MEDIDA=UNID[AVI.UNIDAD]
                                    M.DESCRIPCIO=AVI.AVIOS
                                    =AGRABAR("OCO")
                                    SELE AVI
                                    SET ORDER TO TAG AVICOD
                                 ELSE
                                    SELE TEL
                                    SET ORDER TO TAG TELCOD
                                 ENDIF
                                 IF SEEK(ELA)
                                    REPL STOCK WITH STOCK-REX.CANTIDAD
                                    SELE KAR
                                    M.SALIDA=REX.CANTIDAD
                                    M.TIPO=REX.TIPO
                                    M.ARTICULO=ELA
                                    M.UNIDAD=UNIDAD
                                    M.TALLER=PER.CODCLI
                                    M.OPK="RP"
                                    M.DETALLE="RE N§ "+COSA
                                    M.ENTRADA=0
                                    M.NUMERO=COR.NUMERO
                                    M.PROVEEDOR=""
                                    =AGRABAR("KAR")
                                 ELSE
                                    =CARTEL("POR ALGUNA CAUSA NO SE HA PODIDO EFECTUAR",;
                                      "LA CORRECCION EN EL STOCK DEL ARTICULO "+KSA[PUNTERO-1,3],;
                                      "POR FAVOR, TOME NOTA DEL ERROR Y MODIFIQUELO MANUALMENTE",;
                                      ENTERCON)
                                 ENDIF
                                 SELE REX
                              ENDSCAN
                           ELSE
                              =CARTEL("NO SE HAN PODIDO ENCONTRAR LOS DATOS DEL REMITO Y NO SE HA PODIDO EFECTUAR",;
                                "LA CORRECCION EN EL STOCK TODOS LOS ARTICULOS INVOLUCRADOS",;
                                "POR FAVOR, TOME NOTA DEL ERROR Y MODIFIQUELO MANUALMENTE",;
                                "PULSE [ENTER] PARA CONTINUAR")
                           ENDIF
                           ************
                           *** SACAAR
                           IF GETENV("USERNAME")#"GOYO"
                              SELE DOC
                              =FLOCK() .OR. FLOK()
                              REPL NUMERO WITH M.NUREM+1
                              UNLO IN DOC
                              IF IMPRIME("EL REMITO",.T.,10,10)
                                 DO LREMIF
                              ENDIF
                           ENDIF
                           ********
                        ENDIF
                     ENDIF
                  ENDIF
               ELSE
                  =cartel("EL REMITO N§ "+ALLTRIM(STR(M.NUREM)),"EXISTE","IMPOSIBLE GENERARLO NUEVAMENTE","POR FAVOR REINTENTE")
               ENDIF
            ENDIF
         ENDIF
      ELSE
         =cartel("LA ORDEN DE CORTE N§ "+ALLTRIM(STR(COR.NUMERO)),;
           "HA NO HA SIDO INICIADA",;
           "IMPOSIBLE GENERAR REMITOS",;
           "PULSE [ENTER] PARA CONTINUAR")
      ENDIF
   ELSE
      =cartel("LA ORDEN DE CORTE N§ "+ALLTRIM(STR(COR.NUMERO)),;
      "HA SIDO FINALIZADA EL DIA "+DTOC(COR.FECHAFIN),;
      "IMPOSIBLE GENERAR REMITOS",;
      "PULSE [ENTER] PARA CONTINUAR")
   ENDIF
ELSE
   =IAUDI()
ENDIF
DEAC WIND ALL
=CLOSDBF("OCO")
=RELEWIN("WIN")
UNLO ALL
RETURN MEN_LIN(BOTOM)
