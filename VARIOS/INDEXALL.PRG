parameter eldir,sale
close data
if FUERARED()=ASC("S")
	=dotalk()
	set full on
	eldir=iif(empty(eldir),getdir(),eldir)
	=adir(pipo,eldir+"\*.dbf")
	for a= 1 to alen(pipo,1)
		?PIPO[a,1]
		use (eldir+"\"+pipo[a,1]) excl
		reindex
		use
	next
endif
if sale
	quit
endif
return .t.
