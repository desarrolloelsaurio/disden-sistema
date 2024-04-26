Function GETDIR
parameter cosa
private cosa,arreglo,salida
=adir(arreglo,COSA+'\',"D")
=asort(arreglo)
CANT_ELE=ALEN(ARREGLO,1)
IF CANT_ELE=1 .OR. ARREGLO[1,1]#"."
   DIME ARREGLO[CANT_ELE+2,5]
   ARREGLO[CANT_ELE+1,1]='.'
   ARREGLO[CANT_ELE+2,1]='..'   
   =asort(arreglo)
   CANT_ELE=CANT_ELE+2
ENDIF   
LARGO=IIF(CANT_ELE>20,20,CANT_ELE+2)
XOSA=1
col=occu("\",cosa)*5
@  0,col GET XOSA FROM ARREGLO SIZE LARGO,20 DEFA 1
READ
SALIDA=IIF(LAST()#27,ARREGLO[XOSA,1],'')
if empty(salida)
   return ""
else
   if arreglo[xosa,1]='..'
      RETURN getdir(left(cosa,rat('\',cosa)-1))
   else
      if left(arreglo[xosa,1],2)='.'
         return cosa
      else
         RETURN getdir(cosa+'\'+salida)
      endif
   endif
endif
