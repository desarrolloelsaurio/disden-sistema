************************************************************
*                         LQADEI3                          *
************************************************************

*:*********************************************************************
*:
*:        Program: LQADEI3.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/25/91     19:33
*:
*:          Calls: ELIJAN.PRG
*:               : OPGAS.PRG
*:               : OPLIQ.PRG
*:               : ABPR.PRG
*:               : HLP.PRG
*:
*:        Indexes: TMP.IDX
*:               : &INDICE
*:
*:    Other Files: FILE
*:
*:      Documented 04/25/91 at 19:34               FoxDoc  version 2.01
*:*********************************************************************
*******************************************************************************
*-- Programa: LQADEI3.prg
*-- Fecha   : 01/05/91 00:48am
*-- Version : G. REINER
*-- Notas   : genera planilla de ADELANTOS
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO elijan
IF jannro<>0
   fil=RECC("GAS")
   ulpr=PROGRAM()
   @ 0,60 SAY LEFT(janname,19) COLOR I
	=OPGAS()
   DO opliq
   @ 24,0 SAY PADC(" Calculando Planilla de Adelantos de Sueldo ",80,'*') COLOR SCHE 19
   INDEX ON STR(filtcon,4)+STR(registro,4)+legajo FOR filtcon>70 .AND. fechaven<=fechi TO tmp UNIQ
   DIMENSION gas[fil],ttgas[FIL],lnea[fil]
   SELE liq
   GOTO TOP
   tit="Adelantos de Sueldo"
   @ 24,0 SAY PADC("Calculando Planilla de Adelantos de Sueldo - [TECLA] Interrumpe",80,'*') COLOR SCHE 19
   RG=0
   fl=0
   SCAN
      gas[liq->registro]=.T.
   ENDSCAN
   STORE 0 TO cthor,ttthor
   FOR A=1 TO fil
      IF gas[A]
