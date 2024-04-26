*********************************************************************************
*-- Programa: LDEP.PRG
*-- Fecha   : 05-20-92 01:45pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADO DE CTA CTE PROVEEDORES SOLO DEUDAS
*-- Modificaci¢n GOYO 07-22-92 11:37pm marca -> empresa
********************************************************************************
parameter porpan
private porpan
EXTERNAL ARRAY TEXTO,VARIABLE,Habilitado
CANT_MAX=6
DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], Habilitado[CANT_MAX],habilant[cant_max]
TEXTO[1,1]='FECHA OPERACION'
TEXTO[2,1]='FECHA VENCIMIENTO'
TEXTO[3,1]='PROVEEDOR'
TEXTO[4,1]='DETALLE'
TEXTO[5,1]='ORIGEN'
TEXTO[6,1]='PENDIENTE'
TEXTO[1,2]=8
TEXTO[2,2]=8
TEXTO[3,2]=20
TEXTO[4,2]=15
TEXTO[5,2]=15
TEXTO[6,2]=XACDIGI
STORE '' TO FISC,DATE,TTQUE
store .t. to habilitado
store 1 to FILPRO,FILFEC
store 0 to respuesta
if !empty(ELIEMP("a Listar",-1,1))
   =OPCCP(JANNRO)
   DO WHILE QUERYDEP(PORPAN)
      IF FILPRO=3 .or. filfec=3
         TT=CHR(13)+CHR(10)+TT
         =IIF(M.PORPAN,IIF(FILPRO=3,lCCPPR(),lCCPPX()),IIF(FILPRO=3,lCCPIR(),lCCPIX()))
      ELSE
         =acopy(habilitado,habilant)
         DO WHILE CFGFAC()
            =IIF(PORPAN,LDEPPZ(),LDEPIZ())
            STORE .F. TO VARIABLE
         ENDdo
         STORE .F. TO VARIABLE
         =ACOPY(HABILANT,HABIITADO)
			=KTRUCH()
      ENDIF
   ENDdo
ENDIF
RETURN
