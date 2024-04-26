DO OPSEG
ulpr=hora_ulp(program())
if cheqseg()
do case
case bar()=1
   ULPR='NEW_USR'
   IF CHEQSEG()
      do NEW_usr
   ELSE
      =IAUDI()
   ENDIF
case bar()=2
do ch_pass with "\PUBLIC\MONDAY.PAS"
endcase
else
=iaudi()
endif
return
