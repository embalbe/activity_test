FROM ubuntu:latest
MAINTAINER alberuss myemail@noyb.com
RUN apt -y update
RUN apt -y install python3-pip
RUN apt -y install git
RUN apt -y install wget
RUN pip3 install codespell

RUN wget https://sourceforge.net/projects/astyle/files/astyle/astyle%203.1/astyle_3.1_linux.tar.gz && \
    tar -zxvf astyle_3.1_linux.tar.gz && \
    cd /astyle/build/gcc/ && \
    make && cd / && \ 
    rm /astyle_3.1_linux.tar.gz && \
    echo "export PATH=/astyle/build/gcc/bin:${PATH}" >> /root/.bashrc

ENV PATH "$PATH:/astyle/build/gcc/bin"
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
