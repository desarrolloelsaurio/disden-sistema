* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : TFA.PRG                                                  บ
* บ COMENTARIO    : GESTION DE TIPOS DE FACTURACION                          บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 09-05-93                                                    บ
* บ HORA       : 02:54:51am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
EXTERNAL PROCEDURE ELITFA
ulpr=PROGRAM()
=cabpan1()
SELE mix
DIME MENSAJE[10],OTROS[7],TEXTO[2,9]
MENSAJE[1]=" Ingreso Tipos de Facturaciขn - "              
MENSAJE[2]=" Ingreso Tipos de Facturaciขn "
MENSAJE[3]="TIPO FACTURACION "
MENSAJE[4]="CODIGO TIPO FACTURACION "
MENSAJE[5]=" Correcciขn Tipo de Facturaciขn - "
MENSAJE[6]=" Correcciขn Tipo de Facturaciขn "
MENSAJE[7]="TIPO FACTURACION"
MENSAJE[8]="COD TIPO FACTURACION"
MENSAJE[9]="Listado de Tipos de Facturaciขn"
MENSAJE[10]=' Tipos de Facturaciขn '
OTROS[1]="TFATEX"
OTROS[2]=17
OTROS[6]='ORDTFA'
OTROS[7]='3'

TEXTO[1,1]='TIPO FACTURACION'                                         
TEXTO[1,2]=3                                                    
TEXTO[1,3]='!!!!!!!!!!!!!!!!!!!!'                          
TEXTO[1,4]='M.TEXTO1'                                                      
TEXTO[1,5]='TFATEX'                                                      
TEXTO[1,9]=20                                                              

TEXTO[2,1]='CODIGO   '                                         
TEXTO[2,2]=3                                                    
TEXTO[2,3]='!!'                                            
TEXTO[2,4]='LEFT(M.TEXTO2,2)'                                              
TEXTO[2,5]='TFACOD'                                                      
TEXTO[2,9]=2                                                               

ulpr=PROGRAM()
EXTERNAL ARRAY MENSAJE,OTROS,TEXTO
DO MIX.SPR
=MEN_LIN(BOTOM)
UNLO ALL
RETURN
