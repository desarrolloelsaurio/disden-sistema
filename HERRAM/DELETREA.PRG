parameter texto
store alltrim(texto)+"%" to texto
store "" to salida
do while texto#"%"
letra=alltrim(str(asc(left(texto,1))))
salida=salida+'chr('+letra+")+"
texto=substr(texto,2)
enddo
salida=left(salida,len(salida)-1)
_cliptext=salida
return(salida)
