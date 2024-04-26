* ษออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LRESP.PRG                          บ
* บ COMENTARIO    : RESUMEN DE PRESTACION POR PANTALLA บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                           บ
* บ FECHA      : 08-20-93                              บ
* บ HORA       : 00:45:57am                            บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER               บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE ONE    1                                 && ONE
#DEFINE TWO    2                                 && TWO
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
 
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   LENTEX3=LEN(LIQ.TEXTO3)-5
   ACLA=PAIP+;
     PADC("Nง Orden",10)+PAIP+;
     PADC("Nง Afil.",LENTEX3)+PAIP+;
     PADC("Paciente",20)+PAIP+;
     PADC("Pr ctica",9)+PAIP+;
     "Cant"+PAIP+;
     PADC("Honorarios",XACDIGI)+PAIP+;
     PADC("Gastos",XACDIGI)+PAIP+;
     PADC("Total",XACDIGI)+PAIP
   **********************************
   STOR NUL TO CASOS,GASTOS,GALENOS,CATEGORIZ
   STOR NUL TO GALE_OS,GAST_OS,GALE_PAC,GAST_PAC
   STORE "งง" TO M.ELARANC
   LINEA=REPL("=",LEN(ACLA))
   SELE PRX
   SET ORDER TO TAG UNIDAD
   SELE PRA
   SET ORDER TO TAG CODPRA
   SELE LIQ
   SET RELA TO PRACTICA INTO PRA ADDI
   GO TOP
   ELTPR=TPR
   LAM=ALLTRIM(MUT.MUTUAL)
   LAM1=ALLTRIM(MUT.MUTUALABR)
   TT="Resumen de Prestaciขn Ambulatoria"+CRLF+;
     "OBRA SOCIAL:"+ALLTRIM(MUT.MUTUAL)+CRLF+;
     ALLTRIM(MUT.MUTUALABR)+CRLF+;
     ALLTRIM(SAYMIX(TPR,"TPRCOD"))
   **************************************
   =WIN0()
   PAG=ONE
   =CABPAN()
   =TIT_LIN(ONE)
   *****************************
   SCAN
	 STORE .F. TO HAYCAN      
      IF ELTPR#TPR
         =SAYFIN()
         *
         IF !FIN_LIN(ONE,NUL)
            EXIT
         ENDIF
         CLEA
         ELTPR=TPR
         TT="Resumen de Prestaciขn Ambulatoria"+CRLF+;
           "OBRA SOCIAL:"+LAM+CRLF+;
           LAM1+CRLF+;
           ALLTRIM(SAYMIX(ELTPR,"TPRCOD"))
         STOR PAG+ONE TO PAG
         =CABPAN()
         =TIT_LIN(TWO)
      ENDIF
      ****************
      IF !CHKLIN()
         EXIT
      ENDIF
      ? PAIP
      ?? LEFT(ORDEN,10)
      ?? PAIP
      ?? LEFT(TEXTO3,LENTEX3)
      ?? PAIP
      ?? LEFT(PROP(CLIENTE),20)
      ?? PAIP
      ?? SAYPR1(PRACTICA) PICT "@R 99.99.99!"
      ?? PAIP
      ELMUTUAL=LIQ.TEXTO1
      ELPLAN=LEFT(LIQ.TEXTO2,5)
      ******************************
      *** BUSCA ARANCEL DEL PLAN ***
      ******************************
      =XSEEK(ELMUTUAL+ELPLAN,"MUT","CODPLAN")
