archivo=getfile('MEM','Archivo de Memoria a Modificar')
puntero=1
if last()#27
   rest from (archivo)
   LIST memo like * to file modifica noconsole
   fh=fopen("modifica.txt",2)
   =fseek(fh,0,2)
   =fputs(fh,chr(13)+chr(10)+'eof')
   =fclose(fh)
   fh=fopen("modifica.txt",2)
   PUBLIC MEMORIAS
   puntero=1
   dime memorias[puntero,3]
   STORE .T. TO LEE
   do while !feof(fh)
      IF LEE
         a=fgets(fh)
      ELSE
         STORE .T. TO LEE
      ENDIF
      if !empty(alltrim(a))
         TIPO=SUBSTR(A,20,1)
         variable=alltrim(left(a,10))
		 if tipo="A" 
		    var=variable
		    do while .t.
               if lee		    
   		          a=fgets(fh)
		       else
		          store .t. to lee
		       endif
               INICIO=AT("(",A)
               IF !EMPTY(INICIO)
                  POSFINAL=AT(")",A)
                  FINAL=POSFINAL-INICIO+1
                  AGREGA=SUBSTR(A,INICIO,FINAL)
                  tipo=SUBSTR(A,POSFINAL+6,1)
                  if tipo='C'
                     a=' '+a
                     c1=substr(A,23,39)
                     do while .t.
                        a=fgets(fh)
                        if !empty(left(a,10))
                           store .f. to lee
                           contenido=c1
                           exit
                        else
                           c1=c1+quecont(' '+a,'C',.f.)
                        endif
                     enddo
                  else
                     c1=QUECONT(space(11)+substr(A,10),tipo,.F.)
                  endif
                  variable=VAR+AGREGA
                  contenido=c1
                  =DICE(.T.)
               ELSE
                  STORE .F. TO LEE
                  EXIT
               ENDIF
		    enddo
         else
           if tipo="C"
              c1=substr(A,23,39)
              do while .t.
                 a=fgets(fh)
                 if !empty(left(a,10))
                    store .f. to lee
                    contenido=c1
                    =dice(.t.)
                    exit
                 else
                    c1=c1+quecont(a,'C',.f.)
                 endif
              enddo
  		   else
             =QUECONT(A,TIPO,.T.)
		   endif
        endif
      endif
   endd
   close all
endif
return puntero#1
FUNCTION QUECONT
PARAMETER CUERDA,COSA,PP
PRIVATE CUERDA,COSA,PP
IF COSA='L'
   contenido=substr(CUERDA,23,3)
   =DICE(PP)
ELSE
   IF COSA='D'
      contenido=substr(CUERDA,23,10)
      =DICE(PP)
   ELSE
      IF COSA='N'
         contenido=substr(CUERDA,23,AT('(',CUERDA)-23)
         =DICE(PP)
      else
         if cosa='C'
            CONTENIDO=SUBSTR(CUERDA,24,38)
         endif
      ENDIF
   ENDIF
ENDIF
RETURN CONTENIDO
FUNCTION DICE
PARAMETER UNO
IF UNO
   @ 1,1 say variable
   MEMORIAS[PUNTERO,1]=VARIABLE
   MEMORIAS[PUNTERO,2]=TIPO
   MEMORIAS[PUNTERO,3]=CONTENIDO
   puntero=puntero+1
   dime memorias[puntero,3]
ENDIF
RETURN .T.
