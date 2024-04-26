*
*                             MODIFICA MOVIMIENTO
*
* MODIFICA.PRG
*
store DEBE to X1
store HABER to X2
do while .t.
  store 0 to OP
  @14,54 get OP PICT "#"
  read
  do case
    case OP=0
      exit
    case OP=1
      ? chr(7)
      store " " to RES
      @21,20 say "No se puede modificar, pulse <RETURN> " get RES PICT "X"
      read
      @21,1 SAY SPACE(75)
    case OP=2
      ? chr(7)
      store " " to RES
      @21,20 say "No se puede modificar, pulse <RETURN> " get RES PICT "X"
      read
      @21,1 SAY SPACE(75)
    case OP=3
      do while .t.
        SELE BAL
        seek(MCODIGO)
        replace &DEB with EVAL(DEB)-MDEBE,&HAB with EVAL(HAB)-MHABER
        store "        " to ZZ
        @8,31 get ZZ PICT PICU2
        read
        store val(ZZ) to MCODIGO
        IF EMPTY(MCODIGO)
          loop
        endif
        seek(MCODIGO)
        IF !found()
          ? chr(7)
          store " " to RES
          @21,25 say "No existe, pulse <RETURN> " get RES PICT "X"
          read
          @21,1 SAY SPACE(75)
          loop
        endif
        if IMPUTABLE="N"
          ? chr(7)
          store " " to RES
          @21,20 say "No es imputable, pulse <RETURN> " get RES PICT "X"
          read
          @21,1 SAY SPACE(75)
          loop
        endif
        @3,9 say SPACE(60)
        @4,9 say SPACE(60)
        @3,9 say NOMBRE PICT "@X"
        @4,9 say EVAL(DEB)-EVAL(HAB) PICT PICU1
        seek(MCODIGO)
        replace &DEB with EVAL(DEB)+MDEBE,&HAB with EVAL(HAB)+MHABER
        SELE MOV
        exit
      enddo
    case OP=4
      do while .t.
        @9,31 get MFECHA PICT PICFEC
        read
        @21,1 SAY SPACE(75)
        if month(MFECHA)#KPERIODO
          ? chr(7)
          @21,27 say "El mes debe ser "+str(KPERIODO,2)
          loop
        endif
        exit
      enddo
    case OP=5
      @10,31 get MCONCEPTO PICT "@X"
      read
    case OP=6
      @11,31 get MDEBE PICT PICU1
      read
      if !EMPTY(MDEBE)
        store 0 to MHABER
        @12,31 say MHABER PICT PICU1
      else
        do while .t.
          @12,31 get MHABER PICT PICU1
          read
          IF EMPTY(MHABER)
            loop
          endif
          exit
        enddo
      endif
      @21,15 say (TDEBE-X1+MDEBE) PICT PICU1
      @21,42 say (THABER-X2+MHABER) PICT PICU1
    case OP=7
      @12,31 get MHABER PICT PICU1
      read
      if !EMPTY(MHABER)
        store 0 to MDEBE
        @11,31 say MDEBE PICT PICU1
      else
        do while .t.
          @11,31 get MDEBE PICT PICU1
          read
          IF EMPTY(MDEBE)
            loop
          endif
          exit
        enddo
      endif
      @21,15 say (TDEBE-X1+MDEBE) PICT PICU1
      @21,42 say (THABER-X2+MHABER) PICT PICU1
    case OP=8
      @21,10 say "Cancela <T> Todo el asiento, <U> Ultimo movimiento"
      store "x" to RES
      do while (RES#"T") .and. (RES#"U") .and. (RES#" ")
        store " " to RES
        @21,61 get RES PICT PAIP
        read
      enddo
      @21,1 SAY SPACE(75)
      do case
        case RES=" "
          loop
        case RES="T"
          store "S" to RES
          @21,30 SAY "Confirma (S/N)"
          @21,45 get RES PICT PAIP valid RES="S" .or. RES="N"
          read
          @21,1 SAY SPACE(75)
          if RES="N"
            loop
          endif
          @21,30 SAY "BORRANDO..."
          do BORRA
          @21,1 SAY SPACE(75)
          =MEN_LIN(SYSNOMBRE)
          return
        case RES="U"
          if KMOVIMIENTO[KPERIODO]>1
            store KMOVIMIENTO[KPERIODO]-1 to KMOVIMIENTO[KPERIODO]
          endif
          store DEBE to MDEBE
          store HABER to MHABER
          store CODIGO to MCODIGO
          SELE BAL
          seek(MCODIGO)
          if !EMPTY(MDEBE)
            replace &DEB with EVAL(DEB)-MDEBE
            store TDEBE-MDEBE to TDEBE
          else
            replace &HAB with EVAL(HAB)-MHABER
            store THABER-MHABER to THABER
          endif
          SELE MOV
          delete
          do PANTALLA
          =MEN_LIN(SYSNOMBRE)
          return
      endcase
  endcase
enddo
store TDEBE-X1+MDEBE   to TDEBE
store THABER-X2+MHABER to THABER
SELE BAL
seek(MCODIGO)
replace &DEB with EVAL(DEB)-X1+MDEBE,&HAB with EVAL(HAB)-X2+MHABER
SELE MOV
replace CODIGO with MCODIGO,DEBE with MDEBE,HABER with MHABER,FECHA with MFECHA,CONCEPTO with MCONCEPTO
@21,15 say TDEBE PICT PICU1
@21,42 say THABER PICT PICU1
=MEN_LIN(SYSNOMBRE)
return

