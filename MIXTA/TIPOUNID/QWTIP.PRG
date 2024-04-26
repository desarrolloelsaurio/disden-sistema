********************************************************************************
*-- Programa: qwtip.prg
*-- Fecha   : 05-04-92 03:19pm
*-- Version : G. REINER
*-- Notas   : DEVUELVE FISC PARA TIPOS
********************************************************************************
PARAMETER Q_TROF,qw_campo
Q_SALIDA='.F.'
STORE Q_TROF TO M.TIP_SALIDA
DO CASE
CASE Q_TROF=1
     Q_SALIDA='.T.'+CHR(250)+'Todos los Tipos de Unidad'
CASE Q_TROF=2
	=QWtip1("=",":")
CASE Q_TROF=3
	=QWtip1("#"," NO ")
case Q_TROF=4
   DO WHILE .T.
      store nul to respuesta
      if !empty(eliTIP('a Listar',QWT_REN,QWT_COL))
         Q_SALIDA=QW_FISCO(Q_SALIDA,QWT_CUAL+'="'+left(mix.texto2,2)+'"')
         tt=TT+ALLTRIM(mix.texto1)+'/'
      else
         EXIT
      endif
   ENDDO
   IF Q_SALIDA#".F."
      Q_SALIDA="("+Q_SALIDA+")"+chr(250)+sinult(tt)
   ENDIF
ENDCASE
=MEN_LIN(BOTOM)
RETURN Q_SALIDA

FUNCTION QWTIP1
PARAMETER QW_SIGNO,QW_TEXTO
   store nul to respuesta
   if !empty(eliTIP('a Listar',QWT_REN,QWT_COL))
      Q_SALIDA=QW_CAMPO+QW_SIGNO+'"'+left(mix.texto2,2)+'"'+chr(250)+'Tipo de Unidad'+QW_TEXTO+ALLTRIM(mix.texto1)
   else
      STORE '.F.' TO Q_SALIDA
   endif
RETURN Q_SALIDA
