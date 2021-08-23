ARG Action
ARG Hostname 
ARG Port 
ARG Database 
ARG Username
ARG Password
ARG DatabaseFile

ARG TransportTargetHostname
ARG TransportTargetPort
ARG TransportTargetDatabase
ARG TransportTargetUsername
ARG TransportTargetPassword
ARG TransportTargetDatabase


FROM mcr.microsoft.com/dotnet/runtime:3.1
RUN apt-get update
RUN apt-get install -y wget unzip
RUN mkdir -p /utils/sqlpackage

RUN wget -O /tmp/sqlpackacge.zip https://go.microsoft.com/fwlink/?linkid=2165213
RUN unzip /tmp/sqlpackacge.zip -d /utils/sqlpackage
RUN chmod +x /utils/sqlpackage/sqlpackage
RUN mkdir /output
WORKDIR /utils/sqlpackage
COPY command.sh /utils/sqlpackage/command.sh
RUN chmod +x /utils/sqlpackage/command.sh
ENTRYPOINT ["/bin/bash","/utils/sqlpackage/command.sh"]
