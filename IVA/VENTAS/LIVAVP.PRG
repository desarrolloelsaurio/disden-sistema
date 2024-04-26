********************************************************************************
*-- Programa: LIVAVP.PRG
*-- Fecha   : 09/26/91
*-- Version : V.LEEGSTRA
*-- Notas   : IVA VENTAS POR PANTALLA
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
   =WORKING()
   SELE FAC
   TEMPO=GENTMP()
   INDE ON DTOS(FECHAEM) TO (TEMPO) FOR EVAL(FISC) COMP
   STORE "|  FECHA |"+PADC("COMPROBANTE",10)+PAIP+PADC("MONTO NETO",xacdigi) TO acla
   STORE '' TO NADA
   NADA=NADA+PAIP+PADC(PC9,XACDIGI)+;
     PAIP+PADC(PC18,XACDIGI)
   STORE acla+nada+paip+PADC("FACTURADO",xacdigi)+paip TO acla
   STORE REPL("=",LEN(acla)) TO lns
   STORE 0 TO totbru,totiva,totot2,totot3,totnet
   pag=1
   =UNWORK()
   =win0()
   =cabpan()
   nada=""
   =tit_lns(1)
   SCAN
      IF ROW()=21
         IF TLIVAVP("SUBTOTAL")=27
            EXIT
         ENDIF
         CLEA
         STOR pag+1 TO pag
         =cabpan()
         =tit_lns(2)
      ENDIF
      ? paip
      ?? fac.fechaem
      ?? PAIP
      ?? IIF(EMPTY(fac.tipo),"FA",FAC.TIPO)+IIF(TYPE("FAC.FACTURA")="C",RIGHT(ALLTRIM(FAC.FACTURA),8),STR(fac.factura,8))
      ?? PAIP
      suma=(empty(fac.tipo) .OR. fac.tipo="FA" .OR. fac.tipo='ND')
      if suma
         ?? STR(fac.montobru,xacdigi,2)
         STORE totbru+fac.montobru TO totbru
         ?? '|'
         ?? str(FAC.MONTOIVA,xacdigi,2)
         ?? PAIP
         ?? str(FAC.MONTOOT2,xacdigi,2)
         ?? PAIP
         STORE totiva+fac.montoiva TO totiva
         STORE totot2+fac.montoot2 TO totot2
         ?? STR(fac.montonet,xacdigi,2)
         STORE totnet+fac.montonet TO totnet
      else
         ?? str(0-ABS(fac.montobru),xacdigi,2)
         STORE totbru-ABS(fac.montobru) TO totbru
         ?? PAIP
         ?? str(0-FAC.MONTOIVA,xacdigi,2)
         ?? PAIP
         ?? str(0-FAC.MONTOOT2,xacdigi,2)
         ?? PAIP
         STORE totiva-abs(fac.montoiva) TO totiva
         STORE totot2-abs(fac.montoot2) TO totot2
         ?? STR(0-ABS(Fac.montonet),xacdigi,2)
         STORE totnet-ABS(fac.montonet) TO totnet
      endif
      ?? paip
   ENDSCAN
   =TLIVAVP("TOTAL")
   =relewin("WIN")
   =reopfac()
ELSE
   =iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)

FUNCTION TLIVAVP
PARAMETER COSA
PRIVATE COSA
if lastkey()#27
   ? lns
   ? paip
   ?? PADR(COSA,19)+paip
   ?? STR(totbru,xacdigi,2)+paip
   IF !EMPTY(xaci[1])
      ?? STR(totiva,xacdigi,2)
      ?? paip
   ENDIF
      ?? STR(totot2,xacdigi,2)
      ?? paip
   ?? STR(totnet,xacdigi,2)
   ?? paip
   ? lns
   _WRAP=.F.
   =INKEY(0)
endif
RETURN(LASTKEY())
