COLOR 03
call mvn -f C:\janernest\pom.xml clean install -Dmaven.test.skip=true -o
ECHO ========================================
call mvn -f C:\janernest\freightbit\pom.xml clean install -Dmaven.test.skip=true -o
ECHO ========================================
call mvn -f C:\janernest\freightbit\pom.xml jetty:run -o
ECHO ========================================
PAUSE
