FROM alpine:3.4
MAINTAINER Alfred Gutierrez <alf.g.jr@gmail.com>

# ENV BENTO4_VERSION 1-5-0-615
ENV BENTO4_VERSION 1.5.0-615
ENV PATH=/opt/bento4/bin:${PATH}

RUN apk update \
  && apk add wget ca-certificates python make gcc g++ libgcc

# Get Bento4 SDK binaries and install to /opt/bento4.
# RUN cd /tmp/ && wget http://zebulon.bok.net/Bento4/binaries/Bento4-SDK-${BENTO4_VERSION}.x86_64-unknown-linux.zip \
#   && unzip Bento4-SDK-${BENTO4_VERSION}.x86_64-unknown-linux.zip && rm Bento4-SDK-${BENTO4_VERSION}.x86_64-unknown-linux.zip

RUN cd /tmp/ \
  && wget -O Bento4-${BENTO4_VERSION}.tar.gz https://github.com/axiomatic-systems/Bento4/archive/v${BENTO4_VERSION}.tar.gz \
  && tar -xzvf Bento4-${BENTO4_VERSION}.tar.gz && rm Bento4-${BENTO4_VERSION}.tar.gz

# RUN cd /tmp/ && mkdir -p /opt/bento4 && cp -r Bento4-SDK-1-5-0-615.x86_64-unknown-linux/. /opt/bento4/

RUN cd /tmp/Bento4-${BENTO4_VERSION}/Build/Targets/x86-unknown-linux && make AP4_BUILD_CONFIG=Release
RUN cd /tmp/ && mkdir -p /opt/bento4/bin && cp -r Bento4-${BENTO4_VERSION}/Build/Targets/x86-unknown-linux/Release/. /opt/bento4/bin
RUN cd /tmp/ && mkdir -p /opt/bento4/scripts && cp -r Bento4-${BENTO4_VERSION}/Source/Python/utils/. /opt/bento4/utils
RUN cd /tmp/ && cp -r Bento4-${BENTO4_VERSION}/Source/Python/wrappers/. /opt/bento4/bin
RUN cd /tmp/ && mkdir -p /opt/bento4/include && cp -r Bento4-${BENTO4_VERSION}/Source/C++/**/*.h . /opt/bento4/include

RUN rm -rf /tmp/Bento4-${BENTO4_VERSION}

WORKDIR /opt/bento4/bin

CMD ["sh"]