FROM vergaju/ma5112_singlecell

COPY ids.txt tmp/users.txt

RUN while read -r username password email;do \
	useradd -m -s /bin/bash "$username" && \
	echo "$username:$password" | chpasswd; \
	mkdir -p /home/$username; \
	chown $username:$username /home/$username; \
	chmod 700 /home/$username; \
	done < /tmp/users.txt

RUN rm -f /tmp/users.txt
