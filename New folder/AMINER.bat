@echo off
setlocal enableDelayedExpansion

:: ##########################
:: User-editable section
:: ##########################
set "POOL=octopus.unmineable.com:3333"
set "WALLET=BTC:bc1qh8jnvvgk59xr5u4r55xuv7hkzxvlfa8l2wun6n.MINER"
set "EXTRAPARAMETERS=--apiport 8020"
:: ##########################

cd /d %~dp0
set "MINER=%CD%\lolMiner.exe"

:RESTART
echo Running lolMiner from %MINER%
"%MINER%" --algo OCTOPUS --pool !POOL! --user !WALLET! --watchdog exit !EXTRAPARAMETERS! --nocolor 


if %ERRORLEVEL%==42 (
    timeout /t 10
    goto RESTART
)







pause