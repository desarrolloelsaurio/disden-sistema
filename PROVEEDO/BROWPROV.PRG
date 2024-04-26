set dele on
set excl off
use F:\sistemas\ventas\ventasa\personas orde tag proveedo
brow fiel 	cliente:H="NOMBRE", ;
			domicilio:H="DIRECCION", ;
			localidad:H="LOCALIDAD":6, ;
			telefono:H="TEL":20, ;
			fax:H="FAX":20 nomodify nodelete
