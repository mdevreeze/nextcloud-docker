FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install s3ql -y
RUN mkdir /data
VOLUME /data
RUN mkdir /root/.s3ql
ADD authinfo2 /root/.s3ql
RUN chmod 600 /root/.s3ql/authinfo2
#RUN mkfs.s3ql s3c://s3.nl-ams.scw.cloud/tests3ql5 --authfile /root/.s3ql/authinfo2 
#CMD mount.s3ql s3c://s3.nl-ams.scw.cloud/tests3ql5 /data --allow-other --authfile /root/.s3ql/authinfo2 
CMD [ "/bin/bash" ]