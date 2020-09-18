FROM ubuntu:focal AS builder
WORKDIR /root
ENV DEBIAN_FRONTEND=noninteractive
COPY setup.sh build.sh /root/
RUN /root/setup.sh
RUN /root/build.sh

FROM ubuntu:focal
WORKDIR /root
COPY setup.sh /root/
COPY --from=builder /llvm /llvm
COPY --from=builder /llvm-src /llvm-src
ENV DEBIAN_FRONTEND=noninteractive
ENV LC_ALL=zh_CN.UTF-8
RUN /root/setup.sh && rm /root/setup.sh && \
    apt install locales && locale-gen zh_CN.UTF-8
