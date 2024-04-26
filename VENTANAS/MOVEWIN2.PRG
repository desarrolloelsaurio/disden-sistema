function movewin2
PARAMETER rr1,cc1,rr2,cc2,wn,ttl
cre=rr1+INT((rr2-rr1)/2)
cco=cc1+INT((cc2-cc1)/2)
rw1=0
cw1=0
rw2=24
cw2=79
DEFI WIND (wn) FROM rw1,cw1 TO rw2,cw2 TITL ttl DOUB SHAD COLO SCHE 3
ACTI WIND (wn)
DO WHILE rw1#rr1 .OR. rw2#rr2 .OR. cw1#cc1 .OR. cw2#cc2
   rw1=rw1+IIF(rw1<rr1,1,0)
   rw2=rw2-IIF(rw2>rr2,1,0)
   cw1=cw1+IIF(cw1<cc1,1,0)
   cw2=cw2-IIF(cw2>cc2,1,0)
   ZOOM WIND (wn) NORM FROM rw1,cw1 TO rw2,cw2
ENDDO
RETURN
