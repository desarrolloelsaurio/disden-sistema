*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       � 08/16/94            QUERYFRE.PRG               12:02:48 �
*       �                                                         �
*       픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       � Author's Name                                           �
*       �                                                         �
*       � Copyright (c) 1994 Company Name                         �
*       � Address                                                 �
*       � City,     Zip                                           �
*       �                                                         �
*       � Description:                                            �
*       � This program was automatically generated by GENSCRN.    �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

PARAMETERS porpan

*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       �         QUERYFRE/MS-DOS Setup Code - SECTION 1          �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*

#REGION 1

=HORA_ULP(PROGRAM())
STORE "" TO TTFAC,TTFEC,TTCLI,TTMER,TTVIA,TTPAG
STORE 1  TO FILFAC,FILFEC,FILCLI,FILMER,FILVIA,FILPAG
STORE "" TO QUEFAC,QUEFEC,QUECLI,QUEMER,QUEVIA,QUEPAG
store 1 to minobj,FACINI
store 3 to maxobj,FACFIN
FISC="empty(tipo) .or. tipo='FA'"+iif(ELTIPO='A' .OR. ELTIPO='B',".and. LEFT(FAC.FACTURA,1)=ELTIPO","")
TT=TIT_INVOS


#REGION 0
REGIONAL m.currarea, m.talkstat, m.compstat

*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       �                MS-DOS Window definitions                �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*

IF NOT WEXIST("queryfre") ;
	OR UPPER(WTITLE("QUERYFRE")) == "QUERYFRE.PJX" ;
	OR UPPER(WTITLE("QUERYFRE")) == "QUERYFRE.SCX" ;
	OR UPPER(WTITLE("QUERYFRE")) == "QUERYFRE.MNX" ;
	OR UPPER(WTITLE("QUERYFRE")) == "QUERYFRE.PRG" ;
	OR UPPER(WTITLE("QUERYFRE")) == "QUERYFRE.FRX" ;
	OR UPPER(WTITLE("QUERYFRE")) == "QUERYFRE.QPR"
	DEFINE WINDOW queryfre ;
		FROM INT((SROW()-14)/2),INT((SCOL()-80)/2) ;
		TO INT((SROW()-14)/2)+13,INT((SCOL()-80)/2)+79 ;
		TITLE ' L죑ites del Listado de '+tit_invos+' ' ;
		NOFLOAT ;
		NOCLOSE ;
		SHADOW ;
		NOMINIMIZE ;
		DOUBLE ;
		COLOR SCHEME 1
ENDIF


*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       �              QUERYFRE/MS-DOS Screen Layout              �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*

#REGION 1
IF WVISIBLE("queryfre")
	ACTIVATE WINDOW queryfre SAME
ELSE
	ACTIVATE WINDOW queryfre NOSHOW
ENDIF
@ 1,2 GET m.filfac ;
	PICTURE "@*RVN "+PADR('\<Todas las '+TIT_INVOS,20)+";\<Entre N즡eros;\<Opciones ;
	SIZE 1,36,0 ;
	DEFAULT 1 ;
	WHEN betw(_curobj,minobj,maxobj) ;
	VALID _qsm0ptkh0() ;
	MESSAGE "L죑ites del Listado de Facturas"
@ 1,27 GET m.filcli ;
	PICTURE "@*RVN \<Todos los Clientes;\<Opciones;\<Resumen por Cliente" ;
	SIZE 1,23,0 ;
	DEFAULT 1 ;
	WHEN betw(_curobj,minobj,maxobj) ;
	VALID VAL_OBJ() ;
	MESSAGE "L죑ites de Clientes"
@ 1,52 GET m.filfec ;
	PICTURE "@*RVN \<Todas las Fechas;\<Entre Fechas;\<Resumen por Fecha" ;
	SIZE 1,21,0 ;
	DEFAULT 1 ;
	WHEN betw(_curobj,minobj,maxobj) ;
	VALID val_obj() ;
	MESSAGE "L죑ites de Fecha"