*      IF MUT.TAR#M.ELARANC
         ELARANC=MUT.TAR
         **********************************
         *** BUSCA PORCENTAJES DEL PLAN ***
         **********************************
         =XSEEK(ELMUTUAL+ELPLAN+"UNI","MUX","TIPO")
         ALPAC=MUX.AC_PACIEN
         ALMUT=MUX.AC_MUTUAL
 *     ENDIF
      ***********************************************
      *** VERIFICA SI HAY VARIAS PRACTICAS REPETIDAS
      *** PARA SUMAR DIRECTAMENTE AL TOTAL
      ***********************************************
      IF XSEEK(LIQ.PRACTICA+LIQ.PRXCOD+LIQ.PRACTICA,"PRX","UNIPRAD")
         STORE PRX.CANTIDAD+1 TO M.CTDD
      ELSE
         STORE 1 TO M.CTDD
      ENDIF
      ***********************************************
      ?? STR(M.CTDD,4)
      ?? PAIP
		GLN_PARC=PRA.CANTIDAD1*M.CTDD*;
		SAYGRL(ELARANC+PRA.UNIDAD1,"MIX","ARACOD","MIX.NU1")
	  GLN_PARC=GLN_PARC*ALMUT/100
	  GLN=GLN_PARC
      ?? STR(GLN,XACDIGI,2)
      ?? PAIP

		GTS_PARC=PRA.CANTIDAD2*;
		M.CTDD*;
		SAYGRL(ELARANC+PRA.UNIDAD2,"MIX","ARACOD","MIX.NU1")
		GTS_PARC=GTS_PARC*ALMUT/100
		GTS=GTS_PARC
      ?? STR(GTS,XACDIGI,2)
      ?? PAIP
      PARC=GTS+GLN
      ?? STR(PARC,XACDIGI,2)
      ?? PAIP
      GALE_OS=GALE_OS+GLN
      GAST_OS=GAST_OS+GTS
      **** SE GUARDA EL MATERIAL PARA DESPUES
      IF !EMPTY(PRA.UNIDAD3)
		 STORE .T. TO HAYCAN                  
         STORE PRA.UNIDAD3 TO M.PRAUNID3
         STORE PRA.TIPO3 TO M.PRATIPO3
         STORE M.CTDD TO M.CANTIOR,M.CANTI3
      ELSE
         STORE "" TO M.PRAUNID3,M.PRATIPO
      ENDIF
      *******
      =HAYCAT()
      **** CONTRASTE ?
      IF !EMPTY(PRA.CONTRASTE)
         =SAYCONT()
      ENDIF
      ********** COMPONENTES
      SELE PRX
      SET ORDER TO TAG CODPRX1
      IF SEEK(LIQ.PRACTICA+LIQ.PRXCOD)
         SCAN WHILE PRX.CODPRA=LIQ.PRACTICA .AND. ;
              PRX.CODPRX=LIQ.PRXCOD
            IF EMPTY(PRX.UNIPRA) .OR. ;
               PRX.UNIPRA#LIQ.PRACTICA
               IF PRX.TIPO#"PRA"
                  =SAYMAT(PRX.UNIDAD,PRX.TIPO)
               ELSE
                  =SAYPRA(PRX.UNIPRA)
               ENDIF
               =CHKLIN()
            ENDIF
         ENDSCAN
      ENDIF
      SELE LIQ
      **** MATERIAL ?
      IF HAYCAN .AND. ;
      !EMPTY(PRAUNID3)
         =SAYMAT(PRAUNID3,PRATIPO3,.T.)
      ENDIF
 
      IF ROW()>21
         IF !FIN_LIN(ONE,NUL)
            EXIT
         ENDIF
         CLEA
         STOR PAG+ONE TO PAG
         =CABPAN()
         =TIT_LIN(TWO)
      ENDIF
      **********************
      *  MAIN IMPRESIONES **
      **********************
   ENDSCAN
   =FIN_LIN(TWO,CASOS)
   =RELEWIN("WIN")
   =IAUD("")
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
 
FUNCTION SAYMAT
PARAMETER SA_UNID,SA_TIPO,SA_VIENE
=XSEEK(SA_UNID,"MIX",SA_TIPO+"COD")
? PAIP
?? SPACE(10)
?? PAIP
?? SPACE(LENTEX3)
?? PAIP
?? PROP(MIX.TEXTO1)
?? PAIP
?? SPACE(9)
?? PAIP
IF !SA_VIENE
	M.CANTI3=PRX.CANTIDAD
ELSE
   M.CANTI3=M.CANTIOR	
ENDIF
?? STR(M.CANTI3,4)
?? PAIP
?? SPACE(XACDIGI)
?? PAIP
IF XSEEK(ELMUTUAL+ELPLAN+SA_TIPO,"MUX","TIPO")
   GTS=M.CANTI3*MIX.NU1*MUX.AC_MUTUAL/100
ELSE
   GTS=M.CANTI3*MIX.NU1
ENDIF
?? STR(GTS,XACDIGI,2)
?? PAIP
?? STR(GTS,XACDIGI,2)
?? PAIP
GAST_OS=GAST_OS+GTS
RETURN .T.
 
