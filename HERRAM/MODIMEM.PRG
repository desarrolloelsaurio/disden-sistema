SET TALK OFF
SET SAFE OFF
close all
clea all
rele all
clea
if leemem()
      zxzcant=alen(memorias,1)-1
      dime memorias[zxzcant,3]
   defi popu opera from 10,10 mess "Operaci¢n a Realizar"
   defi bar 1 of opera prom 'Modifica Contenido de Variable ' key Ctrl-M
   defi bar 2 of opera prom 'Cambia Tipo de Variable ' key Ctrl-T
   defi bar 3 of opera prom 'Agrega Variable' key Ctrl-A
   defi bar 4 of opera prom 'Borra Variable' key Ctrl-B
   defi bar 5 of opera prom 'Lista Variables por Familia' key Ctrl-L
   defi bar 6 of opera prom 'Sale sin Grabar' key Ctrl-X
   defi bar 7 of opera prom 'Graba Modificaciones' key Ctrl-W
   on sele popu opera do opmem
   zxzsale=.t.
   do while zxzsale
      acti popu opera
      if last()=27
         exit
      endif
   enddo
endif
rele popu opera
return
procedure opmem
do case
case bar()=1
   zxzcual=1
   @ 1,50 get zxzcual from memorias size 20,25
   read
   if last()#27
      =digamem()
      zxzpic=''
      zxzcontenido=salecont(memorias[zxzcual,2],memorias[zxzcual,3])
      @ 3,1 get zxzcontenido picture zxzpic
      read
      if update()
         =devuelve(memorias[zxzcual,2],zxzcontenido)
      ENDIF
      rele wind win
   endif
case bar()=2
   zxzcual=1
   @ 1,50 get zxzcual from memorias size 20,25
   read
   if last()#27
      =digamem()
      ZXZTIPO=MEMORIAS[ZXZCUAL,2]
      zxztipo=IIF(ZXZTIPO='C','Caracter',IIF(ZXZTIPO='D','Date',IIF(ZXZTIPO='N','Num‚rico','L¢gico')))
      @ 3,1 say "Cont. Anterior:"
      ?? memorias[zxzcual,3]
      @ 4,1 say "Nuevo Tipo de Variable" get zxztipo pict '@M Caracter,Date,Num‚rico,L¢gico'
      read
      if last()#27 .and. update()
         zxztipo=left(zxztipo,1)
         memorias[zxzcual,2]=zxztipo
         =adapta(zxztipo,zxzcual)
         =devuelve(zxztipo,memorias[zxzcual,3])
      endif
   endif
   rele wind win
case bar()=3
   xzxtipo='C'
   xzxvariable=space(10)
   clea
   defi wind win from 10,5 to 16,75
   acti wind win
   store space(10) to zxzvariable,zxztipo
   store space(80) to zxzcontenido
   @ 1,1 say "Variable        " get zxzvariable pict 'X!!!!!!!!!'
   @ 2,1 say "Tipo de Variable" get zxztipo pict '@M Caracter,Date,Num‚rico,L¢gico'
   @ 3,1 say "Contenido       " get zxzcontenido pict repl("X",80)
   read
   if last()#27 .and. !empty(zxzvariable)
      zxzvariable=alltrim(UPPER(zxzvariable))
      SET NEAR ON
      if empty(ascan(memorias,zxzvariable))
         zxzcant=alen(memorias,1)+1
         ZXZTIPO=left(zxztipo,1)
         dime memorias[zxzcant,3]
         memorias[zxzcant,1]=upper(zxzvariable)
         memorias[zxzcant,2]=zxztipo
         MEMORIAS[ZXZCANT,3]=ZXZCONTENIDO
         zxzcual=zxzcant
         =adapta(memorias[zxzcant,2],zxzcant)
         =devuelve(zxztipo,memorias[zxzcual,3])
      endif
      SET NEAR OFF
   endif
   DEAC WIND WIN
case bar()=4
   zxzcual=1
   @ 1,50 get zxzcual from memorias size 20,25
   read
   if last()#27
      =digamem()
      @ 3,1 say "Cont. Anterior:"
      ?? memorias[zxzcual,3]
      IF CONFIRMA("Borrar la Variable",.f.,4,1)
         zxzcant=zxzcant-1
         =aDEL(MEMORIAS,ZXZCUAL)
         DIME MEMORIAS[ZXZCANT,3]
      endif
   ENDIF
   DEAC WIND WIN
