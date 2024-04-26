PROCEDURE COMIRECI
DEFI WIND A FROM 20,20 TO 25,120
ACTI WIND A
SET TALK WINDOW A
SET ECHO ON
ON ERROR
ULPR=HORA_ULP(PROGRAM())
=OPAUD()

=opccl()
scan FOR COMPRRE = "RE"  .and. codcli<>"C000000001"
    do while !lock()
        wait "REINTENTE" wind
        if lastkey()=27
            return
        endif
    enddo
    TMP1=gentmp()
    m.rec=recn()
    m.qarea=sele()
    m.cualfec=fechaop
    m.codcli=codcli
    m.monto=monto
    SORT ON FECHAOP, COMPRRE TO (TMP1) ;
        FOR CODCLI=M.CODCLI AND fechaop<=m.cualfec AND m.rec#recn()
    USE (TMP1) IN 0 ALIAS TMP
    SELE TMP
    REPL ALL GY_DEBE WITH 0,GY_HABER WITH 0
    REPL GY_DEBE WITH MONTO ;
        FOR COMPRRE="FA" .OR. ;
        COMPRRE="ND" .OR. ;
        COMPRRE="SD"
    REPL GY_HABER WITH ABS(MONTO) FOR EMPTY(GY_DEBE)
    CALC SUM(GY_DEBE), SUM(GY_HABER) TO TGY_DEBE, TGY_HABER
    STORE TGY_DEBE-TGY_HABER TO TGY_SALDO

    TOTPAGO=TGY_HABER
    SCAN FOR !EMPTY(GY_DEBE)
        IF GY_DEBE>TOTPAGO
            EXIT
        ENDIF
        TOTPAGO = TOTPAGO - GY_DEBE
    ENDSCAN
    LACOMI = 0
    LACOMIP= 0
    IF !EOF()
        REPL GY_DEBE WITH GY_DEBE - TOTPAGO
        M.PAGARA = M.MONTO
        DO WHILE !EOF()
            IF !EMPTY(GY_DEBE)
                scatter memvar
                IF M.PAGARA > GY_DEBE
                    LACOMI = LACOMI + (GY_DEBE * COMISION)/ MONTO
                    LACOMIP = LACOMIP + (GY_DEBE * COMISIP)/ MONTO
                    m.equivale = (GY_DEBE * COMISION)/ MONTO
                    M.PAGARA = M.PAGARA - GY_DEBE
                ELSE
                    LACOMI = LACOMI + (M.PAGARA * COMISION)/ MONTO
                    LACOMIP = LACOMIP + (M.PAGARA * COMISIP)/ MONTO
                    m.equivale = (M.PAGARA * COMISION)/ MONTO
                    EXIT
                ENDIF
            ENDIF
            SKIP
        ENDDO
    ENDIF
    =OFF_TMP()
    m.comision=LACOMI
    M.COMISIP =LACOMIP
    sele (m.qarea)
    set orde to numerore
    go (m.rec)
    ?codcli, m.comision, m.comisip, MONTO, COMPR
**    wait str(comision,10,2)+str(m.comision,10,2)+str(monto,10,2)+codcli wind
    replace comision with m.comision, comisip with m.comisip
ends
****************************************************  historico
=opcclh()
scan FOR COMPRRE = "RE" and year(fechaop)=year(date()) .and. codcli<>"C000000001"
    do while !lock()
        wait "REINTENTE" wind
        if lastkey()=27
            return
        endif
    enddo
    TMP1=gentmp()
    m.rec=recn()
    m.qarea=sele()
    m.cualfec=fechaop
    m.codcli=codcli
    m.monto=monto
    SORT ON FECHAOP, COMPRRE TO (TMP1) ;
        FOR CODCLI=M.CODCLI AND fechaop<=m.cualfec AND m.rec#recn()
    *********
    sele (m.qarea)
    go (m.rec)

    *********
    USE (TMP1) IN 0 ALIAS TMP
    SELE TMP

    REPL ALL GY_DEBE WITH 0,  GY_HABER WITH 0
    REPL GY_DEBE WITH MONTO FOR COMPRRE="FA" .OR. COMPRRE="ND"
    REPL GY_HABER WITH ABS(MONTO) FOR EMPTY(GY_DEBE)
    CALC SUM(GY_DEBE), SUM(GY_HABER) TO TGY_DEBE, TGY_HABER
    TGY_SALDO = TGY_DEBE - TGY_HABER

    TOTPAGO=TGY_HABER
    SCAN FOR !EMPTY(GY_DEBE)
        IF GY_DEBE>TOTPAGO
            EXIT
        ENDIF
        TOTPAGO = TOTPAGO - GY_DEBE
    ENDSCAN
    LACOMI = 0
    LACOMIP= 0
    IF !EOF()
        REPL GY_DEBE WITH GY_DEBE - TOTPAGO
        M.PAGARA = M.MONTO
        DO WHILE !EOF()
            IF !EMPTY(GY_DEBE)
                IF M.PAGARA > GY_DEBE
                    LACOMI   = LACOMI   + (GY_DEBE * COMISION)/ MONTO
                    LACOMIP  = LACOMIP  + (GY_DEBE * COMISIP) / MONTO
                    M.PAGARA = M.PAGARA - GY_DEBE
                ELSE
                    LACOMI  = LACOMI  + (M.PAGARA * COMISION)/ MONTO
                    LACOMIP = LACOMIP + (M.PAGARA * COMISIP) / MONTO
                    EXIT
                ENDIF
            ENDIF
            SKIP
        ENDDO
    ENDIF
