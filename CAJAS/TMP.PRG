IF M.OPCION=1
   IF !XSEEK(STR(M.PASILLO,2)+M.MANO+STR(M.COLUMNA,3)+STR(M.FILA,2)+M.POSICION,"CJJ","UBICACION")
      IF EMPTY(M.EDITAR)
         IF !EMPTY(M.NUMERO) .AND. ;
              !EMPTY(M.CODCLI) .AND. ;
              !EMPTY(M.NUMINT) .AND. ;
              !EMPTY(M.PASILLO) .AND. ;
              !EMPTY(M.MANO) .AND. ;
              !EMPTY(M.COLUMNA) .AND. ;
              !EMPTY(M.FILA) .AND. ;
              !EMPTY(M.POSICION)
            M.ESTA=.T.
            =AGRABAR("CJJ")
            M.NUMERANT=M.NUMERO+1
            SCAT MEMV BLAN
            M.NUMERO=M.NUMERANT
            _CUROBJ=1
         ELSE
            STORE .T. TO M.INGRESO
            =FALTADAT("ASIGNACION DE CAJAS")
            SELE CJJ
            SCAT MEMV BLAN
            _CUROBJ=1
         ENDIF
      ENDIF
   ELSE
      =CARTEL("LA CAJA "+ALLTRIM(STR(CJJ.NUMERO)),;
        "DEL CLIENTE "+ALLTRIM(CJJ.CODCLI)+" ESTA UBICADA EN EL MISMO LUGAR",;
        "POR FAVOR VERIFIQUE Y REINTENTE",;
        ENTERCON)
      _CUROBJ=6
      RETURN .T.
   ENDIF
ELSE
   IF EMPTY(M.NUMERO)
      CLEA READ
   ENDIF
   SELE CJJ
   SCAT MEMV BLAN
   _CUROBJ=1
ENDIF
RETURN SGET("CJJ")