@ 5,2 GET m.filvia ;
	PICTURE "@*RVN "+PADR('\<Todos los '+BIAJAS,20)+";\<Opciones;"+PADR('\<Resumen por '+BIAJA,20 ;
	SIZE 1,34,0 ;
	DEFAULT 1 ;
	WHEN betw(_curobj,minobj,maxobj) ;
	VALID VAL_OBJ() ;
	MESSAGE "L죑ites de "+BIAJAS
@ 5,27 GET m.filvia ;
	PICTURE "@*RVN \<Todas las Cond. Vta.;\<Opciones;\<Resumen por Cond." ;
	SIZE 1,24,0 ;
	DEFAULT 1 ;
	WHEN betw(_curobj,minobj,maxobj) ;
	VALID VAL_OBJR(3) ;
	MESSAGE "L죑ites de Condiciones de Venta"
@ 5,52 GET m.filMER ;
	PICTURE "@*RVN \<Producto;\<Marca;\<Rubro;R\<ubro-Subrubro;Ru\<bro-Subrubro-Marca" ;
	SIZE 1,24,0 ;
	DEFAULT 1 ;
	WHEN betw(_curobj,minobj,maxobj) ;
	VALID VAL_OBJ(.T.) ;
	MESSAGE "L죑ites de Producto"

IF NOT WVISIBLE("queryfre")
	ACTIVATE WINDOW queryfre
ENDIF

READ CYCLE

RELEASE WINDOW queryfre

#REGION 0

*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       �              QUERYFRE/MS-DOS Cleanup Code               �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*

#REGION 1
IF LAST()#27
   IF FILfac=1
      TTQUE=CHR(13)+CHR(10)+"Todas las Facturas"
   ENDIF
   STORE .T. TO HABILITADO
   =qw_cli(4,27,'fax.codcli')
   =qw_fec(4,52,'fac.fechaop')
   =qw_via(8,2,'fac.codvia')
   =qw_pag(8,27,'fac.condpago')
   FILMER=iif(FILmer=1,12,IIF(FILMER=2,5,IIF(FILMER=3,2,IIF(FILMER=4,10,IIF(FILMER=5,11,12)))))
   =qw_mer(8,52,'fax.articulo',FILMER)
   ***** FISC
   FISC=qw_fisc("",quefac)
   FISC=qw_fisc(FISC,quefec)
   FISC=qw_FISC(FISC,quecli)
   FISC=qw_FISC(FISC,quevia)
   FISC=qw_FISC(FISC,quepag)
   FISC=qw_FISC(FISC,quecli)
   FISC=qw_FISC(FISC,quemer)
   FISC=IIF(EMPTY(FISC),'.T.',FISC)
   ***** TITULOS
   store "Resumen por " to ressu
   ttcli=iif(filCLI=3,RESSU+'Cliente',ttcli)
   ttFEC=iif(filFEC=3,RESSU+'Fecha',ttfec)
   ttcli=iif(filvia=3,RESSU+biaja,ttcli)
   ttpag=iif(filFEC=3,RESSU+'Cond. de Venta',ttfec)

   TTQUE=QW_TT(TTfac)+qw_tt(ttfec)+QW_TT(TTcli)++QW_TT(TTvia)+QW_TT(TTpag)+QW_TT(TTmer)
   TT=TTQUE
   **** AL FIN LISTADOS
   =LFACRELA()
   =UNTALK()
   IF PORPAN
      =REPORTE("LFACPV",FISC)
      =ktruch()
   ELSE
      DO LFACIV WITH FILUNI
      =ktruch()
   ENDIF
ENDIF
=REOPFAC()
RETURN LAST()#27


*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       � _QSM0PTKH0           m.filfac VALID                     �
*       �                                                         �
*       � Function Origin:                                        �
*       �                                                         �
*       � From Platform:       MS-DOS                             �
*       � From Screen:         QUERYFRE,     Record Number:    2  �
*       � Variable:            m.filfac                           �
*       � Called By:           VALID Clause                       �
*       � Snippet Number:      1                                  �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*
FUNCTION _qsm0ptkh0     &&  m.filfac VALID
#REGION 1
IF READKEY()=15 .OR. READKEY()=271
   if _curobj=1
      STORE 16 TO _CUROBJ,MINOBJ
      MAXOBJ=MINOBJ+4
   else
      MINOBJ=CEIL(_CUROBJ/3)*3+1
      MAXOBJ=MINOBJ+2
      _CUROBJ=MINOBJ
   endif
ENDIF
RETURN .T.