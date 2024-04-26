********************************************************************************
*-- Programa: qwact.prg
*-- Fecha   : 05-04-92 03:19pm
*-- Version : G. REINER
*-- Notas   : DEVUELVE FISC PARA estOS
********************************************************************************
PARAMETER TROFIL,qw_campo
PRIVATE TROFIL
est_SALIDA=TROFIL
SALIDA='.F.'
DO CASE
CASE TROFIL=1
   SALIDA='.T.'+CHR(250)+'Todos los Tipos de Actualiz.'
CASE TROFIL=2
	=QWACT1("=",":")
CASE TROFIL=3
	=QWACT1("#"," NO ")
case TROFIL=4
   DO WHILE .T.
      store nul to respuesta
      if !empty(eliact('a Listar',ren,col))
         SALIDA=QW_FISCO(SALIDA,cual+'="'+left(mix.texto2,2)+'"')
         tt=TT+ALLTRIM(mix.texto1)+'/'
      else
         EXIT
      endif
   ENDDO
   IF SALIDA#".F."
      SALIDA="("+SALIDA+")"+chr(250)+sinult(tt)
   ENDIF
ENDCASE
=MEN_LIN(BOTOM)
RETURN SALIDA
FUNCTION QWACT1
PARAMETER QW_SIGNO,QW_TEXTO
   store nul to respuesta
   if !empty(eliact('a Listar',-1,1))
	  SALIDA=QW_CAMPO+QW_SIGNO+'"'+left(mix.texto2,2)+'"'+chr(250)+'Tipo Actualiz.:'+QW_TEXTO+ALLTRIM(mix.texto1)
   else
      STORE '.F.' TO SALIDA
   endif
RETURN SALIDA