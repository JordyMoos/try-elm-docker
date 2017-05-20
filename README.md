# Introduction

This Docker image provides [elm-lang.org][elm-lang] including the [try elm][try-elm].
I use this docker file particularly to have the try elm available even if i do not have any internet connection.

[elm-lang]: https://github.com/elm-lang/elm-lang.org
[try-elm]: http://elm-lang.org/try

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

The container can take a minute to initialize.
After that go to http://localhost:8000/try
