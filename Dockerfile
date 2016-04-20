FROM alpine:latest

RUN \
	apk add --no-cache \
		spamassassin \
	&& sa-update

ENTRYPOINT ["spamd"]

EXPOSE 783

CMD ["--siteconfigpath=/etc/mail/spamassassin", "--max-children", "5", "--create-prefs" , "--user-config", "--syslog", "/proc/self/fd/2"]