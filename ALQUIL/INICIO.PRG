* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : INICIO.PRG                                               บ
* บ COMENTARIO    : PROGRAMA DE INICIO - SISTEMA DE ALQUILERES               บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-20-93                                                    บ
* บ HORA       : 12:14:07PM                                                  บ
* บ COPYRIGHT  : 1993 BY GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
* VALORES DE DOCUMENTACION:
*  1. FACTURAS DE COMPRA
*  2. NOTAS DE CREDITO REALES
*  3. NOTAS DE DEBITO REALES
*  4. RECIBOS
*  5. FACTURAS INTERNAS INQUILINOS
*  7. NOTAS DE CREDITO INTERNAS INQUILINOS
*  8. NOTAS DE DEBITO  INTERNAS INQUILINOS
*  9. NOTAS DE CREDITO INTERNAS PROPIETARIOS
* 10. NOTAS DE DEBITO  INTERNAS PROPIETARIOS
* 11. RECIBOS DE PROPIETARIOS (DEVOLUCIONES ESPONTANEAS A INQUILINOS)
EXTERNAL PROCEDURE PENDIENT
SET TALK OFF
SET ESCA OFF
CLEA
=BIGCHARS(2,4,'ALQUILERES')
=BIGCHARS(15,17,'RAFULS',11)
STORE 0 TO NUL
=MEN_LIN("TECLA PARA CONTINUAR")
=INKEY(0,'HM')
DO WHILE !EMPTY(WONTOP())
   RELE WIND (WONTOP())
ENDDO
STORE .T. TO CONTROL
DO ALQUIL
DO WHILE .T.
   ACTI MENU MAIN
   IF EMPTY(GETENV("EQUIPO")) .OR. ;
        GETENV("EQUIPO")="DESARROLLO" .OR. ;
        GETENV("USERNAME")="GOYO"
      EXIT
   ENDIF
ENDDO
RETURN
* ษออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : ALQUIL.PRG                       บ
* บ COMENTARIO    : SISTEMA DE GESTION DE ALQUILERES บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                         บ
* บ FECHA      : 08-22-93                            บ
* บ HORA       : 05:14:32pm                          บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER             บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออผ
PROCEDURE ALQUIL
=GETFUSER()
=SETEOS()
ULPR=PROGRAM()
CLEA
IF !ISCOLOR()
   SET COLO TO W+
   @ 0,0,24,79 BOX REPL("ฐ",9)
ENDIF
CNTR=0
COUNT=100
LAST_NUM=0
C=3
=TER_SMOO(' Sistema de Alquileres ','Construyendo Menฃes',' Espere por Favor ')
SET COLO TO
RELE PATH,PATHCNS,PATHPRO,PATHVEN,PATHALQ
PUBL PATH,PATHCNS,PATHPRO,PATHVEN,PATHALQ

=GETPATH()

=TER_SMO1(2)
ACTI SCRE
@ 0,0 SAY REPLICATE("Û",80) COLO W
@ 0,1 SAY PADC('Alquileres',20) COLO I
@ 0,23 SAY '|'
@ 0,25 SAY DATE() COLO I
@ 0,34 SAY '|'
@ 0,45 SAY '|'
@ 0,58 SAY '|'

ACTI WIND THERMO
SET SHAD ON
=GENVAR()
=TER_SMO1(2)
=GENVAR1()
=TER_SMO1(2)
ACTI SCRE
=OPAUD()
ACTI WIND THERMO
=TER_SMO1(2)
ACTI SCRE
=OPSEG()
ACTI WIND THERMO
=TER_SMO1(2)
ACTI SCRE
=OPDOC()
ACTI WIND THERMO
=TER_SMO1(2)
ULPR=PROGRAM()
ACTI SCRE
=CABPAN1()
ACTI WIND THERMO
=TER_SMO1(2)


