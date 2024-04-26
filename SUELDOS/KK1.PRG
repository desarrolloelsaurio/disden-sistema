********************************************************************************
*-- Programa: KK1.PRG
*-- Fecha   : 8.11.1990
*-- Version : G. REINER
*-- Notas   : GENERA EL POPUP DE FILTRO DE EMPLEADOS
********************************************************************************
PARAMETER R,C,t
DEFI POPU caca1 FROM R,C MESSAGE t SHADOW COLOR SCHE 3
DEFI BAR 1 OF caca1 PROM ' \<Todos los Empleados'
DEFI BAR 2 OF caca1 PROM ' \<Un Empleado'
DEFI BAR 3 OF caca1 PROM ' Por \<Categor¡a'
DEFI BAR 4 OF caca1 PROM ' Por Con\<venio'
DEFI BAR 5 OF caca1 PROM ' Por C\<entro de Costos '
DEFI BAR 6 OF caca1 PROM ' Por E\<specialidad'
RETURN
