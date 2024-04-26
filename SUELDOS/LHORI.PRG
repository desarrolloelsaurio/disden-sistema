********************************************************************************
*-- Programa: LHORI.PRG
*-- Fecha   : 01/07/91 11:07am
*-- Version : G. REINER
*-- Notas   : DERIVA A PROGRAMAS DE LISTADO DE HORAS TRABAJADAS POR IMPRESORA
********************************************************************************
PARAMETER bsc,fl,flva,flti,fun,fil
uli=ulpr
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
dijo1=BAR()
DO CASE
CASE BAR()=1
   respuesta=0
   IF &fun<>0
      GOTO respuesta
      fisc='FILTCON=BSC .AND. REGISTRO=RESPUESTA'
      MAX=4
      DECL co[MAX]
      tt='Listado de '+flti+' - Tipo '+ALLTRIM(&flva)
      co[1]='  Legajo  '
      co[2]=PADC('Empleado',30,' ')
      co[3]=PADC('Cantidad',ACDIGI,' ')
      co[4]=PADC('Monto',acdigi,' ')
      SELE liq
      DO lHORI7
      RELE co
   ENDIF
CASE BAR()=2
   respuesta=0
   IF eliemp(" a Listar")<>0
      GOTO respuesta
      fisc='EMPLEADO=RESPUESTA .and. FILTCON=BSC'
      MAX=2
      DECL co[MAX],ct[MAX],gt[MAX],gto[MAX],ctt[MAX]
      tt='Listado de '+flti+' - Empleado '+ALLTRIM(emp->apynom)+' - Legajo '+ALLTRIM(emp->legajo)
      co[1]=PADC(flti,20,' ')
      co[2]=PADC('Cantidad',acdigi,' ')
      ct[1]='****'
      gt[1]='liq->REGISTRO'
      gto[1]=fl
      ctt[1]=flva
      ct[2]='str(liq->unidad,acdigi,2)'
      SELE liq
      DO lHORI8
   ENDIF
CASE BAR()=3
   DO kk2 WITH 14,55,'L¡mites del Listado de '+flti
   ON SELE POPU caca1 DO lhori2
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=4
   DO kk2 WITH 14,55,'L¡mites del Listado de '+flti
   ON SELE POPU caca1 DO lhori2
   ACTI POPU caca1
   RELE POPU caca1
ENDCASE
RELE uli
RETURN
