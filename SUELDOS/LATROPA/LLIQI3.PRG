*:*********************************************************************
*:
*:        Program: LLIQI3.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: LLIQI.PRG      (procedure in PROCESOS.PRG)
*:
*:          Calls: NUX()          (function  in PROCESOS.PRG)
*:
*:      Documented 04/24/91 at 17:03               FoxDoc  version 2.01
*:*********************************************************************
*******************************************************************************
*-- Programa: LLIQI3.PRG
*-- Fecha   : 01/02/91 11:23pm
*-- Version : G. REINER
*-- Notas   : LIQUIDACION EN PREIMPRESO TIPO bejer
********************************************************************************
ulpr=PROGRAM()
GOTO liq->empleado IN emp
GOTO emp->cat IN cat
GOTO emp->con IN con
GOTO emp->ccos IN ccos
RELE TAD
DIME TAD[RECC("GAS")]
STORE 0 TO TAD
c1=2
c2=29
c3=37
c4=49
c5=62
c11=5
IF mesaliq=13
   q1=STR(quialiq,1)+'¦ Cuota SAC '
ELSE
   IF cat->periodo='Q'
      q1=STR(quialiq,1)+'¦ Quinc. '
   ELSE
      q1='MES:'
   ENDI
ENDIF
?
??? CHR(14)
?? jan->empresa AT 2
? ALLTRIM(jan->domicilio) AT 2
?? ' - '
?? ALLTRIM(jan->localidad)
IF .NOT. EMPTY(jan->plusuno)
   ? ALLTRIM(jan->plusuno) AT 2
   IF .NOT. EMPTY(jan->plusdos)
      ?? ' - '
      ?? ALLTRIM(jan->plusdos)
      IF .NOT. EMPTY(jan->plustres)
         ?? ' - '
         ?? ALLTRIM(jan->plustres)
      ENDIF
   ENDIF
ENDIF
?
? '7' AT 12
IF JANNRO=1
	?? '1114890' AT 32
	?? '57.243.500' AT 60
ELSE
	IF JANNRO=2
   	?? '1114890' AT 32
	   ?? '52.163.838' AT 60
	ELSE
   	?? '       ' AT 32
	   ?? '56.201.044' AT 60
	ENDIF
ENDIF
DO WHILE _PLINENO<5
   ?
ENDDO
?
?
?
? ALLTRIM(emp->apynom) AT 2
?? ccos->cencos AT 32
?? legajo AT 54
?? emp->fechaing AT 60
?? STR(recaliq,7) AT 66
store recaliq+1 to recaliq
?
?
?
? q1 AT 2
IF mesaliq<>13
   ?? LEFT(meses[mesaliq],3)
   ?? ' '
