* 浜様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : AUTFAC.PRG             �
* � COMENTARIO    :                        �
* 麺様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER               �
* � FECHA      : 06-20-94                  �
* � HORA       : 00:10:25am                �
* � COPYRIGHT  : 1994 by GREGORIO REINER   �
* 藩様様様様様様様様様様様様様様様様様様様夕
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
DO OPPRP
DO OPCCP
DO WHIL .T.
	FAC3=POPMENU(7,23,'FACTURA DE PROPIETARIOS',;
	"Ingreso de Factura a Pagar ",;
	"Autoriza Pago",;
	"Men� Principal")
	DO CASE
	CASE FAC3=1
		DO PRP
	CASE FAC3=2
		DO WHILE .T.
			FAC4=POPMENU(7,23,'AUTORIZA FACTURA DE PROPIETARIOS',;
			"Autoriza por Propietario",;
			"Autoriza por Fecha",;
			"Desautoriza por Propietario ",;
			"Desautoriza por Fecha",;
			"Listados por Pantalla",;
			"Listados por Impresora",;
			"Men� Anterior")
			DO CASE
			CASE FAC4=1
				=AUTFAC3()
			CASE FAC4=2
				=AUTFAC3(.T.)
			CASE FAC4=3
				=DESFAC3()
			CASE FAC4=4
				=DESFAC3(.T.)
			CASE FAC4=5 .OR. FAC4=6
				DO WHILE .T.
					FAC5=POPMENU(7,23,'LISTADOS DE FACTURAS DE PROPIETARIOS',;
					"Autorizadas por Propietario",;
					"Autorizadas por Fecha",;
					"No autorizadas por Propietario ",;
					"No Autorizadas por Fecha",;
					"Men� Anterior")
					TT="Listado de Facturas de Propietarios"
					DO CASE
					CASE FAC5=1 .OR. FAC5=3
						STORE NUL TO RESPUESTA
						IF !EMPTY(ELIPRP("a Listar",-1,1))
							 FISC="CCP.PROCOD='"+PER.CODCLI+"' .AND. "+;
							 IIF(FAC5=1,"AUTORIZ","!AUTORIZ")
							 TT=TT+CRLF+;
							 IIF(FAC5=1,"A","No a")+;
							 "utorizadas de "+;
							 ALLTRIM(PER.CLIENTE)
							 =LFAUT(FAC4=5)
						ENDIF
					CASE FAC5=2 .OR. FAC5=4
						M.FECINI=INFEC("WIN","Fecha l�mite del Listado")
						IF !EMPTY(m.fecini)
							 FISC="CCP.fechave<={"+dtoc(m.fecini)+"} .AND. "+;
							 IIF(FAC5=2,"AUTORIZ","!AUTORIZ")
							 TT=TT+CRLF+;
							 IIF(FAC5=1,"A","No a")+;
							 "utorizadas hasta el "+;
							 dtoc(m.fecini)
							 =LFAUT(FAC4=5)
						ENDIF
					CASE FAC5=5
						EXIT
					ENDCASE
				ENDDO
			CASE FAC4=7
				EXIT
			ENDCASE
		ENDDO
	CASE FAC3=3
		EXIT
	ENDCASE
ENDDO
RETURN