DEFI MENU MAIN MESSAGE 'MENU PRINCIPAL - SISTEMA DE ALQUILERES' shad COLO SCHE 2
=TER_SMO1(2)
DEFI PAD VARIOS OF MAIN PROM '\<Varios'     AT 01,00 COLO SCHE 2
DEFI PAD ALQCLI OF MAIN PROM '\<Clientes'   AT 01,07 COLO SCHE 2
=TER_SMO1(2)
DEFI PAD INMUEB OF MAIN PROM '\<Inmuebles'  AT 01,16 COLO SCHE 2
=TER_SMO1(2)
DEFI PAD ALQUI OF MAIN PROM '\<Alquileres'  AT 01,26 COLO SCHE 2
DEFI PAD CTACT OF MAIN PROM 'C\<tas Ctes'   AT 01,37 COLO SCHE 2
=TER_SMO1(2)
DEFI PAD IMPUES OF MAIN PROM 'I\<mpuestos'  AT 01,47 COLO SCHE 2
=TER_SMO1(2)
DEFI PAD MENSAJ OF MAIN PROM 'M\<ensaje'    AT 01,57 COLO SCHE 2
DEFI PAD VARIAB OF MAIN PROM 'Va\<riables'  AT 01,65 COLO SCHE 2
DEFI PAD ADIOS  OF MAIN PROM 'C\<hau'       AT 01,75 COLO SCHE 2
=TER_SMO1(2)

ON SELE PAD VARIOS OF MAIN ACTI POPU VARIOS
ON SELE PAD INMUEB OF MAIN ACTI POPU INMUEB
=TER_SMO1(2)
ON SELE PAD ALQCLI OF MAIN ACTI POPU ALQCLI
ON SELE PAD CTACT OF MAIN ACTI POPU CTACT
=TER_SMO1(2)
ON SELE PAD ALQUI OF MAIN ACTI POPU ALQUI
ON SELE PAD IMPUES OF MAIN ACTI POPU IMPUES
=TER_SMO1(2)
ON SELE PAD MENSAJ OF MAIN ACTI POPU MENSAJ
ON SELE PAD VARIAB OF MAIN ACTI POPU VARIAB
ON SELE PAD ADIOS  OF MAIN ACTI POPU ADIOS
=TER_SMO1(2)

respuesta='varios#2#0#A/B/M/L Varios#3;
#\<Bancos;
#\<Ciudades;
#\<I. V. A.;
#\<Provincias;
#Tipos de Doc\<umento'
respuesta=respuesta+';
#\<Estado de Unidades;
#\<Tipo de Unidades;
#Tipo de \<Actualizaciขn;
#I\<mpuestos;
#In\<dices de Actualizaciขn;
#Conceptos de Imp\<utaciขn;
#-;
#C\<ontrol Impresoras;
#-;
#Envกa Mensa\<je'
=TER_SMO1(2)
=defpop()

=TER_SMO1(2)
respuesta='alqcli#2#07#Gestiขn de Clientes#3;
#\<Inquilinos;
#\<Propietarios;
#\<Garantกas;
#-;
#\<Empleados'
=defpop()
=ter_smo1(6)

respuesta='Inmueb#2#16#Gestiขn de Inmuebles#3;
#\<Datos Administrativos;
#\<Nฃmeros Impositivos;
#\<Legajo;
#Listados de \<Control'
=DEFPOP()
=TER_SMO1(6)

respuesta='alqui#2#26#Gestiขn de Alquileres#3;
#Datos \<Personales;
#Datos \<Contractuales;
#Datos \<Monetarios;
#Modifica \<Descuento;
#\<Autoriza;
#\<Emite recibo bancario'
respuesta=respuesta+';
#\<Fin de Contrato;
#Re\<sumen;
#-;
#Alquileres a F\<uturo;
#-'
respuesta=respuesta+';
#\<Listados de Control por Pantalla;
#Listados de Control por \<Impresora;
#-;
#Cargos Por \<Gestiขn'
=DEFPOP()
=TER_SMO1(2)

