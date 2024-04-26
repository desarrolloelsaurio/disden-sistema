********************************************************************************
*-- Programa: LRETP.PRG
*-- Fecha   : 10/31/90 06:02pm
*-- Version : G. REINER
*-- Notas   : DERIVA AL LISTADO DE RETENCIONES POR PANTALLA
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=1
   ACTI SCRE
   @ 24,0 SAY PADC('[ESC] para Men£',80,' ')
   SCAN
      DO mret WITH 'Muestra'
      DO WHILE INKEY()=0
      ENDDO
      IF LASTKEY()=27
         EXIT
      ENDIF
   ENDSCAN
   RELE WIND win
   RELE respu,es,filtro,fq,me1,ff,fm
   RELE ALL LIKE ret* EXCEPT retpop
CASE BAR()=2 .OR. BAR()=3
   dijo=BAR()
   MAX=3
   DECL co[MAX]
   tt='Listado de F¢rmulas '+IIF(BAR()=2,'Quincenales','Mensuales')
   co[1]=' N '
   co[2]='     Retenci¢n      '
   co[3]='                F¢rmula                           '
   DO lretp1
   RELE co,dijo,tt
CASE BAR()=4
   MAX=7+IIF(jannro=0,1,0)
   DECL co[MAX]
   tt='Listado de Retenciones'
   co[1]='N§ '
   co[2]='Denom. Interna '
   co[3]='Denom Ret.'
   co[4]='Tpo'
   co[5]='Monto o Porc'
   co[6]='  Per¡odo  '
   co[7]='VENCIM. '
   IF jannro=0
      co[8]='Empresa'
   ENDIF
   DO lretp2
   RELE co,tt
ENDCASE
RETURN
