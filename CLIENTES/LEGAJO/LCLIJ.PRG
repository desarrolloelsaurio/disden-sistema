#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
PROCEDURE LCLIJ
PARAMETER PORPAN
ULPR=HORA_ULP(PROGRAM())
RESPUESTA='LCLIJ#6#60#;
  Listado de Legajo#3;
#Clientes con Legajo;
#Legajos de Clientes (Común);
#Legajos de Clientes (Especial);
#Este Legajo'
=DEFPOP()
ON SELE POPU LCLIJ DO LCLIJ1
ACTI SCRE
ACTI POPU LCLIJ
RELE POPU LCLIJ
RETURN MEN_LIN(BOTOM)
 
PROCEDURE LCLIJ1
LC_DIJO=ALLTRIM(PROMPT())
ULPR=HORA_ULP(PROGRAM())
DO CASE
CASE LC_DIJO="Clientes con Legajo" .OR. ;
     LC_DIJO="Legajos de Clientes (Común)"
   =OPCAG()
   STORE NUL TO M.RESPUESTA
   STORE 2 TO M.FILCAG
   STORE "" TO FISC,TT,TTCAG,QUECAG
   =QW_CAG(.F.,.F.,"PER.CAG")
   IF QUECAG#".F."
      FISCCAG=QUECAG
      TTCAG=TTCAG
   ELSE
      STORE .F. TO M.OK
      =NOSELEC("AGRUPACION")
      FISCCAG = ".T."
   ENDIF
   =OPciu()
   STORE NUL TO M.RESPUESTA
   STORE 2 TO M.FILCIU
   STORE "" TO FISC,TT,TTCIU,QUECIU
   wait "1" wind
   =QW_CIU("PER.LOCALIDAD")
   IF QUECIU#".F."
      FISCCIU=QUECIU
      TTCIU=TTCIU
   ELSE
      STORE .F. TO M.OK
      =NOSELEC("CIUDAD")
      FISCCIU = ".T."
   ENDIF
   FISC = FISCCAG + " .AND. " + FISCCIU
   tt = TTCAG + chr(13) + ttCIU
   =WORKING()
   =DOTALK()
   TMP=GENTMP()
   SELE PER
   SET ORDER TO
   =FLOCK() .OR. FLOK()
   ******   le saque la linea esta y la cambie para que no salieran los guiones.   
   ****** .AND.   !EMPTY(ALLTRIM(MLINE(LEGAJO,1))) 
   ******
   SORT ON CLIENTE TO (TMP) FOR FILTRO="C" .AND. ;
     isalpha(ALLTRIM(MLINE(LEGAJO,1))) .AND. ;
     &FISC  .AND. ;
     !EMPTY(ALLTRIM(MLINE(LEGAJO,1))) FIELD ;
     CODCLI,CLIENTE,LEGAJO 
   =UNLO_PRX("PER",TMP)
   =untalk()
   =unwork()
   SELE TMP
   IF PORPAN
      IF LC_DIJO="Legajos de Clientes (Común)"
         REPO FORM LCLIJ2 PREV
      ELSE
         REPO FORM LCLIJ1 PREV
      ENDIF
   ELSE
      IF LC_DIJO="Legajos de Clientes (Común)"
         REPO FORM LCLIJ2 TO PRIN PROM NOCONSOLE
      ELSE
         REPO FORM LCLIJ1 TO PRIN PROM NOCONSOLE
      ENDIF
   ENDIF
   =OFF_TMP()
CASE LC_DIJO="Este Legajo"
   TMP=GENTMP()
   SELE PER
   =FLOCK() .OR. FLOK()
   COPY TO (TMP) RECORD RECNO() FIELD ;
     CODCLI,CLIENTE,LEGAJO
   =UNLO_PRX("PER",TMP)
IF PORPAN
         REPO FORM LCLIJ2 PREV FOR PER.CODCLI=M.CODCLI
ELSE
         REPO FORM LCLIJ2 NOCONSOLE TO PRIN PROM FOR PER.CODCLI=M.CODCLI
ENDIF         
CASE LC_DIJO="Legajos de Clientes (Especial)"
   =OPCAG()
   STORE NUL TO M.RESPUESTA
   STORE 2 TO M.FILCAG
   STORE "" TO FISC,TT,TTCAG,QUECAG
   =QW_CAG(.F.,.F.,"PER.CAG")
   IF QUECAG#".F."
      FISCCAG=QUECAG
      TTCAG=TTCAG
   ELSE
      STORE .F. TO M.OK
      =NOSELEC("AGRUPACION")
      FISCCAG = ".T."
   ENDIF
   =OPciu()
   STORE NUL TO M.RESPUESTA
   STORE 2 TO M.FILCIU
   STORE "" TO FISC,TT,TTCIU,QUECIU
   =QW_CIU("PER.LOCALIDAD")
   IF QUECIU#".F."
      FISCCIU=QUECIU
      TTCIU=TTCIU
   ELSE
      STORE .F. TO M.OK
      =NOSELEC("CIUDAD")
      FISCCIU = ".T."
   ENDIF
   FISC = FISCCAG + " .AND. " + FISCCIU
   tt = TTCAG + chr(13) + ttCIU
   =WORKING()
   =DOTALK()
   TMP=GENTMP()
   SELE PER
   SET ORDER TO
   =FLOCK() .OR. FLOK()
   ******   le saque la linea esta y la cambie para que no salieran los guiones.   
   ****** .AND.   !EMPTY(ALLTRIM(MLINE(LEGAJO,1))) 
   ******
  SORT ON CLIENTE TO (TMP) FOR ;
   FILTRO="C" .AND. ;
   !EMPTY(ALLTRIM(MLINE(LEGAJO,1))) .AND. ;
   LEFT(ALLTRIM(LEGAJO),4)#"----"  .AND. ;
   &FISC  .AND. ;
   LEFT(UPPER(ALLTRIM(LEGAJO)),5)#"GARAN" ;
   FIELD ;
     CODCLI,CLIENTE,LEGAJO
   =UNLO_PRX("PER",TMP)
   =untalk()
   =unwork()
   SELE TMP
   IF PORPAN
         REPO FORM LCLIJ2 PREV
   ELSE
         REPO FORM LCLIJ2 TO PRIN PROM NOCONSOLE
   ENDIF
   =OFF_TMP()
ENDCASE
RETURN MEN_LIN(BOTOM)
