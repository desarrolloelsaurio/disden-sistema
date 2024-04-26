DO CASE
CASE BAR()=2
   =IAUD("SALIDA DEL SISTEMA")
   =SAVGENE()
   
   RELE abio,abios,tella,tellas,austral,australes,zuela,zuelas,ruvro,ruvros,llinea,llineas,janname,coefseg,usador,xacancho,xachoja,unid
   RELE ulpr,espere,grabando,tratando,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,nlq,offnlq,UNDER,OFFUNDER
   RELE pds,favri,ulpr,sstm,WIDE,OFFWIDE
   A=PATH
   RELE ALL LIKE SSTM*
   RELE ALL LIKE mader*
   RELE ALL LIKE PAT*
   RELE ALL LIKE xa*
   
   =SAVPOLAB(A)
   
   QUIT
ENDCASE
RETURN
