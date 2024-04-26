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
   IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO"
      A=PATH+'\GENE'
      SAVE TO &a ALL LIKE xa*
   ELSE
      save to c:\mercado\gene all like xa*
   ENDIF
   A=PATH+'\posic'
   RELE abio,abios,tella,tellas,austral,australes,zuela,zuelas,ruvro,ruvros,llinea,llineas,janname,coefseg,usador,xacancho,xachoja,unid
   RELE sstm,ulpr,espere,grabando,tratando,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,nlq,offnlq,UNDER,OFFUNDER
   RELE pds,favri,ulpr,sstm,WIDE,OFFWIDE
   RELE ALL LIKE mader*
   RELE ALL LIKE PAT*
   RELE ALL LIKE xa*
	 =SAVPOVEN(A)
    QUIT
ENDCASE
RETURN
*: EOF: ADIOS.PRG
