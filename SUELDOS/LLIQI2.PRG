*******************************************************************************
*-- Programa: LLIQI2.PRG
*-- Fecha   : 01/02/91 11:23pm
*-- Version : G. REINER
*-- Notas   : LIQUIDACION EN PREIMPRESO TIPO CAPSE
********************************************************************************
ulpr=PROGRAM()
GOTO liq.empleado IN emp
GOTO emp.cat IN cat
GOTO emp.con IN con
IF mesaliq=13
   q1=STR(quialiq,1)+'¦ SAC '
ELSE
   IF cat.periodo='Q'
      q1=STR(quialiq,1)+'a Q.'
   ELSE
      q1='MES:'
   ENDI
ENDIF
??? CHR(18)
?? ALLTRIM(jan.empresa) AT 1
?? jan.empresa AT 70
??? CHR(18)
? ALLTRIM(jan.domicilio) AT 1
?? jan.domicilio AT 70
? ALLTRIM(jan.localidad) AT 1
?? jan.localidad AT 70
IF .NOT. EMPTY(jan.plusuno)
   ? jan.plusuno AT 1
   ?? jan.plusuno AT 70
   IF .NOT. EMPTY(jan.plusdos)
      ? jan.plusdos AT 1
      ?? jan.plusdos AT 70
      IF .NOT. EMPTY(jan.plustres)
         ? jan.plustres AT 1
         ?? jan.plustres AT 70
      ENDIF
   ENDIF
ENDIF
?
?
?
? q1 AT 1
IF mesaliq<>13
   ?? LEFT(meses[mesaliq],3) AT 7
ENDIF
?? STR(anoaliq,4) AT 11
?? ALLTRIM(emp.apynom) AT 17
?? con.convenio AT 48
?? q1 AT 63
IF mesaliq<>13
   ?? LEFT(meses[MESaliq],3) AT 69
