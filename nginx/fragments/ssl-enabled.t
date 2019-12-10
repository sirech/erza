    listen 443 ssl http2;
    listen [::]:443 ssl http2;

    ssl_certificate           /cert/live/{{ . }}/fullchain.pem;
    ssl_certificate_key       /cert/live/{{ . }}/privkey.pem;
    ssl_trusted_certificate   /cert/live/{{ . }}/chain.pem;

    # Improve HTTPS performance with session resumption
    ssl_session_cache shared:SSL:10m;
    ssl_session_timeout 10m;

    # Enable server-side protection against BEAST attacks
    ssl_protocols TLSv1.2;
    ssl_prefer_server_ciphers on;
    ssl_ciphers "ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384";

    # RFC-7919 recommended: https://wiki.mozilla.org/Security/Server_Side_TLS#ffdhe4096
    # ssl_dhparam /etc/ssl/ffdhe4096.pem;
    ssl_ecdh_curve secp521r1:secp384r1;