# We're using Alpine Edge
FROM alpine:edge

#
# We have to uncomment Community repo for some packages
#
RUN sed -e 's;^#http\(.*\)/edge/community;http\1/edge/community;g' -i /etc/apk/repositories

#
# Installing Packages
#
RUN apk add --update \
    coreutils \
    bash \
    build-base \
    bzip2-dev \
    curl \
    figlet \
    gcc \
    g++ \
    git \
    sudo \
    aria2 \
    util-linux \
    libevent \
    jpeg-dev \
    libffi-dev \
    libpq \
    libwebp-dev \
    libxml2 \
    libxml2-dev \
    libxslt-dev \
    linux-headers \
    musl \
    neofetch \
    openssl-dev \
    postgresql \
    postgresql-client \
    postgresql-dev \
    openssl \
    pv \
    jq \
    wget \
    python \
    python-dev \
    python3 \
    python3-dev \
    readline-dev \
    sqlite \
    ffmpeg \
    sqlite-dev \
    sudo \
    chromium \
    chromium-chromedriver \
    zlib-dev \
    jpeg \
#
    build-base \
    bzip2-dev \
    curl \
    coreutils \
    figlet \
    gcc \
    g++ \
    git \
    aria2 \
    util-linux \
    libevent \
    libjpeg-turbo-dev \
    chromium \
    chromium-chromedriver \
    jpeg-dev \
    libc-dev \
    libffi-dev \
    libpq \
    libwebp-dev \
    libxml2-dev \
    libxslt-dev \
    linux-headers \
    musl-dev \
    neofetch \
    openssl-dev \
    postgresql-client \
    postgresql-dev \
    pv \
    jq \
    wget \
    python3-dev \
    readline-dev \
    ffmpeg \
    sqlite-dev \
    sudo \
    zlib-dev \
    python-dev



RUN curl https://cli-assets.heroku.com/install.sh

RUN python3 -m ensurepip \
    && pip3 install --upgrade pip setuptools \
    && rm -r /usr/lib/python*/ensurepip && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache




#
# Clone repo and prepare working directory
#
RUN git clone -b sql-extended https://github.com/jefa2231/userbotsp /root/userbot
RUN mkdir /root/userbot/.bin
WORKDIR /root/userbot/

#
# Copies session and config (if it exists)
#
COPY ./sample_config.env ./userbot.session* ./config.env* /root/userbot/

#
# Install requirements
#
RUN pip3 install -r requirements.txt
CMD ["python3","-m","userbot"]


