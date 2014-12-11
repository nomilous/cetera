path = require 'path'
fs = require 'fs'
uglify = require 'uglify-js'
md5 = require 'MD5'
moment = require 'moment'
require 'moment-timezone'

cache = {}

module.exports = class ProductionCache

    route: (conf) ->

        app     = conf.app
        scripts = conf.scripts
        src     = conf.src
        name    = conf.name
        cache_seconds = conf.cache_seconds || 86400
        version = conf.version || '0.0.0'

        cache_control_file = __dirname + "/.#{name.cache_control}"

        concat_script_name = "/#{name}-#{version}.min.js"

        tag = """
        <script src='#{concat_script_name}', type='text/javascript'></script>
        """

        concat_script = uglify.minify (

            for script in scripts

                src + '/' + script

        )

        cache_control = undefined

        try cache_control = JSON.parse fs.readFileSync(cache_control_file).toString()

        if cache_control?

            current_checksum = md5 concat_script.code

            if cache_control.md5 != current_checksum

                cache_control['Last-Modified'] = moment().tz('GMT').format 'ddd, DD MMM YYYY hh:mm:ss GMT'
                cache_control.md5 = current_checksum

        else

            cache_control = {}
            cache_control['Last-Modified'] = moment().tz('GMT').format 'ddd, DD MMM YYYY hh:mm:ss GMT'
            cache_control.md5 = md5 concat_script.code

        try fs.writeFileSync cache_control_file, JSON.stringify cache_control


        app.head concat_script_name, (req, res) ->

            res.header 

                'Content-Type': 'text/javascript'

                'Content-Length': concat_script.code.length

                'Cache-Control': "max-age=#{cache_seconds}, must-revalidate"

                'Expires': moment( Date.now() + cache_seconds * 1000 ).tz('GMT').format 'ddd, DD MMM YYYY hh:mm:ss GMT'

                'Last-Modified': cache_control['Last-Modified']

            res.send ''


        app.get concat_script_name, (req, res) ->

            res.header 

                'Content-Type': 'text/javascript'

                'Content-Length': concat_script.code.length

                'Cache-Control': "max-age=#{cache_seconds}, must-revalidate"

                'Expires': moment( Date.now() + cache_seconds * 1000 ).tz('GMT').format 'ddd, DD MMM YYYY hh:mm:ss GMT'

                'Last-Modified': cache_control['Last-Modified']


            res.send concat_script.code

        return tag
