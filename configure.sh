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
        "loglevel": "none"
    },
    "inbounds": [
        {
            "port": $PORT,
            "protocol": "trojan",
            "settings": {
                "clients": [
                    {
                "password": "$TRPWD"
                    }
                ]
            },
            "streamSettings": {
                "network": "ws"
            },
                "wsSettings": {
                    "path": "/"
                }
        }
    ],
  "outbounds": [
    {
      "tag":"INTERNET_OUT",
      "protocol": "freedom"
    }
  ],
  "routing": {
    "rules": [
      {
        "type": "field",
        "outboundTag": "INTERNET_OUT",
        "network": "udp,tcp"
      }
    ]
  },
  "dns": {
    "servers": [
      "8.8.8.8",
      "8.8.4.4"
]
}
}
EOF

# Run xray
/usr/local/bin/xray -config /usr/local/etc/xray/config.json
