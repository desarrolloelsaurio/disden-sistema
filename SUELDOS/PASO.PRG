** salario familiar ltropa->liq
set talk on
clea
sele 1
use lidqeunf alias liq
zap
sele 2
use c:\mientras\padron alias emp
sele 3
use c:\mientras\salarios alias sal
sele 2
scan for sexo=1 .and. esposa=1
   do paso1 with 1,1
endscan
scan for hijos<>0
   do paso1 with 2,emp->hijos
endscan
scan for escprim<>0
   do paso1 with 3,emp->escprim
endscan
scan for escsec<>0
   do paso1 with 4,emp->escsec
endscan
scan for famnumer<>0
   do paso1 with 5,emp->famnumer
endscan
scan for escsecnum<>0
   do paso1 with 7,emp->escsecnum
endscan
scan for prenatal<>0
   do paso1 with 8,emp->prenatal
endscan
scan for incap<>0
   do paso1 with 9,emp->incap   
endscan
scan for fnhi<>0
   do paso1 with 12,emp->fnhi    
endscan
scan for ehi<>0
   do paso1 with 11,emp->ehi    
endscan
scan for fnpn<>0
   do paso1 with 13,emp->fnpn
endscan
scan for am4<>0
   do paso1 with 10,emp->am4 
endscan
scan for prees<>0
   do paso1 with 6,emp->prees
endscan
return
