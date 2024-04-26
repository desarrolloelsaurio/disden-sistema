function trazable
parameter elarti
if xseek(elarti,"mer","articulo")
	if mer.trazable="S" .or. ;
       mer.trazable="M"
	       return .T.	
	endif
endif
return .F.