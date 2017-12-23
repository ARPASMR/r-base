FROM docker.io/r-base
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y curl
RUN apt-get install -y openssl
RUN apt-get install -y libssl-dev
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y libmysqlclient-dev
RUN apt-get install -y libpq-dev
RUN apt-get install -y ncftp
RUN apt-get install -y ssh
RUN apt-get install -y libgdal-dev
COPY ./install_lib.R /usr/local/src/myscripts/
WORKDIR /usr/local/src/myscripts/
RUN R -e "install.packages('RPostgreSQL', repos = 'http://cran.us.r-project.org')"
RUN Rscript install_lib.R
