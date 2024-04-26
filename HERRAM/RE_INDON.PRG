path=getd()
inverso=.f.
CLEA
CLOSE DATA
SET EXCL OFF
SET TALK ON
CLEA
=ADIR(PIPO,(PATH+"\*.DBF"))
INICIO=IIF(INVERSO,ALEN(PIPO,1),1)
FINAL=IIF(INVERSO,1,ALEN(PIPO,1))
ELPASO=IIF(INVERSO,-1,1)
set prin to sale.prg
set prin on
FOR A=INICIO TO FINAL STEP ELPASO
	?
	?"****  ===================  ****" 
	?"USE "
	?? PATH+PIPO[A,1]
	USE (PATH+PIPO[A,1])
	?"DELETE TAG ALL"
	?
	for i=1 to 20
		if !empty(key(i))
			?"INDE ON "
			?? upper(key(i))
			??" TAG "
			?? upper(TAG(i))
			if !empty(tag())
				??" FOR "
				??UPPER(for(i))
			endif
		endif
	next
ENDF
set prin off
set prin to
RETURN
