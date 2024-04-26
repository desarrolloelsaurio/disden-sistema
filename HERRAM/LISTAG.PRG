funct listag
para tageo
priv tageo,i
?'Archivo: '+dbf(tageo)+'    Alias: '+tageo
i=1
do while !EMPTY(tag(i,tageo))
   if row()=24
      =inkey(0)
      clea
   endif
   ?tag(i,tageo)
   ??' ---> ' at 15
   ??key(i,tageo) at 25
   ??iif(EMPTY(sys(2021,i,tageo)),'',' FOR '+sys(2021,i,tageo)) at 60
   i=i+1
ENDD
retur .t.