* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : CTRL2_PA.PRG                                             บ
* บ COMENTARIO    : CONTROLA LIST. POR PANTALLA - VIENE DE SCREEN CONTROL2   บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION CTRL2_PA
C_ULPR=ULPR
DO CASE
CASE WEXIST("PRC")
   	acla='|  CODIGO  |'+padc("PROC FABRICACION",30)+PAIP+PADC("COSTO",XACDIGI)+"|FECHA IN|  USUARIO |"
	TT='Listado de Procesos de Fabricaciขn'
	=LGRL2(.T.,"PRC","LPRC1()","","LPRC")
CASE WEXIST("IDATOTAL")
   DO LDTT
   #IF "LAB" $ CURD()
   CASE WEXIST("LIQ")
      DO LPAC1 WITH .T.
   #ENDIF
CASE WEXIST("INGPRS")
   DO CASE
   CASE TIPOMERCA="A"
      RESPUESTA="LISPRS#8#40#Tipo de Listado#3;
#\<Un Avกo;
#Un \<Proveedor;
#Un \<Comprobante"
   CASE TIPOMERCA="T"
      RESPUESTA="LISPRS#8#40#Tipo de Listado#3;
#\<Una Tela;
#Un \<Proveedor;
#Un \<Comprobante"
   CASE TIPOMERCA="C"
      RESPUESTA="LISPRS#8#40#Tipo de Listado#3;
#\<Un Prod. Terminado;
#Un \<Proveedor;
#Un \<Comprobante"
   CASE TIPOMERCA="O"
      RESPUESTA="LISPRS#8#40#Tipo de Listado#3;
#\<Otro Producto;
#Un \<Proveedor;
#Un \<Comprobante"
   ENDCASE
   ACTI WIND INGPRS
   =DEFPOP()
   ON SELE POPU LISPRS DO LPRS WITH IIF(ALLT(PROMPT())="Un Proveedor","P",IIF(ALLT(PROMPT())="Un Comprobante","D",TIPOMERCA))
   ACTI POPU LISPRS
   RELE POPU LISPRS
CASE WEXIST("MIX")
   EXTERNAL ARRAY OTROS,TEXTO
   DO CASE
   CASE LEFT(OTROS[1],3)="PAG"
      STORE "" TO CASOS,ACLA,TT
      =LPAGX0()
      DO LGRLP WITH "MIX","LPAGX1()","COND DE PAGO","LPAGP"
   CASE LEFT(OTROS[1],3)="BAN"
      DO LBAN0 WITH .T.
   OTHERWISE
      ULPR="L"+LEFT(OTROS[1],3)+"P"
      DO LMIXP
   ENDCASE
   #IF "NOVO" $ CURDIR()
   CASE WEXIST("MI1")
      EXTERNAL ARRAY OTROS,TEXTO
      ULPR="L"+LEFT(OTROS[1],3)+"P"
      DO LMI1P
   #ENDIF
   #IF "ALQUI" $ CURDIR()
   CASE WEXIST("ALQ")
      DO LALQ WITH .T.
   CASE WEXIST("INM")
      DO LINM WITH .T.
   #ENDIF
   #IF "LABORA" $ CURDIR()
   CASE WEXIST("PRA")
      IF WEXIST("XPRA")                              && ES LISTADO DE INSTRUCCIONES O VAYA A SABER
         IF ALLTRIM(UPPER(WTITL("XPRA")))=UPPER("Componentes de la Pr ctica") .OR. ;
              ALLTRIM(UPPER(WTITL("XPRA")))=UPPER("Ingresa Pr cticas en Pr cticas")
            ** MUESTRA PRACTICA + COMPONENTES
            DO LPRX WITH .T.
         ENDIF
      ELSE
         =QUERYPRA(.T.)
      ENDIF
   #ENDIF
   #IF "NOVO" $ CURDIR()
   CASE WEXIST("XPER")
      ELTIW=ALLTRIM(UPPER(WTITL("XPER")))
      IF ELTIW='INGRESO DE MARCAS'
         STORE NUL TO RESPUESTA
         IF ELIMAR("a Listar",-1,1)
            FISC="PER.FILTRO='S' .AND. !EMPTY(AT('"+LEFT(MI1.TEXTO2,2)+"/',PER.CAG))"
            TT="Listado de Services"+chr(13)+chr(10)+"Marca "+alltrim(mi1.texto1)
            DO LSERMARP
         ENDIF
      ENDIF
   #ENDIF
