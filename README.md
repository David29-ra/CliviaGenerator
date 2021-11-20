# Clivia Generator

This is a Project develop with ruby, it is a game about Questions of differents topics.

In the menú you can write options:

* random: It shows 10 questions in random way.

* custom: You write the topic and difficulty then it shows 10 questions.

* scores: If you save your score, then you can see it in that option.

* exit: Exit the game.

```
###################################
#   Welcome to Trivia Generator   #
###################################
random | custom | scores | exit
>
```

## Before starting!

1. Install ruby
2. install ruby-bundler
3. Run bundle install on terminal to install gems
```ruby
$ bundle install
```

## To Start

1. Run
```ruby
$ ruby main.rb
```

## If you can use Docker

### On Linux/MacOS

1. From the VS Code terminal run the next docker command

```powershell
docker container run \
--name ruby \
-it \
-v $(pwd):/app \
-v ssh:/root/.ssh \
-v bundle:/usr/local/bundle \
-e GIT_USER_NAME=<your_username> \
-e GIT_USER_EMAIL=<your_email> \
--rm \
codeableorg/ruby
```

## If on Windows

2. From the VS Code terminal, select Powershell terminal, then run the next docker command

```powershell
docker container run \
--name ruby \
-it \
-v ${PWD}:/app \
-v ssh:/root/.ssh \
-v bundle:/usr/local/bundle \
-e GIT_USER_NAME=<your_username> \
-e GIT_USER_EMAIL=<your_email> \
--rm \
codeableorg/ruby
```

## Then

3. Clone the repository

```powershell
$ git clone ...
```

4.  Run some initialization scripts

```powershell
$ bootstrap
```

5.  Install some necessary gems for rubocop to work properly

```powershell
$ bundle install
```

6. Run
```powershell
$ ruby main.rb
```

Ready, you can enjoy!

<br/><br/>

*Made by Monito Inc. 🙊*
