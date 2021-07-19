FROM ubuntu:20.04
WORKDIR /app

ENV USER jun
ENV SHELL /bin /bash
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm
#timezoneを選択しないととまってしまうの非対話に
ENV DEBIAN_FRONTEND=noninteractive

RUN \
    apt update && \
    apt -y upgrade && \
    apt install -y build-essential && \
    apt install -y software-properties-common && \
    apt install -y curl git man unzip vim wget sudo \
    language-pack-ja \
    #language-pack-ja-base　片方あればいいらしい　
    #ibus-mozc 　ＩＥＭいらないかも
    #node.js
    install -y nodejs=16.5.0-1nodesource1

RUN useradd -m ${USER}
#ルート権限を付与s
RUN gpasswd -a ${USER} sudo
# パスワードはpassに設定
RUN echo '${USER}}:pass' | chpasswd



CMD [ "/bin/bash" ]d