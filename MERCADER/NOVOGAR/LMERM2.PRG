FUNCTION LMERM2
PARAMETER LMER_TIT
=TIT_(LMER_TIT)
LMERWRAP=_WRAP
_WRAP=.F.
TODO=PALISTAR	
RUBR=LEFT(TODO,20)
SUBR=SUBSTR(TODO,21)
? "RUBRO    :"+RUBR
? "SUBBRUBRO:"+SUBR
_WRAP=LMERWRAP
TODO=PALISTAR	
RUBR=LEFT(TODO,20)
SUBR=SUBSTR(TODO,21)
RETURN _LIN()
