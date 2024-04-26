=elrein("f:\sistemas\ventas\ventasa\")
=elrein("\\bochi\zip\ventasa\")
return

function elrein
para eld
=adir(qq,eld+"*.dbf")
for i=1 to alen(qq,1)
	aa=qq(i,1)
	?i,eld+aa
	use (eld+aa) excl
	reindex
next
return