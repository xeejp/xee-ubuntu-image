# How to use docker image

## In your shell
`git clone https://github.com/NotFounds/docker-xee-ubuntu.git`
`cd ./docker-xee-ubuntu`
`$ docker build -t xee-ubuntu-image .`
`$ docker run -i -t -p 4000:4000 -p 5432:5432 xee-ubuntu-image`

## In the docker container
`$$ cd ./xee/`
`$$ npm install`
`$$ mix deps.get`
`$$ mix mix deps.update --all`
`$$ mix ecto.migrate`
`$$ mix phoenix.server`

## In your browser
Access to `localhost:4000`.
If the page is shown, You're Success.
Else then You should Check the error messages. And Fix it or Report it to me.

# License
MIT License.
