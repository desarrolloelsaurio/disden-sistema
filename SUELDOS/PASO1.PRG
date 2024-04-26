parameter paso,paso1
sele liq
appe blan
repl empresa with 1
repl legajo with emp->legajo
repl filtcon with 40
repl archivo with "SAL"
repl registro with paso
repl unidad with paso1
repl valor with 0,monto with 0
repl fechaven with ctod('12/31/99')
repl informa with .f.
repl cencos with 0
repl empleado with recno("EMP")
repl imprime with .t.
sele emp
return

