function pop_list
parameter r,c,arra,TXT,sinborde
private r,c,arra,RESPUESTA,TXT,anchor,sinborde
anchor=ar_maxan(@arra)
if sinborde
defi wind win2 from r,c to R+alen(arra,1)+1,c+4+anchor none
else
=movewin(r,c,r+alen(arra,1)+3,c+4+anchor,'win2','','')
endif
store 1 to respuesta
@ NUL,NUL GET RESPUESTA from ARRA SIZE 1,WCOL() MESS TXT colo sche 2
READ
=RELEWIN("WIN2")
return(RESPUESTA)