function pgdn
skip 
if eof()
   wait "No hay m s Informaci¢n" wind nowa
   go bottom
   =beep(2)
   wait clear
else
  scat memv   
endif
RETURN .t.