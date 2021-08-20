VAR_EXPORT="EXPORT"
VAR_PARAM_ACTION=${Action^^}
VAR_IMPORT="IMPORT"

if [ "$VAR_PARAM_ACTION" = "$VAR_EXPORT" ]; then
    echo "EXPORT"
    /utils/sqlpackage/sqlpackage /Action:Export /ssn:tcp:$Hostname,$Port /sdn:$Database /su:$Username /sp:$Password /tf:/output/$Database.bacpac
    exit 0
fi

if [ "$VAR_PARAM_ACTION" = "$VAR_IMPORT" ]; then
    echo "IMPORT"
    /utils/sqlpackage/sqlpackage /Action:Import /tsn:tcp:$Hostname,$Port /tdn:$Database /tu:$Username /tp:$Password /sf:/output/$Database.bacpac
    exit 0
fi

if [[ "$VAR_PARAM_ACTION" != "$VAR_IMPORT" && "$VAR_PARAM_ACTION" != "$VAR_EXPORT" ]]; then
    echo "unkown Action Parameter"
    exit 1
fi
