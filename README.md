# AIF

## Setup

```
$ make docker-up
$ make docker-build
$ make browse
```

Wordpress should be setup too, see http://aif.mydocker/wp/wp-admin

### Frontend
  Connect to node
```
$ make node
```

  Install with
```
$ ./install.sh
``` 

  And Compile with 
```
$ ./node_modules/.bin/gulp prod
```

### Backend
  Composer install should be done by install.sh script
  
  Install wordpress in web/wp with wp-cli : 
```
$ php wp-cli.phar core download --path=web/wp --version=4.7.5
$ php wp-cli.phar core install --allow-root --admin_name=admin --admin_password=admin --admin_email=a@e.com --url=http://aif.mydocker/wp --title=aif --path=web/wp
```
   Then follow easywordpressbundle documentation.
   https://github.com/ExtremeSensio/EasyWordpressBundle/tree/1.0.1

## Run tests

To be defined

## Tech stack

### Front

* Node 5.3
* Yarn
* Gulp
* Starter 
* Babel 
* Twig
* React (Search Page)

### Back

* PHP 7.0
* Mysql 5.6
* Elasticsearch 2.4

### VisualComposer
We created some custom blocks and, for the moment, we use some default one.

Youtube : use default block.
<br>
Twitter : Use a block text to copy/paste twitter embed.
