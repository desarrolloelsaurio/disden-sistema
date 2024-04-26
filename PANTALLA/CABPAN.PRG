********************************************************************************
*-- Programa: cabpan.prg
*-- Fecha   : 09/25/91 02:08pm
*-- Versi¢n : g. reiner
*-- Notas   : cabecera listado por pantalla
********************************************************************************
function cabpan
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
IF TYPE("PAG")="U"
   PAG=1
ENDIF   
*elren=iif(menu()="_MSYSMENU",1,nul)
ELREN=0
@ ELREN,nul SAY REPLICATE("Û",80) COLOR W
@ ELREN,nul SAY 'P gina N§' COLO I
@ ELREN,10 SAY STR(pag,8) COLO I
@ ELREN,20 SAY PAIP
@ ELREN,22 SAY DATE() COLO I
@ ELREN,32 SAY PAIP
@ ELREN,34 SAY TIME() COLO I
@ ELREN,44 SAY PAIP
@ ELREN,46 SAY PADC(ulpr,10) COLO I
@ ELREN,58 SAY PAIP
pcht=LEFT(janname,19)
@ ELREN,60 SAY pcht COLO I
RETURN .t.