respuesta='ctact#2#37#Gestiขn de Cuenta Corriente#3;
#\<Alquileres;
#\<Propietarios;
#\<Inquilinos'
=DEFPOP()
=TER_SMO1(2)

RESPUESTA='impues#2#47#Gestiขn de Cuenta Corriente de Impuestos#3;
#\<Ingreso un Impuesto;
#\<Ingreso Mฃltiples Vencimientos;
#\<Borra ;
#\<Control;
#-;
#\<Entrega;
#\<Recepciขn;
#Listado \<por Pantalla;
#\<Listado por Impresora'
=DEFPOP()
=TER_SMO1(2)

respuesta='MENSAJ#2#44#Gestiขn de Mensajes#3;
#\<Envกa Mensaje;
#Mensajes En\<viados;
#Mensajes \<Recibidos;
#Res\<ponde Mensajes'
=DEFPOP()
=TER_SMO1(2)

respuesta='variab#2#50#Mantenimiento de variables del Sistema#3;
#\<Popups a Utilizar;
#A\<limentaciขn del Papel;
#Ancho de la \<Impresora;
#Ancho de la \<Hoja;
#\<Cantidad de Dกgitos;
#\<Denominaciขn Moneda'

RESPUESTA=RESPUESTA+';
#Coti\<zaciขn '+xadol+';
#Nง Doc\<umentaciขn;
#Intereses por \<Mora;
#Fechas de \<Vencimiento;
#\<Recibe Impuestos'
=TER_SMO1(2)
=DEFPOP()

=TER_SMO1(2)
respuesta='adios#2#53#Se va del Sistema#3#ษอออออออออออออออออออออป#บ         \<Chau        บ#ศอออออออออออออออออออออผ'
=TER_SMO1(2)
=defpop()
=TER_SMO1(2)

ON SELE POPU VARIOS DO VARIOS
ON SELE POPU INMUEB DO INMUEB
=TER_SMO1(2)
ON SELE POPU ALQCLI DO ALQCLI
ON SELE POPU IMPUES DO IMPUES
=TER_SMO1(2)
ON SELE POPU ALQUI DO ALQ
ON SELE POPU CTACT DO CTACTE
=TER_SMO1(2)
ON SELE POPU MENSAJ DO MENSAJ
ON SELE POPU VARIAB DO VARIAB
ON SELE POPU ADIOS DO ADIOS
=TER_SMO1(2)
RELE CNTR,COUNT,LAST_NUM,SEGU,C
=RELEWIN("THERMO")
ON KEY LABEL CTRL+F5 WAIT STR(_CUROBJ) WIND
DO WHILE .T.
   ACTI MENU MAIN
   IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO" .OR. GETENV("USERNAME")="GOYO"
      EXIT
   ENDIF
ENDDO
RETURN
* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : GENVAR.PRG                               บ
* บ COMENTARIO    : GENERA VARIABLES - SISTEMA DE ALQUILERES บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                 บ
* บ FECHA      : 08-22-93                                    บ
* บ HORA       : 05:12:08pm                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
PROCEDURE GENVAR
=VAR_ACT()
=TER_SMO1(3)
=VAR_ALQ()
=TER_SMO1(3)
=VAR_BAN()
=VAR_CIU()
=TER_SMO1(3)
=VAR_DNI()
=VAR_EST()
=VAR_EMPL()
=TER_SMO1(3)
=VAR_GAR()
=TER_SMO1(3)
=VAR_GAS()
=TER_SMO1(3)
=VAR_IMP()
=VAR_IVA()
=TER_SMO1(3)
=VAR_INM()
=VAR_INQ()
=TER_SMO1(3)
=VAR_CLI()
=VAR_CLQ()
=TER_SMO1(3)
=VAR_PRP()
=TER_SMO1(3)
=VAR_PRV()
=TER_SMO1(3)
=VAR_IAC()
=TER_SMO1(3)
=VAR_TIP()
=TER_SMO1(3)
PUBL MARPOP,MARPOPR,MARPOPC
PUBL MERPOP,MERPOPR,MERPOPC
PUBL JANNAME,COEFSEG,USADOR,XACANCHO,XACHOJA,ACDIGI,XAUS,XAUSS,XACDIGI
PUBL RH,RP,X10,X15,X20,X30,ORDCLI,ORDMER,ORDPRO,XADOL,XADOLS,XAMONEDA,XACOTIZ,XAREC_IMP
PUBL XACDIGI

