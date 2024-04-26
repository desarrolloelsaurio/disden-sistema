********************************************************************************
*-- Programa: LIVAVI.PRG
*-- Fecha   : 09/26/91
*-- Version : G. REINER
*-- Notas   : IMPRESION DEL IVA VENTAS, POR IMPRESORA
*-- Modificaci¢n GOYO 06-25-92 02:30pm (correccion ncre - y +)
********************************************************************************
parameter aRTEMIO
EXTERNAL PROCEDURE LIVAVI0
STORE PROGRAM() TO ULPR
IF CHEQSEG()
   =WORKING()
   =DOTALK()
   SET ORDER TO TAG CODCLI IN PER
   SELE FAC
   nada=""
   truch=xacdigi-1
   HAYEXE=HAYCAMPO("EXENTO","FAC")
   ACLAPAN="|  FECHA |"+PADC("N§",17)+PAIP+;
   PADC("GRAVADO",XACDIGI)+paip+;
   PADC(PC18,XACDIGI)+PAIP+;
   PADC(PC9,XACDIGI)+PAIP+;
   PADC("FACTURADO",XACDIGI)+paip 

   ACLAPRN="|  FECHA |"+PADC("COMPROBANTE",20)+PAIP+;
   PADC("CLIENTE",30)+PAIP+;
   PADC("C. IVA",10)+PAIP+;
   PADC("N§ CUIT",13)+PAIP+;
   PADC("GRAVADO",XACDIGI)+paip+;
   PADC(PC18,XACDIGI)+PAIP+;
   PADC(PC9,XACDIGI)+PAIP+;
   PADC("FACTURADO",XACDIGI)+paip 
      SELE fac
      TMP=GENTMP()
      =FLOCK() .OR. FLOK()
       SORT ON FACTURA TO (TMP) FOR EVAL(FISC)
       =UNLO_PRX("FAC",TMP,"TMP")
      =XPRN1(4,"TMP","LIVAVI0()",DTOC(M.FECINI)+" A "+DTOC(M.FECFIN),"LIVAVI",4)
      =OFF_TMP()
ELSE
=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)