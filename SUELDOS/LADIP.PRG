********************************************************************************
*-- Programa: LADIP.PRG
*-- Fecha   : 10/31/90 06:02pm
*-- Version : G. REINER
*-- Notas   : DERIVA AL LISTADO DE ADICIONALES POR PANTALLA
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=1
   ACTI SCRE
   @ 24,0 SAY PADC('[ESC] para Men£',80,' ')
   DEFI WIND win FROM 0,0 TO 1,1
   SCAN
      DO madi WITH 'Muestra'
      DO WHILE INKEY()=0
      ENDDO
      @ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
      IF LASTKEY()=27
         EXIT
      ENDIF
   ENDSCAN
   RELE WIND win
   RELE respu,es,filtro,fq,me1,ff
   RELE ALL LIKE adi* EXCEPT adipop
CASE BAR()=2 .OR. BAR()=3
   dijo=BAR()
   MAX=3
   DECL co[MAX]
   tt='Listado de F¢rmulas '+IIF(BAR()=2,'Quincenales','Mensuales')
   co[1]=' N '
   co[2]='     Adicional      '
   co[3]='                F¢rmula                           '
   DO ladip1
   RELE co,dijo
CASE BAR()=4
   MAX=5+IIF(jannro=0,1,0)
   DECL co[MAX]
   tt='Listado de Adicionales'
   co[1]=' N '
   co[2]='     Adicional      '
   co[3]='Tipo '
   co[4]='Monto o Porc. '
   co[5]='  Per¡odo  '
   IF jannro=0
      co[6]='   Empresa    '
   ENDIF
   DO ladip2
   RELE co,tt
ENDCASE
RETURN
