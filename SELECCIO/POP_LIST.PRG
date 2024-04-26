function pop_list
parameter r,c,arra,TXT,sinborde
private r,c,arra,TXT,anchor,sinborde
#DEFINE NUL    0                                 && NUL
anchor=ar_maxan(@arra)
if sinborde
   defi wind POPLIST from r,c to R+alen(arra,1)+1,c+4+anchor none
   ACTI WIND POPLIST
else
   =movewin(r,c,r+alen(arra,1)+3,c+4+anchor,'POPLIST','','')
endif
store 1 to respuesta
@ NUL,NUL GET RESPUESTA from ARRA SIZE 1,WCOL() MESS TXT colo sche 2
READ
IF SINBORDE
	 RELE WIND POPLIST
ELSE
   =RELEWIN("POPLIST")
ENDIF
return RESPUESTA
