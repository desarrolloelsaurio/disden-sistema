function qw_prp
parameter QW_RN,QW_CL,QW_CUAL,JUSTONE
if filprp=2
   IF JUSTONE
      store nul to respuesta
      if !empty(eliprp('a Listar',QW_RN,QW_CL))
         store QW_CUAL+'="'+PER.CODCLI+'"' to queprp
         ttprp='Propietario:'+ALLTRIM(PER.CLIENTE)
         @ QW_RN,QW_CL say left(PER.CLIENTE,20)
      else
         store 1 to filprp
      endif
   endif
ENDIF
return FILprp=1
