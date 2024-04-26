PROCEDURE LMERAGR
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM

EXTERNAL PROCEDURE LMERCAG0.PRG
STORE NUL TO M.RESPUESTA
ACLA=PAIP+" COD. "+PAIP+PADC("AGRUPACION",20)+PAIP
DO WHILE !EMPTY(ELIMER("a Listar",-1,1))
   =WORKING()
   =DOTALK()
   TT="Agrupaci¢n de "+alltrim(mer.articulo)+;
     crlf+;
     alltrim(mer.merca)
   CREATE CURSOR TEMPORAL (CAG C(2),TEXTO1 C(20))
   SELE MER
   M.ELCAG=ALLTRIM(CHRTRAN(MER.CAG,"/ ",""))
   DO WHILE !EMPTY(M.ELCAG)
      M.CAG=LEFT(M.ELCAG,2)
      M.TEXTO1=SAYMIX(M.CAG,"CAGCOD")
      INSERT INTO TEMPORAL FROM MEMV
      M.ELCAG=IIF(LEN(M.ELCAG)<3,"",SUBSTR(M.ELCAG,3))
   ENDDO
   SELE TEMPORAL
   INDEX ON TEXTO1 TAG TEXTO1
   SET ORDER TO TAG TEXTO1
   =UNTALK()
   =UNWORK()
   IF !EMPTY(RECC("TEMPORAL"))
      EXTERNAL PROCEDURE LMERCAG0.PRG
      DO WHILE .T.
         #IF "LISTADO" $ CURD()
            M.PORDONDE=ALGUN(30," Salida del Listado ",;
              "Por \<Pantalla;Por \<Impresora;\<Archivo ASCII;\<Men£ Anterior")
            DO CASE
            CASE M.PORDONDE=1
               PORPAN=.T.
            CASE M.PORDONDE=2
               PORPAN=.F.
            CASE M.PORDONDE=3
               STORE .T. TO M.ENASCII,M.PORPAN
            OTHERWISE
               EXIT
            ENDCASE
         #ENDIF
         =LGRL2(PORPAN,"TEMPORAL","LMERCAG0()",MER.ARTICULO,"LMERCAG1")
         #IF "LISTADO" $ CURD()
         #ELSE
            EXIT
         #ENDIF
      ENDDO
   ENDIF
   =OFF_TMP()
ENDDO
RETURN MEN_LIN(BOTOM)
