
# Redash chatbot add-on for youtube data analytics

## Introduction

The Redash ChatGPT Plugin is an integration that brings natural language conversation capabilities powered by ChatGPT to your Redash dashboard. With this plugin, Redash users can engage in interactive and conversational queries, as well as visualize data directly from the chat interface.

## Features

- Conversational Queries: Users can interact with Redash using natural language queries, making the process more intuitive and user-friendly.
- Interactive Responses: ChatGPT generates human-like responses, providing users with informative and contextual feedback on their queries.
- Data Visualization: The plugin allows users to visualize query results directly within the chat interface, enabling faster data exploration and analysis.

The Redash ChatGPT Plugin is an exciting project that aims to integrate natural language conversation capabilities powered by ChatGPT into your Redash dashboard. Although the plugin is still a work in progress, it currently provides functionality for engaging in conversational queries with ChatGPT directly within the Redash interface.


## Requirements

This document is being written on an Ubuntu 20.04 desktop, so the instructions may need some adjustment on other distributions (etc).

Ubuntu 20.04 uses Python 3.8, so that's the version of Python we'll be using (where it's needed).

# Set up the prerequisites

## Install needed packages

```
$ sudo apt -y install docker.io docker-buildx docker-compose-v2
$ sudo apt -y install build-essential curl docker-compose pwgen python3-venv xvfb
```

## Add your user to the "docker" group

```
$ sudo usermod -aG docker $USER
```

## Install Node Version Manager

```
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
```

Now log out of your desktop, then back in again, for the group change to become effective and nvm to be available


## Install NodeJS version 16

Yes, it's End Of Life.  But we need to use version 16 for now until we've updated some other stuff.

```
$ nvm install --lts 16
$ nvm alias default 16
$ nvm use 16
```

Confirm version 16 of NodeJS is active:

```
$ nvm list
```

## Install Yarn 1.x

```
$ npm install --global yarn@1.22.19
```

## Clone the Redash source code and install the NodeJS dependencies

```
$ git clone https://github.com/getredash/redash
$ cd redash
$ yarn
```

## Generate your local environment variables file

Generate the `.env` file containing (required) environment variables, suitable for development builds:

```
$ make env
```
* Inside your .env file add your openai api key, with the name indicated below

**Get your free openai key** - https://platform.openai.com/

``` 
  OPENAI_API_KEY=*****************************************
```

# Compile and build

Redash uses [GNU Make](https://www.gnu.org/software/make/) to run things, so if you're not sure about something it's often a good idea to take a look over the [Makefile](https://github.com/getredash/redash/blob/master/Makefile) which can help. :smile:

# Plug-in the add-on

1. Copy the `chat` folder entirely `client/app/components/chat` to the corresponding place in redash's `client/app/components` folder
2. Copy the `chat.py` file entirely `redash/handlers/chat.py` to the corresponding place in redash's `redash/handlers` folder
3. copy the `chat.js` file entierly `client/app/service/chat.js` to  the corresponding palce in redash's `client/app/services` folder
4. Replace the `api.py` file entirely `redash/handlers/api.py` with the corrosponsing file in redash's `redash/handlers/api.py` file
5. Replace the `index.js` file entierly `client/app/components/ApplicationArea/ApplicationLayout/index.jsx` with the corresponding fine in redash.
## Build the Redash front end

```
$ make build
```

## Build local Redash Docker image

```
$ make compose_build
```

On my desktop (Ryzen 5600X) that took about 12 minutes to complete the first
time.  After that though, it's much faster at about a minute and a half each time.

# Start Redash locally, using the docker images you just built

```
$ make create_database
$ make up
```

The Redash web interface should also be available at http://localhost:5001, ready to be configured:



Once you've finished confirming everything works the way you want, then shut down the containers with:

```
$ make down
```