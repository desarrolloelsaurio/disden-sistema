* FUNCTION QUE IMPRIME LA CABECERA DEL LISTADO. VIEJA COMO LA INJUSTICIA
* MODIFICACION PARA QUE EN CASO QUE LA SALIDA SEA POR PANTALLA Y EL LARGO
*   DE LA IMPRESION EXACTAMENTE 80 CARACTERES, NO SE SALTE UNA LINEA AL
*   CUETE - NO VERIFICADO EN WINDOWS / 01-09/95
FUNCTION _LIN
PARAMETER KOSA,LIN_NUMERO
M.KOSA=IIF(KOSA,M.LINEA,M.LNS)
ESOCH=(LEN(M.KOSA)=80 .AND. SET("DEVI")="SCREEN" .and. !_windows)
? M.KOSA
IF ESOCH
   ?? M.ACLA
ELSE
   ? M.ACLA
ENDIF
IF TYPE("LIN_NUMERO")="N"
   IF ESOCH
      ?? M.ACLA1
   ELSE
      ? M.ACLA1
   ENDIF
   IF LIN_NUMERO=2
      IF ESOCH
         ?? M.ACLA2
      ELSE
         ? M.ACLA2
      ENDIF
   ENDIF
ENDIF
IF ESOCH
   ??M.KOSA
ELSE
   ? M.KOSA
ENDIF
RETURN .T.
