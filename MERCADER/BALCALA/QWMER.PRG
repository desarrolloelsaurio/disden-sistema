*****************************************************************************
*-- Programa: QWMER.PRG
*-- Fecha   : 22-04-1992
*-- Version : G. REINER
*-- Notas   : FUNCION QUERY DE MERCADERIAS
*-- Modificaci¢n GOYO 07-23-92 01:11am marca -> empresa
*****************************************************************************
FUNCTION QWMER
PARAMETER TROFIL
PRIVATE TROFIL
STORE '.F.' TO MER_SALIDA
DO CASE
CASE TROFIL=1
   MER_SALIDA=".T."
CASE TROFIL=2
	=OPRUB()
   STOR 0 TO respuesta
   IF !EMPTY(elirub(" a Listar",-1,1))
      MER_SALIDA='mer.rubro='+STR(RUB.CODRUB)
      tt=tt+chr(13)+chr(10)+'Por RUBRO '+ALLTRIM(rub.rubro)
   ELSE
      MER_SALIDA='.F.'
   ENDIF
CASE TROFIL=3
   rele temp
   dime temp[5]
   =GEN_TEM(@TEMP)
   m.temporada=TEMP[pop_lisT(5,10,@temp,'Temporada a Listar')]
   IF LASTKEY()#27
      MER_SALIDA='mer.temporada="'+LEFT(M.TEMPORADA,1)+'"'
      tt=tt+chr(13)+chr(10)+'Por TEMPORADA '+ALLTRIM(M.TEMPORADA)
   ELSE
      MER_SALIDA=".F."
   ENDIF
CASE TROFIL=4
   m.name=m.janname
   m.nro=m.jannro
	 store 0 to respuesta
	 if !empty(eliemp("a Listar",-1,1))
     	=OPMER()
        MER_SALIDA='.t.'
   ELSE
      MER_SALIDA=".F."
 endif
case trofil=5
   STOR nul TO respuesta
   IF elimar(" a Listar",-1,1))
      MER_SALIDA='mer.marca="'+left(mix.texto2,2)+'"'
      tt=tt+chr(13)+chr(10)+'MARCA '+ALLTRIM(MIX.TEXTO1)
   ELSE
      MER_SALIDA='.F.'
   ENDIF
CASE TROFIL=6
   =OPPRO()
   STOR NUL TO respuesta
   IF eliPRO(" a Listar",-1,1)
      MER_SALIDA='mer.PROVEEDOR="'+PRO.PROCOD+'"'
      tt=tt+chr(13)+chr(10)+'PROVEEDOR '+ALLTRIM(PRO.PROVEEDOR)
   ELSE
      MER_SALIDA='.F.'
   ENDIF
CASE TROFIL=7
      MER_SALIDA='mer.discrim'
      tt=tt+chr(13)+chr(10)+'Por Grupo VENTA POR PESO'
CASE TROFIL=8
      MER_SALIDA='!mer.discrim'
      tt=tt+chr(13)+chr(10)+'Por Grupo VENTA POR UNIDAD'
CASE TROFIL=8
   =OPMER() WITH JANNRO
   STOR 0 TO respuesta
   IF !EMPTY(eliMER(" a Listar",-1,1))
      MER_SALIDA='mer.ARTICULO="'+MER.ARTICULO+'"'
      tt=tt+chr(13)+chr(10)+'Por PRODUCTO '+ALLTRIM(MER.MERCA)
   ELSE
      MER_SALIDA='.F.'
   ENDIF
ENDCASE
=men_lin(botom)
RETURN MER_SALIDA
