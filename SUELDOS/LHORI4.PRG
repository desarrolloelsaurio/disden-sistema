*******************************************************************************
*-- Programa: LHORI4.prg
*-- Fecha   : 01/05/91 00:48am
*-- Version : G. REINER
*-- Notas   : genera planilla de sueldos y jornales
*-- 10,'THOR','THOR->HORTIPOHOR','Horas Trabajadas','ELITHOR(" a Listar")'
*-- BSC FL     FLVA              ,FLTI,              FUN
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO elijan
IF jannro<>0
   @ 0,60 SAY LEFT(janname,19) COLOR I
   DO opliq
   @ 24,0 SAY PADC("Calculando Planilla de "+ALLTRIM(flti),80,'*') COLOR SCHE 19
   INDEX ON STR(registro,4)+legajo FOR filtcon=bsc .AND. imprime TO tmp UNIQ
   DIMENSION hthor[RECCOUNT(FIL)],tthor[RECCOUNT(FIL)]
   SELE liq
   GOTO TOP
   tit=flti
   @ 24,0 SAY PADC("Calculando Planilla de "+ALLTRIM(flti)+" - [TECLA] Interrumpe",80,'*') COLOR SCHE 19
   SCAN
      STORE .T. TO hthor[LIQ->REGISTRO]
   ENDSCAN
   RG=0
   fl=0
   STORE 0 TO cthor,ttthor
   FOR A=1 TO RECC(fil)
      IF hthor[A]
         STORE 0 TO tthor[A]
         STORE cthor+1 TO cthor
      ENDIF
   NEXT
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
      ON PAGE AT LINE _PLENGTH-4 DO pgh2
      **** EMPRESA ****                                    &&
      ? 'PROGRAMA :LGENI'
      ?? SPACE(47)
      ? 'FECHA    :'
      ?? DATE()
      ?? SPACE(13)
      ?? 'HORA     :'
      ?? TIME()
      ?? SPACE(13)
      ?? 'P g N§   :'
      ?? STR(_PAGENO,5)
      ?
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
      ?? '-'
      ?? ALLTRIM(m->peraliq)
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
      FOR A=1 TO RECC(fil)                          &&
         IF hthor[A]                                &&
            GOTO A IN (fil)
            ?? PADR(&flva,acdigi,' ')
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
      SET INDEX TO tmp1
      GOTO TOP
      ***************************************************************
      SCAN
         STORE 0 TO tt,tthorp
         pl=liq->empleado
         GOTO liq->empleado IN emp
         ? B
         ?? emp->legajo
         ?? B
         ?? emp->apynom
         ?? B
         FOR A=1 TO RECC(fil)
            IF hthor[A]
               IF liq->registro=A .AND. liq->empleado=pl
                  IF dijo1=2
                     ?? STR(liq->unidad,acdigi,2)
                     tt=tt+liq->unidad
                     tthor[A]=tthor[A]+liq->unidad
                     tthorp=tthorp+liq->unidad
                  ELSE
                     ?? STR(ABS(liq->monto),acdigi,2)
                     tt=tt+ABS(liq->monto)
                     tthor[A]=tthor[A]+ABS(liq->monto)
                     tthorp=tthorp+ABS(liq->monto)
                  ENDIF
                  SKIP
               ELSE
                  ?? SPACE(acdigi)
               ENDIF
               ?? B
            ENDIF
         NEXT
         ?? STR(tthorp,acdigi,2)
         ?? B
         DO WHILE pl=empleado
            SKIP
         ENDDO
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
      FOR A=1 TO RECC(fil)
         IF hthor[A]
            ?? STR(tthor[A],acdigi,2)
            ?? B
            STORE tt1+tthor[A] TO tt1
            STORE nada+tthor[A] TO nada
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
