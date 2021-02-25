# v3.5.0
FROM mozilla/sops:v3.6.1

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
