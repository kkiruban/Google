set "param1=%1"
setlocal EnableDelayedExpansion
if "!param1!"=="" ( set UserRole='CSMAdmin' ) else (set UserRole='%param1%')
set _my_datetime=%date%_%time%
set _my_datetime=%_my_datetime: =_%
set _my_datetime=%_my_datetime::=%
set _my_datetime=%_my_datetime:/=_%
set _my_datetime=%_my_datetime:.=_%
set _filename=Result\Google-Admin-Prod-%_my_datetime%.html
cd /d %~dp0
cucumber features --tags @US-003692-u TEST_ENV=production --expand  --format html --out %_filename% UserRole='adminprod'