PROCEDURE BANC
BA_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE BA_DIJO="Bancos"
DO BAN
CASE BA_DIJO="N� de Cheque"
DO BAN WITH "N"
ENDCASE
RETURN MEN_LIN(BOTOM)

