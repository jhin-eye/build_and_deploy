@echo off
setlocal

set directories=crawler_core member message_publisher telegram-bot
@REM set directories=gyu-hee member message_publisher telegram-bot


set ERROR_OCCURRED=0
for %%d in (%directories%) do (
    echo Building project in directory: %%d

    cd %%d

    call gradlew build -x test

    if errorlevel 1 (
        echo Build failed in directory: %%d
        set ERROR_OCCURRED=1
    )

    cd ..
)
if %ERROR_OCCURRED%==1 (
    echo One or more builds failed. Check the logs above.
    pause
    exit /b 1
)

echo Rebuild docker compose
docker-compose build --no-cache


echo Stopping existing Docker Compose services...
docker-compose down

echo Starting Docker Compose
docker-compose up -d

endlocal

pause