function deletrea
parameter palabra
palabra=upper(alltrim(palabra))
salida=""
for a=1 to len(palabra)
salida=salida+"chr("
cara=substr(palabra,a,1)
cara=alltrim(str(asc(cara)))
salida=salida+cara+")+"
endfor
_cliptext=salida
return salida

