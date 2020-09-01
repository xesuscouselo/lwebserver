FROM alpine:latest
MAINTAINER xesuscouselo
ADD web.awk /
RUN apk update && apk add gawk
EXPOSE 80
CMD gawk -v s_hostnm=`hostname` -v s_addr=`hostname -i` -f /web.awk
