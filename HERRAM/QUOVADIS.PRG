store 0 to rx,cx
defi wind wix from 24,0 to 24,40 NONE
acti wind wix
do while .t.
DO DONDE
a=inkey(0)
if a=27
   exit
endif
rx=rx+iif(a=24 .or. a=3 .or. a=6,1,0)+iif(a=5 .or. a=1 .or. a=18,-1,0)
cx=cx+iif(a=4 .or. a=3 .or. a=18,1,0)+iif(a=19 .or. a=1 .or. a=6,-1,0)
RX=IIF(RX<0,0,IIF(RX>24,24,RX))
CX=IIF(CX<0,0,IIF(CX>79,79,CX))
defi wind wiz from rx,cx to rx,cx none fill '›' colo sche 17
show wind wiz
enddo
return
PROCEDURE DONDE
acti wind wix
@ 0,1 SAY "RENGLON:"+STR(RX,2)
@ 0,20 SAY "COLUMNA:"+STR(CX,2)
ACTI scre
RETURN