# BEGIN
FROM pilbbq/debian
WORKDIR /root
COPY requirements.txt ./
RUN apt-get -qq update && \
    apt-get -qq install python3-pip && \
    pip3 install -r requirements.txt && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf requirements.txt
# END
