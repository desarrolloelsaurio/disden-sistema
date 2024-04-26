*:*********************************************************************
*:
*:        Program: INICIO.PRG
*:
*:         System: SYSTEMA DE COMERCIALIZACION
*:         Author: GOYO REINER
*:      Copyright (c) 1991, SISTEMAS INFORMATICOS S.R.L.
*:  Last modified: 09/26/91     11:36
*:
*:          Calls: INICIO2.PRG
*:               : INICIO1.PRG
*:               : COMER.PRG
*:
*:   Memory Files: LETRASX.MEM
*:               : PATH.MEM
*:
*:      Documented 09/26/91 at 11:42               FoxDoc  version 2.01
*:*********************************************************************
SET TALK OFF
SET ESCA On
SET UDFP TO REFE
on key label tab cancel
CLEA
camino=''
camino=camino+';..\..\carteles'
camino=camino+';..\..\ventanas'
camino=camino+';..\..\matemati'
camino=camino+';..\..\rubros\novogar'
camino=camino+';..\..\auditori'
camino=camino+';..\..\segurida'
camino=camino+';..\..\document'
camino=camino+';..\..\pantalla'
camino=camino+';..\..\seleccio'
camino=camino+';..\..\varios'
camino=camino+';..\..\conversi'
camino=camino+';..\..\ARRAYS'
	 set path to (camino)
CLEA
DO VENTAS
RETURN
procedure genvar
*:*********************************************************************
*:
*:        Program: GENVAR.PRG
*:
*:         System: SYSTEMA DE COMERCIALIZACION
*:         Author: GOYO REINER
*:      Copyright (c) 1991, SISTEMAS INFORMATICOS S.R.L.
*:  Last modified: 09/19/91     11:54
*:
*:      Called by: COMER.PRG
*:
*:      Documented 09/26/91 at 11:43               FoxDoc  version 2.01
*:*********************************************************************
PUBL BANpop,iBANr,iBANc,iBANla,iBANan,cBANc,cBANr,cBANan,cBANla,BANpopc,BANpopr,vBANc,vBANr,vBANan,vBANla,mBANc,mBANr,mBANla,mBANan
PUBL ciupop,iciur,iciuc,iciula,iciuan,cciuc,cciur,cciuan,cciula,ciupopc,ciupopr,vciuc,vciur,vciuan,vciula,mciuc,mciur,mciula,mciuan
PUBL clipop,iclir,iclic,iclila,iclian,cclic,cclir,cclian,cclila,clipopc,clipopr,vclic,vclir,vclian,vclila,mclic,mclir,mclila,mclian
PUBL colpop,icolr,icolc,icolla,icolan,ccolc,ccolr,ccolan,ccolla,colpopc,colpopr,vcolc,vcolr,vcolan,vcolla,mcolc,mcolr,mcolla,mcolan
PUBL curpop,icurc,icurr,icuran,icurla,curpopc,curpopr
PUBL iremc,iremr,ireman,iremla
PUBL ifacc,ifacr,ifacan,ifacla
PUBL grupop,igruc,igrur,igrula,igruan,cgruc,cgrur,cgrula,cgruan,grupopc,grupopr,vgruc,vgrur,vgruan,vgrula,mgruc,mgrur,mgrula,mgruan
PUBL linpop,ilinc,ilinr,ilinla,ilinan,clinr,clinc,clinan,clinla,linpopc,linpopr,vlinan,vlinla,vlinr,vlinc,mlinr,mlinc,mlinan,mlinla
PUBL matpop,imatc,imatr,imatan,imatla,cmatc,cmatr,cmatan,cmatla,matpopc,matpopr,mmatc,mmatr,mmatan,mmatla,vmatr,vmatc,vmatla,vmatan
PUBL merpop,imerc,imerr,imeran,imerla,cmerc,cmerr,cmeran,cmerla,merpopc,merpopr,mmerc,mmerr,mmeran,mmerla,vmerr,vmerc,vmerla,vmeran,merpop1
PUBL pagpop,ipagr,ipagc,ipagla,ipagan,cpagc,cpagr,cpagan,cpagla,pagpopc,pagpopr,vpagc,vpagr,vpagan,vpagla
PUBL propop,ipror,iproc,iprola,iproan,cproc,cpror,cproan,cprola,propopc,propopr,vproc,vpror,vproan,vprola,mproc,mpror,mprola,mproan
publ ipedr,ipedc,ipedan,ipedla
PUBL prvpop,iprvr,iprvc,iprvla,iprvan,cprvc,cprvr,cprvan,cprvla,prvpopc,prvpopr,vprvc,vprvr,vprvan,vprvla,mprvc,mprvr,mprvla,mprvan
PUBL rubpop,irubc,irubr,iruban,irubla,crubc,crubr,cruban,crubla,rubpopc,rubpopr,vrubc,vrubr,vruban,vrubla,mrubr,mrubc,mruban,mrubla
PUBL opkpop,iopkr,iopkc,iopkan,iopkla,copkr,copkc,copkla,copkan,opkpopr,opkpopc,mopkc,mopkr,mopkan,mopkla,vopkr,vopkc,vopkan,vopkla
PUBL suepop,isuec,isuer,isuela,isuean,csuec,csuer,csuela,csuean,suepopc,suepopr,vsuec,vsuer,vsuean,vsuela,msuec,msuer,msuela,msuean
publ talpop,talpopr,talpopc
PUBL tarpop,itarr,itarc,itarla,itaran,ctarc,ctarr,ctaran,ctarla,tarpopc,tarpopr,vtarc,vtarr,vtaran,vtarla,mtarc,mtarr,mtarla,mtaran
PUBL telpop,itelc,itelr,itella,itelan,ctelc,ctelan,ctelr,ctella,telpopc,telpopr,mtelr,mtelc,mtelan,mtella,vtelr,vtelc,vtelan,vtella
PUBL marpop,marpopr,marpopc
PUBL merpop,merpopr,merpopc
PUBL viapop,iviar,iviac,iviala,iviaan,cviac,cviar,cviaan,cviala,viapopc,viapopr,vviac,vviar,vviaan,vviala,mviac,mviar,mviala,mviaan
PUBL ivixr,ivixc,ivixla,ivixan,cvixc,cvixr,cvixan,cvixla,vvixc,vvixr,vvixan,vvixla,mvixc,mvixr,mvixla,mvixan
PUBL zonpop,izonr,izonc,izonla,izonan,czonc,czonr,czonan,czonla,zonpopc,zonpopr,vzonc,vzonr,vzonan,vzonla,mzonc,mzonr,mzonla,mzonan
PUBL maxciva,unid[30],xaciva[15,7],xaci[3],xanum[3,12]
PUBL abio,abios,tella,tellas,zuela,zuelas,ruvro,ruvros,llinea,llineas,janname,coefseg,usador,xacancho,xachoja,acdigi,xaus,xauss,xacdigi,korte,xanumcor
PUBL mader,maders,genped,genrem,biaja,biajas
PUBL rh,rp,x10,X15,x20,x30,ordcli,ordmer,ordpro,xadol,xadols,xamoneda,xacotiz
PUBL xatalmin,xatalmax,xatalstep,xatalan,xalis1,xalis2,xalis3,xalis4
PUBL xap1,xap2,xap3,xap4,xas1,xas2,xas3,xas4,xanulis
IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO"
   REST FROM (PATH+'\posic') ADDI
