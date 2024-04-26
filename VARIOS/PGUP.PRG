function pgup
skip -1
if bof()
   wait "Est  en el Principio del Archivo" wind nowa
   go top
   =beep(2)
   wait clear
else
  scat memv   
endif
RETURN .t.