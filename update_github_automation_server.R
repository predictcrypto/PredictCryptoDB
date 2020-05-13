# Adjustments to fix cron job
setwd("~/PredictCryptoDB")
Sys.setenv(RSTUDIO_PANDOC="/usr/lib/rstudio-server/bin/pandoc")
# login info
source("login.R")
db_user = Sys.getenv('db_user')
db_pswd = Sys.getenv('db_pswd')
db_ip = Sys.getenv('db_ip')
# render book
bookdown::render_book('index.Rmd', 'bookdown::gitbook', clean_envir = FALSE)

# set email
system('git config --local user.email "info@predictcrypto.net"')
# set username
system('git config --local user.name "predictcrypto"')
# Commit to GitHub!
system('git commit -m "Update book" -a')
# Push to GitHub!
system('git push origin master')
# ^ If this starts failing, run this line again: git config --global credential.helper 'cache --timeout=10000000000',
#then trigger a new username + pswd challenge to cache credentials again

# date for reference in logs:
Sys.Date()