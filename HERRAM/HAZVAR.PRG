parameter cual
cual1="i"+cual+"C"
cual2="i"+cual+"R"
cual3="i"+cual+"AN"
cual4="i"+cual+"LA"
cual5="C"+cual+"C"
cual6="C"+cual+"R"
cual7="C"+cual+"AN"
cual8="C"+cual+"LA"
cual9="M"+cual+"C"
cual10="M"+cual+"R"
cual11="M"+cual+"AN"
cual12="M"+cual+"LA"
cual13="V"+cual+"C"
cual14="V"+cual+"R"
cual15="V"+cual+"AN"
cual16="V"+cual+"LA"
CUAL17=CUAL+'POP'
CUAL18=CUAL+'POPR'
CUAL19=CUAL+'POPC'

PUBL (CUAL1),(CUAL2),(CUAL5),(CUAL6),(CUAL9),(CUAL10),(CUAL13),(CUAL14)
PUBL (CUAL3),(CUAL7),(CUAL11)
PUBL (CUAL4),(CUAL8),(CUAL12)
PUBL (CUAL18)
PUBL (CUAL19)
PUBL (CUal17)
PUBL (cual15)
PUBL (CUAL16)

STOR NUL TO (CUAL1),(CUAL2),(CUAL5),(CUAL6),(CUAL9),(CUAL10),(CUAL13),(CUAL14)
STORE 60 TO (CUAL3),(CUAL7),(CUAL11)
STORE 14  TO (CUAL4),(CUAL8),(CUAL12)
STORE 2 TO (CUAL18)
STORE 40 TO (CUAL19)
STORE .T. TO (CUal17)
store vruban to (cual15)
store vrublA TO (CUAL16)
RETURN
