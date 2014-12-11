cetera
======

effortlessness, clientside, requirejs, package, modules

### version 0.0.11 (high alpha)


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

    #
    # When NODE_ENV is set to production all scripts are concatinated and minified,
    # and published with a version number and cache controls in the headed
    #
                                # 
    cache_seconds: 31536000     # how long should proxies and clients cache the script file
                                # defaults to one day
                                #
    version: 'n.n.n'            # changing the version will cause a refresh on the proxies
                                # and clients no matter how long the cache_seconds
                                # defaults to 0.0.0
                                # 


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

