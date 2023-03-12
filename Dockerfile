	# instructions
	
	FROM ubuntu:20.04
	RUN apt-get update
	RUN apt-get install -y nginx
	COPY simplilearn.html /var/www/html/index.html
	EXPOSE 80
	CMD nginx -g "daemon off;"
