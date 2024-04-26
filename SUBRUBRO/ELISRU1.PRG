********************************************************************************
*-- Programa: elisru.prg
*-- Fecha   : 11-19-91 05:39pm
*-- Version : G. REINER
*-- Notas   : ELIGE EL SUB-RUBRO
********************************************************************************
function elisru1
para msg,r1,c1,fltr
sele rub
set order to
if rubpop
   SET ORDER TO
   TMPSRU=GENTMP()
   =FLOCK("RUB") .OR. FLOK("RUB")
   SORT ON RUBRO ;
   FIELD RUBRO,CODRUB,CODSRUB ;
   FOR !EMPTY(CODSRUB) .AND. codrub=fltr ;
   TO (TMPSRU)
   SELE RUB
   USE
   USE (TMPSRU) ALIAS RUB IN 16 EXCL
   =DEFPOGRL(RUBPOPR,RUBPOPC,"RUBPOP","RUB.RUBRO",30,'Elija el subrubro')
   ACTI SCRE
   ACTI POPU RUBPOP
   stor !empty(respuesta) to respuesta
   M.ELIGIO=STR(RUB.CODRUB)+STR(RUB.CODSRUB)
   =REOPRUB()
   =XSEEK(M.ELIGIO,'RUB','TODOS')
else
   if r1=-1
      do infic with recc('rub'),'INGRESE SUB-RUBRO '+msg
   else
      @ r1,c1 get respuesta picture '9999'
      read
      if empty(respuesta) .or. respuesta<1 .or. respuesta>recc('RUB') .or. lastkey()=27
         stor nul to respuesta
      endif
   endif
   if !empty(respuesta)
      goto respuesta
   endif
   if empty(codsrub) .or. codrub#fltr
      stor nul to respuesta
   endif
endif
set order to tag todos
return respuesta

