# Introduction

This Docker image provides elm-lang.org including the try elm.
I use this docker file particularly to have the try elm available even if i do not have internet.

# Build

```
git clone https://github.com/JordyMoos/try-elm-docker
docker build -t jordymoos/try-elm .
```

# Installation and usage

The container can be started issuing the following command

```
docker run --name try-elm -d -p 8000:8000 jordymoos/try-elm
```
