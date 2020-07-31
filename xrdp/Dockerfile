FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN sed -i.bak 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list && \
apt update && \
apt upgrade -y

#一般ユーザーでもrootになってコマンド実行できるように
RUN apt-get install -y sudo

#デスクトップ環境
RUN apt install -y lxde

#リモートデスクトップサービス
RUN apt install -y xrdp

#デーモン化できる
#https://qiita.com/yushin/items/15f4f90c5663710dbd56
RUN apt install -y supervisor

#IMEの設定
RUN apt install -y ibus \
                   ibus-mozc \

#日本語環境の設定
RUN apt install -y language-pack-ja-base \
                   language-pack-ja

#フォントのインストール
RUN apt install -y fonts-noto-cjk \
                   fonts-noto-color-emoji

#キャッシュの削除でイメージサイズの削減
RUN apt-get clean \
      && rm -rf /var/cache/apt/archives/* \
      && rm -rf /var/lib/apt/lists/*

# Set locale
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && echo 'Asia/Tokyo' > /etc/timezone

RUN locale-gen ja_JP.UTF-8 \
    && echo 'LC_ALL=ja_JP.UTF-8' > /etc/default/locale \
    && echo 'LANG=ja_JP.UTF-8' >> /etc/default/locale

ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8

# Set sudoers for any user
RUN echo "ALL ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/ALL
## Expose RDP port
EXPOSE 3389

#Xセッション起動時のデスクトップ環境の指定
RUN echo "startlxde" > /etc/skel/.xsession

#Xセッション起動時のデスクトップ環境の指定
RUN install -o root -g xrdp -m 2775 -d /var/run/xrdp \
    && install -o root -g xrdp -m 3777 -d /var/run/xrdp/sockdir \
    && install -o root -g root -m 0755 -d /var/run/dbus

#supervisordコマンドによるリモートデスクトップの常駐サービス化
COPY xrdp.conf /etc/supervisor/xrdp.conf



#COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
#ENTRYPOINT ["docker-entrypoint.sh"]
