@echo off

::##############################################################################
::##
::##  apkanalyzer.cmd
::##
::##  apkanalyzer start up script for Windows
::##
::##  converted by ewwink
::##
::##############################################################################

::Attempt to set APP_HOME

SET SAVED=%cd%
SET APP_HOME=C:\android\sdk\tools
SET APP_NAME="apkanalyzer"

::Add default JVM options here. You can also use JAVA_OPTS and APKANALYZER_OPTS to pass JVM options to this script.
SET DEFAULT_JVM_OPTS=-Dcom.android.sdklib.toolsdir=%APP_HOME%

::## 默认配置
SET CLASSPATH=%APP_HOME%\lib\dvlib-26.0.0-dev.jar;%APP_HOME%\lib\util-2.2.1.jar;%APP_HOME%\lib\jimfs-1.1.jar;%APP_HOME%\lib\annotations-13.0.jar;%APP_HOME%\lib\ddmlib-26.0.0-dev.jar;%APP_HOME%\lib\repository-26.0.0-dev.jar;%APP_HOME%\lib\sdk-common-26.0.0-dev.jar;%APP_HOME%\lib\kotlin-stdlib-1.1.3-2.jar;%APP_HOME%\lib\protobuf-java-3.0.0.jar;%APP_HOME%\lib\apkanalyzer-cli.jar;%APP_HOME%\lib\gson-2.3.jar;%APP_HOME%\lib\httpcore-4.2.5.jar;%APP_HOME%\lib\dexlib2-2.2.1.jar;%APP_HOME%\lib\commons-compress-1.12.jar;%APP_HOME%\lib\generator.jar;%APP_HOME%\lib\error_prone_annotations-2.0.18.jar;%APP_HOME%\lib\commons-codec-1.6.jar;%APP_HOME%\lib\kxml2-2.3.0.jar;%APP_HOME%\lib\httpmime-4.1.jar;%APP_HOME%\lib\annotations-12.0.jar;%APP_HOME%\lib\bcpkix-jdk15on-1.56.jar;%APP_HOME%\lib\jsr305-3.0.0.jar;%APP_HOME%\lib\explainer.jar;%APP_HOME%\lib\builder-model-3.0.0-dev.jar;%APP_HOME%\lib\baksmali-2.2.1.jar;%APP_HOME%\lib\j2objc-annotations-1.1.jar;%APP_HOME%\lib\layoutlib-api-26.0.0-dev.jar;%APP_HOME%\lib\jcommander-1.64.jar;%APP_HOME%\lib\commons-logging-1.1.1.jar;%APP_HOME%\lib\annotations-26.0.0-dev.jar;%APP_HOME%\lib\builder-test-api-3.0.0-dev.jar;%APP_HOME%\lib\animal-sniffer-annotations-1.14.jar;%APP_HOME%\lib\bcprov-jdk15on-1.56.jar;%APP_HOME%\lib\httpclient-4.2.6.jar;%APP_HOME%\lib\common-26.0.0-dev.jar;%APP_HOME%\lib\jopt-simple-4.9.jar;%APP_HOME%\lib\sdklib-26.0.0-dev.jar;%APP_HOME%\lib\apkanalyzer.jar;%APP_HOME%\lib\shared.jar;%APP_HOME%\lib\binary-resources.jar;%APP_HOME%\lib\guava-22.0.jar

::## jdk如果版本大于8，可能需要使用下面的配置，将上面的配置注释，并增加对应的jar文件到 'APP_HOME\lib\' 下
::SET CLASSPATH=%APP_HOME%\lib\activation-1.1.1.jar;%APP_HOME%\lib\istack-commons-runtime-4.0.1.jar;%APP_HOME%\lib\jaxb-impl-2.3.1.jar;%APP_HOME%\lib\jaxb-api-2.3.1.jar;%APP_HOME%\lib\jaxb-runtime-2.3.1.jar;;%APP_HOME%\lib\dvlib-26.0.0-dev.jar;%APP_HOME%\lib\util-2.2.1.jar;%APP_HOME%\lib\jimfs-1.1.jar;%APP_HOME%\lib\annotations-13.0.jar;%APP_HOME%\lib\ddmlib-26.0.0-dev.jar;%APP_HOME%\lib\repository-26.0.0-dev.jar;%APP_HOME%\lib\sdk-common-26.0.0-dev.jar;%APP_HOME%\lib\kotlin-stdlib-1.1.3-2.jar;%APP_HOME%\lib\protobuf-java-3.0.0.jar;%APP_HOME%\lib\apkanalyzer-cli.jar;%APP_HOME%\lib\gson-2.3.jar;%APP_HOME%\lib\httpcore-4.2.5.jar;%APP_HOME%\lib\dexlib2-2.2.1.jar;%APP_HOME%\lib\commons-compress-1.12.jar;%APP_HOME%\lib\generator.jar;%APP_HOME%\lib\error_prone_annotations-2.0.18.jar;%APP_HOME%\lib\commons-codec-1.6.jar;%APP_HOME%\lib\kxml2-2.3.0.jar;%APP_HOME%\lib\httpmime-4.1.jar;%APP_HOME%\lib\annotations-12.0.jar;%APP_HOME%\lib\bcpkix-jdk15on-1.56.jar;%APP_HOME%\lib\jsr305-3.0.0.jar;%APP_HOME%\lib\explainer.jar;%APP_HOME%\lib\builder-model-3.0.0-dev.jar;%APP_HOME%\lib\baksmali-2.2.1.jar;%APP_HOME%\lib\j2objc-annotations-1.1.jar;%APP_HOME%\lib\layoutlib-api-26.0.0-dev.jar;%APP_HOME%\lib\jcommander-1.64.jar;%APP_HOME%\lib\commons-logging-1.1.1.jar;%APP_HOME%\lib\annotations-26.0.0-dev.jar;%APP_HOME%\lib\builder-test-api-3.0.0-dev.jar;%APP_HOME%\lib\animal-sniffer-annotations-1.14.jar;%APP_HOME%\lib\bcprov-jdk15on-1.56.jar;%APP_HOME%\lib\httpclient-4.2.6.jar;%APP_HOME%\lib\common-26.0.0-dev.jar;%APP_HOME%\lib\jopt-simple-4.9.jar;%APP_HOME%\lib\sdklib-26.0.0-dev.jar;%APP_HOME%\lib\apkanalyzer.jar;%APP_HOME%\lib\shared.jar;%APP_HOME%\lib\binary-resources.jar;%APP_HOME%\lib\guava-22.0.jar

SET APP_ARGS=%*
::Collect all arguments for the java command, following the shell quoting and substitution rules
SET APKANALYZER_OPTS=%DEFAULT_JVM_OPTS% -classpath %CLASSPATH% com.android.tools.apk.analyzer.ApkAnalyzerCli %APP_ARGS%

::Determine the Java command to use to start the JVM.
SET JAVACMD="java"
where %JAVACMD% >nul 2>nul
if %errorlevel%==1 (
  echo ERROR: 'java' command could be found in your PATH.
  echo Please set the 'java' variable in your environment to match the
  echo location of your Java installation.
  echo.
  exit /b 0
)

:: execute apkanalyzer

%JAVACMD% %APKANALYZER_OPTS%