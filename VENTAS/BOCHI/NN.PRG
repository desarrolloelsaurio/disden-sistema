
set printer to c:\pepe.txt
set printe on
set dele off
use \\bochi\zip\ventasa\factura             alias fac in 0
use \\bochi\zip\ventasa\cccli orde numerore alias ccc in 0
fechamin = date()-200
sele fac
scan for fechaem>fechamin and !dele()
	if !seek(fac.factura,"ccc")
		?fac.factura, fac.codcli, fac.montonet, fac.usuario, fac.fechaem
	endif
ends
set print to
set print off