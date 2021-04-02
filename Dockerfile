FROM ruby:3.0-alpine
# FROM santoshdocker2021/temp_dev

ENV RAILS_VERSION dev
ENV NODE_VERSION   dev

RUN apk update \
        && apk --no-cache add curl make elixir bash tar vim nodejs
#         && apk --no-cache add curl musl-dev make elixir bash tar vim nodejs

EXPOSE 8080 3000 6379 80

CMD ["sh"]