function xxtochar
parameter xx
private xx,tipo,salida
M.TIPO=type("M.XX")
if M.TIPO='U'
   M.SALIDA=''
else
   if M.TIPO='N'
      M.SALIDA=alltrim(str(m.xx,10,iif(int(m.xx)=m.xx,0,2)))
   else
      if M.TIPO='D'
         M.SALIDA=dtoc(M.XX)
      else
         IF M.TIPO='L'
            M.SALIDA=IIF(M.XX,'SI','NO')
         ELSE
            IF M.XX='?'
               CLEA
               STORE '' TO M.SALIDA
               TEXT
               ***********************************************
               FUNCION : XXTOCHAR
               AUTOR   : GREGORIO REINER
               FECHA   : MARZO DE 1992
               ***********************************************
               INPUT   : VARIABLE DE CUALQUIER TIPO
               OUTPUT  : CARACTER REPRESENTADO POR LA VARIABLE
                         SI ES INDEFINIDA. ''
                         SI ES NUMERICA  . STR()
                         SI ES '?'       . ESTA AYUDA
                         SI ES CARACTER  . CARACTER
                         SI ES LOGICA    . .T. => 'SI'
                                         . .F. => 'NO'
                         SI ES FECHA     . DTOC(FECHA)
               USO     : A=XXTOCHAR(A)
               ***********************************************
               ENDTEXT
            ELSE
               M.SALIDA=M.XX
            ENDIF
         endif
      endif
   endif
ENDIF
return M.SALIDA
