* ษอออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LPER.PRG            บ
* บ COMENTARIO    : LISTADO DE PERSONAS บ
* ฬอออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER            บ
* บ FECHA      : 11-16-93               บ
* บ HORA       : 01:59:49pm             บ
* บ COPYRIGHT  : 1993 by GREGORIO REINERบ
* ศอออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP

PARAMETER PORPAN
M.OPTAR=ALGUN(30,"Tipo de Listado",;
  "\<Completo;"+;
  "Por \<Agrupaciขn;"+;
  "An\<ula Listado")
DO CASE
CASE M.OPTAR=1
   =ACOPY(TEXTO,ANTTEXTO)
   =QUERYPER()
   =ACOPY(ANTTEXTO,TEXTO)
CASE M.OPTAR=2
   STORE NUL TO M.RESPUESTA
   STORE 2 TO M.FILCAG
   STORE "" TO FISC,TT,TTCAG,QUECAG
   =QW_CAG(.F.,.F.,"PER.CAG")
   SELE PER
   SET ORDER TO TAG CONTENIDO[4]
   IF !EMPTY(QUECAG) .AND. ;
        QUECAG#".F."
        =WORKING()
        =DOTALK()
      SELE PER
      SET ORDER TO
      TMP=GENTMP()
      =FLOCK() .OR. FLOK()
      FISC="PER.FILTRO='"+CONTENIDO[5]+"' .AND. "+QUECAG
      SORT ON CLIENTE TO (TMP) FOR &FISC
      UNLO IN PER
      =PRXAREA(.T.)
      USE (TMP) ALIAS TMP
      DIME VARIABLE[11]
      STORE .T. TO VARIABLE[1],VARIABLE[2]
      TT="Listado de "+texto[3]+;
        crlf+TTCAG
        ACLA=PAIP+PADC("CODIGO",10)+PAIP+;
        PADC(UPPER(TEXTO[1]),30)+PAIP
      =XPRN1(4,"TMP","LPER20()",TTCAG,"LPERCAG")
      =OFF_TMP()
   ENDIF
ENDCASE
RETURN MEN_LIN(BOTOM)
