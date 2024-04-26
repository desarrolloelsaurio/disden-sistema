PROCEDURE CONSUL
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
EXTERNAL PROCEDURE LNOEX.PRG
DO WHILE .T.
   M.CONSUL=ALGUN(30," Tipo de Consulta ",;
     "Mercader¡a \<Inexistente;\<Rubros;\<Agrupaci¢nes;\<L¡neas;\<Men£ Anterior")
   DO CASE
   CASE M.CONSUL=1
      =WORKING()
      =DOTALK()
      TMP=GENTMP()
      SET ORDER TO TAG ARTIRED IN MER
      SELE FAC
      SET ORDER TO
      SET RELA TO NROITE INTO MER
      =FLOCK() .OR. FLOK()
      SORT ON NROITE TO (TMP) FOR EMPTY(MER.ARTICULO)
      UNLO IN FAC
      =PRXAREA(.T.)
      USE (TMP) ALIAS TMP
      TT="Mercader¡a Vendida Inexistente en la Base de Producci¢n"
      acla=paip+padc("ARTICULO",10)+PAIP+PADC("CANTIDAD",10)+PAIP
      =UNWORK()
      =UNTALK()
      =HAGALIS("TMP","LNOEX()","LNOEX",.T.,"99999999")
      =OFF_TMP()
      =OFF_RELA()
   CASE M.CONSUL=2
      SELE MIX
      SET ORDER TO TAG RUBTEX
      STORE NUL TO M.CASOS
      ACLA=PAIP+" COD "+PAIP+PADC("RUBRO",20)+PAIP
      TT="Listado de Rubros de Producci¢n"
      =HAGALIS("MIX","LMIX0(1)","LRUB")
   CASE M.CONSUL=3
      SELE MIX
      SET ORDER TO TAG CAGTEX
      STORE NUL TO M.CASOS      
      ACLA=PAIP+"COD "+PAIP+PADC("AGRUPACION",20)+PAIP
      TT="Listado de Conceptos de Agrupaci¢n"
      =HAGALIS("MIX","LMIX0(2)","LCAG")
   CASE M.CONSUL=4
      SELE MIX
      SET ORDER TO TAG LINTEX
      STORE NUL TO M.CASOS      
      ACLA=PAIP+"COD "+PAIP+PADC("LINEA",20)+PAIP
      TT="Listado de Conceptos de L¡neas de Colecci¢n"
      =HAGALIS("MIX","LMIX0(2)","LLIN")
   OTHERWISE
      EXIT
   ENDCASE
ENDDO
RETURN MEN_LIN(BOTOM)
 
FUNCTION HAGALIS
PARAMETER LAS_BASE,EL_LISTADO,EL_NOMBRE,EL_SUMA,EL_PICHER
DO WHILE .T.
   M.PORDONDE=ALGUN(30," Salida del Listado ",;
     "Por \<Pantalla;Por \<Impresora;\<Archivo ASCII;\<Men£ Anterior")
   DO CASE
   CASE M.PORDONDE=1
      STORE .T. TO M.PORPAN
   CASE M.PORDONDE=2
      STORE .F. TO M.PORPAN
   CASE M.PORDONDE=3
      M.ENASCII=.T.
      STORE .F. TO M.PORPAN
   OTHERWISE
      EXIT
   ENDCASE
   =LGRL2(PORPAN,LAS_BASE,EL_LISTADO,"",EL_NOMBRE,EL_SUMA,EL_PICHER)
ENDDO
RETURN .T.
