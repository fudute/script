FROM ubuntu

ARG EXEC_DIR

ADD ./${EXEC_DIR}/app /

ENTRYPOINT /app
EXPOSE 8080
