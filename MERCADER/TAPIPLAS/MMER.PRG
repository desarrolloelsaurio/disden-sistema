* ÚÄ FUNCION ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    File Name: MMER.PRG                                                   ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 10-26-92                                                   ³
* ³ Time created: 01:43:35am                                                 ³
* ³    QUE HACE : MUESTRA MERCADERIA                                         ³
* ³    VERSION  : TAPIPLAST                                                  ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION MMER
PARAMETER MUESTRA,COL,PARCIAL
PRIVATE MUESTRA,COL,PARCIAL
ACTI WIND WIN
@ 1,1 SAY 'RUBRO' COLO SCHE 3
@ 2,1 SAY 'SUB-RUBRO' COLO SCHE 3
@ 3,1 SAY 'ARTICULO' COLO SCHE 3
@ 4,1 SAY 'DESCRIPCION' COLO SCHE 3
@ 5,1 SAY 'COLOR' COLO SCHE 3
@ 6,1 SAY 'MARCA' COLO SCHE 3
@ 7,1 SAY 'LINEA' COLO SCHE 3
IF !PARCIAL
   @ 9,1 SAY 'PROVEEDOR 1' COLO SCHE 3
   @ 10,1 SAY 'PROVEEDOR 2' COLO SCHE 3
   @ 11,1 SAY 'PROVEEDOR 3' COLO SCHE 3
   @ 13,1 SAY 'MATERIAL' COLO SCHE 3
   @ 14,1 SAY 'GRUPO DE COMPRAS' COLO SCHE 3
   @ 15,1 SAY 'NACIONAL' COLO SCHE 3
ENDIF
IF MUESTRA
   =XSEEK(STR(VAL(AGX[1])),'RUB','CODRUB')
   NADA=RUB.RUBRO+'-'+ZERO(AGX[1],3)
   @ 1,COL GET NADA
   =XSEEK(STR(VAL(AGX[1]))+STR(VAL(AGX[2])),'RUB','TODOS')
   NADA=RUB.RUBRO+'-'+ZERO(AGX[2],3)
   @ 2,COL GET NADA
   @ 3,COL GET AGX[3] PICT '9999999'
   @ 4,COL GET AGX[4] PICT '@!'
   =XSEEK(AGX[5],'MIX','COLCOD')
   NADA=MIX.TEXTO1
   @ 5,COL GET NADA
   =XSEEK(AGX[6],'MI1','MARCOD')
   NADA=MI1.TEXTO1
   @ 6,COL GET NADA
   =XSEEK(AGX[7],'MIX','LINCOD')
   NADA=MIX.TEXTO1
   @ 7,COL GET NADA
   CLEA GETS
   IF !PARCIAL
      =XSEEK(AGX[8],'PRO','PROCOD')
      NADA=PRO.PROVEEDOR
      @ 9,COL GET NADA
      =XSEEK(AGX[9],'PRO','PROCOD')
      NADA=PRO.PROVEEDOR
      @ 10,COL GET NADA
      =XSEEK(AGX[10],'PRO','PROCOD')
      NADA=PRO.PROVEEDOR
      @ 11,COL GET NADA
      =XSEEK(AGX[11],'MIX','MATCOD')
      NADA=MIX.TEXTO1
      @ 13,COL GET NADA
      =XSEEK(AGX[12],'MIX','GRUCOD')
      NADA=MIX.TEXTO1
      @ 14,COL GET NADA
      AGX[14]=IIF(AGX[14],'SI','NO')
      @ 15,COL GET AGX[14]
      CLEA GETS
   ENDIF
ELSE
   STORE '  ' TO AGX[14]
ENDIF
RETURN .T.
