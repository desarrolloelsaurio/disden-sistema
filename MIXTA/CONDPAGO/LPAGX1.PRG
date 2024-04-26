* ษอออออออออออออออออออออออออออออออออออออออออออป
* บ FUNCTION      : LPAGI.PRG                 บ
* บ COMENTARIO    : IMPRIME CUERPO COND. PAGO บ
* ศอออออออออออออออออออออออออออออออออออออออออออผ
* 12/10/95 CAMBIO DE NOMBRE. LOS ERRORES SE SIGUEN PAGANDO CARO.
FUNCTION LPAGX1
#DEFINE PAIP   "|"                               && PAIP
	? PAIP
  	?? LEFT(MIX.TEXTO2,2)
	?? PAIP
	?? MIX.TEXTO1
	?? PAIP
	?? STR(MIX.NU1,6)
	?? PAIP
	?? STR(MIX.NU2,6)
	?? PAIP
	?? STR(MIX.NU5,5)
	?? PAIP
    ?? STR(MIX.NU3,XACDIGI,2)
	?? PAIP
	?? STR(MIX.NU4,XACDIGI,2)
	STORE CASOS+1 TO CASOS
RETURN IMPUSE()

