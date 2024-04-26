function qw_fec
parameter QW_RN,QW_CL,QW_CUAL
store date() to fecfin,fecini
if filfec=2
   if entre_fe()
      IF FECINI=FECFIN
         store QW_CUAL+"={"+dtoc(fecfin)+"}" to quefec      
      ELSE
          store 'BETW('+QW_CUAL+',{'+dtoc(fecini)+'},{'+dtoc(fecfin)+'})' to quefec
      ENDIF
      ttfec='Entre el '+dtoc(fecini)+' y el '+dtoc(fecfin)
      @ QW_RN,QW_CL say dtoc(fecini)+'-'+dtoc(fecfin)
   else
      filfec=1
   endif
endif
return FILFEC#2 .OR. (FILFEC=2 .AND. FECINI#FECFIN)
