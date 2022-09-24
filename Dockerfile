FROM alpine:3.14

RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories


RUN apk upgrade && apk add --no-cache vim git make bash neovim curl fzf npm openssh-client-default ruby ruby-dev build-base


WORKDIR /workspace

COPY . .

RUN make

CMD ["bash"]
