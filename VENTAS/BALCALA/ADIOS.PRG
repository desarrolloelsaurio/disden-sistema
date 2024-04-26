ON ERROR QUIT
=iaud("SALIDA DEL SISTEMA")
DO CASE
CASE BAR()=2
   IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO"
      A=PATH+'\GENE'
      SAVE TO &a ALL LIKE xa*
   ELSE
      save to (pathVEN+"\gene") all like xa*
   ENDIF
   RELE abio,abios,tella,tellas,austral,australes,zuela,zuelas,ruvro,ruvros,llinea,llineas,janname,coefseg,usador,xacancho,xachoja,unid
   RELE sstm,ulpr,espere,grabando,tratando,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,nlq,offnlq,UNDER,OFFUNDER
   RELE pds,favri,ulpr,sstm,WIDE,OFFWIDE
   RELE ALL LIKE mader*
   RELE ALL LIKE PATH* EXCEPT PATH
   RELE ALL LIKE xa*
   RELE PATH,pathpro
   IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO"
      SAVE TO (PATH+'\posic')
   ELSE
      SAVE TO ('F:\usr\'+getenv("username")+"\posicCOM")
   ENDIF
   QUIT
ENDCASE
RETURN
*: EOF: ADIOS.PRG
