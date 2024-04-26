* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : CTRL2_LI.PRG                                             บ
* บ COMENTARIO    : DERIVA A LISTADOS POR IMPRESORA - VIENE DE SCREEN2       บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION CTRL2_LI
EXTERNAL ARRAY OTROS
EXTERNAL ARRAY TEXTO
EXTERNAL PROCEDURE LGARJI
C_ULPR=ULPR
DO CASE
   #IF "LAB" $ CURD()
   CASE WEXIST("LIQ")
      DO LPAC1
   #ENDIF
CASE WEXIST("PRC")
   	acla='|  CODIGO  |'+padc("PROC FABRICACION",30)+PAIP+PADC("COSTO",XACDIGI)+"|FECHA IN|  USUARIO |"
	TT='Listado de Procesos de Fabricaciขn'
	=LGRL2(.F.,"PRC","LPRC1()","","LPRC")
CASE WEXIST("IDATOTAL")
   DO LDTT
CASE WEXIST("MIX")
   IF LEFT(OTROS[1],3)="BAN"
      DO LBAN0
   ELSE
         IF LEFT(OTROS[1],3)="PAG"
            STORE "" TO CASOS,ACLA,TT
            =LPAGX0()
            DO LGRLI WITH "MIX","LPAGX1()","COND. DE PAGO","LPAGI"
         ELSE
            ULPR="L"+LEFT(OTROS[1],3)+"I"
            DO LMIXI
         ENDIF
   ENDIF
   #IF "NOVO" $ CURDIR()
   CASE WEXIST("MI1")
      ULPR="L"+LEFT(OTROS[1],3)+"I"
      DO LMI1I
   #ENDIF
   #IF "ALQUIL" $ CURDIR()
   CASE WEXIST("ALQ")
      DO LALQ
   CASE WEXIST("INM")
      DO LINM
   #ENDIF
   #IF "LABORA" $ CURDIR()
   CASE WEXIST("PRA")
      IF WEXIST("XPRA")
         IF "INSTRUCCIONES" $ UPPER(WTIT("XPRA"))
            DO LPRAJI
            SELE PRA
         ELSE
            IF ALLTRIM(UPPER(WTITL("XPRA")))=UPPER("Componentes de la Pr ctica") .OR. ;
                 ALLTRIM(UPPER(WTITL("XPRA")))=UPPER("Ingresa Pr cticas en Pr cticas")
               DO LPRX
            ENDIF
         ENDIF
      ELSE
         =QUERYPRA()
      ENDIF
   #ENDIF
CASE WEXIST("XPER")
   ELTIWI=ALLTRIM(UPPER(WTIT("XPER")))
   DO CASE
      #IF "NOVO" $ CURDIR()
      CASE ELTIWI='INGRESO DE MARCAS'
         TT="Listado de Services"
         DO LSERMARI
      #ENDIF
   CASE "LEGAJO" $ ELTIWI
         TT="Legajo de "+TEXTO[3]
          DO LCLIJ
   ENDCASE
CASE WEXIST("PER")
   #IF "Wind" $ VERS()
      DO LCLI
   #ELIF "CAJAS" $ CURD()
      DO LCLI
   #ELSE
   DO CASE
   CASE WEXIST("INGPRS1")
         =LPRSP1()
   CASE CONTENIDO[5]='P'
       DO LPAC
   OTHER
       DO LPER
   ENDCASE
   #ENDIF
   #IF "LABORA" $ CURDIR()
   CASE WEXIST("MUT")
      IF WEXIST("XMUT")
      ELSE
         SELE MUT
         SET ORDER TO TAG MUTUALABR
         REPO FORM LMUT TO PRIN NOCONSOLE
      ENDIF
   #ENDIF
   #IF "PROD" $ CURDIR()
   CASE WEXIST("TAL")
      IF WEXIST("TAL")
         ACTI SCRE
         DO TALGRL WITH 10,20,'Lกmites del Listado por Impresora'
         ON SELE POPU TALGRL DO ltal
         ACTI POPU TALGRL
         RELE POPU TALGRL
         ACTI WIND TAL
      ENDIF
   #ENDIF
      #IF "PROD" $ CURDIR() .OR. "COMPR" $ CURDIR()
     CASE WEXIST("REQ")
        DO QUERYREQ.SPR
     #ENDIF
   #IF "PROD" $ CURDIR()
     CASE WEXIST("AVIS")
        DO QUERYAVI.SPR
     CASE WEXIST("TELS")
        DO QUERYTEL.SPR
     CASE WEXIST("COMS")
        DO QUERYCOM.SPR
     CASE WEXIST("OTRS")
        DO QUERYOTR.SPR
   #ENDIF
   #IF EMPTY(AT("LABOR",CURDIR())) .AND. EMPTY(AT("EXPEN",CURDIR())) .AND. EMPTY(AT("ALQUIL",CURDIR()))
   CASE WEXIST("RUB")
      EXTERNAL PROCEDURE LRUB0.PRG
      SELE rub
      SET ORDER TO TAG IIF(TYPE("ORDRUB")#'L' .OR. ORDRUB,'CODRUB','RUBRO')
      acla='|POSIC|CODIGO|'+PADC("RUBRO",20)+"|FECHA IN|  USUARIO |"
      tt='Listado de Rubros'
      DO LGRLI WITH "RUB","LRUB0()","","LRUBP"
   #ENDIF
CASE WEXIST("MER")
   DO LMER
CASE WEXIST("TMA")
	DO LTMA
OTHERWISE
   IF TYPE("L_DERIVA")#"U"
      C_LISTADO='L'+ULPR
   ELSE
      C_LISTADO='L'+ULPR+'I'
   ENDIF
   DO &C_LISTADO
   GO TOP
ENDCASE
=CTRL2_CA()
ULPR=C_ULPR
RETURN .T.
