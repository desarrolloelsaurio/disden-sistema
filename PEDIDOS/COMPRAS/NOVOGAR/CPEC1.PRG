*:*********************************************************************
*-- Programa: CPEC1.prg
*-- Fecha   : 06/06/91 04:30pm
*-- Versi¢n : R. 'EL BATA'
*-- Notas   : MODIFICA CABECERA DE NOTAS DE PEDIDO proveed.
*-- Modificaci¢n GOYO
*:*********************************************************************
SELE pec
STORE RECNO() TO ff
registro=STR(ff)
SCAT MEMV
SELE seg
STORE PROGRAM() TO ulpr
STORE '999,999,999,999.99' TO picu2
STORE '@R 999-999-999-999-999-999' TO picu4
ulpr=hora_ulp(program())
IF cheqseg()
   DEFINE WINDOW win FROM ipedr,ipedc TO ipedr+ipedla,ipedc+ipedan TITL " Correcci¢n de Notas de Pedido " SHAD COLOR SCHE 8 NONE
   =lock("pec") .or. lok('PEC')
   SELE pe1
	 ft2=blo_mult(M.PEDIDO+M.PROCOD)
   cuantos=OCCURS(",",ft2)+1
   registro=ft2
   =lock() .or. lok()
   DO mpec WITH ft2, 1
   COL=25
   kok=0
   ACTI WIND win
   @ 1,2 SAY "NOTA DE PEDIDO N§" COLO SCHE 3
   @ 2,2 SAY "PROVEEDOR        " COLO SCHE 3
   @ 3,2 SAY "MARCA            " COLO SCHE 3
   @ 4,2 SAY "COND. DE PAGO 1  " COLO SCHE 3
   @ 5,2 SAY "PRESUPUESTO      " COLO SCHE 3
   @ 6,2 SAY "COND. DE PAGO 2  " COLO SCHE 3
   @ 7,2 SAY "PRESUPUESTO      " COLO SCHE 3
   @ 8,2 SAY "COND. DE PAGO 3  " COLO SCHE 3
   @ 9,2 SAY "PRESUPUESTO      " COLO SCHE 3
   @ 1,COL SAY m.pedido PICT "@Z 9999999999"
   SELE pro
   SET ORDER TO 1
   SEEK m.procod
   m.proveedor=pro.proveedor
   @ 2,COL GET m.procod
   GO m.marca IN ("MAR")
   @ 3,COL SAY mar.marca
   IF !EMPTY(m.condpago1)
      GO m.condpago1 IN ("MIX")
      nada=mix.texto1
      @ 4,COL GET nada PICT picu4
      @ 5,COL GET m.presup1 PICT PICU2
      IF !EMPTY(m.condpago2)
         GO m.condpago2 IN ("MIX")
         nada=mix.texto1
         @ 6,COL GET nada PICT picu4
         @ 7,COL GET m.presup2 PICT PICU2
         IF !EMPTY(m.condpago3)
            GO m.condpago3 IN ("MIX")
            nada=mix.texto1
            @ 8,COL GET nada PICT picu4
            @ 9,COL GET m.presup3 PICT PICU2
         ENDIF
      ENDIF
   ENDIF
   CLEAR GETS
   IF m.condpago1=0
      nada=SPACE(23)
   ELSE
      GO m.condpago1 IN ("MIX")
      nada=TRANS(mix.texto1, picu4)
   ENDIF
   @ 4,COL GET nada
   READ
   IF updated()
      kok=kok+1
      SELE mix
      STORE nul TO respuesta
      IF !EMPTY(elipag("",4,COL))
         m.condpago1=RECNO("mix")
         nada=mix.texto1
         ACTI WIND win
         @ 4,COL GET nada PICT picu4
         CLEAR GETS
      ENDIF
   ENDIF
   IF !EMPTY(m.condpago1)
      @ 5,COL GET m.presup1 PICT picu2
      READ
      IF m.condpago2=0
         nada=SPACE(23)
      ELSE
         GO m.condpago2 IN ("MIX")
         nada=TRANS(mix.texto1, picu4)
      ENDIF
      @ 6,COL GET nada
      READ
      IF updated()
         kok=kok+1
         SELE mix
         STORE nul TO respuesta
         IF !EMPTY(elipag("",6,COL))
            m.condpago2=RECNO("mix")
            nada=mix.texto1
            ACTI WIND win
            @ 6,COL GET nada PICT picu4
            CLEAR GETS
         ENDIF
      ENDIF
      IF !EMPTY(m.condpago2)
         @ 7,COL GET m.presup2 PICT picu2
         READ
         IF m.condpago3=0
            nada=SPACE(23)
         ELSE
            GO m.condpago3 IN ("MIX")
            nada=TRANS(mix.texto1, picu4)
         ENDIF
         @ 8,COL GET nada
         READ
         IF updated()
            kok=kok+1
            SELE mix
            STORE nul TO respuesta
            IF !EMPTY(elipag("",8,COL))
               m.condpago3=RECNO("mix")
               nada=mix.texto1
               ACTI WIND win
               @ 8,COL GET nada PICT picu4
               CLEAR GETS
            ENDIF
         ENDIF
         IF !EMPTY(m.condpago3)
            @ 9,COL GET m.presup3 PICT picu2
            READ
         ENDIF
      ENDIF
   ENDIF
   IF !EMPTY(kok)
      IF confirma("Grabar la nota de pedido",.T.,10,10)
         ACTI SCRE
         @ 24,0 SAY PADC(grabando,80,'*') COLO SCHE 19
         SELE pec
         DO flok WITH "PEC"
         GATH MEMV
         DO repuse
         UNLO IN pec
      ENDIF
   ENDIF
   RELE WIND win
ELSE
   =iaudI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
*: EOF: CPEC1.PRG

