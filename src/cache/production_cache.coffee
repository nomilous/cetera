path = require 'path'
fs = require 'fs'

cache = {}

module.exports = class ProductionCache

    route: (conf) ->

        app     = conf.app
        scripts = conf.scripts
        src     = conf.src
        name    = conf.name

        for script in scripts

            do (script) ->

                route = "/#{name}/#{script}"

                app.get route, (req, res) ->

                    res.header 'Content-Type': 'text/javascript'

                    if cache[route]?

                        return res.send cache[route]

                    match = req.path.match new RegExp "^\/#{name}\/(.*)"
                    file  = path.join src, match[1]

                    fs.readFile file, (err, data) ->

                        unless err?

                            cache[route] = data
                            return res.send( data )

                        res.statusCode = 404
                        res.send()



