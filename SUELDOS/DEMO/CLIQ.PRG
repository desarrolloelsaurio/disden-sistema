*:*********************************************************************
*:
*:        Program: CLIQ.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/23/91     20:35
*:
*:      Called by: LIQUID.PRG     (procedure in PROCESOS.PRG)
*:
*:          Calls: ELIJAN         (procedure in PROCESOS.PRG)
*:               : ACTLIQ         (procedure in PROCESOS.PRG)
*:               : ERROR          (procedure in PROCESOS.PRG)
*:               : OPLIQ          (procedure in PROCESOS.PRG)
*:               : OPEMP          (procedure in PROCESOS.PRG)
*:               : CHLIQ.PRG
*:               : ERROR1         (procedure in PROCESOS.PRG)
*:               : SHAME          (procedure in PROCESOS.PRG)
*:               : HLP            (procedure in PROCESOS.PRG)
*:
*:   Memory Files: PARCIAL.MEM
*:
*:      Documented 04/24/91 at 17:03               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: CLIQ.PRG
*-- Fecha   : 11/12/90 10:22pm
*-- Version : G. REINER
*-- Notas   : CALCULA SUELDOS Y JORNALES Y
*--           SI XX=2 MUESTRA POR PANTALLA SIN DETENERSE ELSE, NO MUESTRA NADA
********************************************************************************
PARAMETER xix
SET TALK OFF
SELE jan
IF RECC()=4
   GOTO 1
   IF empresa=CHR(67)+CHR(65)+CHR(80)+CHR(83)+CHR(69)+CHR(32)+CHR(83)+CHR(46)+CHR(65)+CHR(46)
      GOTO 2
	  IF EMPRESA=CHR(70)+CHR(73)+CHR(78)+CHR(67)+CHR(65)+CHR(83)+CHR(32)+CHR(82)+CHR(73)+CHR(79)+CHR(74)+CHR(65)+CHR(78)+CHR(65)+CHR(83)+CHR(32)+CHR(83)+CHR(46)+CHR(65)+CHR(46)
	     GOTO 3
         IF EMPRESA=CHR(67)+CHR(65)+CHR(80)+CHR(83)+CHR(69)+CHR(32)+CHR(83)+CHR(46)+CHR(65)+CHR(46)+CHR(32)+CHR(40)+CHR(77)+CHR(65)+CHR(82)+CHR(32)+CHR(68)+CHR(69)+CHR(76)+CHR(32)+CHR(80)+CHR(76)+CHR(65)+CHR(84)+CHR(65)+CHR(41)
            GOTO 4
            IF EMPRESA=CHR(67)+CHR(65)+CHR(80)+CHR(83)+CHR(69)+CHR(32)+CHR(83)+CHR(46)+CHR(65)+CHR(46)+CHR(32)+CHR(40)+CHR(67)+CHR(65)+CHR(80)+CHR(46)+CHR(32)+CHR(66)+CHR(69)+CHR(82)+CHR(77)+CHR(85)+CHR(68)+CHR(69)+CHR(90)+CHR(41)
      ************************ inicio de la liquidaci¢n **********************
            store 0 to cho
            do elijan
            if jannro<>0 .and. lastkey()<>27
               do actliq
               if lastkey()<>27
                  on key do error
                  do opliq
                  do opemp
                  sele liq
                  canrec=recc()
                  ulpr=program()
                  @ 0,34 say time() color i
                  @ 0,46 say padc(program(),10,' ') color i
                  @ 24,0 say padc('ORDENANDO EL ARCHIVO DE LIQUIDACION',80,'*') color sche 19
                  sele liq
                  do chliq
                  @ 0,34 say time() color i
                  @ 0,46 say padc(program(),10,' ') color i
                  set order to 1
                  ulpr=program()
                  sele thor
                  scan
                     ha=horvarmon
                     hb=horvarhs
                     store 0 to &ha
                     store 0 to &hb
                  endscan
                  rele ha,hb
                  save all like tt* to parcial
                  sele liq
                  @ 24,0 say padc('CALCULANDO SUELDOS Y JORNALES - [TECLA] Interrumpe',80,'*') color sche 19
                  if xix=2
                     define wind win from 1,1 to 23,79
                  else
                     define wind win from 10,0 to 14,79
                  endif
                  acti wind win
                  goto top
                  ea=0
                  vez=1
                  on error do error1
                  do while .not. eof()
                     if empleado<>ea
                        if vez<>1
                           goto ea in emp
                           repl emp->haberret with habdesc
                           repl emp->habersin with tothab-habdesc
                           repl emp->adicret with totadides
                           repl emp->adicsin with totadi-totadides
                           repl emp->reten with totret
                           repl emp->salar with totsal
                           repl emp->adelan with totgas
                           repl emp->redondeo with totred
                           repl emp->total with totadi+tothab-totret+totsal-totgas+totred
                           if xix=2
                              if tothab<>0 .and. vhab=0
                                 set color to i
                                 ? 'TOTAL HABERES:                                               '
                                 ?? str(tothab,14,2)
                                 set color to w
                              else
                                 if totadi<>0 .and. vadi=0
                                    set color to i
                                    ? 'TOTAL ADICIONALES:                                           '
                                    ?? str(totadi,14,2)
                                    set color to w
                                    vadi=1
                                 else
                                    if totret<>0 .and. vret=0
                                       set color to i
                                       ? 'TOTAL RETENCIONES:                                           '
                                       ?? str(totret,14,2)
                                       set color to w
                                       vret=1
                                    else
                                       if totsal<>0 .and. vgas=0
                                          set color to i
                                          ? 'TOTAL SALARIO FAMILIAR:                                      '
                                          ?? str(totsal,14,2)
                                          set color to w
                                          vgas=1
                                       else
                                          if totgas<>0
                                             set color to i
                                             ? 'TOTAL ADELANTOS:                                             '
                                             ?? str(totgas,14,2)
                                             set color to w
                                          endif
                                       endif
                                    endif
                                 endif
                              endif
                              set color to i
                              ? 'NETO A PERCIBIR:                                            '
                              ?? str(totadi+tothab-totret+totsal-totgas+totred,14,2)
                              set color to w
                              clea
                              store 0 to cho
                           endif
                        endif
                        rest from parcial addi
                        sele liq
                        ea=empleado
                        vez=2
                        ************************* INICIO RLIQ1 *********************
                        store 0 to habdesc,habbon,tothab,tthtb,totoprem,totprod,totpres,totadi,totadides,tthoprem,tthprod,tthpres,habapo,tthprem,totprem
                        store 0 to totret,totadi,totsal,vhor,vadi,vret,vhab,vgas,totgas,totadiapo,totred,confor
                        *********************** NO VA EN RLIQ1 *************************
                        do while .t. .and. .not. eof()
                           ****************************************************************
                           goto liq->empleado in emp
                           goto emp->cat in cat
                           if emp->jan<>jannro .or. .not. emp->noliq .or. (cat->periodo='M' .and. quialiq=1)
                              sele liq
                              replace liq->imprime with .f. while ea=liq->empleado
                              repl emp->haberret with 0
                              repl emp->habersin with 0
                              repl emp->adicret with 0
                              repl emp->adicsin with 0
                              repl emp->reten with 0
                              repl emp->salar with 0
                              repl emp->adelan with 0
                              repl emp->redondeo with 0
                              repl emp->total with 0
                              ea=empleado
                           else
                              goto emp->con in con
                              @ 0,0 say legajo color sche 3
                              ?? ' - '
                              @ 0,15 say emp->apynom color sche 3
                              ?? ' - '
                              ?? cat->categoria
                              ?? ' - '
                              ?? cat->periodo
                              ?
                              sele liq
                              *********************** NO VA EN RLIQ1 ************************
                              store 0 to cho
                              exit
                           endif
                        enddo
                     endif
                     if .not. eof()
                        ******************************************************************
                        *** VA --> DO WHILE EMPLEADO=PERSONA ****
                        ****************************************************************
                        if archivo<>"XXX"
                           xa="'"+alltrim(archivo)+"'"
                           sele &xa
                           goto liq->registro
                        endif
                        if liq->filtcon=10
                           store cho+1 to cho
                           if liq->valor1=0
                              if hortipo='P'
                                 if hormonto=0
                                    a=iif(cat->periodo='Q',horformqui,horformmes)
                                    if .not. empty(a)
                                       a=&a
                                    else
                                       a=0
                                    endif
                                 else
                                    a=cat->sueldo+cat->sueldo*hormonto/100
                                 endif
                              else
                                 a=hormonto
                              endif
                           else
                              a=liq->valor1
                           endif
                           a=round(a,2)
                           repl liq->valor with a
                           if a<>0
                              if xix=2
                                 if liq->unidad>1
                                    ? str(liq->unidad,14,2)
                                 else
                                    ? space(14)
                                 endif
                                 ?? space(5)
                                 ?? hortipohor
                                 ?? str(a,12,2)
                              endif
                              if liq->unidad>0
                                 tp=round(a*liq->unidad,2)
                              else
                                 tp=round(a,2)
                              endif
                              if xix=2
                                 ?? str(tp,14,2)
                              endif
                              a=horvarmon
                              store tp to &a
                              a=horvarhs
                              repl liq->monto with tp
                              repl liq->imprime with .t.
                              store liq->unidad to &a
                              tothab=tothab+tp
                              tthtb=tthtb+liq->unidad
                              if horret='SI'
                                 habdesc=habdesc+tp
                              endif
                              if horbon='SI'
                                 habbon=habbon+tp
                              endif
                              if horproduc='SI'
                                 tthprod=tthprod+liq->unidad
                                 totprod=totprod+tp
                              endif
                              if horpremio='SI'
                                 tthprem=tthprem+liq->unidad
                                 totprem=totprem+tp
                              endif
                              if horpresen='SI'
                                 tthpres=tthpres+liq->unidad
                                 totpres=totpres+tp
                              endif
                           endif
                           if cho=1
                              if con->basconf .and. cat->periodo='M'
                                 sele liq
                                 pst=recno()
                                 do while filtcon<>20 .and. ea=empleado .and. .not. eof()
                                    skip
                                 enddo
                                 if ea=empleado
                                    do while filtcon=20 .and. ea=empleado
                                       goto liq->registro in adi
                                       sele adi
                                       if adi->adiconf='SI'
                                          if val(adiper)=quialiq .or. at(adiper,'RCS')<>0
                                             if at(adiper,"12SR")<>0 .or. (adiper='C' .and. adivez=adicont)
                                                if aditipo='P'
                                                   if liq->unidad=0
                                                      if adimonto=0
                                                         a=iif(cat->periodo='Q',adiformqui,adiformmes)
                                                         if empty(a)
                                                            a=0
                                                         else
                                                            a=&a
                                                         endif
                                                      else
                                                         a=m->habbon*adimonto/100
                                                      endif
                                                   else
                                                      a=m->habbon*liq->unidad/100
                                                   endif
                                                else
                                                   a=iif(liq->unidad=0,adimonto,liq->unidad)
                                                endif
                                                tp=round(a,2)
                                                confor=confor+tp
                                             endif
                                          endif
                                       endif
                                       sele liq
                                       skip
                                    enddo
                                 endif
                                 sele liq
                                 goto pst in liq
                              endif
                           endif
                           sele liq
                        else
                           if liq->filtcon=20
                              if xix=2
                                 if tothab<>0 .and. vhab=0
                                    set color to i
                                    ? 'TOTAL HABERES:                                               '
                                    ?? str(tothab,14,2)
                                    set color to w
                                 endif
                                 ? space(19)
                                 ?? adicional
                              endif
                              if val(adiper)=quialiq .or. at(adiper,'RCS')<>0
                                 if at(adiper,"12SR")<>0 .or. (adiper='C' .and. adivez=adicont)
                                    vhab=1
                                    if aditipo='P'
                                       if liq->unidad=0
                                          if adimonto=0
                                             a=iif(cat->periodo='Q',adiformqui,adiformmes)
                                             if empty(a)
                                                a=0
                                             else
                                                a=&a
                                                if xix=2
                                                   ?? space(12)
                                                endif
                                             endif
                                          else
                                             a=m->habbon*adimonto/100
                                             repl liq->valor with adimonto
                                             if xix=2
                                                ?? ' %'
                                                ?? str(adimonto,10,2)
                                             endif
                                          endif
                                       else
                                          a=m->habbon*liq->unidad/100
                                          repl liq->valor with liq->unidad
                                          if xix=2
                                             ?? ' %'
                                             ?? str(liq->unidad,10,2)
                                          endif
                                       endif
                                    else
                                       a=iif(liq->unidad=0,adimonto,liq->unidad)
                                       repl liq->valor with 0
                                       if xix=2
                                          ?? space(12)
                                       endif
                                    endif
                                    tp=round(a,2)
                                    if tp<>0
                                       if xix=2
                                          ?? str(tp,14,2)
                                       endif
                                       if adiret='SI'
                                          totadides=totadides+tp
                                       endif
                                       if adiapo='SI'
                                          totadiapo=totadiapo+tp
                                       endif
                                    endif
                                    repl liq->monto with tp
                                    repl liq->imprime with tp<>0
                                    totadi=totadi+tp
                                 else
                                    repl liq->imprime with .f.
                                 endif
                              else
                                 repl liq->imprime with .f.
                              endif
                           else
                              if liq->filtcon=30
                                 if xix=2
                                    if tothab<>0 .and. vhab=0
                                       set color to i
                                       ? 'TOTAL HABERES:                                               '
                                       ?? str(tothab,14,2)
                                       set color to w
                                       vhab=1
                                    else
                                       if totadi<>0 .and. vadi=0
                                          set color to i
                                          ? 'TOTAL ADICIONALES:                                           '
                                          ?? str(totadi,14,2)
                                          set color to w
                                       endif
                                    endif
                                 endif
                                 if val(retper)=quialiq .or. at(retper,'RS')<>0 .or. (retper='C' .and. retvez=retcont)
                                    if xix=2 .and. retquien='O'
                                       ? space(19)
                                       ?? retencion
                                    endif
                                    vadi=1
                                    if rettipo='P'
                                       if liq->unidad=0
                                          if retmonto=0
                                             a=iif(cat->periodo='Q',retformqui,retformmes)
                                             if empty(a)
                                                a=0
                                             else
                                                a=&a
                                                if xix=2 .and. retquien='O'
                                                   ?? space(12)
                                                endif
                                             endif
                                          else
                                             a=(m->habdesc+m->totadides)*retmonto/100
                                             repl liq->valor with retmonto
                                             if xix=2 .and. retquien='O'
                                                ?? ' %'
                                                ?? str(retmonto,10,2)
                                             endif
                                          endif
                                       else
                                          a=(m->habdesc+m->totadides)*liq->unidad/100
                                          repl liq->valor with liq->unidad
                                          if xix=2 .and. retquien='O'
                                             ?? ' %'
                                             ?? str(liq->unidad,10,2)
                                          endif
                                       endif
                                    else
													if liq->unidad<>0
														a=liq->unidad
													else
                                          a=retmonto
													endif
                                       if xix=2 .and. retquien='O'
                                          ?? space(12)
                                       endif
                                    endif
                                    a=round(a,2)
                                    tp=a
                                    if tp<>0
                                       if xix=2 .and. retquien='O'
                                          ?? str(tp,14,2)
                                       endif
                                       repl liq->monto with tp*-1
                                       repl liq->imprime with ret->retquien<>"P"
                                       totret=totret+iif(retquien='P',0,tp)
                                    else
                                       repl liq->monto with 0
                                       repl liq->imprime with .f.
                                    endif
                                 else
                                    repl liq->imprime with .f.
                                 endif
                              else
                                 if liq->filtcon=40
                                    if xix=2
                                       if totadi<>0 .and. vadi=0
                                          set color to i
                                          ? 'TOTAL ADICIONALES:                                           '
                                          ?? str(totadi,14,2)
                                          set color to w
                                          vadi=1
                                       else
                                          if totret<>0 .and. vret=0
                                             set color to i
                                             ? 'TOTAL RETENCIONES:                                           '
                                             ?? str(totret,14,2)
                                             set color to w
                                             vret=1
                                          endif
                                       endif
                                    endif
                                    if emp->pagsal<>'NO'
                                       if val(salper)=quialiq .or. at(salper,'RCS')<>0
                                          if liq->valor1=0
                                             a=salmonto
                                             if a=-1
                                                a=m->totsal
                                             endif
                                          else
                                             a=liq->valor1
                                          endif
                                          if liq->unidad=1
                                             if xix=2
                                                ? space(14)
                                             endif
                                          else
                                             if xix=2
                                                ? str(liq->unidad,14,2)
                                             endif
                                          endif
                                          if xix=2
                                             ?? space(5)
                                             ?? salario
                                             ?? str(a,12,2)
                                          endif
                                          tp=round(a*liq->unidad,2)
                                          if tp<>0
                                             if xix=2
                                                ?? str(tp,14,2)
                                             endif
                                             totsal=totsal+tp
                                          endif
                                          repl liq->monto with tp
                                          repl liq->valor with a
                                          repl liq->imprime with tp<>0
                                       else
                                          repl liq->imprime with .f.
                                       endif
                                    else
                                       repl all liq->imprime with .f. while liq->filtcon=40 .and. liq->empleado=ea
                                    endif
                                 else
                                    if totadi<>0 .and. vadi=0
                                       if xix=2
                                          set color to i
                                          ? 'TOTAL ADICIONALES:                                           '
                                          ?? str(totadi,14,2)
                                          set color to w
                                          vadi=1
                                       else
                                          if totret<>0 .and. vret=0
                                             set color to i
                                             ? 'TOTAL RETENCIONES:                                           '
                                             ?? str(totret,14,2)
                                             set color to w
                                             vret=1
                                          else
                                             if totsal<>0 .and. vgas=0
                                                set color to i
                                                ? 'TOTAL SALARIO FAMILIAR:                                      '
                                                ?? str(totsal,14,2)
                                                set color to w
                                                vgas=1
                                             endif
                                          endif
                                       endif
                                    endif
                                    if liq->filtcon=50
                                       if m->redondeo<>0
                                          mt=m->totadi+m->tothab-m->totret+m->totsal
                                          if tipored='A'
                                             remedio=m->redondeo
                                             a=mod(mt,m->redondeo)
                                             if a<>0
                                                fsaj=roun(int(mt/m->redondeo)*m->redondeo+m->redondeo,2)
                                                a=fsaj-mt
                                             else
                                                fsaj=mt
                                             endi
                                          else
                                             remedio=int(m->redondeo/2)
                                             a=mod(mt,m->redondeo)
                                             if a<>0
                                                fsaj=roun(int(mt/m->redondeo)*m->redondeo,2)
                                                if a<remedio
                                                   fsaj=fsaj
                                                else
                                                   fsaj=fsaj+m->redondeo
                                                endi
                                                a=fsaj-mt
                                             else
                                                a=0
                                                fsaj=mt
                                             endi
                                          endi
                                          totred=a
                                          repl liq->monto with totred
                                          repl liq->imprime with .t.
                                          if a<>0
                                             if xix=2
                                                set color to i
                                                ? 'REDONDEO         :                                          '
                                                ?? str(totred,14,2)
                                                set color to w
                                             endif
                                          endif
                                       endif
                                    else
                                       if liq->fechaven<=fliz
                                          vgas=1
                                          if xix=2
                                             ? space(19)
                                             ?? gasto
                                             ?? space(12)
                                          endif
                                          a=1
                                          tp=liq->unidad
                                          if tp<>0
                                             if xix=2
                                                ?? str(tp,14,2)
                                             endif
                                             totgas=totgas+tp
                                          endif
                                          repl liq->monto with tp*-1
                                          repl liq->imprime with m->adenrec
                                       endif
                                    endif
                                 endif
                              endif
                           endif
                        endif
                     endif
                     sele liq
                     if .not. eof()
                        skip
                     endif
                  enddo
                  if lastkey()<>27
                     sele emp
                     if ea<>0
                        goto ea
                        repl emp->haberret with habdesc
                        repl emp->habersin with tothab-habdesc
                        repl emp->adicret with totadides
                        repl emp->adicsin with totadi-totadides
                        repl emp->reten with totret
                        repl emp->salar with totsal
                        repl emp->adelan with totgas
                        repl emp->redondeo with totred
                        repl emp->total with totadi+tothab-totret+totsal-totgas+totred
                        if quialiq=1
                           repl emp->acummes with tothab+totadi
                        endif
                     endif
                     if xix=2
                        if tothab<>0 .and. vhab=0
                           set color to i
                           ? 'TOTAL HABERES:                                               '
                           ?? str(tothab,14,2)
                           set color to w
                        else
                           if totadi<>0 .and. vadi=0
                              set color to i
                              ? 'TOTAL ADICIONALES:                                           '
                              ?? str(totadi,14,2)
                              set color to w
                              vadi=1
                           else
                              if totret<>0 .and. vret=0
                                 set color to i
                                 ? 'TOTAL RETENCIONES:                                           '
                                 ?? str(totret,14,2)
                                 set color to w
                                 vret=1
                              else
                                 if totsal<>0 .and. vgas=0
                                    set color to i
                                    ? 'TOTAL SALARIO FAMILIAR:                                      '
                                    ?? str(totsal,14,2)
                                    set color to w
                                    vgas=1
                                 else
                                    if liq->filtcon>70
                                       if totgas<>0
                                          set color to i
                                          ? 'TOTAL ADELANTOS:                                             '
                                          ?? str(totgas,14,2)
                                          set color to w
                                       endif
                                    endif
                                 endif
                              endif
                           endif
                        endif
                        set color to i
                        ? 'NETO A PERCIBIR:                                             '
                        ?? str(totadi+tothab-totret+totsal-totgas+totred,14,2)
                     endif
                  endif
                  rele wind win
                  sele thor
                  scan
                     a=horvarmon
                     b=horvarhs
                     rele &a,&b
                  endscan
                  rele a,b,habdesc,habbon,tothab,tthtb,totoprem,totprod,totpres,totadi,totadides,tthoprem,tthprod,tthpres,habapo,tthprem,totprem
                  rele totret,totadi,totsal,vhor,vadi,vret,vhab,totadiapo,mt,remedio,fsaj,totred,pst,confor
                  set index to
                  on error do error
               endif
            endif
      ************************ fin de la liquidaci¢n *************************
   ELSE
      DO shame
   ENDIF
   ELSE
      DO shame
   ENDIF
   ELSE
      DO shame
   ENDIF
   ELSE
      DO shame
   ENDIF
ELSE
   DO shame
ENDIF
ON KEY LABEL shift-f1 DO hlp
RETURN
*: EOF: CLIQ.PRG
