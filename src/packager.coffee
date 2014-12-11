Development = require './cache/development_cache'
Production = require './cache/production_cache'


module.exports = class Packager

    mount: (conf = {}) ->

        unless conf.app and typeof conf.app.get == 'function'

            throw 'requires conf.app as express app instance'

        unless conf.name

            throw 'requires conf.name as package name'

        unless conf.src

            throw 'requires conf.src as path to package scripts'

        unless conf.scripts

            throw 'requires conf.scripts as list of paths relative to conf.src'

        env = process.env.NODE_ENV || process.env.ENV || 'development'

        if env != 'production'

            cache = new Production
            tags  = cache.route conf
            return tags

        else

            cache = new Development
            tags  = cache.route conf
            return tags
