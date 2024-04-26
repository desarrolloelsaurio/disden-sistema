#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
function qw_tt
para qwtt
priv qwtt
retu IIF(EMPTY(qwtt),'',CRLF+qwtt)
