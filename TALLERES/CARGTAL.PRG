* CARGA DE TALLERES
#DEFINE TEX_CALC "CALCULANDO - ESPERE POR FAVOR" && TEX_CALC
    
	    STORE NUL TO M.RESPUESTA
	    IF !EMPTY(ELIRUB("a Listar",-1,1))
	       ELRUBRO=LEFT(MIX.TEXTO2,3)
	       STORE "" TO TT,TTPRC
	       STORE 10 TO REN,COL
	       STORE "FAX.PRC" TO CUAL
           FISC=QWPRC(4,"FAX.PRC")
           FISC=LEFT(FISC,AT(CHR(250),FISC)-1)
	       =MEN_LIN(TEX_CALC)
	       =WORKING()
	       =DOTALK()
	       SELE COR
	       SET ORDER TO TAG NUMERO
	       SELE FAX
	       SET RELA TO NUMERO INTO COR
	       TMP=GENTMP()
	       SET ORDER TO
	       =FLOCK("FAX") .OR. FLOK("FAX")
	       SORT ON TALLER,NUMERO ;
	       FOR LEFT(COR.ARTICULO,3)=ELRUBRO .AND. ;
	       TIPO="@" .AND. ;
           !EMPTY(EF) .AND. EMPTY(SF) .AND. ;
	       &FISC ;
	       TO (TMP)
	       UNLO IN FAX
	       SET RELA OFF INTO COR
	       =PRXAREA(.T.)
	       USE (TMP) ALIAS TMP EXCL
	       DO OPTALS
	       CREATE CURSOR TMP1 ;
	       (TALCOD C(10),;
	       TALLERES C(30),;
           ORDENES N(4),;
           CANTIDAD N(8),;
           FECHA D,;
           USUARIO C(10))           
           SCAT MEMV BLAN
           =IIF(PORP,CARGTALP(),CARGTALI())
           =OFF_TMP()
	    ENDIF
RETURN

FUNCTION REF
@ 0,0 SAY "CARGA DE TALLERES POR Rubro:"+alltrim(mix.texto1)
@ 1,0 SAY tt
           @ 23,20 SAY REPL("Ä",60)
           @ 24,0 SAY PADL(ALLTRIM(STR(MAXCAN)),80)           
           FOR A=0 TO 59 STEP 10
           @ 23,A+20 SAY "Á"
           @ 24,A+20 SAY PADR(ALLTRIM(STR(INT(MAXCAN*A/60))),5)
           NEXT
RETURN .T.