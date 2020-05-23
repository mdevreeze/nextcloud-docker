FROM nextcloud
RUN mkdir /data
ADD custom_entrypoint.sh /custom_entrypoint.sh
RUN chmod 755 /custom_entrypoint.sh

ENTRYPOINT ["/custom_entrypoint.sh"]