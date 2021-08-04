FROM ubuntu
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install otp && rm -rf /var/lib/apt/*

ENTRYPOINT ["otp"]