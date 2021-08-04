FROM alpine:3 AS otpalpinebuild
RUN apk update && apk upgrade
RUN apk add --no-cache alpine-sdk
RUN wget https://www.fourmilab.ch/onetime/otp-1.2.2.tar.gz
RUN tar -xf otp-1.2.2.tar.gz
RUN cd /otp-1.2.2/ && make
FROM alpine:3
COPY --from=otpalpinebuild /otp-1.2.2/otp .
ENTRYPOINT ["./otp"]
