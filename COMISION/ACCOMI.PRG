*********************************************************
*-- Programa: ACCOMI.PRG
*-- Notas   : ACTUALIZA COMISION GENERAL PROD.
*********************************************************
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
ulpr=HORA_ULP(PROGRAM())
=MOVEWIN(10,14,14,66,'WIN',' Comisi�n general para Productos ')
XACOMI=getnu1("COMISION",.F.,3)
@ 1,1 SAY 'COMISI�N' colo sche 3
@ 1,26 GET XACOMI PICTURE '99.99'  MESS 'Porcentaje de Comisi�n '
READ
repl mix.nu3 with xacomis
=RELEWIN("win")
RETURN MEN_LIN(BOTOM)
