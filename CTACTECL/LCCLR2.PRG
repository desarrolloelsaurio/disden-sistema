* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LCCLR2.PRG                                               �
* � COMENTARIO    : IMPRIME TOTALES SALDO CTACTE CLIENTES                    �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 08-26-93                                                    �
* � HORA       : 02:33:05pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
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
