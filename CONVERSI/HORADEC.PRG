function horadec
parameter tme
a=val(left(tme,2))
b=val(substr(tme,4,2))
c=round(b/60,2)
c=a+c
return(c)


