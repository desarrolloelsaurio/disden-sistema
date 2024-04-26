* ษออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LBALTAL.PRG                    บ
* บ COMENTARIO    : LISTADO DE BALANCE DE TALLERES บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                       บ
* บ FECHA      : 05-30-94                          บ
* บ HORA       : 10:53:04pm                        บ
* บ COPYRIGHT  : 1994 by GREGORIO REINER           บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION LBALTAL
#DEFINE CRLF CHR(13)+CHR(10)                   && CRLF
#DEFINE NUL    0                               && NUL
#DEFINE PAIP   "|"                             && PAIP
OPTAR=ALGUN(30,"Lกmites del Listado","Todos los Talleres;Un Taller;Un Taller por Proceso")
if !empty(optar)
   if optar>1
      if !EMPTY(ELIPRO("a Listar",-1,1))
         m.eltal=PER.CODCLI
      else
         =noselec("TALLER")
         store "" to m.eltal
      endif
   endif
   if optar=1 .or. ;
        !empty(m.eltal)
      =WORKING()
      =DOTALK()
      SET ORDER TO TAG TALCOD IN PER
      SET ORDER TO TAG NUMERO IN COR
      SELE FAX
      SET RELA TO NUMERO INTO COR
      SET RELA TO TALLER INTO PER ADDI
      TMP=GENTMP()
      IF OPTAR=1
         SORT ON PER.CLIENTE, FAX.NUMERO ;
           FIELDS PER.CLIENTE ,;
           NUMERO ,;
           POSIC ,;
           COR.ARTICULO ,;
           EF ,SF ,;
           EEC,SSC ,;
           REMITO FOR ;
           (YEAR(EF)=M.XANIO .AND. MONTH(EF)=M.XMES) .OR. ;
           (YEAR(SF)=M.XANIO .AND. MONTH(SF)=M.XMES) ;
           TO (TMP)
      ELSE
         SORT ON PER.CLIENTE, FAX.NUMERO ;
           FIELDS PER.CLIENTE ,;
           NUMERO ,;
           COR.ARTICULO ,;
           EF ,SF ,;
           EEC,SSC ,;
           REMITO FOR ;
           FAX.TALLER=ELTAL .AND. ;
           ((YEAR(EF)=M.XANIO .AND. MONTH(EF)=M.XMES) .OR. ;
           (YEAR(SF)=M.XANIO .AND. MONTH(SF)=M.XMES)) ;
           TO (TMP)
      ENDIF
      =UNTALK()
      =UNWORK()

      SELE FAX
      USE (TMP) ALIAS FAX
      SET ORDER TO TAG ARTIRED IN MER
      SET RELA TO ARTICULO INTO MER

      STORE NUL TO CASOS
      M.ACLA=PAIP+;
        PADC("O. C. Nง",10)+PAIP+;
        PADC("REMITO",15)+PAIP+;
        PADC("ARTICULO",10)+PAIP+;
        IIF(PORP,"",PADC("DESCRIPCION",30)+PAIP)+;
        PADC("ENTRADA",XACDIGI-2)+PAIP+;
        PADC("SALIDA",XACDIGI-2)+PAIP+;
        "DIAS"+PAIP

      M.LINEA=REPL("=",LEN(ACLA))
      TT="LISTADO DE BALANCE DE TALLERES"+;
        CRLF+;
        "MES DE "+QMES(M.XMES)+;
        CRLF+;
        "AฅO:"+STR(M.XANIO,4)

      STORE NUL TO TTEEC,TEEC
      STORE NUL TO TTSSC,TSSC
      STORE NUL TO TDIA,TTDIA
      STORE NUL TO CASOS,TTCASOS
      STORE "" TO ELTALLER
      GO TOP
      =IIF(PORP,LBALTALP(),LBALTALI())
      =OFF_RELA()
   ENDIF
ELSE
   =NOSELEC("TIPO DE LISTADO")
ENDIF
RETURN REOPFAB()
