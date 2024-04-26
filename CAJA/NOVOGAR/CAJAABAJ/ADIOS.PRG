*:*********************************************************************
*:
*:        Program: ADIOS.PRG
*:
*:         System: SYSTEMA DE COMERCIALIZACION
*:         Author: GOYO REINER
*:      Copyright (c) 1991, SISTEMAS INFORMATICOS S.R.L.
*:  Last modified: 09/05/91     13:09
*:
*:      Called by: COMER.PRG
*:
*:   Memory Files: &A
*:
*:      Documented 09/25/91 at 13:24               FoxDoc  version 2.01
*:*********************************************************************
DO CASE
CASE BAR()=2
   ON ERROR QUIT
   =SAVGENE()
   A=PATHCAJ
   RELE abio,abios,tella,tellas,austral,australes,zuela,zuelas,ruvro,ruvros,llinea,llineas,janname,coefseg,usador,xacancho,xachoja
   RELE sstm,ulpr,espere,grabando,tratando,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,nlq,offnlq,UNDER,OFFUNDER
   RELE pds,favri,ulpr,sstm,WIDE,OFFWIDE,NUL,PAIP
   RELE ALL LIKE mader*
   RELE ALL LIKE PATH*
   RELE ALL LIKE xa*
   RELE PATH,pathpro
   =SAVPOCAZ(A)
   QUIT
ENDCASE
RETURN
