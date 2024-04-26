FUNCTION MOVEWIN
PARAMETER A,B,C,D,E,F,g,OCHO,NUEVE,DIEZ
PRIVATE A,B,C,D,E,F,g,ocho
****#include c:\windows\bmp\miel.bmp
#IF "Wind" $ VERS()
   G=IIF(EMPTY(G),"",G)
   DO CASE
   CASE EMPTY(OCHO)
      DEFI WIND (e) FROM A,B TO C,D TITL f FOOT G
   CASE EMPTY(DIEZ)
         DEFI WIND (e) FROM A,B TO C,D TITL f FOOT G ;
           FONT OCHO,NUEVE
   OTHER
         DEFI WIND (e) FROM A,B TO C,D TITL f FOOT G ;
           FONT OCHO,NUEVE ;
           FILL FILE (DIEZ)
   ENDCASE
   ACTI WIND (e)
#ELSE
   if c>24
      resta=c-24
      c=24
      a=a-resta
      if a<0
         a=0
      endif
   endif
   if d>79
      resta=d-79
      d=79
      b=b-resta
      if b<0
         b=0
      endif
   endif
 
   IF LEN(SYS(17))#5 .OR. PARAMETER()=8
      DEFI WIND (e) FROM A,B TO C,D TITL f DOUB SHAD COLO SCHE 1
      ACTI WIND (e)
   ELSE
      G=IIF(PARAMETER()#7,' '+IIF(TYPE("JANNAME")='U','*',ALLTRIM(JANNAME))+' ',G)
      M.mispar=INT(RAND()*3)+1
      DO CASE
      CASE M.mispar=3
         =MOVEWIN3(A,B,C,D,E,F,G)
      CASE M.mispar=2
         =MOVEWIN1(A,B,C,D,E,F,G)
      OTHERWISE
         =MOVEWIN2(A,B,C,D,E,f,G)
      ENDCASE
   ENDIF
#ENDIF
RETURN .T.
 
#IF VERS()="FoxPro 2.6"
FUNCTION MOVEWIN3
PARAMETER rr1,cc1,rr2,cc2,wn,ttl,ftr
* RR1= RENGLON SUPERIOR IZQUIERDO
* CC1= COLUMNA SUPERIOR IZQUIERDA
* RR2= RENGLON INFERIOR DERECHA
* CC2= COLUMNA INFERIOR DERECHA
* WN = NOMBRE DE LA VENTANA
* TTL= TITULO DE LA VENTANA
* FTR= PIE DE LA VENTANA
IF PARAMETER()>4
   if parameter()=6
      ftr=""
   ENDIF
   IF PARAMETER()=5
      TTL=''
      FTR=''
   ENDIF
   cre=rr1+INT((rr2-rr1)/2)
   cco=cc1+INT((cc2-cc1)/2)
   rw1=cre-1
   cw1=cco-1
   rw2=cre+1
   cw2=cco+1
   DEFI WIND (wn) FROM rw1,cw1 TO rw2,cw2 footer ftr TITL ttl DOUB SHAD COLO SCHE 1
   ACTI WIND (wn)
   DO WHILE rw1#rr1 .OR. rw2#rr2 .OR. cw1#cc1 .OR. cw2#cc2
      rw1=rw1+IIF(rw1>rr1,-1,0)
      rw2=rw2+IIF(rw2<rr2,1,0)
      cw1=cw1+IIF(cw1>cc1,-1,0)
      cw2=cw2+IIF(cw2<cc2,1,0)
      ZOOM WIND (wn) NORM FROM rw1,cw1 TO rw2,cw2
   ENDDO
ENDIF
RETURN .T.

FUNCTION MOVEWIN1
PARAMETER rr1,cc1,rr2,cc2,wn,ttl,FTR
PRiVATE rr1,cc1,rr2,cc2,wn,ttl,FTR
FTR=IIF(PARAMETER()=6,'*',FTR)
STORE 0 TO rw1,cw1
STORE 4 TO rw2,cw2
DEFI WIND (wn) FROM rw1,cw1 TO rw2,cw2 FOOT FTR TITL ttl DOUB SHAD COLO SCHE 1
ACTI WIND (wn)
DO WHILE rw1#rr1 .OR. rw2#rr2 .OR. cw1#cc1 .OR. cw2#cc2
   rw1=rw1+IIF(rw1<rr1,1,0)
   rw2=rw2+IIF(rw2<rr2,1,0)
   cw1=cw1+IIF(cw1<cc1,1,0)
   cw2=cw2+IIF(cw2<cc2,1,0)
   ZOOM WIND (wn) NORM FROM rw1,cw1 TO rw2,cw2
ENDDO
RETURN .T.
 
FUNCTION MOVEWIN2
PARAMETER rr1,cc1,rr2,cc2,wn,ttl,ftr
PRiVATE rr1,cc1,rr2,cc2,wn,ttl,ftr
FTR=IIF(PARAMETER()=6,'*',FTR)
cre=rr1+INT((rr2-rr1)/2)
cco=cc1+INT((cc2-cc1)/2)
rw1=0
cw1=0
rw2=24
cw2=79
 
DEFI WIND (wn) FROM rw1,cw1 TO rw2,cw2 FOOT FTR TITL ttl DOUB SHAD COLO SCHE 1
ACTI WIND (wn)
DO WHILE rw1#rr1 .OR. rw2#rr2 .OR. cw1#cc1 .OR. cw2#cc2
   rw1=rw1+IIF(rw1<rr1,1,0)
   rw2=rw2-IIF(rw2>rr2,1,0)
   cw1=cw1+IIF(cw1<cc1,1,0)
   cw2=cw2-IIF(cw2>cc2,1,0)
   ZOOM WIND (wn) NORM FROM rw1,cw1 TO rw2,cw2
ENDDO
RETURN .T.
#ENDIF