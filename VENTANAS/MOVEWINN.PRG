FUNCTION MOVEWINN
PARAMETER A,B,C,D,E,F
PRIVATE A,B,C,D,E,F
#IF "Wind" $ vers()
mxren=srows()
mxcol=scols()
	if c>mxren
	   resta=c-mxren
	   c=mxren
	   a=a-resta
	   if a<0
	      a=0
	   endif
	endif
	if d>mxcol
	   resta=d-mxcol
	   d=mxcol
	   b=b-resta
	   if b<0
	      b=0
	   endif
	endif
#else
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
#endif
#IF "Wind" $ vers()
   DEFI WIND (e) FROM A,B TO C,D NONE SHAD ;
   FONT "FOXFONT",12
   ACTI WIND (e)
#ELSE
IF LEN(SYS(17))#5 .OR. PARAMETER()=6
   DEFI WIND (e) FROM A,B TO C,D NONE SHAD COLO SCHE 8
   ACTI WIND (e)
ELSE
   M.mispar=INT(RAND()*3)+1
   DO CASE
   CASE M.mispar=3
      =MOVEWI3(A,B,C,D,E)
   CASE M.mispar=2
      =MOVEWI1(A,B,C,D,E)
   otherwise
      =MOVEWI2(A,B,C,D,E)
   endcase
ENDIF
#ENDIF
RETURN .T.
FUNCTION MOVEWI3
PARAMETER rr1,cc1,rr2,cc2,wn
* RR1= RENGLON SUPERIOR IZQUIERDO
* CC1= COLUMNA SUPERIOR IZQUIERDA
* RR2= RENGLON INFERIOR DERECHA
* CC2= COLUMNA INFERIOR DERECHA
* WN = NOMBRE DE LA VENTANA
* TTL= TITULO DE LA VENTANA
* FTR= PIE DE LA VENTANA
cre=rr1+INT((rr2-rr1)/2)
cco=cc1+INT((cc2-cc1)/2)
rw1=cre-1
cw1=cco-1
rw2=cre+1
cw2=cco+1
DEFI WIND (wn) FROM rw1,cw1 TO rw2,cw2 NONE SHAD COLO SCHE 8
ACTI WIND (wn)
DO WHILE rw1#rr1 .OR. rw2#rr2 .OR. cw1#cc1 .OR. cw2#cc2
   rw1=rw1+IIF(rw1>rr1,-1,0)
   rw2=rw2+IIF(rw2<rr2,1,0)
   cw1=cw1+IIF(cw1>cc1,-1,0)
   cw2=cw2+IIF(cw2<cc2,1,0)
   ZOOM WIND (wn) NORM FROM rw1,cw1 TO rw2,cw2
ENDDO
RETURN
FUNCTION MOVEWI1
PARAMETER rr1,cc1,rr2,cc2,wn
PRiVATE rr1,cc1,rr2,cc2,wn
STORE 0 TO rw1,cw1
STORE 4 TO rw2,cw2
DEFI WIND (wn) FROM rw1,cw1 TO rw2,cw2 NONE SHAD COLO SCHE 8
ACTI WIND (wn)
DO WHILE rw1#rr1 .OR. rw2#rr2 .OR. cw1#cc1 .OR. cw2#cc2
   rw1=rw1+IIF(rw1<rr1,1,0)
   rw2=rw2+IIF(rw2<rr2,1,0)
   cw1=cw1+IIF(cw1<cc1,1,0)
   cw2=cw2+IIF(cw2<cc2,1,0)
   ZOOM WIND (wn) NORM FROM rw1,cw1 TO rw2,cw2
ENDDO
RETURN .T.
FUNCTION MOVEWI2
PARAMETER rr1,cc1,rr2,cc2,wn
PRiVATE rr1,cc1,rr2,cc2,wn
cre=rr1+INT((rr2-rr1)/2)
cco=cc1+INT((cc2-cc1)/2)
rw1=0
cw1=0
rw2=24
cw2=79
DEFI WIND (wn) FROM rw1,cw1 TO rw2,cw2 NONE SHAD COLO SCHE 8
ACTI WIND (wn)
DO WHILE rw1#rr1 .OR. rw2#rr2 .OR. cw1#cc1 .OR. cw2#cc2
   rw1=rw1+IIF(rw1<rr1,1,0)
   rw2=rw2-IIF(rw2>rr2,1,0)
   cw1=cw1+IIF(cw1<cc1,1,0)
   cw2=cw2-IIF(cw2>cc2,1,0)
   ZOOM WIND (wn) NORM FROM rw1,cw1 TO rw2,cw2
ENDDO
RETURN .T.
