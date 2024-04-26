set excl on
=adir(dire,"f:\sistemas\ventas\ventasa\*.dbf")
for I=1 to alen(dire,1)
	? dire(I,1)
	use ("f:\sistemas\ventas\ventasa\"+dire(I,1))
	pack memo
	reindex
next
return