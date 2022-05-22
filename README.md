# Trojan-ws-tls Heroku

## 警告⚠：此技术仅限用于个人查看学术或科研娱乐使用！！！若用于其他违法目的，后果自负！！！

## 概述

用于在 Heroku 上部署 Trojan Websocket + tls

## 一键部署到Heroku

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://dashboard.heroku.com/new?template=https://github.com/HXHGTS/trojan-ws-tls-heroku)

## ENV 设定

### 随机密码生成方法

Linux下用bash执行:

`pwgen -s 40 1`

在线生成随机密码(推荐):

<a href="https://1password.com/password-generator/" target="_blank">随机密码</a>

### CDN嵌套方法

[CDN嵌套方法](https://hxhgts.github.io/xray-websocket-tls-nginx/cdn.html)

## 注意

部署时一定不要用默认的PWD，记得替换！！！

WebSocket 路径默认为 `/ISODownload`

heroku每个月限制550h(约23d)的免费时长，时长使用完会导致服务器离线，下个月自动恢复


