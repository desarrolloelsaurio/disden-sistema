FUNCTION DISPLBL
PARAMETER LB_DIJO,QUELBL,LB_COMPLETO,SONDOS,QUE_FILTRO, POR_LETRA, QUE_ORDEN
* LB_DIJO: LIMITE DEL LISTADO
* QUELBL: ETIQUETA O ENCABEZADO O BASE DE DATOS O MAILS
* LB_COMPLETO: TODA LA SELECCION
* SONDOS: SI VA DESDE HASTA
* QUE_FILTRO=QUE FILTRO USA
* POR_LETRA
* QUE_ORDEN=QUE ORDEN USA
STORE .T. TO M.OK
=OPCAG()
=OPCLI()
DO CASE
CASE EMPTY(QUE_FILTRO) .OR. QUE_FILTRO="C"
   hish="CLIENTE"
   hanashim="CLIENTES"
   COLADOR="C"
CASE QUE_FILTRO="I"
   hish="INTERESADO"
   hanashim="INTERESADOS"
   COLADOR="I"
ENDCASE
DO CASE
CASE LB_DIJO=1
   STORE NUL TO M.RESPUESTA
   SAL_hish=IIF(COLADOR="C",;
     elicli("a Listar",-1,1),;
     ELIINTE("a Listar",-1,1))
   IF !empty(sal_hish)
      FISC="PER.CODCLI='"+PER.CODCLI+"'"
      DO CASE
      CASE QUELBL=1
         REPO FORM ENCABEZ TO PRIN NOCONSOLE ;
           WHILE &FISC
      CASE QUELBL=2
         LABEL FORM CLI1 TO PRIN PROM NOCONSOLE ;
           WHILE &FISC
      CASE QUELBL=3
         eldir=getd(path)
         eltex=''
         labase=intex("NOMBRE",40,"")
         if !Empty(labase)
              labase=eldir+alltr(eltex)
         	=WORKING()
         	=DOTALK()
         	SORT ON CLIENTE TO (labase) WHILE &FISC FIELD CODCLI,CLIENTE,DOMICILIO,LOCALIDAD,TELEFONO,DETALLE, TEXTO3
         	=PRXAREA(.T.)
         	USE (labase) alias prueba
         	SET ORDER TO TAG CIUCOD IN MIX
         	SET RELA TO LOCALIDAD INTO MIX
         	REPL ALL DETALLE WITH "("+ALLTRIM(STR(MIX.NU2))+") "+MIX.TEXTO1
         	USE IN PRUEBA
         	=UNTALK()
         	=UNWORK()
         endif
      ENDCASE
      STORE .F. TO M.OK
   ELSE
      STORE .F. TO M.OK
      =NOSELEC(HISH)
   ENDIF
CASE LB_DIJO=2
   STORE NUL TO M.RESPUESTA, elcod, laloca
    IF !EMPTY(ELICIU("a Listar",-1,1))
        store '"'+SUBS(MIX.TEXTO2,7,6)+'"'  to elcod
        store alltrim(mix.texto1) to laloca
    ENDIF
        STORE NUL TO M.RESPUESTA
        STORE 2 TO M.FILCAG
        STORE "" TO FISC,TT,TTCAG,QUECAG
        =QW_CAG(.F.,.F.,"PER.CAG")
        IF QUECAG#".F."
            SELE PER
            SET ORDER TO
            if !empty(FISC)
               FISC=FISC+".AND."
            endif
        ELSE
            =NOSELEC("LOCALIDAD")
        ENDIF
        if !empty(laloca)
	        FISC=FISC+"PER.LOCALIDAD="+ELCOD+" .and. "+QUECAG+" .AND. !EMPTY(PER.DOMICILIO) .and. filtro='"+colador+"'"
	  else
	        FISC=FISC+QUECAG+" .AND. !EMPTY(PER.DOMICILIO) .and. filtro='"+colador+"'"
	  endif
   IF POR_LETRA
      store " " to m.eltex
      IF INTEX("1ª Letra de Clientes a Listar",3)
         store m.eltex to m.eltex1
         store " " to m.eltex
         IF INTEX("Ult. Letra de Clientes a Listar",3)
            =opcli()
            SELE PER
            SET ORDER TO TAG CLIENTES
            if empty(FISC)
               FISC=""
            ELSE
               FISC=FISC+".AND."
            endif
            FISC=FISC+"LEFT(PER.CLIENTE,3)>='"+ELTEX1+;
              "' .and. !empty(per.domicilio) .and."+;
              "LEFT(PER.CLIENTE,3)<='"+ELTEX+"'"
         ELSE
            =NOSELEC("LETRA")
            STORE .F. TO M.OK
         endif
      ELSE
         =NOSELEC("LETRA")
         STORE .F. TO M.OK
      ENDIF
   ENDIF
   
CASE LB_DIJO=3
   SELE PER
   SET ORDER TO
   FISC="!EMPTY(PER.DOMICILIO) .and. filtro='"+colador+"'"
CASE LB_DIJO=4
   =OPZON()
   STORE NUL TO M.RESPUESTA
   IF ELIZON("a Listar",-1,1)
      LAZON=LEFT(MIX.TEXTO2,2)
      SELE PER
      SET ORDER TO
      FISC="per.texto1='"+lazon+"' .and. !empty(per.domicilio) .and. filtro='"+colador+"'"
   ELSE
      =NOSELEC("ZONA")
      STORE .F. TO M.OK
   ENDIF
