# BEGIN
FROM pilbbq/debian
WORKDIR /root
COPY requirements.txt ./
RUN apt-get -qq update && \
    apt-get -qq install --no-install-recommends python3-pip && \
    pip3 install -q -r requirements.txt && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf requirements.txt
# END
