********************************************************************************
*-- Programa: IREM.PRG
*-- Fecha   : 01-03-92 01:56am
*-- Version : G. REINER
*-- Notas   : RECEPCION REMITOS DE CASA CENTRAL
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   =movewin(3,20,22,68,'win'," Recepciขn Mercaderกa de Casa Central ")
   STOR NUL TO numrem,tll,ctdd
   store 5 to ren
   store 1 to col
   sele mer
   go top
   @ 1,1 SAY 'Nง de REMITO' get numrem
   DO PRIPAN
   read
   if !empty(numrem) .and. lastkey()#27
   store space(15) to artant
   on key label tab keyboard artant
      do while .t.
         STOR NUL TO respuesta
         if !empty(elimer("a Ingresar",ren,col))
            store mer->articulo to rtcl,artant
             acti wind win
               @ ren,col get rtcl
               clea gets
            else
               exit
            endif
            acti wind win
            dtll=left(mer->merca,19)
            @ ren,col+16 get dtll
            clear gets
            @ ren,col+36 get tll pict '99' mess 'Talle del Producto'
            read
            if !empty(tll) .and. lastkey()#27 .and. tll<=xatalmax .and. tll>=xatalmin
               arti=alltrim(rtcl)+zero(tll*10,3)
               sele pre
               STORE .T. TO SIGUE
               if !seek(arti)
                  =cartel("EL ARTICULO NO EXISTE","EN EL ARCHIVO DE STOCK","DEBERA CONFIRMAR LA CREACION","")
                  IF CONFIRM1("CREAR NUEVO REGISTRO",.T.,10,0)
                     =FLOCK("PRE") .OR. FLOK("PRE")
                     APPE BLAN
                     REPL ARTICULO WITH ARTI
                     UNLO IN MER
                  ELSE
                     STORE .F. TO SIGUE
                  ENDIF
               endif
               IF SIGUE
                  @ ren,col+39 get ctdd pict '999999' mess 'Cantidad Recibida'
                  read
                  if !empty(ctdd) .and. lastkey()#27
                     if confirm1("Datos Ingresados",.t.,10,0)
                        REGISTRO=STR(RECNO())
                        DO LOK WITH "PRE"
                        REPL STOCK WITH STOCK+CTDD
                        UNLO IN PRE
                        SELE KAR
                        SCAT MEMV BLAN
                        FECHAOP=DATE()
                        ARTICULO=ARTI
                        OPK=6
                        DOCREF='RI'
                        NRODOCREF=NUMREM
                        DETALLE="Recepciขn Mercaderกas Casa Central"
                        ENTRADA=ctdd
                        SALIDA=NUL
                        DO FLOK WITH "KAR"
                        APPE BLAN
                        GATH MEMV
                        =REPUSE()
                        UNLO IN KAR
                        ren=ren+1
                        IF REN=16
                           CLEA
                           REN=4
                           DO PRIPAN
                        ENDIF
                     endif
                  endif
               ENDIF
            endif
      enddo
   endif
   =relewin("WIN")
ELSE
   =iaudi()
ENDIF
on key label tab
=MEN_LIN(BOTOM)
RETURN
PROCEDURE PRIPAN
@ 2,nul SAY 'ษอออออออออออออออหอออออออออออออออออออหออหออออออป'
@ 3,nul SAY 'บ   ARTICULO    บDENOMINACION COMER.บTLบCANTIDบ'
@ 4,nul SAY 'ฬอออออออออออออออฮอออออออออออออออออออฮออฮออออออน'
for a=5 to 16
   @ a,nul say 'บ               บ                   บ  บ      บ'
endfor
@ a,nul SAY 'ศอออออออออออออออสอออออออออออออออออออสออสออออออผ'
RETURN
