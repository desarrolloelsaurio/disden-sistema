*
*                     BAJA/MODIFICACION DE MOVIMIENTO
*
* BAJASMOD.PRG
* OCT 1993
store "BAJA/MODIF DE ASIENTOS" to TITULO
if haycue()
	public MCODIGO,MFECHA,MCONCEPTO,MDEBE,MHABER,TDEBE,THABER,NROASI,NROMOV,DEB,HAB
	if haymov()
		store "DEBE"+ltrim(str(KPERIODO,2))  to DEB
		store "HABER"+ltrim(str(KPERIODO,2)) to HAB
		store 0 to MCODIGO,MDEBE,MHABER,TDEBE,THABER
		store SPACE(40) to MCONCEPTO
		store date() to MFECHA
		store .f. to CONTINUA
		ON KEY LABEL F1 DO F1
		do while .t.
			do RECUADRO
			@10,10 say "Asiento"
			store 0 to NROASI
			@10,18 get NROASI PICT "####" range 0,KASIENTO[KPERIODO]
			read
			IF !EMPTY(NROASI)
				SELE MOV
				SET ORDER TO TAG MOVIMIE
				IF SEEK(STR(KPERIODO,2)+STR(NROASI,4))
					CALC SUM(DEBE),SUM(HABER),MIN(MOVIMIENTO),MAX(MOVIMIENTO) WHILE;
					ASIENTO=NROASI .and. PERIODO=KPERIODO TO;
					TDEBE,THABER,INICIO,FINAL
					=MUESTRA()
					@1,10
					@1,27 say "BAJA/MODIF DE ASIENTOS"
					@21,20 say "<M> Modifica, <C> Cancela, <S> Sigue"
					store " " to RES
					@21,57 get RES PICT PAIP valid RES="M" .or. RES="C" .or. RES="S" .or. RES=" "
					read
					@21,1 SAY SPACE(75)
					do case
					case RES=" "
						loop
					case RES="M"
						store 0 to NROMOV
						@21,25 say "Movimiento a modificar"
						@21,48 get NROMOV PICT "####" range INICIO,FINAL
						read
						@21,1 SAY SPACE(75)
						SET ORDER TO TAG ASIENTO
						IF SEEK(STR(KPERIODO,2)+STR(NROASI,4)+STR(NROMOV))
							SET ORDER TO TAG MOVIMIE
							do RECUADRO
							do PANTALLA
							do MUESTRA2
							do MODIFICA
							do while round(TDEBE,2)#round(THABER,2)
								=MUESTRA()
								CALC MIN(MOVIMIENTO),MAX(MOVIMIENTO) FOR;
								ASIENTO=NROASI .and. PERIODO=KPERIODO TO;
								INICIO,FINAL
								@21,1 SAY SPACE(75)
								@21,25 say "Movimiento a modificar"
								store 0 to NROMOV
								do while (NROMOV<INICIO) .or. (NROMOV>FINAL)
									store 0 to NROMOV
									@21,48 get NROMOV PICT "####"
									read
								enddo
								@21,1 SAY SPACE(75)
								SET ORDER TO TAG ASIENTO
								IF SEEK(STR(KPERIODO,2)+STR(NROASI,4)+STR(NROMOV))
									SET ORDER TO TAG MOVIMIE
									do RECUADRO
									do PANTALLA
									do MUESTRA2
									do MODIFICA
								ELSE
									=BAJASMO1()
								endif
							enddo
						ELSE
							=BAJASMO1()
						endif
					case RES="C"
						IF CONFIRM1("CANCELAR ASIENTO")
							WAIT "BORRANDO..." WIND NOWA
							do BORRA
							WAIT CLEA
						ENDIF
					case RES="S"
						store .f. to CONTINUA
						do while .t.
							store "INGRESO DE MOVIMIENTOS" to TITULO
							do RECUADRO
							store KMOVIMIENTO[KPERIODO] to NROMOV
							seek(str(KPERIODO,2)+str(NROASI,4))
							sum DEBE,HABER to TDEBE,THABER while (ASIENTO=NROASI) .and. (PERIODO=KPERIODO)
							do while ASIENTO#NROASI
								skip -1
							enddo
							do PANTALLA
							do GRABA
							do while .t.
								store KMOVIMIENTO[KPERIODO] to NROMOV
								do ALTAS
								if MCODIGO#0
									store KMOVIMIENTO[KPERIODO]+1 to KMOVIMIENTO[KPERIODO]
								endif
								IF EMPTY(MCODIGO)
									store .f. to CONTINUA
									do while round(TDEBE,2)#round(THABER,2)
										=MUESTRA()
										@21,27 say "<M> Modifica, <C> Continua"
										store "M" to RES
										@21,54 get RES PICT PAIP valid RES="M" .or. RES="C"
										read
										@21,1 SAY SPACE(75)
										if RES="M"
											store MOVIMIENTO to FINAL
											do while (ASIENTO=NROASI) .and. (PERIODO=KPERIODO) .and. (! bof())
												skip -1
											enddo
											if (! bof()) .and. (!EOF())
												skip
											endif
											store MOVIMIENTO to INICIO
											@21,1 SAY SPACE(75)
											@21,25 say "Movimiento a modificar"
											store 0 to NROMOV
											@21,48 get NROMOV PICT "####" range INICIO,FINAL
											read
											@21,1 SAY SPACE(75)
											do while (MOVIMIENTO#NROMOV) .and. (ASIENTO=NROASI) .and. (!EOF())
												skip
											enddo
											if MOVIMIENTO#NROMOV
												=BAJASMO1()
												loop
											endif
											do RECUADRO
											store ASIENTO to NROASI
											do PANTALLA
											do MUESTRA2
											do MODIFICA
										else
											store .t. to CONTINUA
											exit
										endif
									enddo
									IF !CONTINUA
										go top
										go bottom
										go top
										do GRABA
										exit
									else
										do RECUADRO
										store KMOVIMIENTO[KPERIODO] to NROMOV
										do PANTALLA
									endif
								else
									do MODIFICA
									exit
								endif
							enddo
							if (TDEBE=0) .and. (THABER=0)      && Si cancela
								exit
							endif
							store 0 to OP
							@19,30 get OP PICT "#" range 1,2
							read
							if OP=1
								loop
							else
								store .f. to CONTINUA
								do while round(TDEBE,2)#round(THABER,2)
									store ASIENTO to NROASI
									=MUESTRA()
									@21,27 say "<M> Modifica, <C> Continua"
									store "M" to RES
									@21,54 get RES PICT PAIP valid RES="M" .or. RES="C"
									read
									@21,1 SAY SPACE(75)
									if RES="M"
										store MOVIMIENTO to FINAL
										do while (ASIENTO=NROASI) .and. (PERIODO=KPERIODO) .and. (! bof())
											skip -1
										enddo
										if (! bof()) .and. (!EOF())
											skip
										endif
										store MOVIMIENTO to INICIO
										@21,1 SAY SPACE(75)
										@21,25 say "Movimiento a modificar"
										store 0 to NROMOV
										@21,48 get NROMOV PICT "####" range INICIO,FINAL
										read
										@21,1 SAY SPACE(75)
										do while (MOVIMIENTO#NROMOV) .and. (ASIENTO=NROASI) .and. (!EOF())
											skip
										enddo
										if MOVIMIENTO#NROMOV
											=BAJASMO1()
											loop
										endif
										do RECUADRO
										store ASIENTO to NROASI
										do PANTALLA
										do MUESTRA2
										do MODIFICA
									else
										store .t. to CONTINUA
										exit
									endif
								enddo
								IF !CONTINUA
									exit
								else
									if round(TDEBE,2)#round(THABER,2)
										loop
									endif
									store " " to RES
									@21,30 SAY "Continua (S/N)"
									@21,45 get RES PICT PAIP valid RES="S" .or. RES="N"
									read
									@21,1 SAY SPACE(75)
									if RES="N"
										exit
									endif
								endif
							endif
						enddo
					endcase
				ELSE
					=CARTEL("NO EXISTE",;
					"EL ASIENTO"+ALLTRIM(STR(NROASI)),;
					"EN EL PERIODO "+ALLTRIM(KMESES[KPERIODO]),;
					"Pulse <RETURN>")
				ENDIF
			ELSE
				do GRABA
				EXIT
			endif
		enddo
	ENDIF
ENDIF
ON KEY LABEL F1
release MCODIGO,MFECHA,MCONCEPTO,MDEBE,MHABER,TDEBE,THABER,NROASI,NROMOV,DEB,HAB
RELE WIND WIN0
=MEN_LIN(SYSNOMBRE)
RETURN

FUNCTION BAJASMO1
	=CARTEL("NO EXISTE EL MOVIMIENTO "+ALLTRIM(STR(NROMOV)),;
	"EN EL ASIENTO "+ALLTRIM(STR(NROASI)),;
	"DEL PERIODO "+ALLTRIM(KMESES[KPERIODO]),;
	"Pulse <RETURN>")
	SET ORDER TO TAG MOVIMIE
RETURN .T.