CASE LB_DIJO=5
   store " " to m.eltex
   IF INTEX("1ª Letra de Clientes a Listar",1)
      =opcli()
      SELE PER
      SET ORDER TO TAG CLIENTES
      FISC="LEFT(PER.CLIENTE,1)='"+ELTEX+"' .and. !empty(per.domicilio)"
   ELSE
      =NOSELEC("LETRA")
      STORE .F. TO M.OK
      SELE PER
      SET ORDER TO
   ENDIF

CASE LB_DIJO=6
   STORE NUL TO M.RESPUESTA
   STORE 2 TO M.FILCAG
   STORE "" TO FISC,TT,TTCAG,QUECAG
   =QW_CAG(.F.,.F.,"PER.CAG")
   IF QUECAG#".F."
      SELE PER
      SET ORDER TO
      FISC=QUECAG+" .AND. !EMPTY(PER.DOMICILIO) .and. filtro='"+colador+"'"
   ELSE
      STORE .F. TO M.OK
      =NOSELEC("AGRUPACION")
   ENDIF

   =OPPER()
   =OPMIX()
   STORE NUL TO M.RESPUESTA
   M.elmes=INFIC("Mes a Listar",12)
   if last()#27 .AND. !EMPTY(M.ELMES)
       SELE PER
       SET ORDER TO 
       FISC=FISC+" .and.  month(per.fechanac)="+str(m.elmes,3)
    endif
    
CASE LB_DIJO=7
    STORE NUL TO M.RESPUESTA, elcod, laloca
    IF !EMPTY(ELICIU("a Listar",-1,1))
        store '"'+SUBS(MIX.TEXTO2,7,6)+'"'  to elcod
        store alltrim(mix.texto1) to laloca
        STORE NUL TO M.RESPUESTA
        STORE 2 TO M.FILCAG
        STORE "" TO FISC,TT,TTCAG,QUECAG
        =QW_CAG(.F.,.F.,"PER.CAG")
        IF QUECAG#".F."
            SELE PER
            SET ORDER TO
            FISC="PER.LOCALIDAD="+ELCOD+" .and. "+QUECAG+" .AND. !EMPTY(PER.DOMICILIO) .and. filtro='"+colador+"'"
        ELSE
            STORE .F. TO M.OK
            =NOSELEC("AGRUPACION")
        ENDIF
    ENDIF
   IF POR_LETRA
      store " " to m.eltex
      IF INTEX("1ª Letra de Clientes a Listar",3)
         store m.eltex to m.eltex1
         store " " to m.eltex
         IF INTEX("Ult. Letra de Clientes a Listar",3)
            =opcli()
            SELE PER
            SET ORDER TO TAG CLIENTES
            if empty(FISC)
               FISC=""
            ELSE
               FISC=FISC+".AND."
            endif
            FISC=FISC+"LEFT(PER.CLIENTE,3)>='"+ELTEX1+;
              "' .and. !empty(per.domicilio) .and."+;
              "LEFT(PER.CLIENTE,3)<='"+ELTEX+"'"
         ELSE
            =NOSELEC("LETRA")
            STORE .F. TO M.OK
         endif
      ELSE
         =NOSELEC("LETRA")
         STORE .F. TO M.OK
      ENDIF
   ENDIF

    
    
OTHERWISE
   STORE .F. TO M.OK
   SELE PER
   SET ORDER TO
ENDCASE

IF TYPE("QUE_ORDEN") ="C"
	SET ORDE TO (QUE_ORDEN)
ENDIF

IF OK
   IF !LB_COMPLETO
      STORE NUL TO M.RESPUESTA
      sal_hish=iif(colador="C",;
        ELICLI("inicial",-1,1),;
        ELIINTE("inicial",-1,1))
      if !empty(sal_hish)
         FISC=FISC+" .AND. PER.CODCLI>='"+PER.CODCLI+"'"
         IF SONDOS
            STORE NUL TO M.RESPUESTA
            sal_hish=iif(colador="C",ELICLI("final",-1,1),ELIINTE("final",-1,1))
            IF !EMPTY(SAL_HISH)
               FISC=FISC+" .AND. PER.CODCLI<'"+PER.CODCLI+"'"
               FISC=FISC+" .AND. FILTRO='"+COLADOR+"'"
            ELSE
               =NOSELEC(hish+" FINAL")
               STORE .F. TO M.OK
            ENDIF
         ENDIF
      ELSE
         =NOSELEC(hish+" INICIAL")
         STORE .F. TO M.OK
      ENDIF
   ENDIF
   IF OK
      SELE PER
      DO CASE
      CASE QUELBL=1
         repo form encabez to prin ;
           NOCONSOLE FOR &FISC
      CASE QUELBL=2
         LABEL FORM CLI1 TO PRIN PROM ;
           NOCONSOLE FOR &FISC
      CASE QUELBL=3
         eldir=getd(path)
         eltex='' 
         labase=intex("NOMBRE",40,"")
         if !Empty(labase)
              labase=eldir+alltr(eltex)
         	=WORKING()
         	=DOTALK()
         	SORT ON CLIENTE TO (labase) FOR &FISC ;
           		FIELD CODCLI,CLIENTE,DOMICILIO,LOCALIDAD,TELEFONO,DETALLE, TEXTO3
         	=PRXAREA(.T.)
         	USE (labase) alias prueba
         	SET ORDER TO TAG CIUCOD IN MIX
         	SET RELA TO LOCALIDAD INTO MIX
         	REPL ALL DETALLE WITH "("+ALLTRIM(STR(MIX.NU2))+") "+MIX.TEXTO1
         	USE IN PRUEBA
         	=UNTALK()
         	=UNWORK()
         endif
      ENDCASE
   ENDIF
ENDIF
SELE PER
SET ORDER TO
RETURN
