function PoneLinP
para cualpop, tira
priv cualpop, tira
VA='VA'+ALLTRIM(STR(row()+1))
STORE 'Usa Popup de '+tira+' ?' TO &VA
@ $+1,1 get cualpop pict UPPER(tira) func '*C' MESS &VA colo sche 19
return .t.
