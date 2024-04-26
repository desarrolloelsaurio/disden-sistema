*********************************************************************************
*-- Programa: LDEU.PRG
*-- Fecha   : 05-20-92 01:45pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADO DE CTA CTE CLIENTES SOLO DEUDAS
*-- Modificaci¢n GOYO 07-22-92 11:37pm marca -> empresa
********************************************************************************
parameter porpan
private porpan
CANT_MAX=5
DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], Habilitado[CANT_MAX],habilant[cant_max]
TEXTO[1,1]='FECHA OPERACION'
TEXTO[2,1]='FECHA VENCIMIENTO'
TEXTO[3,1]='DETALLE'
TEXTO[4,1]='ORIGEN'
TEXTO[5,1]='PENDIENTE'
TEXTO[1,2]=8
TEXTO[2,2]=8
TEXTO[3,2]=15
TEXTO[4,2]=15
TEXTO[5,2]=XACDIGI
STORE '' TO FISC,DATE,TTQUE
store .t. to habilitado
store 1 to FILCLI,FILFEC,filzon
store 0 to respuesta
if !empty(ELIEMP("a Listar",-1,1))
	=OPCCL()
   do while queryDEU(PORPAN)
      FISC=qw_fisc(FISC,'LEFT(PER.CODCLI,1)="C"')
      IF FILcli=3 .or. filfec=3 .or. filzon=3
         IF M.PORPAN
            =IIF(FILCLI=3,ldeuPR(),ldeuPX())
         ELSE
            =IIF(FILCLI=3,ldeuIR(),ldeuIX())
         ENDIF
      ELSE
         =acopy(habilitado,habilant)
         do while CFGFAC()
            =IIF(PORPAN,ldeuPz(),ldeuIz())
            store .f. to variable
         ENDdo
         store .f. to variable
         =acopy(habilant,habiitado)
      endif
   ENDdo
endif
RETURN
