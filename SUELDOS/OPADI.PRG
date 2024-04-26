****************************
* ABRE ARCHIVO ADICIONALES *
****************************
@ 24,0 SAY PADC('Abriendo archivo de Adicionales',80,' ') COLO SCHE 19
SELE 10
IF ALIAS()<>'ADI'
   USE (PATH+'\ADICIONALES') INDEX (PATH+'\ADICIONAL')  ALIAS adi
ENDIF
IF jannro=0
   SET FILTER TO
ELSE
   SET FILTER TO adi->adiempresa=jannro .OR. adi->adiempresa=0
ENDIF
IF adipop
   DEFI POPU adipop FROM 0,50 PROM FIELD adi->adicional MESS 'Elija el adicional' SHAD COLOR SCHE 3
   ON SELE POPU adipop DO resp1
ENDIF
@ 24,0 SAY SPACE(80)
RETURN
