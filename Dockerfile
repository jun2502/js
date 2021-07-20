FROM ubuntu:20.04
WORKDIR /app

#日本語化する場合
#ENV LANG ja_JP.UTF-8
#ENV LANGUAGE ja_JP:ja
#ENV LC_ALL ja_JP.UTF-8

ENV USER jun
ENV SHELL /bin /bash
ENV TZ JST-9
ENV TERM xterm
#timezoneを選択しないととまってしまうの非対話に
ENV DEBIAN_FRONTEND=noninteractive

RUN \
    apt update && \
    apt -y upgrade && \
    apt install -y build-essential && \
    apt install -y software-properties-common && \
    apt install -y curl git man unzip vim wget sudo 
    #language-pack-ja 日本語化する場合
    #ibus-mozc 　ＩＥＭ必要ないかも
#ここからnode.js　node16.5をインストールするためにnパッケージを使用。その後古いのを消している
RUN apt install -y npm   
RUN npm install -y -g n
RUN n 16.5.0
#RUN apt purge -y nodejs npm

#ひとまずユーザーをけす
#RUN useradd -m ${USER}
#ルート権限を付与s
#RUN gpasswd -a ${USER} sudo
# パスワードはpassに設定
#RUN echo '${USER}}:pass' | sudo chpasswd

CMD [ "/bin/bash" ]d