********************************************
* ABRE ARCHIVO DE VARIABLES DE LIQUIDACION *
********************************************
@ 24,0 SAY PADC('Abriendo archivo de Constantes de Liquidaci¢n',80,' ') COLO SCHE 19
SELE 8
IF ALIAS()<>'VAR'
   USE (PATH+'\VARIABLE') INDEX (PATH+'\NOMBRE'),(PATH+'\CONTENIDO') ALIAS VAR
ENDIF
IF varpop
   DEFI POPU varpop FROM 0,55 PROM FIELD var->nombre MESS ' Elija la Constante ' SHAD COLOR SCHE 3
   ON SELE POPU varpop DO resp1
ENDIF
@ 24,0 SAY SPACE(80)
RETURN
