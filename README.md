cetera
======

effortlessness, clientside, requirejs, package, modules

### version 0.0.9 (high alpha)


usage
-----

```coffee

Packager = require('cetera').Packager
packager = new Packager

app = express()

script_tags = packager.mount

    #
    # config.app as express app instance
    # 
    # - uses app.get() to define routes
    # 

    app: app

    #
    # config.name as name of package
    #
    # - results in script routes as /packagename/**/*.js for the browser to access
    # 

    name: 'packagename'

    #
    # config.src as source directory for the js scripts
    #

    src: __dirname + '/lib/client'

    #
    # scripts as array of scripts to serve, 
    # path relative to 'src' as specified above
    # 

    scripts: [
      'main.js'
      'submodule1/main.js'          
      'submodule2/et.js'
      'submodule2/cetera.js'
    ]


app.get '/index', (req, res) -> 

    res.render 'index', 

        title: 'www.newswords.org'
        script_tags: script_tags


```
```html
<html>
    <head>
        <%= script_tags %>
    </head>
    ...

```

Todo
----

* Handle missing script file
* Production to bundle all

