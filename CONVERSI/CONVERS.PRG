set talk off
clea
scp=' - [ESC] para Salir'
*=movewin(1,1,23,78,'win','Conversiones','Su Opci¢n')
set mess wind
define popu opera from 0,0 
   defi bar  1 of opera prompt ' Centigrados a Farenheit'
   defi bar  2 of opera prompt ' Farenheit a Centigrados'
   defi bar  3 of opera prompt ' Hora Sexag. a Decimal'
   defi bar  4 of opera PROMPT ' Cantidad de Segundos'
   defi bar  5 of opera PROMPT ' Cent¡metros a Pulgadas'
   defi bar  6 of opera PROMPT ' Pulgadas a Cent¡metros'
   defi bar  7 of opera PROMPT ' Metrosý a Piesý'
   defi bar  8 of opera PROMPT ' Piesý a Metrosý'
   defi bar  9 of opera PROMPT ' Cent¡metros C£b. a Pulgadas C£b.'
   defi bar  10 of opera prompt ' Pulgadas C£b. a Cent¡metros C£b.'
   defi bar  11 of opera prompt ' Factorial'
   on sele popu opera deac popu
   DO WHILE .T.
	 acti popu opera
	 deac popu
   IF LASTKEY()=27
      EXIT
   ENDIF
   opcion=bar()
   do case
   case opcion=1
      =movewin(3,10,9,40,'win1',' Centigrados a Farenheit ')
      =movewin(20,5,22,75,'mess',' Mensaje ')
      set mess wind mess
      acti wind win1
      store 0 to respuesta
      do while lastkey()#27
         @ 1,1 say 'Centigrados:' get respuesta pict '9999999.99' mess 'Ingrese la Temperatura en Grados Cent¡grados'+scp
         @ 3,1 say 'Farenheit  :'
         read
         @ 3,15 say ctof(respuesta) pict '999999.99'
      enddo
      =RELEwin(1,10,9,40,'win1')
            set mess wind
      =relewin(20,5,22,75,'mess')
   case opcion=2
      =movewin(4,10,10,40,'win1',' Farenheit a Centigrados ')
      =movewin(20,5,22,75,'mess',' Mensaje ')
      set mess wind mess
      acti wind win1
      store 0 to respuesta
      do while lastkey()#27
         @ 1,1 say 'Farenheit  :' get respuesta pict '9999999.99' mess 'Ingrese la Temperatura en Grados Farenheit'+scp
         @ 3,1 say 'Centigrados:'
         read
         @ 3,15 say ftoc(respuesta) pict '999999.99'
      enddo
      =RELEwin(4,10,10,40,'win1')
            set mess wind
      =relewin(20,5,22,75,'mess')
   case opcion=3
      =movewin(5,10,11,40,'win1',' Hora Sexagesimal a Decimal ')
      =movewin(20,5,22,75,'mess',' Mensaje ')
      set mess wind mess
      acti wind win1
      store space(5) to respuesta
      do while lastkey()#27
         @ 1,1 say 'Hora Sexag.  :' get respuesta pict '99:99' mess 'Ingrese la Hora'+scp
         @ 3,1 say 'Hora Decimal :'
         read
         @ 3,16 say ttoh(RESPUESTA) pict '99.99'
      enddo
      =RELEwin(5,10,11,40,'win1')
            set mess wind
      =relewin(20,5,22,75,'mess')
   case opcion=4
      =movewin(6,10,12,40,'win1',' Cantidad de Segundos ')
      =movewin(20,5,22,75,'mess',' Mensaje ')
      set mess wind mess
      acti wind win1
      store space(5) to respuesta
      do while lastkey()#27
         @ 1,1 say 'Hora         :     ' get respuesta pict '99:99' mess 'Ingrese la Hora'+scp
         @ 3,1 say 'Segundos     :'
         read
         @ 3,16 say ttos(RESPUESTA) pict '9999999999'
      enddo
      =RELEwin(6,10,12,40,'win1')
            set mess wind
      =relewin(20,5,22,75,'mess')
   case opcion=5
      =movewin(7,10,13,40,'win1',' Cent¡metros a Pulgadas ')
      =movewin(20,5,22,75,'mess',' Mensaje ')
      set mess wind mess
      acti wind win1
      store 0 to respuesta
      do while lastkey()#27
         @ 1,1 say 'Cent¡metros:' get respuesta pict '9999999.99' mess 'Ingrese Cent¡metros'+scp
         @ 3,1 say 'Pulgadas   :'
         read
         @ 3,15 say cmtoin(respuesta) pict '999999.99'
      enddo
      =RELEwin(7,10,13,40,'win1')
            set mess wind
      =relewin(20,5,22,75,'mess')
   case opcion=6
      =movewin(8,10,14,40,'win1',' Pulgadas a Cent¡metros')
      =movewin(20,5,22,75,'mess',' Mensaje ')
      set mess wind mess
      acti wind win1
      store 0 to respuesta
      do while lastkey()#27
         @ 1,1 say 'Pulgadas   :' get respuesta pict '9999999.99' mess 'Ingrese Pulgadas'+scp
         @ 3,1 say 'Cent¡metros:'
         read
         @ 3,12 say intocm(respuesta) pict '999999999.99'
      enddo
      =RELEwin(8,10,14,40,'win1')
            set mess wind
      =relewin(20,5,22,75,'mess')
   case opcion=7
      =movewin(9,10,15,40,'win1',' Metrosý a Piesý ')
      =movewin(20,5,22,75,'mess',' Mensaje ')
      set mess wind mess
      acti wind win1
      store 0 to respuesta
      do while lastkey()#27
         @ 1,1 say 'Metrosý    :' get respuesta pict '9999999.999999' mess 'Ingrese Metrosý'+scp
         @ 3,1 say 'Piesý      :'
         read
         @ 3,12 say sqmtosqf(respuesta) pict '999999999.999999'
      enddo
      =RELEwin(9,10,15,40,'win1')
            set mess wind
      =relewin(20,5,22,75,'mess')
   case opcion=8
      =movewin(10,10,16,40,'win1',' Piesý a Metrosý ')
      =movewin(20,5,22,75,'mess',' Mensaje ')
      set mess wind mess
      acti wind win1
      store 0 to respuesta
      do while lastkey()#27
         @ 1,1 say 'Piesý      :' get respuesta pict '9999999.999999' mess 'Ingrese Piesý'+scp
         @ 3,1 say 'Metrosý    :'
         read
         @ 3,12 say sqftosqm(respuesta) pict '999999999.999999'
      enddo
      =RELEwin(9,10,15,40,'win1')
            set mess wind
      =relewin(20,5,22,75,'mess')
   case opcion=9
      =movewin(10,10,16,50,'win1',' Cent¡metros C£b. a Pulgadas C£b. ')
      =movewin(20,5,22,75,'mess',' Mensaje ')
      set mess wind mess
      acti wind win1
      store 0 to respuesta
      do while lastkey()#27
         @ 1,1 say 'Cent¡metros C£b. :  ' get respuesta pict '9999999.999999' mess 'Ingrese Cent¡metros C£bicos'+scp
         @ 3,1 say 'Pulgadas C£b.    :'
         read
         @ 3,20 say cctocuin(respuesta) pict '999999999.999999'
      enddo
      =RELEwin(10,10,16,50,'win1')
            set mess wind
      =relewin(20,5,22,75,'mess')
   case opcion=10
      =movewin(11,10,17,50,'win1',' Pulgadas C£b. a Cent¡metros C£b.')
      =movewin(20,5,22,75,'mess',' Mensaje ')
      set mess wind mess
      acti wind win1
      store 0 to respuesta
      do while lastkey()#27
         @ 1,1 say 'Pulgadas C£b.    :  ' get respuesta pict '9999999.999999' mess 'Ingrese Cent¡metros C£bicos'+scp
         @ 3,1 say 'Cent¡metros Cub. :'
         read
         @ 3,20 say cuintocc(respuesta) pict '999999999.999999'
      enddo
      =RELEwin(11,10,17,50,'win1')
            set mess wind
      =relewin(20,5,22,75,'mess')
   case opcion=11
      =movewin(12,10,18,50,'win1',' Factorial ')
      =movewin(20,5,22,75,'mess',' Mensaje ')
      set mess wind mess
      acti wind win1
      store 0 to respuesta
      do while lastkey()#27
         @ 1,1 say 'Numero           :  ' get respuesta pict '9999999' mess 'Ingrese N£mero Entero Positivo'+scp
         @ 3,1 say 'Factorial        :'
         read
         @ 3,20 say fctorial(respuesta) pict '999999999999999'
      enddo
      =RELEwin(12,10,18,50,'win1')
            set mess wind
      =relewin(20,5,22,75,'mess')
   endcase
ENDDO
*=relewin(1,1,23,78,'win')
RETURN
