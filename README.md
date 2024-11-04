# Ubuntu

```yml
version: '3.8'

services:
  ubuntu_server:
    build:
      context: .
      args:
        ROOT_PASSWORD: "비밀번호"
    container_name: sv1
    restart: always
    tty: true
    ports:
      - "1001:22"
    networks:
      - ubuntu_network

networks:
  ubuntu_network:
    driver: bridge
```