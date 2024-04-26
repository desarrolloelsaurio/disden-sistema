FUNCTION HORA_ULP
parameter HO_ULPR
private HO_ULPR
#DEFINE NUL    0                                 && NUL
HO_ULPR=iif(!empty(parameter()),HO_ULPR,M.ULPR)
#IF "Wind" $ VERS()
#ELSE
IF TYPE("RH")#"U"
   IF EMPTY(WONTOP()) .OR. !WOUTPUT(WONTOP()) .OR. EMPTY(WLROW(WONTOP()))
      ACTI SCRE
      elren=iif(menu()="_MSYSMENU",NUL,nul)      
      @ ELREN,rh SAY TIME() COLO I
      @ ELREN,rp SAY PADC(HO_ULPR,10) COLO I
   ENDIF      
ENDIF
#ENDIF
RETURN HO_ULPR