ENDIF
?? STR(anoaliq,4)
?? left(cat->categoria,15) AT 32
?? LEFT(con->convenio,14) AT 47
?? STR(cat->sueldo,12,2) AT 61
?
?
?
STORE 0 TO tt,hh,aa,rr,ss,gg
STORE 0 TO thh,taa,trr,tss,tgg,nd,na
STORE 1 TO vhor,vadi,vret,vsal
DO WHILE empleado=ea .AND. .NOT. EOF()
   IF imprime
      IF archivo<>"XXX"
         xa="'"+ALLTRIM(archivo)+"'"
         SELE &xa
         GOTO liq->registro
      ENDIF
      IF liq->filtcon=10
         ? hortexto AT c1
         ?? STR(liq->unidad,8,2) AT c2
         IF thor->horret='SI'
            ?? STR(liq->monto,12,2) AT c3
            hh=hh+liq->monto
         ELSE
            ?? STR(liq->monto,12,2) AT c4
            nd=nd+liq->monto
         ENDIF
         tt=tt+liq->monto
      ELSE
         IF liq->filtcon=20
            IF thh=0
               thh=1
               ***
               ? 'TOTAL HABERES:' AT c11
               ?? STR(hh,12,2) AT c3
               IF nd<>0
                  ?? STR(nd,12,2) AT c4
               ENDIF
               *@**
            ENDIF
            ? aditexto AT c1
            IF liq->valor<>0
               ?? ' %' AT c2
               ?? STR(adimonto,6,2)
            ENDIF
            IF adi->adiret="SI"
               ?? STR(liq->monto,12,2) AT c3
               aa=aa+liq->monto
            ELSE
               ?? STR(liq->monto,12,2) AT c4
               na=na+IIF(adi->adiret='SI',0,liq->monto)
            ENDIF
            tt=tt+liq->monto
         ELSE
            IF liq->filtcon=30
               IF thh=0
                  thh=1
                  ***
                  ? 'TOTAL HABERES:' AT c11
                  ?? STR(hh,12,2) AT c3
                  IF nd<>0
                     ?? STR(nd,12,2) AT c4
                  ENDIF
                  *@**
               ELSE
                  IF taa=0 .AND. aa<>0
                     taa=1
                     ***
                     ? 'TOTAL ADICIONALES:' AT c11
                     ?? STR(aa,12,2) AT c3
                     IF na<>0
                        ?? STR(na,12,2) AT c4
                     ENDIF
                     *@**
                  ENDIF
               ENDIF
               ? retencion AT c1
               IF liq->valor<>0
                  ?? ' %' AT c2
                  ?? STR(liq->valor,6,2)
               ENDIF
               ?? STR(ABS(liq->monto),12,2) AT c5
               rr=rr+ABS(liq->monto)
               tt=tt+liq->monto
            ELSE
               IF liq->filtcon=40
                  IF thh=0
                     thh=1
                     ***
                     ? 'TOTAL HABERES:' AT c11
                     ?? STR(hh,12,2) AT c3
                     IF nd<>0
                        ?? STR(nd,12,2) AT c4
                     ENDIF
                     *@**
                  ELSE
                     IF aa<>0 .AND. taa=0
                        ***
                        ? 'TOTAL ADICIONALES:' AT c11
                        ?? STR(aa,12,2) AT c3
                        IF na<>0
                           ?? STR(na,12,2) AT c4
                        ENDIF
                        *@**
                        taa=1
                     ELSE
                        IF rr<>0 .AND. trr=0
                           trr=1
                           ***
                           ? 'TOTAL RETENCIONES:' AT c11
                           ?? STR(rr,12,2) AT c5
                           *@**
                        ENDIF
                     ENDIF
                  ENDIF
                  ? salario AT 2
                  ?? STR(liq->unidad,5) AT c2
                  ?? STR(liq->monto,12,2) AT c4
                  ss=ss+liq->monto
               ELSE
                  IF thh=0
                     thh=1
                     ***
                     ? 'TOTAL HABERES:' AT c11
                     ?? STR(hh,12,2) AT c3
                     IF nd<>0
                        ?? STR(nd,12,2) AT c4
                     ENDIF
                     *@**
                  ELSE
                     IF aa<>0 .AND. taa=0
                        ***
                        ? 'TOTAL ADICIONALES:' AT c11
                        ?? STR(aa,12,2) AT c3
                        IF na<>0
                           ?? STR(na,12,2) AT c4
                        ENDIF
                        *@**
                        taa=1
                     ELSE
                        IF rr<>0 .AND. trr=0
                           trr=1
                           ***
                           ? 'TOTAL RETENCIONES:' AT c11
                           ?? STR(rr,12,2) AT c5
                           *@**
                        ELSE
                           IF ss<>0 .AND. tss=0
                              ***
                              tss=1
                              ? 'TOTAL SALARIO FAMILIAR:' AT c11
                              ?? STR(ss,12,2) AT c4
                              *@**
                           ENDIF
                        ENDIF
                     ENDIF
                  ENDIF
               ENDIF
            ENDIF
            IF liq->filtcon=50
               IF liq->monto<>0
                  ***
                  ? 'REDONDEO:' AT 2
                  ?? STR(liq->monto,12,2) AT c3
                  *@**
                  hh=hh+liq->monto
               ENDIF
            ENDIF
            IF liq->filtcon>70

               IF adenrec
                  ? gasto AT 2
                  ?? 'N§:'+STR(liq->valor,6) AT c2
                  ?? STR(ABS(liq->monto),12,2) AT c3
               ELSE
                  TAD[LIQ->REGISTRO]=TAD[LIQ->REGISTRO]+ABS(LIQ->MONTO)
               ENDIF
              gg=gg+ABS(liq->monto)
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
   ? 'TOTAL HABERES:' AT c11
   ?? STR(hh,12,2) AT c3
   IF nd<>0
      ?? STR(nd,12,2) AT c4
   ENDIF
   *@**
