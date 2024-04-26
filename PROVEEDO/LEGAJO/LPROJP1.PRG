SELE PRO
set order to proveedor
fisc=fisc+' .and. !empty(legajo)'
SCAN FOR &fisc
DO mPROj
	 IF LASTKEY()=27
      EXIT
   ENDIF
ENDSCAN
RETURN
