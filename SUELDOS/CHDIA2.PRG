if ordlis=1
   index on legajo+str(thor,4) to tmp
else
   sele emp
   set order to
   sele dia
   set rela to empleado into emp addi
   index on emp->apynom+str(thor,4) to tmp
endif
