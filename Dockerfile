FROM haskell:8.2.2 as builder

WORKDIR /src
COPY . .

RUN stack setup
RUN stack build --copy-bins

FROM fpco/haskell-scratch:integer-gmp

WORKDIR /root/
COPY --from=builder /root/.local/bin/helloworld-haskell-exe .

CMD ["./helloworld-haskell-exe"]