FUNCTION SAYCONT
? PAIP
?? SPACE(10)
?? PAIP
?? SPACE(LENTEX3)
?? PAIP
?? PADR("Contraste "+ALLTRIM(STR(PRA.CONTRASTE))+" %",20)
?? PAIP
?? SPACE(9)
?? PAIP
?? SPACE(4)
?? PAIP
GLN=GLN_PARC*(PRA.CONTRASTE/100)*(ALMUT/100)
?? STR(GLN,XACDIGI,2)
?? PAIP
GTS=GTS_PARC*(PRA.CONTRASTE/100)*(ALMUT/100)
?? STR(GTS,XACDIGI,2)
?? PAIP
?? STR(GTS+GLN,XACDIGI,2)
?? PAIP
GAST_OS=GAST_OS+GTS
GALE_OS=GALE_OS+GLN
RETURN haycat()
 
FUNCTION SAYPRA
PARAMETER LAPRA
? PAIP
?? SPACE(10)
?? PAIP
?? SPACE(LENTEX3)
?? PAIP
=XSEEK(LAPRA,"PRA","CODPRA")
?? LEFT(PROP(PRA.PRACTICA),20)
?? PAIP
?? SAYPR1(LAPRA) PICT "@R 99.99.99!"
?? PAIP
M.CTDD=PRX.CANTIDAD
?? STR(M.CTDD,4)
?? PAIP
GLN=PRA.CANTIDAD1*M.CTDD*;
  SAYGRL(ELARANC+PRA.UNIDAD1,"MIX","ARACOD","MIX.NU1")*(ALMUT/100)
?? STR(GLN,XACDIGI,2)
?? PAIP
GTS=PRA.CANTIDAD2*;
  M.CTDD*;
  SAYGRL(ELARANC+PRA.UNIDAD2,"MIX","ARACOD","MIX.NU1")*(ALMUT/100)
?? STR(GTS,XACDIGI,2)
?? PAIP
?? STR(GTS+GLN,XACDIGI,2)
?? PAIP
GAST_OS=GAST_OS+GTS
GALE_OS=GALE_OS+GLN
=HAYCAT()
*
IF !EMPTY(PRA.UNIDAD3)
   =SAYMAT(PRA.UNIDAD3,PRA.TIPO3)
ENDIF
*
RETURN
 
FUNCTION SAYPR1
PARAMETER PRA1
IF EMPTY(RIGHT(PRA1,1))
   RETURN PRA1
ENDIF
IF RIGHT(PRA1,1)="A" .OR. ;
     RIGHT(PRA1,1)="B"
   RETURN PRA1
ENDIF
RETURN LEFT(PRA1,6)+" "
 
FUNCTION HAYCAT
** BUSCA MEDICO PARA CATEGORIZACION
IF XSEEK(LIQ.INTERNO,"PER","INTERCOD")
   CAT=VAL(PER.DETALLE)
   LACAT=GLN*CAT/100
   CATEGORIZ=CATEGORIZ+LACAT
ENDIF
RETURN .T.
 
FUNCTION SAYFIN
? M.LINEA
*** BRUTO
LAPOS=LEN(M.LINEA)-(XACDIGI+3)*3
? "Totales Brutos:"
?? STR(GALE_OS,XACDIGI+2,2) AT LAPOS
?? PAIP
?? STR(GAST_OS,XACDIGI+2,2)
?? PAIP
?? STR(GALE_OS+GAST_OS,XACDIGI+2,2)
?? PAIP
*** CATEGORIZACION
? "Categorizaciขn:"
?? STR(CATEGORIZ,XACDIGI+2,2) AT LAPOS
?? paip
*** TOTALES
\? "Totales:"
?? STR(CATEGORIZ+GALE_OS,XACDIGI+2,2) AT LAPOS
?? PAIP
?? STR(GAST_OS,XACDIGI+2,2)
?? PAIP
?? STR(GALE_OS+GAST_OS+CATEGORIZ,XACDIGI+2,2)
?? PAIP
STOR NUL TO CASOS,GASTOS,GALENOS,CATEGORIZ
STOR NUL TO GALE_OS,GAST_OS,GALE_PAC,GAST_PAC
RETURN .T.
 
FUNCTION CHKLIN
STORE .T. TO SAL_LIN
IF _PLINENO>63
   SAL_LIN=FIN_LIN(1,NUL)
   CLEA
   STORE PAG+1 TO PAG
   =CABPAN()
   =TIT_LIN(TWO)
ENDI
RETURN SAL_LIN