ELSE
  IF GETENV("EQUIPO")="MICASA"
     REST FROM posic ADDI
  ELSE
     REST FROM ('F:\usr\'+getenv("username")+"\posicCOM") ADDI
  ENDIF
ENDIF
RELE sstm,ulpr,espere,grabando,tratando,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,nlq,offnlq,UNDER,OFFUNDER,WIDE,OFFWIDE,NUL,PAIP,botom,TECMOD,sucu,numim,OPC_SEX,tecmen,opc_tem,JANNRO
PUBL sstm,ulpr,ESPERE,GRABANDO,tratando,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,nlq,offnlq,UNDER,OFFUNDER,WIDE,OFFWIDE,NUL,PAIP,botom,TECMOD,sucu,numim,OPC_SEX,tecmen,opc_tem,JANNRO
sucu='0001'
JANNRO=0
TECMEN="[ENTER] para Men£"
TECMOD="TECLA y [ENTER] modifica"
botom='  '+repl('°',78)
OPC_SEX="@M Hombre,Mujer,Colegial,J¢venes,Unisex,No"
PAIP='|'
STOR 0 TO NUL,numim
SSTM=padc('Ventas',19)
ESPERE=padc(' Espere por Favor - El archivo est  siendo Utilizado por otro Usuario ',80,"°")
GRABANDO=padc(' Grabando los datos ingresados - Espere por Favor ',80,"°")
tratando=PADC(" Tratando de Bloquear el Registro a Utilizar ",80,"°")
imprimiendo=PADC(' IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe ',80,'°')
TEN='Existe - [ENTER] para Continuar'
nlq=chr(27)+chr(120)+chr(1)+chr(27)+chr(107)+chr(0)
offnlq=chr(27)+chr(120)+chr(0)+chr(18)
UNDER=CHR(27)+CHR(45)+CHR(1)
OFFUNDER=CHR(27)+CHR(45)+CHR(0)
WIDE=CHR(27)+CHR(87)+CHR(1)
OFFWIDE=CHR(27)+CHR(87)+CHR(0)
RETURN
*: EOF: GENVAR.PRG
procedure genvar1
*:*********************************************************************
*:
*:        Program: GENVAR1.PRG
*:
*:         System: SYSTEMA DE COMERCIALIZACION
*:         Author: GOYO REINER
*:      Copyright (c) 1991, SISTEMAS INFORMATICOS S.R.L.
*:  Last modified: 09/10/91     11:17
*:
*:      Called by: COMER.PRG
*:
*:      Documented 09/26/91 at 11:43               FoxDoc  version 2.01
*:*********************************************************************
REST FROM (pathpro+'\UNID') ADDI
*STORE 1 TO xatalmin
*STORE 20 TO xatalmax
*STORE 1 TO xatalstep
*STORE 4 TO xatalan
*STORE 2 TO ordcli
STORE 36 TO rh
STORE 47 TO rp
STORE REPL("!",10) TO x10
STORE REPL("!",15) TO x15
STORE REPL("!",20) TO x20
STORE REPL("!",30) TO x30
IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO"
   REST FROM (PATH+'\GENE') ADDI
ELSE
IF GETENV("EQUIPO")="MICASA"
   REST FROM GENE ADDI
ELSE
   REST FROM (PATHcom+'\GENE') ADDI
   ENDIF
ENDIF
STORE 'Av¡o' TO abio
STORE 'Av¡os' TO abios
STORE 'Tela' TO tella
STORE 'Telas' TO tellas
STORE 'Color' TO zuela
STORE 'Colores' TO zuelas
STORE 'Rubro' TO ruvro
STORE 'Rubros' TO ruvros
STORE 'L¡nea' TO llinea
STORE 'L¡neas' TO llineas
STORE 'Compa¤¡a Productos NAZA SRL' TO janname
STORE 'Corte' TO korte
STORE 'Molder¡a' TO mader
STORE 'Molder¡a' TO maders
store "Viajante" to biaja
store "Viajantes" to biajas
coefseg=1
usador=GETENV("USERNAME")
*STOR 0 TO xanum
*STORE 'Dolar' TO xadol
*STORE 'D¢lares' TO xadols,xamoneda
*STORE 'Austral' TO xaus
*STORE 'Australes' TO xauss
*STORE 10000 TO xacotiz
rele pds
PUBL pds[2]
pds[1]=132
pds[2]=233
genped=.F.
genrem=.F.
RETURN
*: EOF: GENVAR1.PRG
procedure ventas
*********************************************************************************
*-- Programa: VENTAS.PRG
*-- Fecha   : 07/01/91 10:55am
*-- Version : G. REINER
*-- Notas   : MENU SISTEMA DE VENTAS
********************************************************************************
*ON ERROR QUIT
*A=FILE("C:\ANIM\AA\BOSTALK.FLI")
*F A .AND. CONTROL
**************************************
SET EXCL OFF
SET STAT OFF
SET TALK OFF
set repr to 5
SET MEMO TO 70
SET DECIMALS TO 4
SET LOGE OFF
SET SYSMENU OFF
SET SAFE OFF
SET DELE ON
SET EXCL OFF
SET CONFIRM ON
SET MULTI ON
SET DATE TO FRENCH
SET BELL TO 100,1
RELE ALL
CLOSE ALL
CLEA ALL
SET SHAD ON
IF GETENV("EQUIPO")#"MICASA"
   IF GETENV("USERNAME")#"GOYO"
      on eRROR DO ERROR
   ENDIF
ENDIF
ulpr=PROGRAM()
CLEA
set colo to w+
@ 0,0,24,79 BOX REPL("°",9)
set colo to
cntr=0
count=100
last_num=0
c=3
RELE PATH,pathpro,PATHVEN
PUBL PATH,pathpro,PATHVEN
IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO"
   IF VERSION()='FoxPro 2.0'
      REST FROM path ADDI
   ELSE
      REST FROM f:\SISTEMAS\BALCALA\path ADDI
   ENDIF
ELSE
IF GETENV("EQUIPO")="MICASA"
   REST FROM path ADDI
ELSE
   REST FROM ("F:\PUBLIC\pathCOM") ADDI
   ENDIF
ENDIF
*************************** INICIO comercializacion **************************
do genvar
do genvar1
do ..\auditori\opaud
do ..\SEGURIDA\cdx\opseg
do opdoc
=OPMER()
do c:\foxpro2\sistemas\rubros\novogar\oprub
do imer
return
