FROM alpine:3.8
LABEL MAINTAINER Alfred Gutierrez <alf.g.jr@gmail.com>

ENV BENTO4_VERSION 1.5.1-629
ENV BENTO4_INSTALL_DIR=/opt/bento4
ENV PATH=/opt/bento4/bin:${PATH}
 
# Install dependencies.
RUN apk update \
  && apk add --no-cache \
  ca-certificates bash python wget libgcc make gcc g++

# Fetch source.
RUN cd /tmp/ \
  && wget -O Bento4-${BENTO4_VERSION}.tar.gz https://github.com/axiomatic-systems/Bento4/archive/v${BENTO4_VERSION}.tar.gz \
  && tar -xzvf Bento4-${BENTO4_VERSION}.tar.gz && rm Bento4-${BENTO4_VERSION}.tar.gz

# Create installation directories.
RUN mkdir -p \
  ${BENTO4_INSTALL_DIR}/bin \
  ${BENTO4_INSTALL_DIR}/scripts \
  ${BENTO4_INSTALL_DIR}/include

# Build.
RUN cd /tmp/Bento4-${BENTO4_VERSION}/Build/Targets/x86-unknown-linux \
  && make AP4_BUILD_CONFIG=Release

# Install.
RUN cd /tmp \
  && cp -r Bento4-${BENTO4_VERSION}/Build/Targets/x86-unknown-linux/Release/. ${BENTO4_INSTALL_DIR}/bin \
  && cp -r Bento4-${BENTO4_VERSION}/Source/Python/utils/. ${BENTO4_INSTALL_DIR}/utils \
  && cp -r Bento4-${BENTO4_VERSION}/Source/Python/wrappers/. ${BENTO4_INSTALL_DIR}/bin \
  && cp -r Bento4-${BENTO4_VERSION}/Source/C++/**/*.h . ${BENTO4_INSTALL_DIR}/include

# Cleanup.
RUN rm -rf /var/cache/apk/* /tmp/*

WORKDIR /opt/bento4

CMD ["bash"]
