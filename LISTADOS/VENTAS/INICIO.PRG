PROCEDURE INICIO
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
#DEFINE FOLC  ".F."                              && FOLC
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
=SETEOS()
*WAIT GETENV("USERNAME") WIND
*WAIT GETENV("NWLANGUAGE") WIND
*WAIT FULL(CURD()) WIND
*IF GETENV("USERNAME")="GOYO" .OR ;
(GETENV("USERNAME")="ALE" .AND. GETENV("NWLANGUAGE")="ENGLISH" .AND. FULL(CURD())="H:\GOYO\")
=GETFUSER()
RELE PATH,MADER,MADERS,ZUELA,ZUELAS,XACANCHO,XACHOJA,ULPR,USADOR,SSTM,TELLA,TELLAS,XACDIGI
PUBL PATH,MADER,MADERS,ZUELA,ZUELAS,XACANCHO,XACHOJA,ULPR,USADOR,SSTM,TELLA,TELLAS,XACDIGI
DO CASE
   CASE GETENV("EQUIPO")="GOYOLAP"
      STORE "C:\SISTEMAS\LISTADOS\VENTAS" TO PATH,PATHPRO,PATHCOM
   CASE GETENV("USERNAME")="GOYO"
      STORE "G:\SISTEMAS\LISTADOS\VENTAS" TO PATH,PATHPRO,PATHCOM
   CASE GETENV("USERNAME")="ALE"
      STORE "H:\GOYO" TO PATH,PATHPRO,PATHCOM
   OTHERWISE
      STORE "K:\" TO PATH,PATHPRO,PATHCOM
ENDCASE
STORE "COMPA¥IA DE PRODUCTOS NAZA S.A." TO M.JANNAME
STORE "Molder¡a" to mader
STORE "Molder¡as" to maders
STORE "Tela" to TELLA
STORE "Telas" to TELLAS
STORE "Color" to ZUELA
STORE "Colores" to ZUELAS
STORE 80 TO XACANCHO,XACHOJA
STORE "INFORMES" TO SSTM
STORE 10 TO XACDIGI
STORE GETENV("USERNAME") to m.usador
ULPR=PROGRAM()
=WNCL("ABRIENDO BASES")
STORE .F. TO MERPOP,MERPOP1
STORE 0 TO MERPOPC,MERPOPR
=OPMER()
SET ORDER TO TAG ARTIRED
STORE .T. TO RUBPOP
STORE 0 TO RUBPOPC,RUBPOPR
=OPRUB()
STORE .T. TO LINPOP
STORE 0 TO LINPOPC,LINPOPR
=OPLIN()
STORE .T. TO MARPOP
STORE 0 TO MARPOPC,MARPOPR
=OPMAR()
STORE .T. TO MATPOP
STORE 0 TO MATPOPC,MATPOPR
=OPMAT()
STORE .T. TO SUEPOP
STORE 0 TO SUEPOPC,SUEPOPR
=OPSUE()
STORE .T. TO CAGPOP
STORE 0 TO CAGPOPC,CAGPOPR
=OPCAG()
STORE .T. TO TELPOP,TELSPOP
STORE 0 TO TELPOPC,TELPOPR
*=OPTELS()
=WCL()
DO WHILE .T.
   CLEA
   *** SELECCIONA LA BASE DE DATOS
   =MEN_LIN("Seleccione la Base de Origen de los Datos a Procesar - [ESC] Fin del Programa")
   EL_ARCHIVO=GETF("DBF","Seleccione la Base de Resumen","Abre Base")
   IF LAST()#27 .AND. ;
        !EMPTY(EL_ARCHIVO)
=RELEWIN("upleft")
=RELEWIN("upright")
=RELEWIN("Lowleft")
=RELEWIN("lowright")
	  =CARTEL2("USTED HA SELECCIONADO LA BASE",;
	  	EL_ARCHIVO,;
		"EL PROGRAMA EFECTUARA MODIFICACIONES PARA PODER LISTAR",;
		"POR FAVOR CONFIRME SU SELECCION",.T.)
		IF CONFIRMA("Archivo de Trabajo",.t.,15,10)
=RELEWIN("upleft")
=RELEWIN("upright")
=RELEWIN("Lowleft")
=RELEWIN("lowright")
      =MEN_LIN(BOTOM)
      =DOTALK()
      =WNCL("ABRIENDO BASE "+EL_ARCHIVO)
      EL_PATH=LEFT(EL_ARCHIVO,RAT("\",EL_ARCHIVO))
      EL_MEM=EL_PATH+"PH.MEM"
      RELE ALL LIKE PH*
      =PRXAREA(.T.)
      USE (EL_ARCHIVO) ALIAS FAC EXCL
      =WNCL("CHEQUEANDO BASE")
      REST FROM STRUORI ADDI
      TMP=GENTMP()
      COPY STRU EXTE TO (TMP)
      =PRXAREA(.T.)
      USE (TMP)
      COPY TO ARRAY STRUNUE
      IF AR_EQUAL(@STRUNUE,@STRUORI)
         =WNCL("LA BASE ES LA ADECUADA")
         =OFF_TMP()
         RELE ALL LIKE STRU*
      REST FROM (EL_MEM) ADDI
      =WNCL("REGENERANDO ARTICULOS")
      SELE FAC
      REPL ALL NROITE WITH ZERO(LEFT(GRUPO1,2),3)+"-"+ZERO(SUBSTR(GRUPO1,3),6)
      DELE FOR EMPTY(GRUPO1)
      =WNCL("INDEXANDO LA BASE")
      INDEX ON NROITE TAG ARTICULO
      SET ORDER TO TAG ARTICULO
      SELE FAC
      =UNTALK()
      =WCL()
      DO WHILE .T.
         =MEN_LIN("Seleccione el Tipo de Listado a Efectuar - [ESC] Fin")
         M.OPCION=ALGUN(35," Tipo de Listado ",;
           "Ran\<king;Re\<s£menes;\<Un Rubro;\<Otros Listados Mercader¡a;\<Consultas;Otra \<Base")
         =MEN_LIN(BOTOM)
         DO CASE
         CASE M.OPCION=1
            STORE "" TO FISC,TT,TTQUE
            DO QWMERCA.SPR WITH .F.,.T.
            IF !EMPTY(FISC) .AND. LAST()#27
               =WORKING()
               =DOTALK()
               SET ORDER TO TAG ARTIRED IN MER
               SELE FAC
               =FLOCK() .OR. FLOK()
               SET RELA TO NROITE INTO MER
               TMP=GENTMP()
               SORT ON NROITE TO (TMP) FOR &FISC
               UNLO IN FAC
               =PRXAREA(.T.)
               USE (TMP) ALIAS TMP EXCL
               DELE FOR EMPTY(CANT)
               PACK
               INDEX ON CANT TAG CANT DESC
               SET ORDER TO TAG CANT
               SET RELA TO NROITE INTO MER
               TT="Ranking de Ventas"+;
                 ALLTRIM(TTQUE)
               =HAZ_TIT()
               ACLA=PAIP+;
                 PADC("ARTICULO",10)+;
                 PAIP+;
                 PADC("DESCRIPCION",30)+;
                 PAIP+;
                 PADC("CANTIDAD",10)+;
                 PAIP
               DO WHILE .T.
                  M.PORDONDE=ALGUN(30," Salida del Listado ",;
                    "Por \<Pantalla;Por \<Impresora;\<Archivo ASCII;\<Men£ Anterior")
                  DO CASE
                  CASE M.PORDONDE=1
                     =LGRLP("TMP","LRANK1()","","LRANKP",.T.,REPL("9",10))
                  CASE M.PORDONDE=2
                     =LGRLI("TMP","LRANK1()","","LRANKI",.T.,REPL("9",10))
                  CASE M.PORDONDE=3
                     M.ENASCII=.T.
                     =LGRLI("TMP","LRANK1()","","LRANKA",.T.,REPL("9",10))
                  OTHERWISE
                     EXIT
                  ENDCASE
               ENDDO
            ELSE
               =NOSELEC("LIMITES DE LISTADO")
            ENDIF
            =UNWORK()
            =UNTALK()
            =OFF_TMP()
            =OFF_RELA()
         CASE M.OPCION=2
            DO LRANK
         CASE M.OPCION=3
            DO UNRUB
         CASE M.OPCION=4
            DO LMER
         CASE M.OPCION=5
            DO CONSUL
         CASE m.opcion=6 .OR. ;
              M.OPCION=0
            EXIT
         ENDCASE
      ENDDO
      ELSE
      =CARTEL2("LA BASE SELECCIONADA",;
EL_ARCHIVO,;
"TIENE UNA ESTRUCTURA DIFERENTE A LA ESPERADA",;
"IMPOSIBLE GENERAR LISTADOS")      
=OFF_TMP()
      ENDIF
      ENDIF
      =CLOSDBF("FAC")
      =MEN_LIN(BOTOM)
   ELSE
      EXIT
   ENDIF
ENDDO
*ENDIF
RETURN MEN_LIN(BOTOM)


FUNCTION HAZ_TIT
TT=TT+QW_TT("ORIGEN DE LOS DATOS")+;
  QW_TT(ALLTR(MPHLIN1))+;
  QW_TT(ALLTR(MPHLIN2))+;
  QW_TT(ALLTR(MPHLIN3))
RETURN .T.

FUNCTION OPSEG
RETURN .T.

FUNCTION CHEQSEG
RETURN .T.

FUNCTION OPAUD
RETURN .T.

FUNCTION OPDOC
RETURN .T.

FUNCTION HLP
RETURN .T.
