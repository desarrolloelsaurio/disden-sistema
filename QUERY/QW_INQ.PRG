FUNCTION QW_INQ
parameter QW_RN,QW_CL,QW_CUAL,JUSTONE
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
if filinq=2
   IF JUSTONE
      store nul to respuesta
      if !empty(eliinq('a Listar',QW_RN,QW_CL))
         IF USED('PER')
            store QW_CUAL+'="'+PER.CODCLI+'"' to queinq
            QW_TTOK=ALLTRIM(PER.CLIENTE)
         ELSE
            store QW_CUAL+'="'+PER.CODCLI+'"' to queinq
            QW_TTOK=ALLTRIM(PER.CLIENTE)
      ENDIF
      ttinq='Inquilino:'+QW_TTOK
      @ QW_RN,QW_CL say left(QW_TTOK,20)
   else
      store 1 to filinq
   endif
ENDIF
endif
return FILinq=1
