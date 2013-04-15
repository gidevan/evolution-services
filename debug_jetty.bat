echo %MAVEN_OPTS%
set MAVEN_OPTS=-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5566
echo %MAVEN_OPTS%
call mvn -Djetty.port=9999 jetty:run-war