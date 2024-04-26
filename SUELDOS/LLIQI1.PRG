********************************************************************************
*-- Programa: LLIQi1.PRG
*-- Fecha   : 12/31/90 04:02pm
*-- Version : G. REINER
*-- Notas   : IMPRIME una liquidacion EN HOJA BLANCA
********************************************************************************
ulpr=PROGRAM()
GOTO liq.empleado IN emp
GOTO emp.cat IN cat
GOTO emp.con IN con
DO pagehead
?
_WRAP=.T.
_ALIGNMENT='RIGHT'
? fechaliq
? 'LIQUIDACION DE SUELDOS Y JORNALES'
? 'Periodo '
IF mesaliq=13
   ?? STR(quialiq,1)+'¦ Cuota S.A.C. '
ELSE
   IF cat.periodo='M'
      ?? 'Mes de '
   ELSE
      ?? STR(quialiq,1)+'¦ Quincena de '
   ENDI
   ?? LEFT(meses[MESALIQ],3)
   ?? ' de '
ENDIF
?? STR(anoaliq,4)
? 'RECIBO N§:'
??STR(recaliq,6)
STORE recaliq+1 TO recaliq
_WRAP=.F.
?
? 'EMPLEADO             :'
?? emp.apynom
? 'CATEGORIA            :'
?? cat.categoria
? 'CONVENIO             :'
?? con.convenio
? 'FECHA DE INGRESO     :'
?? emp.fechaing
?? 'RECONOC. ANTIG. DESDE:' AT 40
?? emp.fechaani
tt=LEFT(tdoc[emp.tipodoc]+SPACE(21),21)+':'
? tt
?? emp.nrodoc
? 'LEGAJO               :'
?? legajo
?
?
?
STORE 0 TO tt,hh,aa,rr,ss,gg
STORE 0 TO thh,taa,trr,tss,tgg
STORE 1 TO vhor,vadi,vret,vsal
DO WHILE empleado=ea .AND. .NOT. EOF()
   IF imprime
      IF archivo<>"XXX"
         xa="'"+ALLTRIM(archivo)+"'"
         SELE &xa
         GOTO liq.registro
      ENDIF
      IF liq.filtcon=10
         ? STR(liq.unidad,14,2)
         ?? SPACE(5)
         ?? hortexto
         ?? STR(liq.valor,12,2)
         ?? STR(liq.monto,14,2)
         tt=tt+liq.monto
         hh=hh+liq.monto
      ELSE
         IF liq.filtcon=20
            IF thh=0
               thh=1
               ***
               ? SPACE(19)
               ?? 'TOTAL HABERES:                              '
               ?? STR(hh,14,2)
               *@**
            ENDIF
            ? SPACE(19)
            ?? aditexto
            IF liq.valor<>0
               ?? ' %'
               ?? STR(adimonto,10,2)
            ELSE
               ?? SPACE(12)
            ENDIF
            ?? STR(liq.monto,14,2)
            aa=aa+liq.monto
            tt=tt+liq.monto
         ELSE
            IF liq.filtcon=30
               IF thh=0
                  thh=1
                  ***
                  ? SPACE(19)
                  ?? 'TOTAL HABERES:                              '
                  ?? STR(hh,14,2)
                  *@**
               ELSE
                  IF taa=0 .AND. aa<>0
                     taa=1
                     ***
                     ? SPACE(19)
                     ?? 'TOTAL ADICIONALES:                          '
                     ?? STR(aa,14,2)
                     *@**
                  ENDIF
               ENDIF
               ? SPACE(19)
               ?? retencion
               IF liq.valor<>0
                  ?? ' %'
                  ?? STR(liq.valor,10,2)
               ELSE
                  ?? SPACE(12)
               ENDIF
               rr=rr+ABS(liq.monto)
               ?? STR(ABS(liq.monto),14,2)
               tt=tt+liq.monto
            ELSE
               IF liq.filtcon=40
                  IF thh=0
                     thh=1
                     ***
                     ? SPACE(19)
                     ?? 'TOTAL HABERES:                              '
                     ?? STR(hh,14,2)
                     *@**
                  ELSE
                     IF aa<>0 .AND. taa=0
                        ***
                        ? SPACE(19)
                        ?? 'TOTAL ADICIONALES:                          '
                        ?? STR(aa,14,2)
                        *@**
                        taa=1
                     ELSE
                        IF rr<>0 .AND. trr=0
                           trr=1
                           ***
                           ? SPACE(19)
                           ?? 'TOTAL RETENCIONES:                          '
                           ?? STR(rr,14,2)
                           *@**
                        ENDIF
                     ENDIF
                  ENDIF
                  ? STR(liq.unidad,14,2)
                  ?? SPACE(5)
                  ?? salario
                  ?? STR(liq.valor,12,2)
                  ?? STR(liq.monto,14,2)
                  ss=ss+liq.monto
               ELSE
                  IF thh=0
                     thh=1
                     ***
                     ? SPACE(19)
                     ?? 'TOTAL HABERES:                              '
                     ?? STR(hh,14,2)
                     *@**
                  ELSE
                     IF aa<>0 .AND. taa=0
                        ***
                        ? SPACE(19)
                        ?? 'TOTAL ADICIONALES:                          '
                        ?? STR(aa,14,2)
                        *@**
                        taa=1
                     ELSE
                        IF rr<>0 .AND. trr=0
                           trr=1
                           ***
                           ? SPACE(19)
                           ?? 'TOTAL RETENCIONES:                          '
                           ?? STR(rr,14,2)
                           *@**
                        ELSE
                           IF ss<>0 .AND. tss=0
                              tss=1
                              ? SPACE(19)
                              ?? 'TOTAL SALARIO FAMILIAR:                     '
                              ?? STR(ss,14,2)
                              *@**
                           ENDIF
                        ENDIF
                     ENDIF
                  ENDIF
               ENDIF
            ENDIF
            IF liq.filtcon=50
               IF liq.monto<>0
                  ***
                  ? SPACE(19)
                  ?? 'REDONDEO         :                          '
                  ?? STR(liq.monto,14,2)
                  *@**
                  hh=hh+liq.monto
               ENDIF
            ENDIF
            IF liq.filtcon>70
               IF adenrec
                  ? SPACE(5)
                  ?? '(N§:'+STR(liq.valor,9)+")"
                  ?? gasto
                  ?? SPACE(12)
                  ?? STR(ABS(liq.monto),14,2)
               ENDIF
               gg=gg+ABS(liq.monto)
            ENDIF
         ENDIF
      ENDIF
   ENDIF
   SELE liq
   SKIP
