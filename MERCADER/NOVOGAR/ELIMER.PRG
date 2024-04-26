***********************************
*-- Programa: ELIMER.PRG
*-- Fecha   : 05/26/91 09:26am
*-- Version : G. REINER
*-- Notas   : ELIGE MERCAERIAS
*-- VERSION NOVOGAR
*-- Modificaci¢n 09-16-92 05:48pm
***********************************
FUNCTION elimer
PARA msg,r1,c1,n_ind
priv msg,r1,c1,resant
SELE mer
IF merpop
   ACTI SCRE
   if merpop1 .OR. N_IND
      if n_ind
         SELE MER1
         SET ORDER TO TAG MODEL1
         ACTI POPUP merpop1
      RESPUESTA=(!EMPTY(RESPUESTA))         
      ELSE
        **** OJO SQL ****
  SELECT ALL ARTICULO,MERCA FROM MER INTO CURSOR NADAS ORDER BY MERCA
  DEFI POPU NADAS FROM 0,0 PROM FIEL MERCA ;
  FOOTER " Art¡culo"+alltrim(msg)+" " ;
  TITL ' Mercader¡as ' ;
  
  ON SELE POPU NADAS DO RESP1
  ventant=wontop()
  acti scre
  store nul to respuesta
  ACTI POPUP NADAS
  STOR !EMPTY(respuesta) TO respuesta
  SELE MER
  =IIF(RESPUESTA,SEEK(NADAS.ARTICULO),.T.)
  USE IN NADAS
  *****************   

*         SET ORDER TO TAG MERCA
 *        IF EOF()
  *          GO TOP
   *      ENDIF
    *     ACTI POPUP merpop REST
      ENDIF

   else
      stor nul to respuesta
      if !empty(elirub(" del Producto",-1,1))
         stor nul to respuesta
         if !empty(elisru1("RUBRO"+ALLTRIM(RUB.RUBRO),-1,1,(RUB.CODrub)))
            RUX=ZERO(RUB.CODRUB,3)+'.'+ZERO(RUB.CODSRUB,3)
            SELE MER
            if ulpr='IPEC'
               SET ORDER TO TAG MERC1
               SET FILTER TO LEFT(ARTICULO,7)=RUX
               ACTI POPUP merpop
               RESPUESTA=(!EMPTY(RESPUESTA))
               set filter to
            ELSE
               SET ORDER TO
               TMPMER=GENTMP()
               =FLOCK("MER") .OR. FLOK("MER")
               SORT ON ARTICULO ;
                 FIELD ARTICULO,MERCA ;
                 FOR LEFT(ARTICULO,7)=RUX ;
                 TO (TMPMER)
               SELE MER
               USE
               USE (TMPMER) ALIAS MER IN 14 EXCL
               =DEFPOGRL(MERPOPR,MERPOPC,"MERPOP","MER.ARTICULO",20,"Elija la mercader¡a")
               ACTI POPUP merpop
               RESPUESTA=(!EMPTY(RESPUESTA))
               M.ELIGIO=MER.ARTICULO
               =REOPMER()
               =XSEEK(M.ELIGIO,'MER','ARTICULO')
            ENDIF
         else
            stor .F. to respuesta
         ENDIF
      ELSE
         stor .F. TO RESPUESTA
      endif
   endif
ELSE
   *if ulpr='IPEC'
   *   SET ORDER TO TAG ARTICUL1 IN MER1
   *ELSE
   *   SET ORDER TO TAG ARTICULO
   *ENDIF
   stor SPACE(20) TO respuesta
   IF r1=-1
      DO infic1 WITH 'ARTICULO '+msg,20
   ELSE
      @ r1,c1 GET respuesta PICTURE '@!'
      READ
   ENDIF
   IF EMPTY(respuesta) .OR. LASTKEY()=27
      stor .F. TO respuesta
   ELSE
      IF ULPR="IPEC" .OR. N_IND
         SELE MER1
         SET ORDER TO TAG MODEL1
      ELSE
         SELE MER
         SET ORDER TO TAG MODELO
      ENDIF
      salida=SEEK(LEFT(respuesta,10))
      if !salida
         RESPUESTA=AJCODMER(RESPUESTA)
         IF r1#-1
            @ r1,c1 GET RESPUESTA
            CLEAR GETS
         ENDIF
         IF ULPR="IPEC" .OR. N_IND
            respuesta=XSEEK(respuesta,'MER1','ARTICUL1')
         ELSE
             respuesta=XSEEK(respuesta,'MER','ARTICULO')
         ENDIF
      else
         salida=.t.
      ENDIF
   ENDIF
endif
RETURN respuesta
