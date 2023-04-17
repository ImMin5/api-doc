FROM klakegg/hugo:latest-ext

WORKDIR /site/api
COPY ./ /site/api

RUN hugo server --minify --theme hugo-book
