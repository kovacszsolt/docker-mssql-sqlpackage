# docker-mssql-sqlpackage
Docker Image SQLPackage command
## Parameters  
- Action = Export / Import  
- Hostname = MSSQL server host name  
- Port = SQL server port number
- Database = Database name  
- Username = Database username  
- Password = Database password  

## Output
/output/$Database

## Example
  
### Import  
docker run -v .\database_files:/output -e Action=import -e Port=1433 -e Hostname=host.docker.internal -e Database=databasename -e Username=sa -e Password=sa123 kovacszsolt/mssql-sqlpackage  
  
### Export  
docker run -v .\database_files:/output -e Action=export -e Port=1433 -e Hostname=database.host -e Database=databasename -e Username=sa -e Password=sa123  kovacszsolt/mssql-sqlpackage  
  
  