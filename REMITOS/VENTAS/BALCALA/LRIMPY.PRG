*******************************************************************************
*-- Programa: lrimpy.prg
*-- Fecha   : 08/25/91
*-- Version : G. REINER
*-- Notas   : LISTADO DE mercaderias en remitos
********************************************************************************
parameter inter
private inter
STORE PROGRAM() TO ULPR
IF CHEQSEG()
   STORE '' TO lamerca,elarticulo,ACLA,LNS,TT
   STORE NUL TO can,tcan   
   =LRIMPY0()
   =WIN0()
   pag=1
   =CABPAN()
   =tit_lns(1)
   GO TOP
   SCAN
      IF rex.ARTICULO#ELARTICULO
         =LRIMPY1()
      ENDIF
      IF ROW()=21
         IF !fin_lns(1,nul,PAIP+padR("SUBTOTAL",10)+PAIP+SPACE(20)+PAIP+str(tcan,xacdigi,2)+paip)
            EXIT
         ENDIF
         CLEA
         STOR pag+1 TO pag
         =CABPAN()
         =tit_lns(2)
      ENDIF
      can=can+rex.cantidad
   ENDSCAN
   =LRIMPY1()
   =fin_lns(2,nul,PAIP+padR("TOTAL",10)+PAIP+SPACE(20)+PAIP+str(tcan,xacdigi,2)+paip)
   =relewin("WIN")
   =REOPREI()
   =IAUD(FISC)
ELSE
   =iaudi()
ENDIF
=men_lin(botom)
RETURN