=GETPOALQ()

RELE SSTM,ULPR,ESPERE,GRABANDO,TRATANDO,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,NLQ,OFFNLQ,UNDER,OFFUNDER,WIDE,OFFWIDE,NUL,PAIP,BOTOM,TECMOD,SUCU,NUMIM,CART_INQUI,CART_PROPI,PROBE,PROBES,CANT_EMPRE,SSTM1,ABA
PUBL SSTM,ULPR,ESPERE,GRABANDO,TRATANDO,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,NLQ,OFFNLQ,UNDER,OFFUNDER,WIDE,OFFWIDE,NUL,PAIP,BOTOM,TECMOD,SUCU,NUMIM,CART_INQUI,CART_PROPI,PROBE,PROBES,CANT_EMPRE,SSTM1,ABA

RELE TEX_EFES,JANNRO,SSTM2,ENASCII
PUBL TEX_EFES,JANNRO,SSTM2,ENASCII

JANNRO=1
TEX_EFES=" - [F2] Popup - [F3] Bฃsqueda"
CANT_EMPRE=1

probe="Propietario"
probes="Propietarios"

sucu='0001'
TECMOD="TECLA y [ENTER] modifica"
botom='  '+repl('ฐ',78)
PAIP='|'
STOR 0 TO NUL,numim
SSTM=padc('Alquileres',19)
SSTM1="ADMIN"
SSTM2='ALQUILER'
ABA='Abriendo Base de '

ESPERE=padc(' Espere por Favor - El archivo est  siendo Utilizado por otro Usuario ',80,"ฐ")
GRABANDO=padc(' Grabando los datos ingresados - Espere por Favor ',80,"ฐ")
tratando=PADC(" Tratando de Bloquear el Registro a Utilizar ",80,"ฐ")
imprimiendo=PADC(' IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe ',80,'ฐ')
TEN='Existe - [ENTER] para Continuar'
NLQ=CHR(27)+CHR(120)+CHR(1)+CHR(27)+CHR(107)+CHR(0)
OFFNLQ=CHR(27)+CHR(120)+CHR(0)+CHR(18)
UNDER=CHR(27)+CHR(45)+CHR(1)
OFFUNDER=CHR(27)+CHR(45)+CHR(0)
WIDE=CHR(27)+CHR(87)+CHR(1)
OFFWIDE=CHR(27)+CHR(87)+CHR(0)
RETURN
* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : GENVAR1.PRG                                              บ
* บ COMENTARIO    : GENERA VARIABLES - SISTEMA DE ALQUILERES                 บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-22-93                                                    บ
* บ HORA       : 05:13:27pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
PROCEDURE GENVAR1
STORE 36 TO RH
STORE 47 TO RP
STORE REPL("!",10) TO X10
STORE REPL("!",15) TO X15
STORE REPL("!",20) TO X20
STORE REPL("!",30) TO X30
COEFSEG=1
USADOR=GETENV("USERNAME")
=GETGENE()
STORE 'ADMINISTRACION RAFULS' TO JANNAME
RELE PDS
PUBL PDS[2]
PDS[1]=132
PDS[2]=233
STORE .F. TO GENPED,GENREM
***** RESTAURA DATOS DE LA BASE MIXTA
=OPMIX()
RELE HOJASUELTA
PUBL HOJASUELTA
STORE IIF(XSEEK(PADR("HOJASUELTA",LEN(MIX.TEXTO1))+PADR(GETENV("MAQUINA"),LEN(MIX.TEXTO2)),"MIX","FOXMAQ"),;
  (MIX.NU1=2),;
  .F.) TO M.HOJASUELTA
RETURN
