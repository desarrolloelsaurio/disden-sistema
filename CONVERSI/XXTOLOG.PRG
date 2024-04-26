function xxtolog
parameter xx
private xx,tipo,XX_SALIDA
M.TIPO=type("M.XX")
if M.TIPO='U'
   M.XX_SALIDA=.f.
else
   if M.TIPO='N'
      M.XX_SALIDA=(m.xx#0)
   else
      if M.TIPO='D'
         M.XX_SALIDA=(date()=M.XX)
      else
         IF M.TIPO='L'
            M.XX_SALIDA=m.xx
         ELSE
            IF M.XX='?'
               CLEA
               STORE .t. TO M.XX_SALIDA
               TEXT
               ***********************************************
               FUNCION : XXTOLOG
               AUTOR   : GREGORIO REINER
               FECHA   : MARZO DE 1992
               ***********************************************
               INPUT   : VARIABLE DE CUALQUIER TIPO
               OUTPUT  : CARACTER REPRESENTADO POR LA VARIABLE
                         SI ES INDEFINIDA-> .F.
                         SI ES NUMERICA  -> 0  => .F.
                                            !0 => .T.
                         SI ES '?'       -> ESTA AYUDA
                         SI ES CARACTER  -> YES, Y, S O SI => .T.
                                            ELSE           => .F.
                         SI ES LOGICA    -> VARIABLE
                         SI ES FECHA     -> HOY      => .T.
                                            OTRO DIA => .F.
               USO     : A=XXTOLOG(A)
               ***********************************************
               ENDTEXT
            ELSE
               M.XX_SALIDA=(m.xx $ 'SIs¡siNOnoNoSiS¡YYESyesYes')
            ENDIF
         endif
      endif
   endif
ENDIF
return M.XX_SALIDA
