# docker-mssql-sqlpackage
Docker Image SQLPackage command
## Parameters  
- Action = Export / Import / Transport
- Hostname = Export MSSQL server host name OR Import MSSQL server host name OR Transport Souce MSSQL server host name  
- Port = Export SQL server port number OR Import SQL server port number OR Transport Souce server port number  
- Database = Export Database name OR Import Database name OR Transport Souce Database name  
- DatabaseFile = Export Target File name OR Import Database File name OR Transport Souce Database File name 
- Username = Export Database username OR Import Database username OR Transport Souce Database username  
- Password = Export Database password OR Import Database password OR Transport Souce Database password  

- TransportTargetHostname = Transport Target MSSQL server host name  
- TransportTargetPort = Transport Target SQL server port number
- TransportTargetDatabase = Transport Target Database name  
- TransportTargetUsername = Transport Target Database username  
- TransportTargetPassword = Transport Target Database password  
- TransportTargetDatabase = Transport Target Database name  

## Output
/output/$Database

## Example
  
### Import  
docker run -v .\database_files:/output -e Action=import -e Port=1433 -e Hostname=host.docker.internal -e Database=databasename -e Username=sa -e Password=sa123 kovacszsolt/mssql-sqlpackage  
  
### Export  
docker run -v .\database_files:/output -e Action=export -e Port=1433 -e Hostname=database.host -e Database=databasename -e Username=sa -e Password=sa123  kovacszsolt/mssql-sqlpackage  

### Transport  
docker run -e Action=transport -e Port=1433 -e Hostname=database.host -e Database=databasename -e Username=sa -e Password=sa123 -e TransportTargetPort=1433 -e TransportTargetHostname=host.docker.internal -e TransportTargetDatabase=databasename -e TransportTargetUsername=sa -e TransportTargetPassword=sa123 kovacszsolt/mssql-sqlpackage  
