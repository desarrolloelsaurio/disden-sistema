***************************************************
*-- Programa: LCCH.PRG
*-- Fecha   : 05-20-92 01:45pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADO DE CTA CTE CHEQUES
**************************************************
parameter porpan
private porpan
CANT_MAX=15
DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], Habilitado[CANT_MAX],habilant[cant_max]
TEXTO[1,1]='CLIENTE'
TEXTO[2,1]='FECHA OPERACION'
TEXTO[3,1]='TIPO'
TEXTO[4,1]='COMPROBANTE'
TEXTO[5,1]='ORIGEN'
TEXTO[6,1]='FECHA CHEQUE'
TEXTO[7,1]='BANCO'
TEXTO[8,1]='NRO CHEQUE'
TEXTO[9,1]='MONTO'
TEXTO[10,1]='HRS ACREDITACION'
TEXTO[11,1]='MONEDA'
TEXTO[12,1]='EQUIV DOLAR'
TEXTO[13,1]='FECHA ACREDITACION'
TEXTO[14,1]='ENTREGADO'
TEXTO[15,1]='GASTO'
TEXTO[1,2]=15
TEXTO[2,2]=8
TEXTO[3,2]=2
TEXTO[4,2]=15
TEXTO[5,2]=LEN(CHEQ.COMPR)
TEXTO[6,2]=8
TEXTO[7,2]=15
TEXTO[8,2]=15
TEXTO[9,2]=XACDIGI
TEXTO[10,2]=3
TEXTO[11,2]=1
TEXTO[12,2]=XACDIGI
TEXTO[13,2]=8
TEXTO[14,2]=2
TEXTO[15,2]=11
STORE '' TO FISC,TTQUE
store .t. to habilitado
store 1 to FILCLI,FILFEC,FILFEV,FILBCO,FILMON,FILACR,FILCCH,FILENT
do while queryCCH(PORPAN)
   IF FILcli=3 .or. filfec=3 .or. filfev=3 .or. filbco=3
      =IIF(M.PORPAN,LCCHPR(),LCCHIR())
   ELSE
      =acopy(habilitado,habilant)
      do while CFGFAC()
         =IIF(PORPAN,LCCHPZ(),LCCHIZ())
         store .f. to variable
      ENDdo
      store .f. to variable
      =acopy(habilant,habiitado)
	=ktruch()
   endif
ENDdo
RETURN
