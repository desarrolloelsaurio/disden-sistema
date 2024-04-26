*
*                        MUESTRA EL ASIENTO CON F1
*
* F1.PRG
*
store recno() to REGISTRO
store TDEBE to AUX1
store THABER to AUX2
do MUESTRA
store 0 to AUX3
? chr(7)
@21,30 SAY "Pulse <RETURN> "
do while AUX3#13
   store inkey() to AUX3
enddo
RELE WIND WIN0
store AUX1 to TDEBE
store AUX2 to THABER
set order to 0
goto REGISTRO
set order to 1
return
