FROM alpine:3.10

RUN apk add --no-cache bash git build-base cmake ruby ruby-dev ruby-etc ruby-irb \
        ruby-json ruby-minitest ruby-rake ruby-rdoc ruby-webrick && \
      adduser -D developer && \
      echo "gem: --suggestions --user-install" > /etc/gemrc

USER developer

ENV GEM_HOME "/home/developer/.gem/ruby/2.5.0"
ENV PATH "/usr/bin:/usr/sbin:/bin:/sbin:/home/developer/.gem/ruby/2.5.0/bin"
