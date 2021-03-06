#! /bin/bash

if [[ -z "${IAST_MANAGER_URL}" ]]; then
  dotnet run
else
  cwd=$(pwd)
  mkdir /usr/local/cxiast-agent
  cd /usr/local/cxiast-agent
  wget "${IAST_MANAGER_URL}/iast/compilation/download/C_SHARP" -O CxAgent.zip
  unzip CxAgent.zip
  chmod a+w .
  chmod a+x CxIAST_CORE.sh
  echo "maxStoredStringLength=50" >>cx_agent.override.properties
  cd ${cwd}
  /usr/local/cxiast-agent/CxIAST_CORE.sh "dotnet /app/bin/Debug/netcoreapp2.1/NET_CORE_SINK_APP.dll"
fi