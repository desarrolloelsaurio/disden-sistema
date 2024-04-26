DO CASE
CASE BAR()=2
   DO CASE
   case EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO"
      A=PATH+'\GENE'
      SAVE TO &a ALL LIKE xa*
   CASE GETENV("EQUIPO")='MICASA' .OR. ;
        GETENV("EQUIPO")="GOYOLAP"
      SAVE TO GENE ALL LIKE XA*
   OTHERWISE
      save to (pathcom+"\gene") all like xa*
   ENDCASE
   A=PATH+'\posic'
   RELE abio,abios,tella,tellas,austral,australes,zuela,zuelas,ruvro,ruvros,llinea,llineas,janname,coefseg,usador,xacancho,xachoja
   RELE sstm,ulpr,espere,grabando,tratando,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,nlq,offnlq,UNDER,OFFUNDER
   RELE pds,favri,ulpr,sstm,WIDE,OFFWIDE,NUL,PAIP,POSIB
   RELE ALL LIKE mader*
   RELE ALL LIKE PATH*
   RELE ALL LIKE xa*
   RELE PATH,pathpro
   DO CASE
   CASE EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO"
      SAVE TO &a
   CASE GETENV("EQUIPO")='MICASA'.OR. GETENV("EQUIPO")="GOYOLAP"
      SAVE TO POSIC
   OTHERWISE
      save to ('F:\usr\'+getenv("username")+"\posicCOM")
   ENDCASE
   QUIT
ENDCASE   
RETURN
