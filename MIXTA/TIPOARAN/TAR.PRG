* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : TAR.PRG                                                  บ
* บ COMENTARIO    : GESTION DE TIPOS DE ARANCEL                              บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 09-05-93                                                    บ
* บ HORA       : 02:54:51am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
EXTERNAL PROCEDURE ELITAR
ulpr=PROGRAM()
=cabpan1()
SELE mix
DIME MENSAJE[10],OTROS[7],TEXTO[2,9]
MENSAJE[1]=" Ingreso Tipos de Arancel - "              
MENSAJE[2]=" Ingreso Tipos de Arancel "
MENSAJE[3]="TIPO ARANCEL "
MENSAJE[4]="CODIGO TIPO ARANCEL "
MENSAJE[5]=" Correcciขn Tipo de Arancel - "
MENSAJE[6]=" Correcciขn Tipo de Arancel "
MENSAJE[7]="TIPO ARANCEL"
MENSAJE[8]="COD TIPO ARANCEL"
MENSAJE[9]="Listado de Tipos de Arancel"
MENSAJE[10]=' Tipos de Arancel '
OTROS[1]="TARTEX"
OTROS[2]=17
OTROS[6]='ORDTAR'
OTROS[7]='T'

TEXTO[1,1]='TIPO ARANCEL'                                         
TEXTO[1,2]=3                                                    
TEXTO[1,3]='!!!!!!!!!!!!!!!!!!!!'                          
TEXTO[1,4]='M.TEXTO1'                                                      
TEXTO[1,5]='TARTEX'                                                      
TEXTO[1,9]=20                                                              

TEXTO[2,1]='CODIGO   '                                         
TEXTO[2,2]=3                                                    
TEXTO[2,3]='!!'                                            
TEXTO[2,4]='LEFT(M.TEXTO2,2)'                                              
TEXTO[2,5]='TARCOD'                                                      
TEXTO[2,9]=2                                                               

ulpr=PROGRAM()
EXTERNAL ARRAY MENSAJE,OTROS,TEXTO
DO MIX.SPR
=MEN_LIN(BOTOM)
UNLO ALL
RETURN
