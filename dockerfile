FROM ubuntu:20.04

# 비대화형 모드 설정
ENV DEBIAN_FRONTEND=noninteractive

# 패키지 업데이트 및 openssh-server 설치
RUN apt update && \
    echo -e "6\n68" | apt install -y openssh-server

# SSH 설정 파일 수정하여 비밀번호 인증 허용
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# 환경 변수를 사용하여 root 비밀번호 설정
ARG ROOT_PASSWORD
RUN echo "root:${ROOT_PASSWORD}" | chpasswd

# SSH 포트 설정
EXPOSE 22

# SSH 서비스 시작
CMD service ssh start && bash
