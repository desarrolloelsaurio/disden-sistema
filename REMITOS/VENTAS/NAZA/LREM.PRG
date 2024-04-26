********************************************************************************
*-- Programa: LREM.PRG
*-- Fecha   : 05-02-92 10:46am
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE REMITO
********************************************************************************
PARAMETER PORPAN
PRIVATE PORPAN
ulpr=PROGRAM()
   STORE NUL TO RESPUESTA
   =OPMER()
   =oprem()
   ESCHAR=(TYPE("REM.REMITO")="C")
   ESCHARFA=(TYPE("REM.REMITO")="C")
   CANT_MAX=8
   DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], Habilitado[CANT_MAX],habilant[cant_max]
   TEXTO[1,1] ='REMITO'
   TEXTO[2,1] ='FECHA EMISION'
   TEXTO[3,1] ='CLIENTE'
   TEXTO[4,1] =UPPER(BIAJA)
   TEXTO[5,1] ='VALORIZACION       '
   TEXTO[6,1] ='FECHA FACT.'
   TEXTO[7,1] ='N§ FACTURA'
   TEXTO[8,1] ='USUARIO'
   TEXTO[1,2]=IIF(ESCHAR,LEN(REM.REMITO),13)
   TEXTO[2,2]=8
   TEXTO[3,2]=20
   TEXTO[4,2]=20
   TEXTO[5,2]=xacdigi
   TEXTO[6,2]=8
   TEXTO[7,2]=IIF(ESCHARFA,LEN(REM.FACTURA),13)
   TEXTO[8,2]=10
   STORE '' TO FISC
   store .t. to habilitado
   store "" to ttque
   store 1 to filemp,filrem,filvia,filmer,filfec,filmon,filcli,filfac
   do while queryREM(PORPAN)
      IF FILREM=3 .or. filfec=3 .or. filvia=3
         =IIF(M.PORPAN,LRIMPR(.F.),LRIMIR(.F.))
      ELSE
         if filmer=2
            =IIF(M.PORPAN,LRiMPY(),LRiMIy())
         else
            =acopy(habilitado,habilant)
            do while CFGFAC() .AND. FILREM#2
               =IIF(M.PORPAN,LREMPz(),LREMIz())
               store .f. to variable
            ENDdo
            store .f. to variable
            =acopy(habilant,habiitado)
         endif
      ENDIF
   ENDdo
RETURN MEN_LIN(BOTOM)