case bar()=5
   clea
   defi wind win from 10,5 to 16,75 titl ' Familia de Variables a Listar '
   acti wind win
   zxzvar=space(10)
   @ 2,1 say "Familia a Listar " get zxzvar
   read
   if last()#27 .and. !empty(zxzvar)
      zxzvar=alltrim(zxzvar)
      defi wind win from 0,0 to 24,79 none
      acti wind win
      clea
      for zxz=1 to zxzcant
         if upper(zxzvar) $ upper(memorias[zxz,1])
            ? memorias[zxz,1]
            ?? left(memorias[zxz,3],50) at 29
            if row()>20
               =inkey(0)
               clea
            endif
         endif
      endf
      if row()#0
         =inkey(0)
      endif
   endif
   rele wind win
case bar()=6
   clea
   defi wind win from 10,5 to 16,75 titl ' Sale sin Grabar '
   acti wind win
   if confirma("Salir sin Grabar",.f.,2,1)
      ZXZSALE=.F.
      DEAC Popu
   endif
   rele wind win
CASE BAR()=7
   clea
   defi wind win from 10,5 to 16,75 titl ' Familia de Variables a Listar '
   acti wind win
   zxzFILE=space(8)
   @ 2,1 say "Archivo de Destino" get zxzfile
   read
      rele wind win
      if last()#27 .and. !empty(zxzfile)
      zxzfile=alltrim(upper(zxzfile))+".MEM"
			zxzarray=''
      FOR ZXZ1=ALEN(MEMORIAS,1) to 1 step -1
         IF "(" $ MEMORIAS[zxz1,1]
						if zxzarray#left(memorias[zxz1,1],at("(",MEMORIAS[zxz1,1]))
							 zxzarray=left(memorias[zxz1,1],at("(",MEMORIAS[zxz1,1]))
							 dime (memorias[zxz1,1])
						endif
				 endif
         STORE SALECONT(MEMORIAS[ZXZ1,2],MEMORIAS[ZXZ1,3],.t.) TO (MEMORIAS[ZXZ1,1])
     ENDFOR
     rele memorias
   save to (zxzfile) ALL except zxz*
      store .f. to zxzsale
      DEAC popu
   endif
endcase
return
**************************************************
function salecont
parameter tipo,contenido,atrm
private tipo,contenido
if tipo='C'
   contenido=alltrim(contenido)
   contenido=compacta(contenido)
   if !atrm
   contenido=contenido+space(80-len(contenido))
   endif
   zxzpic=repl("X",80)
else
   if tipo="N"
      contenido=compacta(contenido)
      contenido=alltrim(contenido)
      contenido=val(contenido)
      zxzpic=repl("9",14)+"."+repl("9",10)
   else
      if tipo='L'
         contenido=compacta(contenido)
         contenido=(contenido='.T.')
         zxzpic='L'
      else
         if tipo='D'
            contenido=compacta(contenido)
            contenido=ctod(contenido)
            zxzpic='D'
         endif
      endif
   endif
endif
return contenido
*******************************
function compacta
parameter contenido
private contenido
contenido=substr(contenido,2)
contenido=left(contenido,len(contenido)-1)
return contenido
***************************************
function digamem
clea
defi wind win from 10,5 to 16,75
acti wind win
@ 1,1 say memorias[zxzcual,1]
zxz=memorias[zxzcual,2]
@ 2,1 say IIF(ZXZ='C','Caracter',IIF(zxz='D','Date',IIF(zxz='N','Num‚rico','L¢gico')))
return .t.
***************************************
function devuelve
parameter tipo,contenido
private tipo,contenido
if memorias[zxzcual,2]="C"
   memorias[zxzcual,3]='"'+alltrim(contenido)+'"'
else
   if memorias[zxzcual,2]="N"
      memorias[zxzcual,3]='"'+str(contenido,14,10)+'"'
   else
      if memorias[zxzcual,2]="L"
         memorias[zxzcual,3]='"'+iif(contenido,'.T.','.F.')+'"'
      else
         if memorias[zxzcual,2]="D"
            memorias[zxzcual,3]='"'+dtoc(contenido)+'"'
         endif
      endif
   endif
endif
return .t.
***********************************
function adapta
parameter tipo,cual
private tipo,cual
if tipo='N'
   memorias[cual,3]=xxtonum(memorias[cual,3])
else
   if tipo="D"
      memorias[cual,3]=xxtofec(memorias[cual,3])
   else
      if tipo="L"
         memorias[cual,3]=xxtolog(memorias[cual,3])
      else
         memorias[cual,3]=xxtochar(memorias[cual,3])
      endif
   endif
endif
return .t.
