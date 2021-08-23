VAR_EXPORT="EXPORT"
VAR_IMPORT="IMPORT"
VAR_TRANSPORT="TRANSPORT"
VAR_DATABASE_FILE=${DatabaseFile}
VAR_DATABASE=${Database}
VAR_DATABASE_PORT=${Port}
VAR_TRANSPORT_DATABASE=${TransportTargetDatabase}
VAR_TRANSPORT_DATABASE_PORT=${TransportTargetPort}
VAR_PARAM_ACTION=${Action^^}
if [ "$VAR_TRANSPORT_DATABASE" = "" ]; then
  VAR_TRANSPORT_DATABASE=$VAR_DATABASE
fi

if [ "$VAR_DATABASE_PORT" = "" ]; then
  VAR_DATABASE_PORT=1433
fi


if [ "$VAR_TRANSPORT_DATABASE_PORT" = "" ]; then
  VAR_TRANSPORT_DATABASE_PORT=1433
fi


if [ "$VAR_DATABASE_FILE" = "" ]; then
  VAR_DATABASE_FILE=$VAR_DATABASE
fi

if [ "$VAR_PARAM_ACTION" = "$VAR_EXPORT" ]; then
    echo "EXPORT"
    /utils/sqlpackage/sqlpackage /Action:Export /ssn:tcp:$Hostname,$VAR_DATABASE_PORT /sdn:$Database /su:$Username /sp:$Password /tf:/output/$VAR_DATABASE_FILE.bacpac
    exit 0
fi

if [ "$VAR_PARAM_ACTION" = "$VAR_IMPORT" ]; then
    echo "IMPORT"
    /utils/sqlpackage/sqlpackage /Action:Import /tsn:tcp:$Hostname,$VAR_DATABASE_PORT /tdn:$Database /tu:$Username /tp:$Password /sf:/output/$VAR_DATABASE_FILE.bacpac
    exit 0
fi
if [ "$VAR_PARAM_ACTION" = "$VAR_TRANSPORT" ]; then
    echo "TRANSPORT"
    /utils/sqlpackage/sqlpackage /Action:Export /ssn:tcp:$Hostname,$VAR_DATABASE_PORT /sdn:$Database /su:$Username /sp:$Password /tf:/output/$Database.bacpac
    /utils/sqlpackage/sqlpackage /Action:Import /tsn:tcp:$TransportTargetHostname,$VAR_TRANSPORT_DATABASE_PORT /tdn:$TransportTargetDatabase /tu:$TransportTargetUsername /tp:$TransportTargetPassword /sf:/output/$Database.bacpac
    exit 0
fi



if [[ "$VAR_PARAM_ACTION" != "$VAR_IMPORT" && "$VAR_PARAM_ACTION" != "$VAR_EXPORT" && "$VAR_PARAM_ACTION" != "$VAR_TRANSPORT" ]]; then
    echo "unkown Action Parameter"
    exit 1
fi
