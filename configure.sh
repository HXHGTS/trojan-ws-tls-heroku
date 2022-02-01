#!/bin/sh

# Download and install xray
mkdir /tmp/xray
curl -L -H "Cache-Control: no-cache" -o /tmp/xray/xray.zip https://github.com/XTLS/Xray-core/releases/download/v1.5.2/Xray-linux-64.zip
unzip /tmp/xray/xray.zip -d /tmp/xray
install -m 755 /tmp/xray/xray /usr/local/bin/xray

# Remove temporary directory
rm -rf /tmp/xray

# xray new configuration
install -d /usr/local/etc/xray
cat << EOF > /usr/local/etc/xray/config.json
{
    "log": {
        "loglevel": "warning"
    },
    "inbounds": [
        {
            "port": $PORT,
            "protocol": "trojan",
            "settings": {
                "clients": [
                    {
                "password": "$PWD"
                    }
                ]
            },
            "streamSettings": {
                "network": "ws"
            },
                "wsSettings": {
                    "acceptProxyProtocol": true,
                    "path": "/"
                }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom"
        }
    ]
}
EOF

# Run xray
/usr/local/bin/xray -config /usr/local/etc/xray/config.json
