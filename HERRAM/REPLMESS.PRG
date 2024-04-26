parameter r_texto
list alltrim(stuff(message,at(r_texto,message),len(r_texto),'"+tipo_per+"')) for !empty(atline(r_texto,message))
repl message with alltrim(stuff(message,at(r_texto,message),len(r_texto),'"+tipo_per+"')) for !empty(atline(r_texto,message))
return