*         STORE 0 TO ttgas[A]
         STORE cthor+1 TO cthor
      ENDIF
   NEXT
   STORE 0 TO TTGAS
   veces=cthor+1
   largo=43+veces*(acdigi+1)
   largoim=MIN(acancho,achoja)
   largoim1=largoim*1.65
   B='|'
   ON KEY DO abpr
   SET DEVICE TO PRINT
   SET CONSOLE OFF
   IF largo>largoim1
      A=PATH+"\PL"+LEFT(ptn[jannro],1)+'A'+SUBSTR(ptn[jannro],2,1)+'N'+RIGHT(ptn[jannro],1)+LEFT(janname,1)+'.TXT'
      SET PRINTER TO FILE &a
      SET PRINTER ON
      _PSCODE='{27}{64}{27}{67}{53}'
      IF largoim=80
         _PLENGTH=53
      ELSE
         _PLENGTH=90
      ENDIF
   ELSE
      SET PRINTER ON
      _PLENGTH=72
      _PSCODE='{27}{64}{27}{67}{72}'
   ENDIF
   _PEJECT="NONE"
   _PLINENO=1
   _PAGENO=1
   _PECODE='{27}{64}{27}{67}{72}'
   _PLOFFSET=0
   _RMARGIN=255
   _PADVANCE="LINEFEEDS"
   _PCOPIES=1
   PRINTJOB
      **** EMPRESA ****                                    &&
      ? 'PROGRAMA :'
      ?? ALLTRIM(ulpr)
      ?? SPACE(47)
      ? 'FECHA    :'
      ?? DATE()
      ?? SPACE(13)
      ?? 'HORA     :'
      ?? TIME()
      ? jan->empresa                     &&
      IF .NOT. EMPTY(jan->plusuno)       &&
         ?? ' - '                        &&
         ?? ALLTRIM(jan->plusuno)        &&
      ENDIF                              &&
      ? jan->domicilio                   &&
      IF .NOT. EMPTY(jan->plusdos)       &&
         ?? ' - '                        &&
         ?? ALLTRIM(jan->plusdos)        &&
      ENDIF                              &&
      ? jan->localidad                   &&
      IF .NOT. EMPTY(jan->plustres)      &&
         ?? ' - '                        &&
         ?? ALLTRIM(jan->plustres)       &&
      ENDIF                              &&
      **** TITULO ****                   &&
      ? 'PLANILLA DE '
      ?? tit                             &&
      ?? SPACE(20)                       &&
      ?? 'Pag:'                          &&
      ?? STR(_PAGENO,3)                  &&
      ? ttl1
      **** LINEA ****                    &&
      IF largo>largoim
         ??? CHR(15)
      ENDIF
      ? REPL('-',12)                     &&
      ?? REPL('-',31)                    &&
      FOR A=1 TO veces                   &&
         ?? REPL('-',acdigi+1)           &&
      NEXT                               &&
      **** TEXTOS ****                   &&
      ? B                                &&
      ?? PADC("Legajo",10,' ')           &&
      ?? B                               &&
      ?? PADC("Apellido y Nombre Empleado",30," ")  &&
      ?? B                                          &&
      FOR A=1 TO fil                          &&
         IF gas[A]                                &&
            GOTO A IN gas
            ?? PADC(ALLTRIM(gas->gasto),acdigi,' ')
            ?? B                                         &&
         ENDIF                                           &&
      NEXT A                                             &&
      ?? PADC("TOTALES",acdigi,' ')
      ?? B                                         &&
      ? REPL('-',12)                     &&
      ?? REPL('-',31)                    &&
      FOR A=1 TO veces                   &&
         ?? REPL('-',acdigi+1)           &&
      NEXT                               &&
      **** FIN ****                                      &&
      INDEX ON legajo+STR(filtcon,2)+STR(registro,4) FOR filtcon>70 .AND. fechaven<=fechi TO tmp
      SET INDEX TO tmp
      GOTO TOP
      ***************************************************************
      SCAN
         IF _PLINENO=_plengTh-4
            ? REPL('-',12)
            ?? REPL('-',31)
            FOR A=1 TO veces
               ?? REPL('-',acdigi+1)
            NEXT
            **** IMPRIME SUBTOTALES ****
            ? B
            ?? 'SUBTOTALES'
            ?? SPACE(31)
            ?? B
            STORE 0 TO tt1,nada
            FOR A=1 TO fil
               IF gas[A]
                  ?? STR(ttgas[A],acdigi,2)
                  ?? B
                  STORE tt1+ttgas[A] TO tt1
                  STORE nada+ttgas[A] TO nada
               ENDIF
            NEXT
            ?? STR(nada,acdigi,2)
            ?? B
            EJECT PAGE
            ? 'PROGRAMA :'
            ?? ALLTRIM(ulpr)
            ?? SPACE(47)
            ? 'FECHA    :'
            ?? DATE()
            ?? SPACE(13)
            ?? 'HORA     :'
            ?? TIME()
            ? jan->empresa                     &&
            IF .NOT. EMPTY(jan->plusuno)       &&
               ?? ' - '                        &&
               ?? ALLTRIM(jan->plusuno)        &&
            ENDIF                              &&
            ? jan->domicilio                   &&
            IF .NOT. EMPTY(jan->plusdos)       &&
               ?? ' - '                        &&
               ?? ALLTRIM(jan->plusdos)        &&
            ENDIF                              &&
            ? jan->localidad                   &&
            IF .NOT. EMPTY(jan->plustres)      &&
               ?? ' - '                        &&
               ?? ALLTRIM(jan->plustres)       &&
            ENDIF                              &&
            **** TITULO ****                   &&
            ? 'PLANILLA DE '
            ?? tit                             &&
            ?? SPACE(20)                       &&
            ?? 'Pag:'                          &&
            ?? STR(_PAGENO,3)                  &&
            ? ttl1
            **** LINEA ****                    &&
            IF largo>largoim
               ??? CHR(15)
            ENDIF
            ? REPL('-',12)                     &&
            ?? REPL('-',31)                    &&
            FOR A=1 TO veces                   &&
               ?? REPL('-',acdigi+1)           &&
            NEXT                               &&
            **** TEXTOS ****                   &&
            ? B                                &&
            ?? PADC("Legajo",10,' ')           &&
            ?? B                               &&
            ?? PADC("Apellido y Nombre Empleado",30," ")  &&
            ?? B                                          &&
            FOR A=1 TO fil                          &&
               IF gas[A]                                &&
                  GOTO A IN gas
                  ?? PADC(ALLTRIM(gas->gasto),acdigi,' ')
                  ?? B                                         &&
               ENDIF                                           &&
            NEXT A                                             &&
            ?? PADC("TOTALES",acdigi,' ')
            ?? B                                         &&
            ? REPL('-',12)                     &&
            ?? REPL('-',31)                    &&
            FOR A=1 TO veces                   &&
               ?? REPL('-',acdigi+1)           &&
            NEXT                               &&

         ENDIF
         STORE 0 TO tt,tthorp
         pl=liq->empleado
         GOTO liq->empleado IN emp
         ? B
         ?? emp->legajo
         ?? B
         ?? emp->apynom
         ?? B
         STORE 0 TO lnea,ttg
         DO WHILE pl=empleado
            STORE lnea[liq->registro]+liq->unidad TO lnea[liq->registro]
            SKIP
         ENDDO
         FOR A=1 TO fil
           IF gas[A]
            ?? STR(lnea[a],acdigi,2)
            STORE ttg+lnea[a] TO ttg
            ttgas[A]=ttgas[A]+lnea[a]
            ?? '|'
            ENDIF
         NEXT
         ?? STR(ttg,acdigi,2)
         ?? B
         SKIP -1
      ENDSCAN
      ? REPL('-',12)
      ?? REPL('-',31)
      FOR A=1 TO veces
         ?? REPL('-',acdigi+1)
      NEXT
      **** IMPRIME SUBTOTALES ****
      ? B
      ?? 'TOTALES   '
      ?? SPACE(31)
      ?? B
      STORE 0 TO tt1,nada
      FOR A=1 TO fil
         IF gas[A]
            ?? STR(ttgas[A],acdigi,2)
            ?? B
            STORE tt1+ttgas[A] TO tt1
            STORE nada+ttgas[A] TO nada
         ENDIF
      NEXT
      ?? STR(nada,acdigi,2)
      ?? B
      ON PAGE
      EJECT PAGE
      ?
   ENDP
   SET DEVI TO SCRE
   SET CONS ON
   SET PRINTER OFF
   SET PRINTER TO
   ON KEY LABEL shift-f1 DO hlp
   SELE liq
   indice="LI"+LEFT(ptn[jannro],1)+'Q'+SUBSTR(ptn[jannro],2,1)+'u'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
   SET INDEX TO &indice
   RELE hthor,cthor,tthor,hadi,cadi,tadi,hret,cret,tret,hsal,csal,tsal,hgas,cgas,tgas,red,RG,fl
   RELE ttthor,ttadi,ttret,ttsal,ttgas,ttred,veces,B,pl,tit,tt1,nada,largo,largoim,largoim1
ENDIF
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: LQADEI3.PRG


