
TARGET = hughes@secil.univ-tlse3.fr:/nfs/www_siame/ontheroadagain
#TARGET = tracesgrue@ftp.tracesgroup.net:www/ontheroadagain

push:
	hugo
	rsync -r public/ $(TARGET)

serve:
	hugo serve
