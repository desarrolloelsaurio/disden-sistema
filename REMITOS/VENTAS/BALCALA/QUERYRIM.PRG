********************************************************************************
*-- Programa: QUERYRIM.PRG
*-- Fecha   : 05-02-92 11:39am
*-- Version : G. REINER
*-- Notas   : GENERA QUERY PARA LISTADO EN REMITOS INTERNOS
*-- Modificaci¢n 07-22-92 07:51pm GOYO marca->empresa
********************************************************************************
FUNCTION QUERYRIM
parameter porpant
PRIVATE PORPANT
ULPR=HORA_ULP(PROGRAM())
=MOVEWIN(7,1,19,79,'win',' L¡mites del Listado de Remitos de '+biajas,' [ESC] para Men£ ')
store 1 to filemp,filrem,filvia,filval,filmer,filfec,filmon
STORE '.T.' to QUEemp,QUErem,QUEvia,QUEval,QUEmer,quefec,quemon
STORE '' to TTemp,TTrem,TTvia,TTval,TTmer,ttfec,ttmon
***
for m.i=nul to 1
   =rad_bot(1,2,'filemp','*RT Empresa;Anula Listado',19,m.i=1)
   if m.i=1
      read cycle
   endif
   if m.i=0 .or. (m.i=1 .and. filemp=1)
      if last()#27 .or. (last()=27 .and. m.i=0)
         =rad_bot(1,27,'filrem','*RT Todos los Remitos;Un Remito;Resumen por Remito',19,m.i=1)
         read cycle when last()#27 .and. m.i=1
         =rad_bot(1,52,'filfec','*RT Todas las Fechas;Una Fecha;Res£men por Fecha',19,m.i=1)
         read cycle when last()#27 .and. m.i=1 .and. filrem#2
         =rad_bot(6,2,'filvia','*RT Todos los '+biajas+';Un '+biaja+';Res£men por '+biaja,19,m.i=1)
         read cycle when last()#27 .and. m.i=1 .and. filrem#2
         =rad_bot(6,27,'filmon','*RT Todos los Montos;Montos Mayores a...;Montos Menores a...',19,m.i=1)
         read cycle when last()#27 .and. m.i=1 .and. filrem#2
         =rad_bot(6,52,'filmer','*RT Sin Mercader¡a;Resumen por Producto',19,m.i=1)
         read cycle when last()#27 .and. m.i=1 .and. filrem#2
      endif
   ELSE
      EXIT
   endif
next
if lastkey()#27 .and. filemp=1
   ** ELIGE EMPRESA
   store nul TO RESPUESTA
   IF !empty(ELIEMP("a Listar",4,2))
      DO OPREI WITH JANNRO
      =OPMER() WITH JANNRO
      @ 4,2 say janname
      *** elige Remito
      if filrem=2
         store NUL to respuesta,NUREM
         ULPR=PROGRAM()
         if busrem(.T.)
            nurem=rem.remito
            if porpant
               DO lremp1 WITH NUREM
            else
               IF LEFT(JANNAME,5)="ARCO "
                  DO lremiA WITH .f.,.f.
               ELSE
                  DO lremiL WITH .f.,.f.
               ENDIF
            endif
         ELSE
            store 1 to filrem
         endif
      ELSE
         HABILITADO[2]=qw_fec(4,52,'rem.fechaem')
         HABILITADO[3]=qw_via(9,2,'rem.codvia')
         HABILITADO[4]=QW_MON(9,27,'REM.VALORIZ')
         if filmer=2
            =qw_mer(14,52,'rex.articulo')
         endif
         FISC=''
         FISC=qw_fisc(FISC,queREM)
         FISC=qw_FISC(FISC,quefec)
         FISC=qw_FISC(FISC,quevia)
         FISC=qw_FISC(FISC,queMON)
         FISC=qw_FISC(FISC,queMer)
         FISC=IIF(EMPTY(FISC),'.T.',FISC)
         store "Resumen por " to ressu
         ttREM=iif(filrem=3,RESSU+'Remito',ttREM)
         ttfec=iif(filfec=3,RESSU+'Fecha',ttfec)
         ttvia=iif(filvia=3,RESSU+'Viajante',ttvia)
         TTQUE=QW_TT(TTREM)+QW_TT(TTFEC)+QW_TT(TTVIA)+QW_TT(TTMON)+QW_TT(TTMER)
      ENDIF
   endif
endif
IF !EMPTY(WONTOP())
   =releWIN('win')
ENDIF
RETURN last()#27 .AND. filrem#2 .and. jannro#0
