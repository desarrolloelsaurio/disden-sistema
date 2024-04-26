***************************************************
* ABRE ARCHIVO CENTRO DE VARIABLES DE RETENCIONES *
***************************************************
@ 24,0 SAY PADC('Abriendo archivo de Retenciones',80,' ') COLO SCHE 19
SELE 11
IF ALIAS()<>'RET'
   USE (PATH+'\RETENCIONES') INDEX (PATH+'\RETENCION') ALIAS ret
ENDIF
IF jannro=0
   SET FILTER TO
ELSE
   SET FILTER TO ret->retempresa=jannro .OR. ret->retempresa=0
ENDIF
IF retpop
   DEFI POPU retpop FROM 0,50 PROM FIELD ret->retencion MESS 'Elija la retencion' SHAD COLOR SCHE 3
   ON SELE POPU retpop DO resp1
ENDIF
@ 24,0 SAY SPACE(80)
RETURN
