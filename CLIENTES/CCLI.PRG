*******************************
*-- Programa: CPER.PRG
*-- Fecha   : 06/27/91
*-- Version : G. REINER
*-- Notas   : CORRIGE CLIENTES
*******************************
STOR RECNO() TO ff
STORE STR(ff) TO registro
STORE PROGRAM() TO ULPR
=CHEQSEG()
	=MOVECENT(NUL,NUL,16,60,"WIN"," Correcci¢n Cliente ")
	SELE PER
   =lock() .or. lok()
   SET ORDER TO tag codcli
   SCAT MEMV
   STOR " Correcci¢n Cliente - " TO me1
   STOR 25 TO COL
   STORE .T. TO sigue
   SCAT MEMV
   DO mcli WITH .T.
   STORE m.cliente TO nada
   @ 2,COL GET nada PICTURE "@!" MESS 'Corrige el nombre del Cliente - [ESC] para Men£'
   READ
   IF LASTKEY()#27
      IF !EMPTY(nada)
         IF UPDATE()
            STORE nada TO m.cliente
         ENDIF
         IF sigue
            @ 3,COL GET m.enccom PICT "&X20";
              MESS "Corrige el Encargado de Compras del Cliente"
            @ 4,COL GET m.domicilio PICT "&X30";
              MESS "Corrige el Domicilio del Cliente"
            READ
            =XSEEK(m.localidad,'mix','CIUCOD')
            STORE mix.texto1 TO nada
            @ 5,COL GET nada MESS "[TECLA] y [ENTER] para corregir"
            READ
            IF UPDATE()
               CLEAR GETS
               STORE nul TO respuesta
               DO WHILE empty(eliciu("del Cliente",5,COL))
                  STORE nul TO respuesta
               ENDDO
               m.localidad=MIX.NU1
               nada=mix.texto1
               nada1="("+LEFT(mix.texto2,5)+")"
               nada2=STR(mix.nu2,4)
               =XSEEK(RIGHT(mix.TEXTO2,2),'MIX','PRVCOD')
               nada3=(mix.texto1)
               ACTI WIND win
               @ 5,COL GET nada
               @ 5,COL+21 SAY "Pcia.:" COLO SCHE 3
               @ 5,COL+28 GET nada3
               @ 6,COL+21 SAY "C.P.:" COLO SCHE 3
               @ 6,COL+28 GET nada2
               @ 6,13 GET nada1
               CLEAR GETS
					SELE PER
               STORE " " TO nada
            ENDIF
            @ 6,COL GET m.telefonos PICT "@!";
              MESS "Corrige el Tel‚fono del Cliente"
            @ 7,COL GET m.fax PICT "@!";
              MESS "Corrige el Fax del Cliente"
            READ
            STORE xaciva[m.condiva,1] TO nada
            @ 8,COL GET nada MESS "Condici¢n IVA - [TECLA] y [ENTER] para corregir"
            READ
            IF UPDATE()
               STORE nul TO respuesta
               DO WHILE empty(eliiva(" del Cliente",8,COL))
                  ACTI WIND win
               ENDDO
               STORE respuesta TO m.condiva
               STORE xaciva[m.condiva,1] TO nada
               ACTI WIND win
               @ 8,COL GET nada
               CLEAR GETS
					SELE PER
               STORE " " TO nada
            ENDIF
            @ 9,COL GET m.nroiva PICTURE "XXXXXXXXXXXXXXX";
              MESS "Corrige el N£mero de IVA del Cliente"
            @ 10,COL GET m.montomax PICTURE "99999999999.99";
              MESS "Corrige el Monto M ximo para el Cliente"
            @ 11,COL GET m.descuento PICTURE "XXXXXXXXXX";
              MESS "Corrige el Descuento para el Cliente"
            @ 12,COL GET m.precio PICTURE "99" RANGE 1,4;
              MESS "Corrige el Precio para el Cliente"
            READ
            NADA='XALIS'+ALLTRIM(STR(m.PRECIO))
            nada=&nada
            @ 12,COL GET nada
            clea gets
            =XSEEK(PER.zona,'mix','ZONCOD')
            nada=mix.texto1
            @ 13,COL+10 GET nada PICTURE "@!"  MESS "[TECLA] y [ENTER] para Corregir"
            READ
            IF UPDATE()
               STORE nul TO respuesta
               DO WHILE empty(elizon(' Correcto',13,COL+10))
               ENDDO
               STORE LEFT(MIX.TEXTO2,2) TO m.zona
               nada=mix.texto1
               @ 13,COL+10 GET nada PICTURE "@!"
               CLEA GETS
            ENDIF
            IF confirma ("las correcciones",.T.,18,0)
               =MEN_LIN(grabando)
					SELE PER
               GOTO ff
               GATH MEMV
               =repuse()
               UNLO IN PER
               =iaud(alltrim(m.codcli)+'-'+m.cliente)
            ENDIF
         ENDIF
      ENDIF
   ENDIF
   RELE WIND win
RETURN men_lin(botom)
