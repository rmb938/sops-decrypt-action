FROM mozilla/sops:647560046fef85d8ba1800ed63528a364538391f # v3.5.0

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
