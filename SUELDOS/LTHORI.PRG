********************************************************************************
*-- Programa: LTHORI.PRG
*-- Fecha   : 10/31/90 09:58pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LOS LISTADOS DE TIPO DE HORA POR IMPRESORA
********************************************************************************
ULPR=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 24,0 say padc('Imprimiendo los Datos Requeridos',80,' ')
DO CASE
   CASE BAR()=1
   MAX=15+IIF(JANNRO=0,1,0)
   DECL co[MAX],ct[MAX],gt[MAX],gto[MAX],ctt[MAX]
   tt='Listado de Tipo de Hora'
   co[1]='N§ '
   co[2]='Denom. Interna '
   co[3]='  Denom. Hora  '
   co[4]='Tipo '
   co[5]='Monto o Porc. '
   co[6]='RET.'
   co[7]='APO.'
   co[8]='BON.'
   co[9]='INF.'
   co[10]='REST'
   co[11]='PROD'
   co[12]='PREM'
   co[13]='PRES'
   co[14]='Var. Total'
   co[15]='Var. Horas'
   ct[1]='str(recno("THOR"),3)'
   ct[2]='left(HORTIPOHOR,15)'
   ct[3]='left(HORTEXTO,15)'
   ct[4]='iif(HORTIPO="P","Porc.","Monto")'
   ct[5]='str(HORMONTO,14,2)'
   ct[6]="' '+HORRET+' '"
   ct[7]="' '+HORAPO+' '"
   ct[8]="' '+HORBON+' '"
   ct[9]="' '+HORINFO+' '"
   ct[10]="' '+HORRESET+' '"
   ct[11]="' '+HORPRODUC+' '"
   ct[12]="' '+HORPREMIO+' '"
   ct[13]="' '+HORPRESEN+' '"
   ct[14]='HORVARMON'
   ct[15]='HORVARHS'
   IF JANNRO=0
      co[16]='Empresa'
      ct[16]='****'
      gt[16]='thor->horfiltro'
      gto[16]='JAN'
      ctt[16]='left(jan->empresa,7)'
   ENDIF
   IF JANNRO<>0
      DO lgeni
   ELSE
	  DO lgenie
   ENDIF
   RELE co,ct,gt,gto,ctt
   CASE BAR()=2 .OR. BAR()=3
	  MAX=3
	  TT='Listado de F¢rmulas '+iif(bar()=2,'Quincenales','Mensuales')
      DECL co[MAX],ct[MAX]
      co[1]=' N '
      co[2]='    Tipo de Hora    '
      co[3]=space(50)+'F¢rmula'+space(50)
      ct[1]='STR(RECNO(),3)'
      ct[2]='HORTIPOHOR'
	  IF BAR()=2
         ct[3]='LEFT(HORFORMQUI,107)+space(107-len(left(horformqui,107)))'
	  ELSE
         ct[3]='LEFT(HORFORMMES,107)+space(107-len(left(horformmes,107)))'
	  ENDIF
     DO lgeni
     RELE tt,MAX,ct,co
ENDCASE
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
RETURN
