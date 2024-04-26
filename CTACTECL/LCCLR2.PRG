* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LCCLR2.PRG                                               บ
* บ COMENTARIO    : IMPRIME TOTALES SALDO CTACTE CLIENTES                    บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-26-93                                                    บ
* บ HORA       : 02:33:05pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION LCCLR2
	PARAMETER T_COSA,T_INKEY                  	              
	PRIVATE T_COSA,T_INKEY                  	                                  	            
	? LNS                             	     
	? SPACE(10)                       	      
	?? PAIP                           	                
	?? PADR(T_COSA,25)                	       
	?? PAIP                           	                  
	?? GDEBE PICT PICU                	       
	?? PAIP                           	                   
	?? GHABER PICT PICU               	       
	?? PAIP                           	                         
	?? GDEBE-GHABER PICT PICU         	       
RETURN IIF(T_INKEY,INKEY(NUL,"HM"),0)                                            
