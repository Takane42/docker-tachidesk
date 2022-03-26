FROM alpine:latest

RUN apk --update add curl openjdk8-jre-base tzdata

RUN mkdir -p /usr/share/tachidesk/data

WORKDIR /usr/share/tachidesk

RUN curl "https://raw.githubusercontent.com/Suwayomi/docker-tachidesk/main/scripts/startup_script.sh" -o /usr/share/tachidesk/startup_script.sh

RUN curl -L $(curl -s https://api.github.com/repos/suwayomi/tachidesk-server/releases/latest | grep -o "https.*jar") -o /usr/share/tachidesk/tachidesk_latest.jar

EXPOSE 4567

CMD ["/bin/sh", "/usr/share/tachidesk/startup_script.sh"]
