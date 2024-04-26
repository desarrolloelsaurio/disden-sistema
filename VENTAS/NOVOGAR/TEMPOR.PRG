      CASE SALIDA=5
		=OPCIU()
      STORE .T. TO MARPOP
		=OPMAR()
      DO OPSER
      STORE NUL TO RESPUESTA
      IF ELIMAR("a Listar",-1,1)
         FISC="PER.FILTRO='S' .AND. !EMPTY(AT('"+LEFT(MI1.TEXTO2,2)+"/',PER.CAG))"
         TT="Listado de Services"+chr(13)+chr(10)+"Marca "+alltrim(mi1.texto1)
         DO LSERMARP
      ENDIF
      =CLOSDBF("PER")
