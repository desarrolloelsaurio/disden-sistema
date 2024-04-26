***********************************************
*-- Programa: QWMER
*-- Fecha   : 05-11-92 02:58pm
*-- Version : G. REINER
*-- Notas   : GENERA QUERY DE MERCADERIAS
*--           VERSION NOVOGAR
*-- Modificaci¢n GOYO 07-23-92 01:11am marca -> empresa
*******************************************************
PARAMETER TROFIL
PRIVATE TROFIL,QWM_SAL
STORE 2 TO FILMER
QWM_SAL='.F.'
DO CASE
CASE EMPTY(TROFIL) .or. type("trofil")#"N"
QWM_SAL='.F.'
CASE TROFIL=1
   QWM_SAL='.T.'
   tt='Todos los Art¡culos'
CASE TROFIL=2
	=OPRUB()
   stor nul TO respuesta
   IF !EMPTY(elirub("a Listar",-1,1))
      QWM_SAL='mer.rubro='+ALLTRIM(STR(RUB.CODRUB))
      tt=tt+'Por RUBRO '+ALLTRIM(rub.rubro)
   ENDIF
CASE TROFIL=3
   stor SPACE(20) TO respuesta
   =MOVEWIN(10,nul,14,78,'FIC',' Temporada a Listar ')
   @ 1,1 SAY 'Temporada a Listar ([ESC] Para Men£) ' GET respuesta PICT "@M Primavera,Verano,Oto¤o,Invierno" MESS '[ESPACIO] para Cambiar de Opci¢n'
   READ
   RELE WINDOW fic
   IF LASTKEY()#27
      QWM_SAL='mer.temporada="'+LEFT(RESPUESTA,1)+'"'
      tt=tt+'Por TEMPORADA '+ALLTRIM(respuesta)
   ENDIF
CASE TROFIL=4
   stor nul TO respuesta
   IF !EMPTY(elilin("a Listar",-1,1))
      xcos=left(texto2,2)
      QWM_SAL='MER.LINEA="'+LEFT(MIX.TEXTO2,2)+'"'
      tt=tt+'Por LINEA '+ALLTRIM(MIX.TEXTO1)
   ENDIF
CASE TROFIL=5
   stor nul TO respuesta
   IF !EMPTY(elimar("a Listar",-1,1))
      QWM_SAL='MER.MARCA="'+LEFT(MI1.TEXTO2,2)+'"'
      tt=tt+'Por MARCA '+ALLTRIM(MI1.TEXTO1)
   ENDIF
CASE TROFIL=6
   stor nul TO respuesta
   IF !EMPTY(eliPRO("a Listar",-1,1))
      QWM_SAL='MER.PRO1="'+PRO.PROCOD+'"'
      tt=tt+'1§ PROVEEDOR:'+ALLTRIM(PRO.PROVEEDOR)
   ENDIF
CASE TROFIL=7
   stor nul TO respuesta
   IF !EMPTY(eliPRO("a Listar",-1,1))
      QWM_SAL='MER.PRO1="'+PRO.PROCOD+'" .OR. MER.PRO1="'+PRO.PROCOD+'" .OR. MER.PRO2="'+PRO.PROCOD+'"'
      tt=tt+'Por PROVEEDOR '+ALLTRIM(PRO.PROVEEDOR)
   ENDIF
CASE TROFIL=8
   QWM_SAL='jean'
   tt=tt+'Por GRUPO ELECTRONICO'
CASE TROFIL=9
   QWM_SAL='!jean'
   tt=tt+'POR GRUPO BLANCO'
CASE TROFIL=10
	=OPRUB()
   do opsru
   stor nul TO respuesta
   IF !EMPTY(elisru("a Listar",-1,1))
      QWM_SAL='mer.subrubro='+alltrim(str(rub.codsrub))+' .and. mer.rubro='+ALLTRIM(STR(RUB.CODRUB))
      t1='SUBRUBRO:'+ALLTRIM(rub.rubro)
      =XSEEK(STR(RUB.CODRUB),'RUB','CODRUB')
      tt='Por RUBRO '+ALLTRIM(rub.rubro)+'/'+T1
   ENDIF
CASE TROFIL=11
	=OPRUB()
   do opsru
   stor nul TO respuesta
   IF !EMPTY(elisru("a Listar",-1,1))
      QWM_SAL='mer.subrubro='+alltrim(str(rub.codsrub))+' .and. mer.rubro='+ALLTRIM(STR(RUB.CODRUB))
      t1='SUBRUBRO:'+ALLTRIM(rub.rubro)
      =XSEEK(STR(RUB.CODRUB),'RUB','CODRUB')
      tt='Por RUBRO '+ALLTRIM(rub.rubro)+'/'+T1
      stor nul TO respuesta
      IF !EMPTY(elimar("a Listar",-1,1))
         QWM_SAL=QWM_SAL+' .AND. MER.MARCA="'+LEFT(MI1.TEXTO2,2)+'"'
         tt=tt+CHR(13)+CHR(10)+'MARCA '+ALLTRIM(MI1.TEXTO1)
      ENDIF
   ENDIF
CASE TROFIL=12
   QWM_SAL='!ENLISTA'
   tt=tt+'Exclu¡dos de Lista de Precios'
CASE TROFIL=13
   STORE NUL TO RESPUESTA
   IF !EMPTY(ELIMER("a Listar",-1,1))
      QWM_SAL='MER.ARTICULO="'+MER.ARTICULO+'"'
      tt=tt+ALLTRIM(MER.MERCA)+"-"+ALLTRIM(MER.ARTICULO)
      STORE 1 TO FILMER
   ENDIF
ENDCASE
=MEN_LIN(BOTOM)
RETURN QWM_SAL