CASE WEXIST("PER")
   #IF "Wind" $ VERS()
      IF WEXIST("XPER") .AND. "LEGAJO" $ UPPER(WTIT("XPER"))
          DO LCLIJ WITH .T.
      ELSE
          =IIF(CONTENIDO[5]="C"  OR  CONTENIDO[5]="R",LCLI(.T.),LPER(.T.))
      ENDIF
   #ELIF "CAJAS" $ CURD()
      DO LCLI WITH .T.
   #ELSE
      DO CASE
      CASE WEXIST("INGPRS1")
         =LPRSP1()
      CASE CONTENIDO[5]='P'
         DO LPAC WITH .T.
      OTHER
         DO LPER WITH .T.
      ENDCASE
   #ENDIF
   #IF "LABORA" $ CURDIR()
   CASE WEXIST("MUT")
      IF WEXIST("XMUT")
         DO LPLAN WITH .T.
      ELSE
         SELE MUT
         SET ORDER TO TAG MUTUALABR
         REPO FORM LMUT PREV
      ENDIF
   #ENDIF
   #IF "PROD" $ CURDIR()
   CASE WEXIST("TAL")
      IF WEXIST("TAL")
         ACTI SCRE
         DO TALGRL WITH 13,30,'Lกmites del Listado por Pantalla'
         ON SELE POPU TALGRL DO ltal WITH .T.
         ACTI POPU TALGRL
         RELE POPU TALGRL
         ACTI WIND TAL
      ENDIF
   #ENDIF
   #IF "PROD" $ CURDIR() .OR. "COMPR" $ CURDIR()
   CASE WEXIST("REQ")
      DO QUERYREQ.SPR WITH .T.
   #ENDIF
   #IF "PROD" $ CURDIR()
   CASE WEXIST("AVIS")
      DO QUERYAVI.SPR WITH .T.
   CASE WEXIST("TELS")
      DO QUERYTEL.SPR WITH .T.
   CASE WEXIST("COMS")
      DO QUERYCOM.SPR WITH .T.
   CASE WEXIST("OTRS")
      DO QUERYOTR.SPR WITH .T.
   #ENDIF
   #IF EMPTY(AT("LABOR",CURDIR())) .AND. EMPTY(AT("EXPEN",CURDIR())) .AND. EMPTY(AT("ALQUIL",CURDIR()))
   CASE WEXIST("RUB")
      EXTERNAL PROCEDURE LRUB0.PRG
      SELE rub
      SET ORDER TO TAG IIF(TYPE("ORDRUB")#'L' .OR. ORDRUB,'CODRUB','RUBRO')
      acla='|POSIC|CODIGO|'+PADC("RUBRO",20)+"|FECHA IN|  USUARIO |"
      tt='Listado de Rubros'
      DO LGRLP WITH "RUB","LRUB0()","","LRUBP"
   #ENDIF
CASE WEXIST("MER")
   DO LMER WITH .T.
CASE WEXIST("TMA")
	DO LTMA
OTHERWISE
   IF TYPE("L_DERIVA")#"U"
      C_LISTADO='L'+ULPR
   ELSE
      C_LISTADO='L'+ULPR+'P'
   ENDIF
   DO &C_LISTADO WITH .T.
   GO TOP
ENDCASE
=CTRL2_CA()
ULPR=C_ULPR
RETURN .T.
