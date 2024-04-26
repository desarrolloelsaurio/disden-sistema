* ÚÄ Program ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    File Name: LFACR0.PRG          ³
* ³       Author: G. REINER           ³
* ³ Date created: 02-06-93            ³
* ³ Time created: 12:39:15pm          ³
* ³    Copyright: 1993 by GOYO REINER ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
* GENERA CABECERA DE LISTADOS LFACPR Y LFACIR
FUNCTION LFACR0
PARAMETER L_CAB
IF !L_CAB
   =WORKING()
   NADA=GENTMP()
   IF FILMER=2
      SET ORDER TO TAG ARTICULO IN MER
      SELE FAX
      SET RELA TO ARTICULO INTO MER
   ENDIF
   IF FILCLI=3
      SET ORDER TO TAG CODCLI IN PER
      SELE FAC
      SET RELA TO CODCLI INTO PER ADDI
      sele FAX
      SET RELA TO FACTURA INTO FAC ADDI
      IF ".T."=FISC
         INDE ON PER.CODCLI TO (NADA) COMP
      ELSE
         INDE ON PER.CODCLI TO (NADA) FOR EVAL(FISC) COMP
      ENDIF
   ELSE
      IF FILVIA=3
         SET ORDER TO CODVIA IN VIA
         SELE FAC
         SET RELA TO CODVIA INTO VIA ADDI
         sele FAX
         SET RELA TO  FACTURA INTO FAC ADDI
         IF ".T."=FISC
            INDE ON VIA.VIAJANTE TO (NADA) COMP
         ELSE
            INDE ON VIA.VIAJANTE TO (NADA) FOR EVAL(FISC) COMP
         ENDIF
      ELSE
         sele FAC
         SET RELA TO FACTURA INTO FAX ADDI
         sele FAX
         IF ".T."=FISC
            INDE ON fac.Fechaem TO (NADA) COMP
         ELSE
            INDE ON fac.Fechaem TO (NADA) FOR EVAL(FISC) COMP
         ENDIF
      ENDIF
   ENDIF
   go top
   store nul to can,tcan,TOT,TTOT,TFAC
   STORE 1 TO FAC
   STORE TOT+FAC.MONTONET TO TOT
ENDIF
IF FILFAC=3
   ELARTICULO=FAX.FACTURA
   LAMERCA=FAC.FECHAEM
   if !l_cab
      store paip+PADC('FACTURA',13)+paip+PADC('FECHA',8)+paip+padc("CANTIDAD",XACDIGI)+paip+padc("MONTO",XACDIGI)+paip to acla
   endif
else
   LAMERCA=FAC.FACTURA
   if filfec=3
      ELARTICULO=FAC.FECHAEM
      LAFACTURA=FAX.FACTURA
      if !l_cab
         store paip+PADC('FECHA',8)+paip+padc("CANTIDAD",XACDIGI)+paip+PADC("FACTURAS",XACDIGI)+PAIP+padc("MONTO",XACDIGI)+paip to acla
      endif
   ELSE
      IF FILVIA=3
         ELARTICULO=FAC.CODVIA
         LAFACTURA=VIA.VIAJANTE
         if !l_cab
            store paip+PADC(UPPER(BIAJA),30)+paip+padc("CANTIDAD",XACDIGI)+paip+PADC("FACTURAS",XACDIGI)+PAIP+padc("MONTO",XACDIGI)+paip to acla
         endif
      ELSE
         IF FILCLI=3
            ELARTICULO=FAC.CODCLI
            LAFACTURA=PER.CLIENTE
            if !l_cab
               store paip+PADC('CLIENTE',30)+paip+padc("CANTIDAD",XACDIGI)+paip+PADC("FACTURAS",XACDIGI)+PAIP+padc("MONTO",XACDIGI)+paip to acla
            endif
         ENDIF
      endif
   ENDIF
ENDIF
if !L_cab
   STORE REPL("=",LEN(acla)) TO lns
   tt=UPPER(TIT_INVOS)+TTQUE
endif
=UNWORK()
RETURN .T.
