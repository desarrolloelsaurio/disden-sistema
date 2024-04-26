****************************************************
*-- Programa: gpla1.prg
*-- Fecha   : 01/05/91 00:48am
*-- Version : G. REINER
*-- Notas   : genera planilla de sueldos y jornales
****************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO opjan
do elijan
IF jannro#0
	goto jannro
   @ 0,60 SAY LEFT(janname,19) COLOR I
   DO opliq
   DO opemp
   SELE liq
   @ 24,0 SAY PADC(" Calculando Libro de Sueldos y Jornales - [TECLA] Interrumpe ",80,'*') COLOR SCHE 19
   INDEX ON STR(filtcon,4)+STR(registro,4) FOR imprime TO tmp UNIQUE
   SET INDEX TO tmp
   DIMENSION hthor[RECCOUNT("THOR")],tthor[RECCOUNT("THOR")]
   IF RECC("ADI")#0
      DIMENSION hadi[RECC("ADI")],tadi[RECC("ADI")]
   ENDIF
   IF RECC("RET")#0
      DIMENSION hret[RECC("RET")],tret[RECC("RET")]
   ENDIF
   IF RECC("SAL")#0
      DIMENSION hsal[RECC("SAL")],tsal[RECC("SAL")]
   ENDIF
   IF RECC("GAS")#0
      DIMENSION hgas[RECC("GAS")],tgas[RECC("GAS")],gus[RECC("GAS")]
   ENDIF
   STORE .F. TO red
   STORE 0 TO tred
   SELE liq
   GOTO TOP
   IF .NOT. EOF()
      DEFINE WINDOW win FROM 10,0 TO 16,77 TITL " T¡tulo de la Planilla " SHAD COLOR SCHE 8
      ACTI WIND win
      STORE SPACE(60) TO tit
      @ 1,1 SAY PADC('T¡tulo de la planilla de Sueldos y Jornales',78,' ') COLOR SCHE 3
      @ 3,4 GET tit PICTURE REPL("X",60) MESS '[ENTER] para Anular'
      READ
      RELE WIND win
      IF .NOT. EMPTY(tit)
         tit=ALLTRIM(UPPER(tit))
         @ 24,0 SAY PADC("Calculando Planilla de Sueldos y Jornales",80,'*') COLOR SCHE 19
         RELE ergo,fl
         ergo=0
         fl=0
         GOTO TOP
         SCAN
            IF liq.filtcon=10
               hthor[liq.registro]=.T.
            ELSE
               IF liq.filtcon=20
                  hadi[liq.registro]=.T.
               ELSE
                  IF liq.filtcon=30
                     hret[liq.registro]=.T.
                  ELSE
                     IF liq.filtcon=40
                        hsal[liq.registro]=.T.
                     ELSE
                        IF liq.filtcon=50
                           red=.T.
                        ELSE
                           IF liq.filtcon>70
                              hgas[liq.registro]=.T.
                           ENDIF
                        ENDIF
                     ENDIF
                  ENDIF
               ENDIF
            ENDIF
            *            ENDIF
         ENDSCAN
         STORE 0 TO cthor,ttthor
         FOR A=1 TO RECC("THOR")
            IF hthor[A]
               STORE 0 TO tthor[A]
               STORE cthor+1 TO cthor
            ENDIF
         NEXT

         STORE 0 TO cadi,ttadi
         FOR A=1 TO RECC("ADI")
            IF hadi[A]
               STORE 0 TO tadi[A]
               STORE cadi+1 TO cadi
            ENDIF
         NEXT

         STORE 0 TO cret,ttret
         FOR A=1 TO RECC("RET")
            IF hret[A]
               GOTO A IN ret
               IF ret.retquien="O"
                  STORE 0 TO tret[A]
                  STORE cret+1 TO cret
               ELSE
                  hret=.F.
               ENDIF
            ENDIF
         NEXT

         STORE 0 TO csal,ttsal
         FOR A=1 TO RECC("SAL")
            IF hsal[A]
               STORE 0 TO tsal[A]
               STORE csal+1 TO csal
            ENDIF
         NEXT

         STORE 0 TO cgas,ttgas
         FOR A=1 TO RECC("GAS")
            IF hgas[A]
               STORE 0 TO tgas[A]
               STORE cgas+1 TO cgas
            ENDIF
         NEXT

         veces=cadi+cthor+cret+csal+7
         IF red
            veces=veces+2
            STORE 0 TO ttred
         ENDIF
         IF cgas=0
            veces=veces-2
         ELSE
            IF adenrec
               veces=veces+cgas
            ENDIF
         ENDIF
         B='|'
         ON KEY DO abpr
         SET DEVICE TO PRINT
         SET CONSOLE OFF
         A=PATH+"\PL"+LEFT(ptn[jannro],1)+'A'+SUBSTR(ptn[jannro],2,1)+'N'+RIGHT(ptn[jannro],1)+LEFT(janname,1)+'.TXT'
         SET PRINTER TO FILE &a
         SET PRINTER ON
         largoim=MIN(acancho,achoja)
         IF largoim>80
            mxrn=85
         ELSE
            mxrn=48
         ENDIF
         _PEJECT="NONE"
         _PLENGTH=mxrn+5
         _PLINENO=1
         _PAGENO=1
         _PSCODE='{27}{64}{27}{67}{'+ALLTRIM(STR(_PLENGTH))+'}'
         _PECODE='{27}{64}{27}{67}{72}'
         _PLOFFSET=0
         _RMARGIN=255
         _PADVANCE="LINEFEEDS"
         _PCOPIES=1
         PRINTJOB
            **** EMPRESA ****                                    &&
            ? jan.empresa                     &&
            IF .NOT. EMPTY(jan.plusuno)       &&
               ?? ' - '                        &&
               ?? ALLTRIM(jan.plusuno)        &&
            ENDIF                              &&
            ? jan.domicilio                   &&
            IF .NOT. EMPTY(jan.plusdos)       &&
               ?? ' - '                        &&
               ?? ALLTRIM(jan.plusdos)        &&
            ENDIF                              &&
            ? jan.localidad                   &&
            IF .NOT. EMPTY(jan.plustres)      &&
               ?? ' - '                        &&
               ?? ALLTRIM(jan.plustres)       &&
            ENDIF                              &&
            **** TITULO ****                   &&
            ? 'PLANILLA DE SUELDOS Y JORNALES:'&&
            ?? tit                             &&
            ?? SPACE(20)                       &&
            ?? 'Pag:'                          &&
            ?? STR(_PAGENO,3)                  &&
            **** LINEA ****                    &&
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
            FOR A=1 TO RECC("THOR")                       &&
               IF hthor[A]                                &&
                  GOTO A IN thor                          &&
                  ?? PADC(ALLTRIM(thor.hortexto),acdigi,' ')  &&
                  ?? B                                         &&
               ENDIF                                           &&
            NEXT A                                             &&
            ?? PADC("TOTAL HABERES",acdigi," ")                &&
            ?? B                                               &&
            FOR A=1 TO RECC("ADI")                             &&
               IF hadi[A]                                      &&
                  GOTO A IN adi                                &&
                  ?? PADC(ALLTRIM(adi.aditexto),acdigi,' ')   &&
                  ?? B                                         &&
               ENDIF                                           &&
            NEXT A                                             &&
            ?? PADC("TOTAL ADICIONALES",acdigi," ")            &&
            ?? B                                               &&
            FOR A=1 TO RECC("RET")                             &&
               IF hret[A]                                      &&
                  GOTO A IN ret                                &&
                  ?? PADC(ALLTRIM(ret.rettexto),acdigi,' ')   &&
                  ?? B                                         &&
               ENDIF                                           &&
            NEXT A                                             &&
            ?? PADC("TOTAL RETENCIONES",acdigi," ")            &&
            ?? B                                               &&
            FOR A=1 TO RECC("SAL")                             &&
               IF hsal[A]                                      &&
                  GOTO A IN sal                                &&
                  ?? PADC(ALLTRIM(sal.salario),acdigi,' ')    &&
                  ?? B                                         &&
               ENDIF                                           &&
            NEXT A                                             &&
            ?? PADC("TOTAL SAL. FAM.",acdigi," ")              &&
            ?? B                                               &&
            IF red                                             &&
               ?? PADC("SUBTOTAL",acdigi," ")                  &&
               ?? B                                            &&
               ?? PADC("REDONDEO",acdigi," ")                  &&
               ?? B                                            &&
            ENDIF                                              &&
            ?? PADC("NETO A PERCIBIR",acdigi," ")           &&
            ?? B                                            &&
            IF cgas#0
               IF adenrec
                  FOR A=1 TO RECC("GAS")                          &&
                     IF hgas[A]                                   &&
                        GOTO A IN gas                             &&
                        ?? PADC(ALLTRIM(gas.gasto),acdigi,' ')   &&
                        ?? B                                      &&
                     ENDIF                                        &&
                  NEXT A                                          &&
               ENDIF                                              &&
               ?? PADC("TOTAL ADELANTOS",acdigi," ")           &&
               ?? B                                            &&
               ?? PADC("NETO A PERCIBIR",acdigi," ")              &&
               ?? B                                               &&
            ENDIF
            **** LINEA ****                                    &&
            ? REPL('-',12)                                     &&
            ?? REPL('-',31)                                    &&
            FOR A=1 TO veces                                   &&
               ?? REPL('-',acdigi+1)                           &&
            NEXT                                               &&
            **** FIN ****                                      &&
            SELE liq
            indice="LI"+LEFT(ptn[jannro],1)+'Q'+SUBSTR(ptn[jannro],2,1)+'u'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
            SET INDEX TO &indice
            GOTO TOP
            ***************************************************************
            SCAN FOR imprime
               IF _PLINENO>mxrn
                  **** IMPRIME SUBTOTALES ****
                  ? REPL('-',12)                 &&
                  ?? REPL('-',31)                &&
                  FOR A=1 TO veces               &&
                     ?? REPL('-',acdigi+1)       &&
                  NEXT                           &&
                  ? B
                  ?? 'SUBTOTALES'
                  ?? SPACE(31)
                  ?? B
                  STORE 0 TO tt1,nada
                  FOR A=1 TO RECC("THOR")
                     IF hthor[A]
                        ?? STR(tthor[A],acdigi,2)
                        ?? B
                        STORE tt1+tthor[A] TO tt1
                        STORE nada+tthor[A] TO nada
                     ENDIF
                  NEXT
                  ?? STR(nada,acdigi,2)
                  ?? B
                  STORE 0 TO nada
                  FOR A=1 TO RECC("ADI")
                     IF hadi[A]
                        ?? STR(tadI[A],acdigi,2)
                        ?? B
                        STORE tt1+tadi[A] TO tt1
                        STORE nada+tadi[A] TO nada
                     ENDIF
                  NEXT
                  ?? STR(nada,acdigi,2)
                  ?? B
                  STORE 0 TO nada
                  FOR A=1 TO RECC("RET")
                     IF hret[A]
                        ?? STR(ABS(tret[A]),acdigi,2)
                        ?? B
                        STORE tt1+tret[A] TO tt1
                        STORE nada+ABS(tret[A]) TO nada
                     ENDIF
                  NEXT
                  ?? STR(nada,acdigi,2)
                  ?? B
                  STORE 0 TO nada
                  FOR A=1 TO RECC("SAL")
                     IF hsal[A]
                        ?? STR(ABS(tsal[A]),acdigi,2)
                        ?? B
                        STORE tt1+tsal[A] TO tt1
                        STORE nada+tsal[A] TO nada
                     ENDIF
                  NEXT
                  ?? STR(nada,acdigi,2)
                  ?? B
                  ?? STR(tt1,acdigi,2)
                  ?? B
                  IF red
                     ?? STR(tred,acdigi,2)
                     ?? B
                     STORE tt1+tred TO tt1
                     ?? STR(tt1,acdigi,2)
                     ?? B
                  ENDIF
                  STORE 0 TO nada
                  IF cgas#0
                     FOR A=1 TO RECC("GAS")
                        IF hgas[A]
                           IF adenrec
                              ?? STR(ABS(tgas[A]),acdigi,2)
                              ?? B
                           ENDIF
                           STORE tt1+tgas[A] TO tt1
                           STORE nada+ABS(tgas[A]) TO nada
                        ENDIF
                     NEXT
                     ?? STR(nada,acdigi,2)
                     ?? B
                     ?? STR(tt1,acdigi,2)
                     ?? B
                  ENDIF
                  EJECT PAGE
                  **** EMPRESA ****              &&
                  ? jan.empresa                 &&
                  IF .NOT. EMPTY(jan.plusuno)   &&
                     ?? ' - '                    &&
                     ?? ALLTRIM(jan.plusuno)    &&
                  ENDIF                          &&
                  ? jan.domicilio               &&
                  IF .NOT. EMPTY(jan.plusdos)   &&
                     ?? ' - '                    &&
                     ?? ALLTRIM(jan.plusdos)    &&
                  ENDIF                          &&
                  ? jan.localidad               &&
                  IF .NOT. EMPTY(jan.plustres)  &&
                     ?? ' - '                    &&
                     ?? ALLTRIM(jan.plustres)   &&
                  ENDIF                          &&
                  **** TITULO ****               &&
                  ? 'PLANILLA DE SUELDOS Y JORNALES:'  &&
                  ?? tit                               &&
                  ?? SPACE(20)                   &&
                  ?? 'Pag:'                      &&
                  ?? STR(_PAGENO,3)              &&
                  **** LINEA ****                &&
                  ? REPL('-',12)                 &&
                  ?? REPL('-',31)                &&
                  FOR A=1 TO veces               &&
                     ?? REPL('-',acdigi+1)       &&
                  NEXT                           &&
                  **** TEXTOS ****               &&
                  ? B                            &&
                  ?? PADC("Legajo",10,' ')       &&
                  ?? B                           &&
                  ?? PADC("Apellido y Nombre Empleado",30," ")  &&
                  ?? B                                          &&
                  FOR A=1 TO RECC("THOR")                       &&
                     IF hthor[A]                                &&
                        GOTO A IN thor                          &&
                        ?? PADC(ALLTRIM(thor.hortexto),acdigi,' ')  &&
                        ?? B                                         &&
                     ENDIF                                           &&
                  NEXT A                                             &&
                  ?? PADC("TOTAL HABERES",acdigi," ")                &&
                  ?? B                                               &&
                  FOR A=1 TO RECC("ADI")                             &&
                     IF hadi[A]                                      &&
                        GOTO A IN adi                                &&
                        ?? PADC(ALLTRIM(adi.aditexto),acdigi,' ')   &&
                        ?? B                                         &&
                     ENDIF                                           &&
                  NEXT A                                             &&
                  ?? PADC("TOTAL ADICIONALES",acdigi," ")            &&
                  ?? B                                               &&
                  FOR A=1 TO RECC("RET")                             &&
                     IF hret[A]                                      &&
                        GOTO A IN ret                                &&
                        ?? PADC(ALLTRIM(ret.rettexto),acdigi,' ')   &&
                        ?? B                                         &&
                     ENDIF                                           &&
                  NEXT A                                             &&
                  ?? PADC("TOTAL RETENCIONES",acdigi," ")            &&
                  ?? B                                               &&
                  FOR A=1 TO RECC("SAL")                             &&
                     IF hsal[A]                                      &&
                        GOTO A IN sal                                &&
                        ?? PADC(ALLTRIM(sal.salario),acdigi,' ')    &&
                        ?? B                                         &&
                     ENDIF                                           &&
                  NEXT A                                             &&
                  ?? PADC("TOTAL SAL. FAM.",acdigi," ")              &&
                  ?? B                                               &&
                  IF red                                             &&
                     ?? PADC("SUBTOTAL",acdigi," ")                  &&
                     ?? B                                            &&
                     ?? PADC("REDONDEO",acdigi," ")                  &&
                     ?? B                                            &&
                  ENDIF                                              &&
                  ?? PADC("NETO A PERCIBIR",acdigi," ")           &&
                  ?? B                                            &&
                  IF cgas#0
                     IF adenrec                                         &&
                        FOR A=1 TO RECC("GAS")                          &&
                           IF hgas[A]                                   &&
                              GOTO A IN gas                             &&
                              ?? PADC(ALLTRIM(gas.gasto),acdigi,' ')   &&
                              ?? B                                      &&
                           ENDIF                                        &&
                        NEXT A                                          &&
                     ENDIF
                     ?? PADC("TOTAL ADELANTOS",acdigi," ")           &&
                     ?? B                                            &&
                     ?? PADC("NETO A PERCIBIR",acdigi," ")              &&
                     ?? B
                  ENDIF                                      &&
                  **** LINEA ****                                    &&
                  ? REPL('-',12)                                     &&
                  ?? REPL('-',31)                                    &&
                  FOR A=1 TO veces                                   &&
                     ?? REPL('-',acdigi+1)                           &&
                  NEXT                                               &&
                  **** FIN ****                                      &&
               ENDIF
               STORE 0 TO tt,tthorp,ttadip,ttretp,ttsalp,ttgasp
               pl=liq.empleado
               GOTO liq.empleado IN emp
               ? B
               ?? emp.legajo
               ?? B
               ?? emp.apynom
               ?? B
               STORE 0 TO gus
               FOR A=1 TO RECC("THOR")
                  IF hthor[A]
                     IF filtcon=10 .AND. registro=A
                        ?? STR(liq.monto,acdigi,2)
                        tt=tt+liq.monto
                        tthor[A]=tthor[A]+liq.monto
                        tthorp=tthorp+liq.monto
                        SKIP
                        DO WHILE .NOT. imprime .AND. .NOT. EOF()
                           SKIP
                        ENDDO
                     ELSE
                        ?? STR(0,acdigi,2)
                     ENDIF
                     ?? B
                  ENDIF
               NEXT
               ?? STR(tthorp,acdigi,2)
               ?? B
               FOR A=1 TO RECC("ADI")
                  IF hadi[A]
                     IF filtcon=20 .AND. registro=A
                        ?? STR(liq.monto,acdigi,2)
                        tt=tt+liq.monto
                        ttadip=ttadip+liq.monto
                        tadi[A]=tadi[A]+liq.monto
                        SKIP
                        DO WHILE .NOT. imprime .AND. .NOT. EOF()
                           SKIP
                        ENDDO
                     ELSE
                        ?? STR(0,acdigi,2)
                     ENDIF
                     ?? B
                  ENDIF
               NEXT
               ?? STR(ttadip,acdigi,2)
               ?? B
               FOR A=1 TO RECC("RET")
                  IF hret[A]
                     IF filtcon=30 .AND. registro=A
                        ?? STR(ABS(liq.monto),acdigi,2)
                        tt=tt+liq.monto
                        ttretp=ttretp+liq.monto
                        tret[A]=tret[A]+liq.monto
                        SKIP
                        DO WHILE .NOT. imprime .AND. .NOT. EOF()
                           SKIP
                        ENDDO
                     ELSE
                        ?? STR(0,acdigi,2)
                     ENDIF
                     ?? B
                  ENDIF
               NEXT
               ?? STR(ABS(ttretp),acdigi,2)
               ?? B
               FOR A=1 TO RECC("SAL")
                  IF hsal[A]
                     IF filtcon=40 .AND. registro=A
                        ?? STR(ABS(liq.monto),acdigi,2)
                        tt=tt+liq.monto
                        ttsalp=ttsalp+liq.monto
                        tsal[A]=tsal[A]+liq.monto
                        SKIP
                        DO WHILE .NOT. imprime .AND. .NOT. EOF()
                           SKIP
                        ENDDO
                     ELSE
                        ?? STR(0,acdigi,2)
                     ENDIF
                     ?? B
                  ENDIF
               NEXT
               ?? STR(ttsalp,acdigi,2)
               ?? B
               ?? STR(tt,acdigi,2)
               ?? B
               IF filtcon=50
                  ?? STR(ABS(liq.monto),acdigi,2)
                  ?? B
                  tt=tt+liq.monto
                  ?? STR(tt,acdigi,2)
                  ?? B
                  STORE tred+liq.monto TO tred
                  SKIP
               ENDIF
               IF cgas#0
                  DO WHILE liq.filtcon>70
                     IF imprime
                        IF hgas[liq.registro]
                           ttgasp=ttgasp+liq.monto
                           tgas[liq.registro]=tgas[liq.registro]+liq.monto
                           gus[liq.registro]=gus[liq.registro]+liq.monto
                        ENDIF
                     ENDIF
                     SKIP
                  ENDDO
                  FOR A=1 TO RECC("GAS")
                     IF hgas[A]
                        tt=tt+gus[a]
                        IF adenrec
                           ?? STR(ABS(gus[a]),acdigi,2)
                           ?? B
                        ENDIF
                     ENDIF
                  NEXT
                  ?? STR(ABS(ttgasp),acdigi,2)
                  ?? B
                  ?? STR(tt,acdigi,2)
                  ?? B
               ENDIF
	            **** LINEA ****                    &&
   	         ? REPL('-',12)                     &&
      	      ?? REPL('-',31)                    &&
         	   FOR A=1 TO veces                   &&
            	   ?? REPL('-',acdigi+1)           &&
	            NEXT                               &&
               DO WHILE pl#liq.empleado
                  SKIP -1
               ENDDO
            ENDSCAN
            ? REPL('-',12)
            ?? REPL('-',31)
            FOR A=1 TO veces
               ?? REPL('-',acdigi+1)
            NEXT
            **** IMPRIME TOTALES ****
            ? B
            ?? 'TOTALES'
            ?? SPACE(34)
            ?? B
            STORE 0 TO tt1,nada
            FOR A=1 TO RECC("THOR")
               IF hthor[A]
                  ?? STR(tthor[A],acdigi,2)
                  ?? B
                  STORE tt1+tthor[A] TO tt1
                  STORE nada+tthor[A] TO nada
               ENDIF
            NEXT
            ?? STR(nada,acdigi,2)
            ?? B
            STORE 0 TO nada
            FOR A=1 TO RECC("ADI")
               IF hadi[A]
                  ?? STR(tadi[A],acdigi,2)
                  ?? B
                  STORE tt1+tadi[A] TO tt1
                  STORE nada+tadi[A] TO nada
               ENDIF
            NEXT
            ?? STR(nada,acdigi,2)
            ?? B
            STORE 0 TO nada
            FOR A=1 TO RECC("RET")
               IF hret[A]
                  ?? STR(ABS(tret[A]),acdigi,2)
                  ?? B
                  STORE tt1+tret[A] TO tt1
                  STORE nada+ABS(tret[A]) TO nada
               ENDIF
            NEXT
            ?? STR(nada,acdigi,2)
            ?? B
            STORE 0 TO nada
            FOR A=1 TO RECC("SAL")
               IF hsal[A]
                  ?? STR(ABS(tsal[A]),acdigi,2)
                  ?? B
                  STORE tt1+tsal[A] TO tt1
                  STORE nada+tsal[A] TO nada
               ENDIF
            NEXT
            ?? STR(nada,acdigi,2)
            ?? B
            ?? STR(tt1,acdigi,2)
            ?? B
            IF red
               ?? STR(tred,acdigi,2)
               ?? B
               STORE tt1+tred TO tt1
               ?? STR(tt1,acdigi,2)
               ?? B
            ENDIF
            IF cgas#0
               STORE 0 TO nada
               FOR A=1 TO RECC("GAS")
                  IF hgas[A]
                     IF adenrec
                        ?? STR(ABS(tgas[A]),acdigi,2)
                        ?? B
                     ENDIF
                     STORE tt1+tgas[A] TO tt1
                     STORE nada+ABS(tgas[A]) TO nada
                  ENDIF
               NEXT
               ?? STR(nada,acdigi,2)
               ?? B
               ?? STR(tt1,acdigi,2)
               ?? B
            ENDIF
            EJECT PAGE
            ?
         ENDP
         SET DEVI TO SCRE
         SET CONS ON
         SET PRINTER OFF
         SET PRINTER TO
         ON KEY LABEL shift-f1 DO hlp
      ENDIF
      RELE hthor,cthor,tthor,hadi,cadi,tadi,hret,cret,tret,hsal,csal,tsal,hgas,cgas,tgas,red,ergo,fl
      RELE ttthor,ttadi,ttret,ttsal,ttgas,ttred,veces,B,pl,tit,tt1,nada,gus,mxrn,largoim
      SELE liq
      indice="LI"+LEFT(ptn[jannro],1)+'Q'+SUBSTR(ptn[jannro],2,1)+'u'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
      SET INDEX TO &indice
   ENDIF
ENDIF
@ 24,0 SAY SPACE(80)
RETURN
