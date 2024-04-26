********************************************************************************
*-- Programa: LADII.PRG
*-- Fecha   : 10/31/90 09:58pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LOS LISTADOS DE ADICIONALES POR IMPRESORA
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 24,0 SAY PADC('Imprimiendo los Datos Requeridos',80,'*')
DO CASE
CASE BAR()=1
   MAX=15+IIF(jannro=0,1,0)
   DECL co[MAX]
   tt='Listado de Adicionales'
   co[1]='N§ '
   co[2]='Denom. Interna '
   co[3]=' Denom. Adic.  '
   co[4]='Tipo '
   co[5]='Monto o Porc. '
   co[6]='  Per¡odo  '
   co[7]='RET.'
   co[8]='APO.'
   co[9]='BCON'
   co[10]='MES'
   co[11]='Q'
   co[12]='REST'
   co[13]='VEZ'
   co[14]='CT'
   co[15]='VENCIM. '
   IF jannro=0
      co[16]='      Empresa       '
   ENDIF
   DO ladii2
   RELE co,tt
CASE BAR()=2 .OR. BAR()=3
   dijo=BAR()
   MAX=3
   tt='Listado de F¢rmulas '+IIF(BAR()=2,'Quincenales','Mensuales')
   DECL co[MAX]
   co[1]=' N '
   co[2]='    Tipo de Hora    '
   co[3]=SPACE(50)+'F¢rmula'+SPACE(50)
   DO ladii1
   RELE tt,MAX,ct,co,dijo
ENDCASE
RETURN
