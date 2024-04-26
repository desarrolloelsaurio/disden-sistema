* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ  SISTEMA DE CAJAS - CAJAS : ARCHIBOX                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : INICIO.PRG                                               บ
* บ COMENTARIO    :                                                          บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 04-12-95 08:17am                                            บ
* บ COPYRIGHT  : 1995 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
EXTERNAL PROCEDURE IM_LIN
EXTERNAL PROCEDURE FINIMPR
EXTERNAL PROCEDURE SHIT
=SETEOS()
STORE "CAJAS" to sstm,sstm1
***
JANNAME="DEMOSTRACION"
***
STORE 36 TO RH
STORE 47 TO RP
USADOR="GOYO"
SET TALK OFF
SET ESCA OFF
CLEA
=bigletT(2,1,'CAJAS')
   =bigchars(12,10,'ARCHIBOX',6)
STORE 0 TO NUL
=MEN_LIN("TECLA PARA CONTINUAR")
=INKEY(0,'HM')
DO WHILE !EMPTY(WONTOP())
   RELE WIND (WONTOP())
ENDDO
CLEA
SELE 0
use rub1
SELE 0
use rub2
SELE 0
use rub3
SELE 0
use rub4
SELE 0
use rub5
SELE 0
use rub6
SELE 0
use contenid alias ctn
=OPAUD()
=OPSEG()
ULPR=PROGRAM()
=IAUD("INGRESO AL SISTEMA")
=CABPAN1()
************************** INICIO COMERCIALIZACION
DEFI MENU MAIN MESSAGE 'MENU PRINCIPAL - SISTEMA DE VENTAS' shad COLO SCHE 2
DEFI PAD RUBROS OF MAIN PROM '\<Rubros'     AT 01,00 COLO SCHE 2
DEFI PAD CAJAS  OF MAIN PROM '\<Cajas'      AT 01,07 COLO SCHE 2
DEFI PAD CONSUL OF MAIN PROM 'C\<onsultas'  AT 01,14 COLO SCHE 2
DEFI PAD CHAU   OF MAIN PROM 'C\<hau'       AT 01,25 COLO SCHE 2

ON SELE PAD RUBROS OF MAIN DO RUBROS
ON SELE PAD CAJAS  OF MAIN ACTI POPU CAJAS
ON SELE PAD CONSUL OF MAIN ACTI POPU CONSUL
ON SELE PAD CHAU   OF MAIN ACTI POPU CHAU

respuesta='CHAU#2#25#Se va del Sistema#3#ษอออออออออออออออออออออป#บ         \<Chau        บ#ศอออออออออออออออออออออผ'
=DEFPOP()

*ON SELE POPU RUBROS DO VARIOS
ON SELE POPU CHAU   DO CHAU

DO WHILE .T.
   ACTI MENU MAIN
   IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO" .OR. GETENV("USERNAME")="GOYO"
      EXIT
   ENDIF
ENDDO
RETURN

