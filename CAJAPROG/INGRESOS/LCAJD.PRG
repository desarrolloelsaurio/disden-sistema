*********************************************************************************
*-- Programa: lcajd.prg
*-- Fecha   : 03-31-93 11:16am
*-- Version : g. reiner
*-- Notas   : DERIVA A LISTADOS DE CAJA
********************************************************************************
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
#DEFINE PICUMAX "9,999,999,999,999.99"           && PICUMAX
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF

PARAMETER PORPAN
=cabpan1()
l_DIJO=ALLTRIM(PROMPT())
STORE {} TO M.FECINI,M.FECFIN
IF !EMPTY(ENTRE_FE("del Listado"))
=WORKING()
=DOTALK()
DO CASE
CASE L_DIJO="Estado de Caja"
TMP=GENTMP()
=opcajd()
SELE CAJD
=DOTALK()
=WORKING()
=flock() .or. flok()
SORT ON FECHAOP TO (TMP) FOR BETW(FECHAOP,M.FECINI,M.FECFIN)
=UNLO_PRX("CAJD",TMP)
ACLA=PAIP+PADC("FECHA",8)+PAIP+;
PADC("PESOS",XACDIGI)+PAIP+;
PADC("DOLARES",XACDIGI)+PAIP+;
PADC("TARJETAS",XACDIGI)+PAIP+;
PADC("CHEQUES 3�",XACDIGI)+PAIP+;
PADC("CHEQUES PROP",XACDIGI)+PAIP+;
PADC("TOTAL",XACDIGI)+PAIP
EXTERNAL PROCEDURE LCAJD1
TT="ESTADO DE CAJA"+;
CRLF+;
DTOC(M.FECINI)+" al "+dtoc(m.fecfin)
=UNTALK()
=UNWORK()
=XPRN1(4,"TMP","LCAJD1()",DTOC(M.FECINI)+"-"+DTOC(M.FECFIN),"LCAJR",6,RIGHT(PICUMAX,XACDIGI))
=OFF_TMP()
CASE L_DIJO="Recibos Emitidos"
=OPCLI()
=OPRECI()
TMP=GENTMP()
=FLOCK() .OR. FLOK()
SORT ON RECIBO TO (TMP) ;
FOR BETW(FECHAOP,M.FECINI,M.FECFIN)
=UNLO_PRX("RECI",TMP)
ACLA=PADC("PESOS",XACDIGI)+PAIP+;
PADC("DOLARES",XACDIGI)+PAIP+;
PADC("TARJETAS",XACDIGI)+PAIP+;
PADC("CHEQUES",XACDIGI)+PAIP+;
PADC("TOTAL",XACDIGI)
ACLAPRN=PAIP+PADC("RECIBO",14)+PAIP+;
PADC("FECHA",8)+PAIP+;
PADC("CODIGO",10)+PAIP+;
PADC("CLIENTE",30)+PAIP+ACLA+PAIP
ACLAPAN=PADC("RECIBO",14)+PAIP+;
PADC("FECHA",8)+PAIP+;
PADC("CODIGO",10)+PAIP+ACLA
TT="RECIBOS EMITIDOS"+;
CRLF+;
DTOC(M.FECINI)+" al "+dtoc(m.fecfin)
=UNTALK()
=UNWORK()
EXTERNAL PROCEDURE LCAJD0
=XPRN1(4,"TMP","LCAJD0()",DTOC(M.FECINI)+"-"+DTOC(M.FECFIN),"LCAJD",5,RIGHT(PICUMAX,XACDIGI))
=OFF_TMP()
CASE L_DIJO="Cheques Ingresados"
CASE L_DIJO="Tarjetas de Cr�dito"
ENDCASE
ELSE
=NOSELEC("FECHA")
ENDIF
RETURN men_lin(botom)