ENDIF
?? STR(anoaliq,4) AT 73
?? ALLTRIM(emp.apynom) AT 79
?? con.convenio AT 110
?
? emp.fechaing AT 1
?? emp.nrodoc AT 17
?? cat.categoria AT 31
?? legajo AT 47
?? emp.fechaing AT 63
?? emp.nrodoc AT 79
?? cat.categoria AT 93
?? legajo AT 109
?
?
??? CHR(15)
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
         ? STR(liq.unidad,14,2) AT 1
         ?? hortexto AT 21
         ?? STR(liq.valor,14,2) AT 57
         ?? STR(liq.monto,16,2) AT 72
         IF liq.unidad>1
            ?? STR(liq.unidad,14,2) AT 108
         ENDIF
         ?? hortexto AT 128
         ?? STR(liq.valor,14,2) AT 164
         ?? STR(liq.monto,16,2) AT 179
         tt=tt+liq.monto
         hh=hh+liq.monto
      ELSE
         IF liq.filtcon=20
            IF thh=0
               thh=1
               ***
               ? 'TOTAL HABERES:' AT 21
               ?? STR(hh,16,2) AT 72
               ?? 'TOTAL HABERES:' AT 128
               ?? STR(hh,16,2) AT 179
               *@**
            ENDIF
            ? aditexto AT 21
            IF liq.valor<>0
               ?? ' %' AT 57
               ?? STR(adimonto,12,2)
            ENDIF
            ?? STR(liq.monto,16,2) AT 72
            ?? aditexto AT 128
            IF liq.valor<>0
               ?? ' %' AT 164
               ?? STR(adimonto,12,2)
            ENDIF
            ?? STR(liq.monto,16,2) AT 179
            aa=aa+liq.monto
            tt=tt+liq.monto
         ELSE
            IF liq.filtcon=30
               IF thh=0
                  thh=1
                  ***
                  ? 'TOTAL HABERES:' AT 21
                  ?? STR(hh,16,2) AT 72
                  ?? 'TOTAL HABERES:' AT 128
                  ?? STR(hh,16,2) AT 179
                  *@**
               ELSE
                  IF taa=0 .AND. aa<>0
                     taa=1
                     ***
                     ? 'TOTAL ADICIONALES:' AT 21
                     ?? STR(aa,16,2) AT 72
                     ?? 'TOTAL ADICIONALES:' AT 128
                     ?? STR(aa,16,2) AT 179
                     *@**
                  ENDIF
               ENDIF
               ? retencion AT 21
               IF liq.valor<>0
                  ?? ' %' AT 57
                  ?? STR(liq.valor,12,2)
               ENDIF
               ?? STR(ABS(liq.monto),14,2) AT 90
               ?? retencion AT 128
               IF liq.valor<>0
                  ?? ' %' AT 164
                  ?? STR(liq.valor,12,2)
               ENDIF
               ?? STR(ABS(liq.monto),16,2) AT 196
               rr=rr+ABS(liq.monto)
               tt=tt+liq.monto
            ELSE
               IF liq.filtcon=40
                  IF thh=0
                     thh=1
                     ***
                     ? 'TOTAL HABERES:' AT 21
                     ?? STR(hh,16,2) AT 72
                     ?? 'TOTAL HABERES:' AT 128
                     ?? STR(hh,16,2) AT 179
                     *@**
                  ELSE
                     IF aa<>0 .AND. taa=0
                        ***
                        ? 'TOTAL ADICIONALES:' AT 21
                        ?? STR(aa,16,2) AT 72
                        ?? 'TOTAL ADICIONALES:' AT 128
                        ?? STR(aa,16,2) AT 179
                        *@**
                        taa=1
                     ELSE
                        IF rr<>0 .AND. trr=0
                           trr=1
                           ***
                           ? 'TOTAL RETENCIONES:' AT 21
                           ?? STR(rr,14,2) AT 90
                           ?? 'TOTAL RETENCIONES:' AT 128
                           ?? STR(rr,14,2) AT 196
                           *@**
                        ENDIF
                     ENDIF
                  ENDIF
                  ? STR(liq.unidad,14) AT 1
                  ?? salario AT 21
                  ?? STR(liq.valor,14,2) AT 57
                  ?? STR(liq.monto,16,2) AT 72
                  IF liq.unidad<>1
                     ?? STR(liq.unidad,14) AT 108
                  ENDIF
                  ?? salario AT 128
                  ?? STR(liq.valor,14,2) AT 164
                  ?? STR(liq.monto,16,2) AT 179
                  ss=ss+liq.monto
               ELSE
                  IF thh=0
                     thh=1
                     ***
                     ? 'TOTAL HABERES:' AT 21
                     ?? STR(hh,16,2) AT 72
                     ?? 'TOTAL HABERES:' AT 128
                     ?? STR(hh,16,2) AT 179
                     *@**
                  ELSE
                     
                     IF aa<>0 .AND. taa=0
                        ***
                        ? 'TOTAL ADICIONALES:' AT 21
                        ?? STR(aa,16,2) AT 72
                        ?? 'TOTAL ADICIONALES:' AT 128
                        ?? STR(aa,16,2) AT 179
                        *@**
                        taa=1
                     ELSE
                        IF rr<>0 .AND. trr=0
                           trr=1
                           ***
                           ? 'TOTAL RETENCIONES:' AT 21
                           ?? STR(rr,14,2) AT 90
                           ?? 'TOTAL RETENCIONES:' AT 128
                           ?? STR(rr,14,2) AT 196
                           *@**
                        ELSE
                           IF ss<>0 .AND. tss=0
                              ***
                              tss=1
                              ? 'TOTAL SALARIO FAMILIAR:' AT 21
                              ?? STR(ss,16,2) AT 72
                              ?? 'TOTAL SALARIO FAMILIAR:' AT 128
                              ?? STR(ss,16,2) AT 179
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
                  ? 'REDONDEO:' AT 21
                  ?? STR(liq.monto,16,2) AT 72
                  ?? 'REDONDEO:' AT 128
                  ?? STR(liq.monto,16,2) AT 179
                  *@**
                  hh=hh+liq.monto
               ENDIF
            ENDIF
            IF liq.filtcon>70
               IF adenrec
                  ? '(N§:'+STR(liq.valor,9)+")" AT 1
                  ?? gasto AT 21
                  ?? STR(ABS(liq.monto),14,2) AT 90
                  ?? '(N§:'+STR(liq.valor,9)+")" AT 108
                  ?? gasto AT 128
                  ?? STR(ABS(liq.monto),14,2) AT 196
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
   ? 'TOTAL HABERES:' AT 21
   ?? STR(hh,16,2) AT 72
   ?? 'TOTAL HABERES:' AT 128
   ?? STR(hh,16,2) AT 179
   *@**
