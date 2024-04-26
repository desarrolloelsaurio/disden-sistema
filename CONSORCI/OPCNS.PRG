********************************************************************************
*-- Programa: OPCNS.PRG
*-- Fecha   : 01-18-92 08:44am
*-- Version : R. 'EL BATA'
*-- Notas   : ABRE ARCHIVO CONSORCIOS
********************************************************************************
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
IF ESOPEN('Consorcios',18,"CNS")
   USE (PATHCNS+'\CONSORCI') ORDER TAG CONSORCIO ALIAS CNS
ENDIF
IF CNSPOP
   DEFI POPU CNSPOP FROM CNSPOPR,CNSPOPC PROMPT FIELD CNS.CONSORCIO MESS 'Elija el Consorcio' SHAD COLOR SCHE 3 IN SCREEN
   ON SELE POPU CNSPOP DO RESP1
ELSE
   RELE POPU CNSPOP
ENDIF
RETURN MEN_LIN(BOTOM)
