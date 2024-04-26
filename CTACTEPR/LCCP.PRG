*********************************************************************************
*-- Programa: LCCP.PRG
*-- Fecha   : 05-20-92 01:45pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADO DE CTA CTE PROVEEDORES
********************************************************************************
parameter porpan
private porpan
EXTERNAL ARRAY TEXTO,VARIABLE,Habilitado
CANT_MAX=12
DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], Habilitado[CANT_MAX],habilant[cant_max]
TEXTO[1,1]='PROVEEDOR'
TEXTO[2,1]='FECHA OPERACION'
TEXTO[3,1]='FECHA VENCIMIENTO'
TEXTO[4,1]='DETALLE'
TEXTO[5,1]='COMPROBANTE'
TEXTO[6,1]='NUMERO'
TEXTO[7,1]='ORIGEN'
TEXTO[8,1]='MONTO'
TEXTO[9,1]='MONEDA'
TEXTO[10,1]='EQUIV DOLAR'
TEXTO[11,1]='PAGADA'
TEXTO[12,1]='USUARIO'
TEXTO[1,2]=15
TEXTO[2,2]=8
TEXTO[3,2]=8
TEXTO[4,2]=15
TEXTO[5,2]=2
TEXTO[6,2]=14
TEXTO[7,2]=14
TEXTO[8,2]=XACDIGI
TEXTO[9,2]=2
TEXTO[10,2]=XACDIGI
TEXTO[11,2]=2
TEXTO[12,2]=10
store "" to ttque,FISC
store .t. to habilitado
store 1 to FILPRO,FILFEC,FILCPB,FILDOL,filmon,filemp
*do while queryCCP(PORPAN)
DO IPER_DO.SPR WITH .F.,.T.,"PER"," Listado de Cta. Cte. Proveedores ",.f.,16

*   IF FILPRO=3 .or. filfec=3 .or. filcpb=3
*      =IIF(M.PORPAN,IIF(FILPRO=3,LCCPPR(),LCCPPX()),IIF(FILPRO=3,LCCPIR(),LCCPIX()))
*   ELSE
*      =acopy(habilitado,habilant)
*      do while CFGFAC()
*         =IIF(PORPAN,LCCPPZ(),LCCPIz())
*         store .f. to variable
*      ENDdo
*      store .f. to variable
*      =acopy(habilant,habiitado)
*      =ktruch()
*   endif
*ENDdo
RETURN