ENDDO
SKIP -1
IF thh=0
   thh=1
   ***
   ? SPACE(19)
   ?? 'TOTAL HABERES:                              '
   ?? STR(hh,14,2)
   *@**
ELSE
   IF aa<>0 .AND. taa=0
      ***
      ? SPACE(19)
      ?? 'TOTAL ADICIONALES:                          '
      ?? STR(aa,14,2)
      *@**
      taa=1
   ELSE
      IF rr<>0 .AND. trr=0
         trr=1
         ***
         ? SPACE(19)
         ?? 'TOTAL RETENCIONES:                          '
         ?? STR(rr,14,2)
         *@**
      ELSE
         IF ss<>0 .AND. tss=0
            ***
            ? SPACE(19)
            ?? 'TOTAL SALARIO FAMILIAR:                     '
            tss=1
            ?? STR(ss,14,2)
            *@**
         ELSE
            IF gg<>0
               ***
               ? SPACE(19)
               ?? 'TOTAL ADELANTOS:                            '
               ?? STR(gg,14,2)
               *@**
            ENDIF
         ENDIF
      ENDIF
   ENDIF
ENDIF
***
? SPACE(19)
?? 'NETO A PERCIBIR:                            '
neto=aa+hh-rr+ss-gg
?? STR(neto,14,2)
?
IF .NOT. EMPTY(m.acttex)
   ? ALLTRIM(UPPER(acttex))
ELSE
   ?
ENDIF
?
? '   Recib¡ el importe neto de esta liquidaci¢n en pago de mi remuneraci¢n corres-'
? 'pondiente al per¡odo indicado y duplicado de la misma conforme a la ley vigente.'
? '   Asimismo tomo conocimiento de que los haberes jubilatorios del per¡odo ******'
? ALLTRIM(perjub)
?? ' han sido depositados el dia '
?? fecdep
?? ' en el Banco '
?? bcodep
?
?
?
?
? 'SON '
?? ALLTRIM(UPPER(auss))
?? ':'
p=nux(neto)
IF LEN(p)<=80
   ? PADR(p,80,'*')
   ? REPLICATE("*",80)
ELSE
   FOR A=80 TO 1 STEP -1
      IF SUBSTR(p,A,1)=" "
         ? PADR(LEFT(p,A-1),80,"*")
         ? PADR(SUBSTR(p,A+1),80,"*")
         EXIT
      ENDIF
   NEXT
ENDIF
?
?
? ' RECIBI CONFORME'
? PADC(emp.apynom,80,' ')
?
?
? PADL('POR/'+ALLTRIM(janname),80,' ')
?
EJECT PAGE
RETURN
*: EOF: LLIQI1.PRG
