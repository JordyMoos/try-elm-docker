FROM haskell:7.10.3

RUN apt-get update \
  && apt-get install -y \
    git \
    curl \
    libtinfo-dev \
    zlib1g-dev \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /opt/elm/ \
  && curl https://raw.githubusercontent.com/elm-lang/elm-platform/master/installers/BuildFromSource.hs > /opt/elm/BuildFromSource.hs

ENV PATH="/opt/elm/Elm-Platform/0.18/.cabal-sandbox/bin:${PATH}"

WORKDIR /opt/elm

RUN runhaskell BuildFromSource.hs 0.18

WORKDIR /opt/elm/Elm-Platform/0.18/

RUN git clone https://github.com/elm-lang/elm-lang.org.git

WORKDIR /opt/elm/Elm-Platform/0.18/elm-lang.org

RUN git checkout 0.18 \
  && cabal sandbox init --sandbox ../.cabal-sandbox \
  && cabal install --only-dependencies \
  && cabal configure \
  && cabal build

CMD ["./dist/build/run-elm-website/run-elm-website"]
