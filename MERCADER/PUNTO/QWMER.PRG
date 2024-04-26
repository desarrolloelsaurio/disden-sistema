********************************************************************************
*-- Programa: QWMER.PRG
*-- Fecha   : 05-13-92 07:06pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE MERCADERIAS
*-- Modificaci¢n GOYO 05-17-92 12:00pm
*-- Modificaci¢n GOYO 05-17-92 12:51pm
*-- Modificaci¢n GOYO 05-19-92 10:16pm
********************************************************************************
FUNCTION QWMER
PARAMETER QM_TROFIL
QM_SALIDA='.F.'
STORE .F. TO UNOSOLO
DO CASE
CASE QM_TROFIL=1
	 TT='Todos los Art¡culos'
     QM_SALIDA='.T.'
CASE QM_TROFIL=2
   STORE nul TO respuesta
   IF !empty(elirub(" a Listar",-1,1))
      QM_SALIDA='mer.rubro="'+left(mix.texto2,3)+'"'
      tt='Por RUBRO '+ALLTRIM(mix.texto1)
   ELSE
     STORE '.F.' TO QM_SALIDA
   ENDIF
CASE QM_TROFIL=3
   rele temp
   dime temp[5]
   =GEN_TEM(@TEMP)
   m.temporada=TEMP[pop_lisT(5,10,@temp,'Temporada a Listar',.t.)]
   IF LASTKEY()#27
      QM_SALIDA='mer->temporada="'+LEFT(M.TEMPORADA,1)+'"'
      tt=tt+'Por TEMPORADA '+ALLTRIM(M.TEMPORADA)
   ELSE
      QM_SALIDA=".F."
   ENDIF
CASE QM_TROFIL=4
   rele temp
   dime temp[6]
   =GEN_SEX(@TEMP)
   m.SEXO=TEMP[pop_lisT(5,10,@temp,'Sexo a Listar',.t.)]
   IF LASTKEY()#27
      QM_SALIDA='mer->sexo="'+LEFT(M.sexo,1)+'"'
      tt=tt+'Por SEXO '+ALLTRIM(M.SEXO)
   ELSE
      QM_SALIDA=".F."
   ENDIF
CASE QM_TROFIL=5
   STORE nul TO respuesta
   IF !empty(elilin(" a Listar",-1,1))
      QM_SALIDA='MER.LINEA="'+left(texto2,2)+'"'
      TT=' - Por LINEA '+ALLTRIM(mix.texto1)
   ELSE
      STORE '.F.' TO QM_SALIDA
   ENDIF
CASE QM_TROFIL=6
   STORE nul TO respuesta
   IF !empty(ELIMAR(" a Listar",-1,1))
      QM_SALIDA='MER.MARCA="'+LEFT(MIX.TEXTO2,2)+'"'
      TT=' - Por MARCA '+ALLTRIM(MIX.TEXTO1)
   ELSE
STORE '.F.' TO QM_SALIDA
   ENDIF
CASE QM_TROFIL=7
   STORE nul TO respuesta
   IF !empty(elimat(" a Listar",-1,1))
      QM_SALIDA='MER.MATERIAL="'+LEFT(MIX.TEXTO2,2)+'"'
      TT=' - Por '+mader+' '+ALLTRIM(MIX.TEXTO1)
   ELSE
STORE '.F.' TO QM_SALIDA
   ENDIF
CASE QM_TROFIL=8
   STORE nul TO respuesta
   IF !empty(elisue(" a Listar",-1,1))
      QM_SALIDA='MER.SUELA="'+LEFT(MIX.TEXTO2,2)+'"'
      TT=' - Por '+UPPER(zuela)+' '+ALLTRIM(MIX.TEXTO1)
   ELSE
STORE '.F.' TO QM_SALIDA
   ENDIF
CASE QM_TROFIL=9
   STORE nul TO respuesta
   IF !empty(elitel(" a Listar",-1,1))
      QM_SALIDA='MER.TELA="'+TEL.TELCOD+'"'
      TT='Por '+UPPER(tella)+' '+ALLTRIM(tel.tela)
   ELSE
STORE '.F.' TO QM_SALIDA
   ENDIF
CASE QM_TROFIL=10
   QM_SALIDA='jean'
   TT=' - Por Grupo JEAN'
CASE QM_TROFIL=11
   QM_SALIDA='!jean'
   TT=' - Mercader¡as NO de JEAN'
CASE QM_TROFIL=12
STORE nul TO RESPUESTA
IF !EMPTY(ELIMER("",-1,1))
   QM_SALIDA='left(mer.articulo,10)="'+left(mer.articulo,10)+'"'
   TT='Por N§ de Plano '+left(mer.articulo,10)
   STORE .T. TO UNOSOLO
ELSE
   STORE '.F.' TO QM_SALIDA
ENDIF   
ENDCASE
RETURN QM_SALIDA