ELSE
   IF aa<>0 .AND. taa=0
      ***
      ? 'TOTAL ADICIONALES:' AT c11
      ?? STR(aa,12,2) AT c3
      IF na<>0
         ?? STR(na,12,2) AT c4
      ENDIF
      *@**
      taa=1
   ELSE
      IF rr<>0 .AND. trr=0
         trr=1
         ***
         ? 'TOTAL RETENCIONES:' AT c11
         ?? STR(rr,12,2) AT c5
         *@**
      ELSE
         IF ss<>0 .AND. tss=0
            tss=1
            ***
            ? 'TOTAL SALARIO FAMILIAR:' AT c11
            ?? STR(ss,12,2) AT c4
            *@**
         ELSE
            IF gg<>0
               ***
               FOR XA=1 TO RECC("GAS")
               IF TAD[XA]<>0
                  GOTO XA IN GAS
                  ? GAS->GASTO AT C1
                  ?? STR(TAD[XA],12,2) AT C5
               ENDIF
               NEXT
               ? 'TOTAL ADELANTOS:' AT c11
               ?? STR(gg,12,2) AT c5
               *@**
            ENDIF
         ENDIF
      ENDIF
   ENDIF
ENDIF
***
DO WHILE _PLINENO<44
   ?
ENDDO
? STR(hh+aa,12,2) AT c3
IF nd<>0 .or. ss<>0 .or. na<>0
   ?? STR(ss+nd+na,12,2) AT c4
ENDIF
?? STR(rr+gg,12,2) AT c5
neto=aa+hh-rr+ss-gg+na+nd
?
?
? 'Rosario, ' AT 16
SET CENT ON
flp=DTOC(fepag)
SET CENT OFF
?? LEFT(flp,2)
?? ' de '
?? meses[val(substr(flp,4,2))]
?? ' de '
?? RIGHT(flp,4)
?? STR(neto,12,2) AT c5
?
?
p=nux(neto)
IF LEN(p)<=70
   ? PADR(p,70,'*') AT 2
   ? REPLICATE("*",70) AT 2
ELSE
   FOR A=70 TO 1 STEP -1
      IF SUBSTR(p,A,1)=" "
         ? PADR(LEFT(p,A-1),70,"*") AT 2
         ? PADR(SUBSTR(p,A+1),70,"*") AT 2
         EXIT
      ENDIF
   NEXT
ENDIF
?
?
? perjub AT 10
? bcodep AT 10
? fecdep AT 10
?? tdoc[emp->tipodoc] at 30
?? ':'
?? emp->nrodoc
IF .NOT. EMPTY(m->acttex)
   ?
   ? ALLTRIM(UPPER(acttex)) AT 2
ENDIF
EJECT PAGE
?
RELE tt,hh,aa,rr,ss,gg,thh,taa,trr,tss,tgg,nd,vhor,vadi,vret,vsal,c1,c2,c3,c4,c5,flp,na
RETURN
*: EOF: LLIQI3.PRG
