PARAMETER PORPAN
M.OPTAR=ALGUN(30,"Tipo de Listado",;
  "\<Completo;"+;
  IIF(CONTENIDO[5]="R","\","")+"Por \<Zona;"+;
  "Por \<Agrupación;"+;
  "Por \<Condición de IVA;"+;
  "Por \<Localidad;"+;
  "Informe de A\<grupación;"+;
  "Informe de Z\<onas;"+;
  "Clientes y  A\<grupación;"+;
  "Completo y \<Borrados;"+;
  "Clientes B\<orrados;"+;
   "An\<ula Listado")
DO CASE
CASE M.OPTAR=1 .or. ;
M.OPTAR=9
   M.COMPLET=ALGUN(30,"Inicio del Listado",;
  "\<Completo;"+;
  "\<Desde un Cliente;"+;
  "\<Desde una Letra")
  
   TT="Listado de "+TEXTO[3]
   TT1="Todos los "+TEXTO[3]
   SELE PER
   SET ORDER TO TAG CONTENIDO[4]
   if m.optar=9
    set dele off
   endif
   if m.complet=3
        minimo=space(30)
       do eliclitx.spr
       IF PORPAN
           REPO FORM LPERI1P PREV for CLIENTE>=minimo
       ELSE
             REPO FORM LPERI1 TO PRIN PROM NOCONSOLE for CLIENTE>=minimo
       ENDIF
   else
     if m.complet=2
         if elicli("a Listar",-1,1)
           minimo=per.CLIENTE
           IF PORPAN
             REPO FORM LPERI1P PREV for CLIENTE>=minimo
            ELSE
             REPO FORM LPERI1 TO PRIN NOCONSOLE for CLIENTE>=minimo
          ENDIF
       else
          =noselec("CLIENTE")
       endif
     else
       IF PORPAN
          REPO FORM LPERI1P PREV
        ELSE
          REPO FORM LPERI1 TO PRIN PROMPT NOCONSOLE 
       ENDIF
     endif
  endif
   set dele on
CASE M.OPTAR=10
   TT="Listado de "+TEXTO[3]
   TT1=TEXTO[3]+" Borrados" 
   SELE PER
   SET ORDER TO TAG CONTENIDO[4]
   set dele off
   IF PORPAN
      REPO FORM LPERI1P PREV for dele()
   ELSE
      REPO FORM LPERI1 TO PRIN PROMPT NOCONSOLE for dele()
   ENDIF
   set dele on
CASE M.OPTAR=2
   STORE NUL TO M.RESPUESTA
   IF !EMPTY(ELIZON("a Listar",-1,1))
      SELE PER
      SET ORDER TO TAG CONTENIDO[4]
      ELCOD=LEFT(MIX.TEXTO2,2)
      TT="Listado de "+TEXTO[3]
      TT1="Por Zona:"+alltrim(mix.texto1)
      IF PORPAN
      REPO FORM LPERI1P PREV for ;
           LEFT(PER.TEXTO1,2)=ELCOD
      ELSE
         REPO FORM LPERI1 TO PRIN PROMPT NOCONSOLE ;
           FOR LEFT(PER.TEXTO1,2)=ELCOD
      ENDIF
   ENDIF
CASE M.OPTAR=3
   STORE NUL TO M.RESPUESTA
   STORE 2 TO M.FILCAG
   STORE "" TO FISC,TT,TTCAG,QUECAG
   =QW_CAG(.F.,.F.,"PER.CAG")
   TT="Listado de "+TEXTO[3]
   TT1=TTCAG
   SELE PER
   SET ORDER TO TAG CONTENIDO[4]
   IF !EMPTY(QUECAG) .AND. ;
        QUECAG#".F."
      IF PORPAN
         REPO FORM LPERI1P prev ;
           FOR &QUECAG
      ELSE
         REPO FORM LPERI1 TO PRIN PROMPT NOCONSOLE ;
           FOR &QUECAG
      ENDIF
   ENDIF
CASE M.OPTAR=4
   STORE NUL TO M.RESPUESTA
   IF !EMPTY(ELIIVA("a Listar",-1,1))
      SELE PER
      SET ORDER TO TAG CONTENIDO[4]
      ELCOD=LEFT(MIX.TEXTO2,2)
      TT="Listado de "+TEXTO[3]
      TT1="Por Cond. IVA:"+alltrim(mix.texto1)
      IF PORPAN
         REPO FORM LPERI1P PREV ;
           FOR PER.CONDIVA=ELCOD
      ELSE
         REPO FORM LPERI1 TO PRIN PROMPT NOCONSOLE ;
           FOR PER.CONDIVA=ELCOD
      ENDIF
   ENDIF
CASE M.OPTAR=5
   STORE NUL TO M.RESPUESTA, elcod, laloca
   IF !EMPTY(ELICIU("a Listar",-1,1))
   	store subs(mix.texto2,7,6) to elcod
   	store alltrim(mix.texto1) to laloca
       STORE NUL TO M.RESPUESTA
      	STORE 2 TO M.FILCAG
   	STORE "" TO FISC,TT,TTCAG,QUECAG
   	=QW_CAG(.F.,.F.,"PER.CAG")
   	TT="Listado de "+TEXTO[3]
   	TT1=TTCAG +chr(13)+"Por Localidad: "+laloca
      SELE PER
      SET ORDER TO TAG CONTENIDO[4]
	IF !EMPTY(QUECAG) .AND. QUECAG#".F."
		FISC="PER.LOCALIDAD='"+ELCOD+"' .AND. "+QUECAG
		sele per
	      IF PORPAN
       		REPO FORM LPERI1P PREV  FOR &fisc
      		ELSE
	              REPO FORM LPERI1 TO PRIN PROMPT NOCONSOLE FOR &fisc
	      ENDIF
	 ENDIF
   ENDIF
CASE M.OPTAR=6       && INFORME DE AGRUPACION
   =WORKING()
   =DOTALK()
   =OPCAG()
   CREATE CURSOR TEMPORAL ;
     (CAGCOD C(10),;
     AGRUPAC C(20),;
     CANTIDAD N(5))
   INDEX ON CAGCOD TAG CAGCOD
   SELE PER
   SET ORDER TO TAG CODCLI
   SCAN
      ELCAG=ALLTRIM(SINCOSAS(PER.CAG))
      DO WHILE !EMPTY(ELCAG)
         ELCAGOK=LEFT(ELCAG,2)
         IF !EMPTY(ELCAGOK)
            IF XSEEK(M.ELCAGOK,"TEMPORAL","CAGCOD")
               REPL TEMPORAL.CANTIDAD WITH TEMPORAL.CANTIDAD+1
            ELSE
               SELE TEMPORAL
               APPE BLAN
               REPL CAGCOD WITH ELCAGOK
               REPL AGRUPAC WITH SAYMIX(ELCAGOK,"CAGCOD")
               REPL CANTIDAD WITH 1
            ENDIF
         ENDIF
         IF LEN(ELCAG)>2
             ELCAG=SUBSTR(ELCAG,3)
          ELSE
             ELCAG=""
          ENDIF
      ENDDO
      SELE PER
   ENDSCAN
   SELE TEMPORAL
   INDEX ON AGRUPAC TAG CAGCOD
   SET ORDER TO TAG CAGCOD
   tt="Listado de Clientes"
   tt1="Informe de Agrupación"
   eltexto1="AGRUPACION"
   =UNTALK()
   =UNWORK()
   IF PORPAN
   REPO FORM LCLI1 PREV
   ELSE
   REPO FORM LCLI1 TO PRIN PROMPT NOCONSOLE NOEJECT   
   ENDIF
   USE IN TEMPORAL   
CASE M.OPTAR=7       && INFORME DE ZONAS
   =WORKING()
   =DOTALK()
   =OPZON()
   CREATE CURSOR TEMPORAL ;
     (CAGCOD C(10),;
     AGRUPAC C(20),;
     CANTIDAD N(5))
   INDEX ON CAGCOD TAG CAGCOD
   SELE PER
   SET ORDER TO TAG CODCLI
SCAN
	IF !EMPTY(PER.TEXTO1)
		IF XSEEK(PER.TEXTO1,"TEMPORAL","CAGCOD")
			REPL TEMPORAL.CANTIDAD WITH TEMPORAL.CANTIDAD+1
		ELSE
			SELE TEMPORAL
			APPE BLAN
			REPL CAGCOD WITH PER.TEXTO1
			REPL AGRUPAC WITH SAYMIX(LEFT(PER.TEXTO1,2),"ZONCOD")
			REPL CANTIDAD WITH 1
		ENDIF
	ENDIF
	SELE PER
ENDSCAN
   =OPCAG()
   SELE TEMPORAL
   INDEX ON AGRUPAC TAG CAGCOD
   SET ORDER TO TAG CAGCOD
   tt="Listado de Clientes"
   tt1="Informe de Zonas"
   eltexto1="ZONA"
   =UNTALK()
   =UNWORK()
   IF PORPAN
   REPO FORM LCLI1 PREV
   ELSE
   REPO FORM LCLI1 TO PRIN PROMPT NOCONSOLE NOEJECT   
   ENDIF
   USE IN TEMPORAL
CASE M.OPTAR=8
   tt="Listado de Clientes"
   tt1="Agrupación de los Clientes"
   =working()
   =dotalk()
   CREATE CURSOR TEMPORAL ;
   (FILTRO C(1),CODCLI C(10),CLIENTE C(30),CAG C(60),;
   AG1 C(20),;
      AG2 C(20),;
         AG3 C(20),;
            AG4 C(20),;
               AG5 C(20),;
                  AG6 C(20),;
                     AG7 C(20),;
   AGC1 C(2),;
      AGC2 C(2),;
         AGC3 C(2),;
            AGC4 C(2),;
               AGC5 C(2),;
                  AGC6 C(2),;
                     AGC7 C(2))
SELE PER
SET ORDER TO TAG CLIENTES
SELE TEMPORAL
APPE FROM DBF("PER")
SELE TEMPORAL
DELE FOR FILTRO#"C"
REPL ALL AGC1 WITH LEFT(CAG,2),;
AGC2 WITH SUBSTR(CAG,4),;
AGC3 WITH SUBSTR(CAG,7),;
AGC4 WITH SUBSTR(CAG,10),;
AGC5 WITH SUBSTR(CAG,13),;
AGC6 WITH SUBSTR(CAG,16),;
AGC7 WITH SUBSTR(CAG,19)
SET ORDER TO TAG CAGCOD IN MIX
SET RELA TO AGC1 INTO MIX
REPL ALL AG1 WITH MIX.TEXTO1
SET RELA TO AGC2 INTO MIX
REPL ALL AG2 WITH MIX.TEXTO1
SET RELA TO AGC3 INTO MIX
REPL ALL AG3 WITH MIX.TEXTO1
SET RELA TO AGC4 INTO MIX
REPL ALL AG4 WITH MIX.TEXTO1
SET RELA TO AGC5 INTO MIX
REPL ALL AG5 WITH MIX.TEXTO1
SET RELA TO AGC6 INTO MIX
REPL ALL AG6 WITH MIX.TEXTO1
SET RELA TO AGC7 INTO MIX
REPL ALL AG7 WITH MIX.TEXTO1
INDEX ON CLIENTE TAG CLIENTE
SET ORDER TO TAG CLIENTE
=untalk()
=Unwork()
   IF PORPAN
      REPO FORM LPERI2 PREV
   ELSE
      REPO FORM LPERI2 TO PRIN PROMPT NOCONSOLE
   ENDIF
   USE IN TEMPORAL
ENDCASE
