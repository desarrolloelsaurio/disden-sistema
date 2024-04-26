* ษอออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : MPRC.PRG                        บ
* บ COMENTARIO    : MUESTRA PROCESOS DE FABRICACION บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออออผ
PARAMETER COSA
ACTI WIND WIN
@ 1,2 SAY "CODIGO PROCESO     " COLO SCHE 3
@ 2,2 SAY "PROCESO FABRICACION" COLO SCHE 3
@ 3,2 SAY "MONTO              " COLO SCHE 3
IF !COSA
	@ 1,COL GET M.PRCCOD
	@ 2,COL GET M.PROCFAB
	@ 3,COL GET M.MONTO PICT '99999999999.99'
	CLEAR GETS
ENDIF
RETURN
