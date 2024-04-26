function qw_gar
parameter QW_REN,QW_COL,QW_CUAL,JUSTONE
if filgar=2
IF JUSTONE
   store nul to respuesta
   if !empty(eligar('a Listar',QW_REN,QW_COL))
      store '('+ALLTR(QW_CUAL)+'1="'+PER.CODCLI+'" .OR. '+;
                ALLTR(QW_CUAL)+'2="'+PER.CODCLI+'" .OR. '+;
                ALLTR(QW_CUAL)+'3="'+PER.CODCLI+'")' to quegar
      ttgar='Garant¡a:'+ALLTRIM(PER.CLIENTE)
      @ QW_REN,QW_COL say left(PER.CLIENTE,20)
   else
      store 1 to filgar
   endif
   ENDIF
endif
return FILGAR=1
