FROM mcr.microsoft.com/dotnet/runtime:3.1
RUN apt-get update
RUN apt-get install -y wget unzip
RUN mkdir -p /utils/sqlpackage
RUN wget -O /tmp/sqlpackacge.zip https://go.microsoft.com/fwlink/?linkid=2165213
RUN unzip /tmp/sqlpackacge.zip -d /utils/sqlpackage
RUN chmod +x /utils/sqlpackage/sqlpackage
WORKDIR /utils/sqlpackage
