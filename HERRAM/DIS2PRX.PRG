set talk off
set esca on
use admin.pjx
go top
skip
scan while !eof()
   a=alltrim(substr(name,rat('\',name)+1))
   clea
   ? 'fuente: '
   ?? ('d:\'+a)
   ?? 'destino:' at 40
   ?? alltrim(name)
   store 'NO' to copia
   @ 10,10 say "copia" get copia pict "@M NO,SI"
   read
   if last()#27
      if copia="SI"
         if file((name))
            @ 10,0 say padc("el programa existe",80)
            store 'NO' to copia
            @ 12,10 say "overescribe ? " get copia pict "@M NO,SI"
            read
         endif
         if copia="SI"
            copy file ('d:\'+a) to (name)
         endif
      endif
   else
      exit
   endif
endscan
use