*    if int(m.lacomi) <> int(cclh.comision)
*       wait str(cclh.comision,10,2)+str(m.lacomi,10,2)+str(cclh.monto,10,2)+" "+cclh.codcli wind
*       defi wind ddd from 0,0 to 40, 95
*       acti wind ddd
*       brow in ddd
*       rele wind ddd
*    endif
    =OFF_TMP()
    m.comision=LACOMI
    M.COMISIP =LACOMIP
    sele (m.qarea)
    go (m.rec)
    ?codcli, m.comision, m.comisip, MONTO, COMPR
    replace comision with m.comision, comisip with m.comisip
ends
RELE WIND A

return
**********************************************




DEFI WIND A FROM 20,20 TO 25,80
ACTI WIND A
SET TALK WINDOW A
SET ECHO ON
ON ERROR
ULPR=HORA_ULP(PROGRAM())
=OPAUD()
=opccl()
scan FOR COMPRRE = "RE"
    do while !lock()
        wait "REINTENTE" wind
        if lastkey()=27
            return
        endif
    enddo
    m.newval = unacomi()
    ?codcli, newval, MONTO, COMPR
    repl comision with newval
    unlock
ends
RELE WIND A
RETURN

function unacomi
sele ccl
TMP1=gentmp()
m.rec=recn()
m.cualfec=fechaop
m.codcli=ccl.codcli
m.monto=ccl.monto
SORT ON FECHAOP, COMPRRE TO (TMP1) ;
    FOR CODCLI=M.CODCLI AND fechaop<=m.cualfec AND m.rec#recn()
USE (TMP1) IN 0 ALIAS TMP
SELE TMP
m.elarea = sele()
REPL ALL GY_DEBE WITH 0,GY_HABER WITH 0
REPL GY_DEBE WITH MONTO ;
    FOR COMPRRE="FA" .OR. ;
    COMPRRE="ND" .OR. ;
    COMPRRE="SD"
REPL GY_HABER WITH ABS(MONTO) FOR EMPTY(GY_DEBE)
CALC SUM(GY_DEBE), SUM(GY_HABER) TO TGY_DEBE, TGY_HABER
STORE TGY_DEBE-TGY_HABER TO TGY_SALDO

TOTPAGO=TGY_HABER
SCAN FOR !EMPTY(GY_DEBE)
    IF GY_DEBE>TOTPAGO
        EXIT
    ENDIF
    TOTPAGO = TOTPAGO - GY_DEBE
ENDSCAN
LACOMI =  0
IF !EOF()
    REPL GY_DEBE WITH GY_DEBE - TOTPAGO
    M.PAGARA = M.MONTO

    *******	tmp2=gentmp()
    *******	copy stru to (tmp2)
    *******	use (tmp2) in 0 alias tmp2

    DO WHILE !EOF()
        IF !EMPTY(GY_DEBE)

            scatter memvar

            IF M.PAGARA > GY_DEBE
                LACOMI = LACOMI + (GY_DEBE * COMISION)/ MONTO

                m.equivale = (GY_DEBE * COMISION)/ MONTO
                *******				insert into tmp2 from memvar

                M.PAGARA = M.PAGARA - GY_DEBE
            ELSE
                LACOMI = LACOMI + (M.PAGARA * COMISION)/ MONTO

                m.equivale = (M.PAGARA * COMISION)/ MONTO
                *******				insert into tmp2 from memvar

                EXIT
            ENDIF
        ENDIF
        SKIP
    ENDDO
ENDIF
sele tmp
OFF_BASE=FULL(DBF())
USE
OFF_RAIZ=LEFT(OFF_BASE,RAT(".",OFF_BASE))
ERASE (OFF_BASE)
ERASE (OFF_RAIZ+"CDX")
ERASE (OFF_RAIZ+"IDX")
ERASE (OFF_RAIZ+"FPT")
ERASE (OFF_RAIZ+"BAK")
sele ccl
go m.rec
retu LACOMI
