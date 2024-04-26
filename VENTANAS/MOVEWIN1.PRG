*:*********************************************************************
*:
*:        Program: D:\AGENDA\MOVEWIN.PRG
*:
*:         System:
*:         Author:
*:      Copyright (c) 1991,
*:  Last modified: 09/09/91     22:27
*:
*:      Called by: CPRO.PRG
*:
*:      Documented 09/20/91 at 00:32               FoxDoc  version 2.10
*:*********************************************************************
PARAMETER rr1,cc1,rr2,cc2,wn,ttl
STORE 0 TO rw1,cw1
STORE 4 TO rw2,cw2
DEFI WIND (wn) FROM rw1,cw1 TO rw2,cw2 TITL ttl DOUB SHAD COLO SCHE 1
ACTI WIND (wn)
DO WHILE rw1#rr1 .OR. rw2#rr2 .OR. cw1#cc1 .OR. cw2#cc2
   rw1=rw1+IIF(rw1<rr1,1,0)
   rw2=rw2+IIF(rw2<rr2,1,0)
   cw1=cw1+IIF(cw1<cc1,1,0)
   cw2=cw2+IIF(cw2<cc2,1,0)
   ZOOM WIND (wn) NORM FROM rw1,cw1 TO rw2,cw2
ENDDO
RETURN
