define wind winICO AT SROWS()/2+10,SCOLS()-10 SIZE 3,3 font "ARIAL",10
define wind win from 0,0 to SROWS()/2,SCOLS() font "ARIAL",10
ACTI WIND WINICO
ACTI WIND WIN
brow fiel direc:W=SGET("WINICO"):V=SGET("WINICO"):R,;
icono:W=SGET("WINICO"):V=SGET("WINICO"):R ;
wind win 
RELE WIND WINICO
RELE WIND WIN
return

function SGET
PARAMETER COSA
ACTI WIND WINICO
@ 0,0 SAY (alltrim(direc)+alltrim(icono)) bitmap
ACTI WIND WIN
RETURN .T.