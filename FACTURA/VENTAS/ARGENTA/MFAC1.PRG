********************************************************************************
*-- Programa: MFAC1.PRG
*-- Fecha   : 09-18-92 06:30pm
*-- Version : E.BANALOTTI
*-- Notas   : MUESTRA FACTURA PARA ASIGNAR STOCK
********************************************************************************
PARAMETER fattal, desdec,comosell
PRIVATE desdecual,hastacual, cuantos
desdecual=desdec
cuantos = OCCURS(",",fattal)+1
hastacual=desdecual+13
IF hastacual>cuantos
   hastacual=cuantos
ENDIF
ACTI WIND win
ren=0
do cabpan
B="³"+REPL(' ',30)+"³"+REPL(' ',8)+"³"+REPL(' ',12)+"³"+REPL(' ',14)+"³"+REPL(' ',10)+"³"
IF !COMOSELL
A="Ú"+REPL("Ä",30)+"Â"+REPL("Ä",8)+"Â"+REPL("Ä",12)+"Â"+REPL("Ä",14)+"Â"+REPL("Ä",10)+"¿"
C="Ã"+REPL("Ä",30)+"Å"+REPL("Ä",8)+"Å"+REPL("Ä",12)+"Å"+REPL("Ä",14)+"Å"+REPL("Ä",10)+"´"
D="À"+REPL("Ä",30)+"Á"+REPL("Ä",8)+"Á"+REPL("Ä",12)+"Á"+REPL("Ä",14)+"Á"+REPL("Ä",10)+"Ù"
@ 6,0 SAY A
@ 7,0 SAY B
@ 7,1  SAY "MERCADERIA"
@ 7,32 SAY "CANTIDAD"
@ 7,41 SAY "PRECIO UNIT."
@ 7,55 SAY "PRECIO TOTAL"
@ 7,69 SAY "ASIGNADA"
@ 8,0 SAY C
FOR ren=9 TO 22
   @ ren,0 SAY B
ENDFOR
@ ren,0 SAY D
REN=9
c1=1
c2=32
c3=41
c4=54
c5=69
@ 1,1 SAY "Cliente:"
@ 5,1 SAY "Factura N§:"
@ 1,45 SAY padl(biaja+space(10),10)+":"
@ 2,45 SAY "Cond. Pago:"
@ 4,45 SAY "Fecha de emisi¢n:"
@ 5,45 SAY "Se factura en "+alltrim(xauss)
sele fac
SELE PER
STOR 0 TO respuesta
M.CLIENTE=IIF(XSEEK(FAC.CODCLI,'PER','CODCLI'),PER.CLIENTE,'')
IF !EMPTY(M.CLIENTE)
	m->cliiva=PER.condiva
  acti wind win
  @ 1,1 SAY Alltrim(PER.codcli)+" "+Alltrim(M.cliente)
  @ 2,1 SAY Alltrim(PER.domicilio)+" T.E."+Alltrim(PER.telefonos)
  NADA=IIF(XSEEK(PER.localidad,'MIX','CIUCOD'),MIX->TEXTO1,SPACE(15))
  @ 3,1 SAY ZERO(PER.localidad,6)+" "+Alltrim(mix->texto1)
  @ 4,1 SAY Alltrim(xaciva(PER.condiva,1))+" "+Alltrim(PER.nroiva)
ENDIF
@ 5,13 GET m.NAFAC PICT "9999999999"
CLEA GETS
M.VIAJ=IIF(XSEEK(FAC.CODVIA,'VIA','CODVIA'),VIA.VIAJANTE,'')
IF !empty(M.VIAJ)
      acti wind win
      @ 1,57 SAY left(M.VIAJ,20)
ENDIF
M.PAGO=IIF(XSEEK(FAC.CONDPAGO,'MIX','PAGCOD'),MIX.TEXTO1,'')
IF !empty(M.PAGO)
    stor M.PAGO TO nada
    NADA=TRANSF(NADA,"@R 999-999-999-999-999-999")
    M.PAGO=ALLTRIM(STRTRAN(NADA,'-000',SPACE(4)))
    ACTI WIND WIN
    @ 2,57 GET M.PAGO

    clea GETS
ENDIF
@ 4,62  GET FAC.fechaem
CLEA GETS
ENDIF
REN=9
FOR I=desdecual TO hastacual
   SELE FAX
   nada=IIF(I=1,1,AT(",",fattal,I-1)+1)
   nada1=IIF(I=cuantos,LEN(fattal)+1,AT(",",fattal,I))
   GO VAL(SUBSTR(fattal, nada, nada1-nada))
   SCAT MEMV
   sele mer
   SET ORDER TO TAG ARTICULO
   @ ren ,c1 SAY iif(seek(ALLTRIM(m->ARTICULO)),left(MER.PALPOPUP,19),"Merca. inexistente ")
   @ ren ,c2 SAY m->cantidad pictu '99999.99'
   @ ren,c3 SAY m.monto pictu '99999999.99'
   @ ren, c4 SAY round(m.cantidad*m.monto,2) picture '99999999.99'
   nasig=iif(fax.imputada,'SI','NO')
   @ ren, c5 SAY nasig
   SELE FAX
   ren=ren+1
NEXT
IF REN < 22
   FOR K=REN TO 22
      @ REN,0 SAY B
      REN=REN+1
   ENDFOR
ENDIF
RETURN
