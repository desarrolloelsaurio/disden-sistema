* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LPED.PRG                                                 �
* � COMENTARIO    :                                                          �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 11-01-93                                                    �
* � HORA       : 01:50:15pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
PARAMETER ELPED
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
   SELE CJJ
   SET ORDER TO TAG PEDIDO
   IF SEEK(M.ELPED)
   STOR NUL TO CASOS
   STORE 80 TO LARGO,LARGOIM
   TT="SOLICITUD DE PREPARACION DE CAJAS"
   ACLA=PAIP+;
   PADC("NUMERO",10)+;
   PAIP+;
   PADC("PASILLO",10)+;
   PAIP+;
   PADC("MANO",10)+;
   PAIP+;
   PADC("COLUMNA",10)+;
   PAIP+;
   PADC("FILA",10)+;
   PAIP+;
   PADC("POSICION",10)+;
   PAIP
   LINEA=REPL("=",LEN(ACLA))
   =CABPRI()
   _PCOPIES=1
   PRINTJOB
      =CABPRI1()
      ?
      ? PADC(TT,80)
      ?
      _WRAP=.T.
      _ALIGNMENT="RIGHT"
      ? "PEDIDO:"+M.PEDIDO
      ? "FECHA :"+DTOC(CJJ.FPREP)
      ? "CLIENTE:"+CJJ.CODCLI+SPACE(20)
      ? SAYPER(CJJ.CODCLI,"CODCLI")
      ? ALLTRIM(SAYMIX(PER.TIPODOC,"DNICOD"))
      ?? " "
      ?? TRANS(PER.NRODOC,"@R 99.999.999")
      IF PER.NRODOC=M.NRODOC .AND. PER.TIPODOC=M.TIPODOC
      ? "RETIRA :"+CJJ.CODCLI+SPACE(20)
      ? SAYPER(CJJ.CODCLI,"CLIENTE")
      ? ALLTRIM(SAYMIX(PER.TIPODOC,"DNICOD"))
      ?? " "
      ?? TRANS(PER.NRODOC,"@R 99.999.999")
      ELSE
      =xseek(m.tipodoc+m.nrodoc,"OPE","opedni")
      ? "RETIRA :"+OPE.CODCLI+SPACE(20)
      ? SAYGRL(OPE.CODCLI,"OPE","OPECOD","OPE.CLIENTE")
      ? ALLTRIM(SAYMIX(OPE.TIPODOC,"DNICOD"))
      ?? " "
      ?? TRANS(OPE.NRODOC,"@R 99.999.999")
      ENDIF
      _ALIGNMENT="LEFT"
      ?
      ?
      ?
      =_LIN(.T.)
      SELE CJJ
      SCAN WHILE PEDIDO=M.ELPED
      ? PAIP
      ?? STR(CJJ.NUMERO,10)
      ?? PAIP
      ?? STR(CJJ.PASILLO,10)
      ?? PAIP
      ?? PADR(IIF(CJJ.MANO="I","IZQUIERDA","DERECHA"),10)
      ?? PAIP
      ?? STR(CJJ.COLUMNA,10)
      ?? PAIP
      ?? STR(CJJ.FILA,10)
      ?? PAIP
      ?? PADR(IIF(CJJ.POSICION="D","DELANTERA","TRASERA"),10)
      ?? PAIP
      ENDSCAN
      ? M.LINEA
      ?
  		?"            敖陳陳陳陳陳陳陳堕陳陳陳陳陳陳陳陳堕陳陳陳陳陳陳陳陳陳陳朕"
		?"            �    FECHA      �      FIRMA      �      ACLARACION      �"
		?"  敖陳陳陳陳田陳陳陳陳陳陳陳田陳陳陳陳陳陳陳陳田陳陳陳陳陳陳陳陳陳陳調"
		?"  � PREPARO �               �                 �                      �"
		?"  団陳陳陳陳田陳陳陳陳陳陳陳田陳陳陳陳陳陳陳陳田陳陳陳陳陳陳陳陳陳陳調"
		?"  � ENTREGO �               �                 �                      �"
		?"  団陳陳陳陳田陳陳陳陳陳陳陳田陳陳陳陳陳陳陳陳田陳陳陳陳陳陳陳陳陳陳調"
		?"  � RECIBIO �               �                 �                      �"
		?"  青陳陳陳陳祖陳陳陳陳陳陳陳祖陳陳陳陳陳陳陳陳祖陳陳陳陳陳陳陳陳陳陳潰"
		?
EJECT PAGE
   ENDP
   =FINIMP()
   =IAUD("")
   ENDIF
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
