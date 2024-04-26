* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LLIQI.PRG                                                บ
* บ COMENTARIO    : IMPRIME LIQUIDACION EXPENSAS                             บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : R. 'EL BATA'                                                บ
* บ FECHA      : 25/04/92                                                    บ
* บ HORA       : 00:11:20am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ MODIFICACIONES: 07-25-93 00:12am VARIOS                                  บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	tmppr=cabliq(cns.consorcio)
	if !empty(tmppr)
		store RIGHT('9999999,999,999.99',xacdigi) to picu
		sele tix
		INDE ON unicod to (GENTMP()) for tix.concod=cns.concod uniq COMP
		count to m.cuant
		DIME SSUM[M.CUANT],INDICE[M.CUANT]
		STORE NUL TO PUNTERO
		scan
			PUNTERO=PUNTERO+1
			INDICE[PUNTERO]=unicod
		endS
		use
		do optix
		STORE NUL TO SSUM,PUNTERO,m.ttot
		sele liq
		scan
			PUNTERO=iif(PUNTERO<m.cuant,PUNTERO+1,1)
			ssum[PUNTERO]=ssum[PUNTERO]+monto
		ends
		sele CNX
		SET RELA TO tipO INTO MIX
		SET ORDER TO TAG TIPCOD IN MIX
		SET ORDER TO TAG CSSCOD IN PER
		SET RELA TO CODCLI INTO PER addi
		store space(80) to acla
		SET MEMO TO 70
		=CABPRI()
		_PCOPIES=1
        PRINT
		scan for CNX.concod=cns.concod
			m.cual=ascan(indice,tipo)
			m.importe=ssum[m.cual]*porcentaje/100
			store m.ttot+m.importe to m.ttot
			=cabemp()
			_ALIGNMENT='RIGHT'
			? "LIQUIDACION Nง:"
			?? GETNULIQ(CNS.CONCOD)
			? "FECHA         :  "
			?? GETFELIQ(CNS.CONCOD)
			? "VENCIMIENTO   :  "
			?? GETVELIQ(CNS.CONCOD)
			?
			? PADC("CORRESPONDIENTE AL MES DE "+QMES(GETMELIQ(CNS.CONCOD)),80)
		    =SAYFILE(tmppr)
			?
			?"UNIDAD      : " AT 5
			??denom
			?"TIPO        : " AT 5
			??mix.texto1
			?"PROPIETARIO : " AT 5
			??PER.cliente
			?"IMPORTE     : " AT 5
			?? M.IMPORTE PICT "$"+PICU
			?
			?
			? "SON "+UPPER(ALLTRIM(XAUSS))+":"
			ENTEXTO=SAY_NUM(M.IMPORTE)
			DO WHILE !EMPTY(ENTEXTO)
			   T1=ALLTRIM(LEFT(ENTEXTO,80))
               IF LEN(T1)<=80
                  ? PADR(T1,80,"*")
                  EXIT
			   ENDIF
  			   PT1=RAT(" ",T1)
               T1=ALLTRIM(LEFT(ENTEXTO,PT1-1))
               ? PADR(T1,80,"*")
   	  	       ENTEXTO=SUBSTR(ENTEXTO,PT1+1)
			ENDDO
			?
			SALIDA=GETTELIQ(CNS.CONCOD)
			IF !EMPTY(SALIDA)
				? REPL("-",80)
				? SALIDA
				? REPL("-",80)
			ENDIF
			EJECT PAGE
			=IAUD(ALLTRIM(PER.CLIENTE)+"/"+CNS.CONCOD,.T.)
		ends
		ENDP
		=finimp()
		=REOPCNX()
		SET ORDER TO TAG CONSORCI IN PER
	endif
ELSE
	=iaudi()
ENDI
RETU
