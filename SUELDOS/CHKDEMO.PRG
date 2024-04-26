set dele off
if recc()>5
   @ 0,1 say str(recc(),5)
   dele all
   go top
   reca next 5
   pack
endif
set dele on
@ 0,1 say str(recc(),5)