ELSE
   
   IF aa<>0 .AND. taa=0
      ***
      ? 'TOTAL ADICIONALES:' AT 21
      ?? STR(aa,16,2) AT 72
      ?? 'TOTAL ADICIONALES:' AT 128
      ?? STR(aa,16,2) AT 179
      *@**
      taa=1
   ELSE
      IF rr<>0 .AND. trr=0
         trr=1
         ***
         ? 'TOTAL RETENCIONES:' AT 21
         ?? STR(rr,14,2) AT 90
         ?? 'TOTAL RETENCIONES:' AT 128
         ?? STR(rr,14,2) AT 196
         *@**
      ELSE
         IF ss<>0 .AND. tss=0
            ***
            tss=1
            ? 'TOTAL SALARIO FAMILIAR:' AT 21
            ?? STR(ss,16,2) AT 72
            ?? 'TOTAL SALARIO FAMILIAR:' AT 128
            ?? STR(ss,16,2) AT 179
            *@**
         ELSE
            IF gg<>0
               ***
               ? 'TOTAL ADELANTOS:' AT 21
               ?? STR(gg,14,2) AT 90
               ?? 'TOTAL ADELANTOS:' AT 128
               ?? STR(gg,14,2) AT 196
               *@**
            ENDIF
         ENDIF
      ENDIF
   ENDIF
ENDIF
***
neto=aa+hh-rr+ss-gg
? 'NETO A PERCIBIR:' AT 21
?? STR(neto,16,2) AT 72
?? 'NETO A PERCIBIR:' AT 128
?? STR(neto,16,2) AT 179
DO WHILE _PLINENO<39
   ?
ENDDO
? ALLTRIM(peraliq) AT 1
?? fecdep AT 33
?? bcodep AT 44
?? ALLTRIM(peraliq) AT 108
?? fecdep AT 140
?? bcodep AT 151
p=nux(neto)
IF LEN(p)<=90
   ? PADR(p,90,'*') AT 10
   ?? PADR(p,90,'*') AT 117
   ? REPLICATE("*",100) AT 1
   ?? REPLICATE("*",100) AT 108
ELSE
   FOR A=90 TO 1 STEP -1
      IF SUBSTR(p,A,1)=" "
         ? PADR(LEFT(p,A-1),90,"*") AT 10
         ?? PADR(LEFT(p,A-1),90,"*") AT 117
         ? PADR(SUBSTR(p,A+1),100,"*") AT 1
         ?? PADR(SUBSTR(p,A+1),100,"*") AT 108
         EXIT
      ENDIF
   NEXT
ENDIF
?
?
? fepag AT 62
?? STR(neto,16,2) AT 82
?? fepag AT 175
?? STR(neto,16,2) AT 185
IF .NOT. EMPTY(m.acttex)
   ?
   ? ALLTRIM(UPPER(acttex)) AT 1
   ?? ALLTRIM(UPPER(acttex)) AT 108
ENDIF
EJECT PAGE
?
RETURN
