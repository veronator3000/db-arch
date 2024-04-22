FROM alpine:latest

RUN apk add --no-cache postgresql-client
COPY version_controller.sh /version_controller.sh

RUN chmod +x /version_controller.sh

EXPOSE 8080
CMD ["sh", "/version_controller.sh"]



