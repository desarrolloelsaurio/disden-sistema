* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LCCI.PRG                             บ
* บ COMENTARIO    : LISTA CUENTA CORRIENTE DE IMPUESTOS  บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                             บ
* บ FECHA      : 12-31-93                                บ
* บ HORA       : 04:05:51pm                              บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                 บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
PARAMETER PORPAN
PRIVATE PORPAN
CANT_MAX=9
DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], Habilitado[CANT_MAX],habilant[cant_max]
TEXTO[1,1]='FECHA OPERACION'
TEXTO[2,1]='CLIENTE'
TEXTO[3,1]='PARTIDA'
TEXTO[4,1]='IMPUESTO'
TEXTO[5,1]='PERIODO'
TEXTO[6,1]='FECHA VENCIMIENTO'
TEXTO[7,1]='ENTREGADA'
TEXTO[8,1]='DEVUELTA'
TEXTO[9,1]='MONTO'
TEXTO[1,2]=8
TEXTO[2,2]=15
TEXTO[3,2]=15
TEXTO[4,2]=15
TEXTO[5,2]=9
TEXTO[6,2]=8
TEXTO[7,2]=8
TEXTO[8,2]=2
TEXTO[9,2]=XACDIGI
STORE "" TO FISC,TTQUE
STORE .T. TO HABILITADO
STORE 1 TO FILPIN,FILFOP,FILEMP,FILENT,FILDEV,FILIMP,FILPRP,FILCLI,FILFVE
DO WHILE QUERYCCI(PORPAN)
   ********************************************
   IF FILCLI=3 .OR. FILFOP=3 .OR. FILFVE=3 .OR. FILPRP=3
      =OPCLI()
      SELE CCI
      STORE .T. TO HAY
      SET ORDER TO TAG CODCLI
      SET ORDER TO TAG CODINQ IN PER
      SET RELATION TO CCI.CODCLI INTO PER
      SET ORDER TO TAG PRPCOD IN PER
      SET RELATION TO CCI.CODCLI INTO PER ADDI
      CANT_MAX=3
      DIME TEXTO[CANT_MAX,5],VARIABLE[CANT_MAX],CTRL[CANT_MAX]
      STORE .T. TO VARIABLE,CTRL
      STORE .F. TO TEXTO
      TEXTO[2,1]="CANTIDAD"
      TEXTO[2,2]=XACDIGI
      texto[2,3]="TTL[2]"
      texto[2,4]="1"
      TEXTO[2,5]=REPL("9",XACDIGI)
      TEXTO[3,1]="MONTO"
      TEXTO[3,2]=XACDIGI
      texto[3,3]="TTL[3]"
      TEXTO[3,4]="CCI.MONTO"
      TEXTO[3,5]=REPL("9",XACDIGI-3)+".99"
      TT='Listado de Impuestos'+ttque
      IF FILCLI=3
         TEXTO[1,1]='INQUILINO'
         TEXTO[1,2]=30
         TEXTO[1,3]="ELTEXTO"
         TEXTO[1,5]="@!"
         =IIF(PORPAN,;
           LRESPT("LCCIPR","CCI","PER.CLIENTE","CCI.CODCLI","PER.CLIENTE",'"|"+STR(GTOTAL)+"|"',3,.T.),;
           LRESIT("LCCIIR","CCI","PER.CLIENTE","CCI.CODCLI","PER.CLIENTE",'"|"+STR(GTOTAL)+"|"',3,.T.))
      ELSE
         IF FILPRP=3
            TEXTO[1,1]='PROPIETARIO'
            TEXTO[1,2]=30
            TEXTO[1,3]="ELTEXTO"
            TEXTO[1,5]="@!"
            =IIF(PORPAN,;
              LRESPT("LCCIPR","CCI","PER.CLIENTE","CCI.CODCLI","PER.CLIENTE",'"|"+STR(GTOTAL)+"|"',3,.T.),;
              LRESIT("LCCIIR","CCI","PER.CLIENTE","CCI.CODCLI","PER.CLIENTE",'"|"+STR(GTOTAL)+"|"',3,.T.))
         ELSE
            IF FILFOP=3
               TEXTO[1,1]='FECHA OP'
               TEXTO[1,2]=8
               texto[1,3]="eltexto"
               TEXTO[1,5]="@D"
               =IIF(PORPAN,;
                 LRESPT("LCCIPR","CCI","CCI.FECHAOP","CCI.FECHAOP","CCI.FECHAOP",'"|"+STR(GTOTAL)+"|"',3,.T.),;
                 LRESIT("LCCIIR","CCI","CCI.FECHAOP","CCI.FECHAOP","CCI.FECHAOP",'"|"+STR(GTOTAL)+"|"',3,.T.))
            ELSE
               TEXTO[1,1]='FECHA VE'
               TEXTO[1,2]=8
               texto[1,3]="eltexto"
               TEXTO[1,5]="@D"
               =IIF(PORPAN,;
                 LRESPT("LCCIPR","CCI","CCI.FECHAVE","CCI.FECHAVE","CCI.FECHAVE",'"|"+STR(GTOTAL)+"|"',3,.T.),;
                 LRESIT("LCCIIR","CCI","CCI.FECHAVE","CCI.FECHAVE","CCI.FECHAVE",'"|"+STR(GTOTAL)+"|"',3,.T.))
            ENDIF
         ENDIF
      ENDIF
      =REOPCCI()
   ELSE
      =ACOPY(HABILITADO,HABILANT)
      DO WHILE CFGFAC()
         =IIF(PORPAN,LCCIPZ(),LCCIIZ())
         STORE .F. TO VARIABLE
      ENDDO
      STORE .F. TO VARIABLE
      =ACOPY(HABILANT,HABIITADO)
      =KTRUCH()
   ENDIF
ENDDO
RETURN CLOSDBF('PER')
