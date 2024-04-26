********************************************************************************
*-- Programa: LRETI.PRG
*-- Fecha   : 10/31/90 09:58pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LOS LISTADOS DE RETENCIONES POR IMPRESORA
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 24,0 SAY PADC('Imprimiendo los Datos Requeridos',80,'*')
DO CASE
CASE BAR()=1
   MAX=12+IIF(jannro=0,1,0)
   DECL co[MAX]
   tt='Listado de Retenciones'
   co[1]='N§ '
   co[2]='Denom. Interna '
   co[3]=' Denom. Retenc.'
   co[4]='Tipo '
   co[5]='Monto o Porc. '
   co[6]='  Per¡odo  '
   co[7]='MES'
   co[8]='Q'
   co[9]='REST'
   co[10]='VEZ'
   co[11]='CT'
   co[12]='VENCIM. '
   IF jannro=0
      co[13]='      Empresa       '
   ENDIF
   DO lreti1
   RELE co,tt
CASE BAR()=2 .OR. BAR()=3
   dijo=BAR()
   MAX=3
   tt='Listado de F¢rmulas '+IIF(BAR()=2,'Quincenales','Mensuales')
   DECL co[MAX]
   co[1]=' N '
   co[2]='    Tipo de Hora    '
   mxl=IIF(MIN(achoja,acancho)>80,180,107)
   co[3]=PADC('F¢rmula',mxl," ")
   DO lreti2
   RELE tt,MAX,co,mxl,dijo
ENDCASE
RETURN
