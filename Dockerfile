FROM denoland/deno:alpine-1.10.3

EXPOSE 8080

WORKDIR /app

USER deno

COPY deps.ts .
RUN deno cache deps.ts

ADD . .

RUN deno cache main.ts

CMD ["run", "--allow-net", "main.ts"]
