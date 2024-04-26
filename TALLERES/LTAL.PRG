********************************************************************************
*-- Programa: LTAL.PRG
*-- Fecha   : 06-28-92 11:00am
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE TALLERES
********************************************************************************
PARAMETER PORPAN
CANT_MAX=10
DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], Habilitado[CANT_MAX],habilant[cant_max]
TEXTO[ 1,1]='CODIGO'
TEXTO[ 2,1]='TALLER'
TEXTO[ 3,1]='DOMICILIO'
TEXTO[ 4,1]='LOCALIDAD'
TEXTO[ 5,1]='COND. IVA'
TEXTO[ 6,1]='N§ IVA'
TEXTO[ 7,1]='TELEFONO'
TEXTO[ 8,1]='ETAPA'
TEXTO[ 9,1]='FECHA'
TEXTO[10,1]='USUARIO             '
TEXTO[ 1,2]=10
TEXTO[ 2,2]=30
TEXTO[ 3,2]=30
TEXTO[ 4,2]=20
TEXTO[ 5,2]=6
TEXTO[ 6,2]=20
TEXTO[ 7,2]=12
TEXTO[ 8,2]=IIF(PORPAN,10,20)
TEXTO[ 9,2]=8
TEXTO[10,2]=10
store "" to ttque
store .t. to habilitado
FILTAL=BAR()
TT=''
FISC=QWTAL(FILTAL)
IF FISC#'.F.'
   IF FILTAL=5
      SELE TAL
      SCAT MEMV
      =sget("TAL")
      =inkey(nul,'HM')
   ELSE
      HABILITADO[4]=(FILTAL#2)
      HABILITADO[5]=(FILTAL#3)
      =acopy(habilitado,habilant)
      do while CFGFAC()
         =IIF(PORPAN,LTALP(),LTALI())
         store .f. to variable
      ENDdo
   ENDIF
ENDIF
RETURN
