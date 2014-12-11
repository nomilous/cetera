{ipso} = require 'ipso'

describe 'Packager', ->

    context 'mount()', ->

        it 'requires conf.app as connect based app instance', 

            ipso (done, Packager) ->

                try
                    (new Packager).mount()
                catch error
                    error.should.match /requires conf.app as express app instance/
                    done()

        it 'requires a conf.name as package name', 

            ipso (done, Packager) -> 

                try
                    (new Packager).mount app: get: ->
                catch error
                    error.should.match /requires conf.name as package name/
                    done()

        it 'requires conf.src as path to package scripts', 

            ipso (done, Packager) -> 

                try
                    (new Packager).mount
                        app: get: ->
                        name: 'PACKAGENAME'
                catch error
                    error.should.match /requires conf.src as path to package scripts/
                    done()

        it 'defaults to development environment', 

            ipso (done, DevelopmentCache, Packager) -> 

                orig = DevelopmentCache.prototype.route
                DevelopmentCache.prototype.route = -> 
                    DevelopmentCache.prototype.route = orig
                    done()

                (new Packager).mount
                    src: __dirname + '../lib'
                    name: 'PACKAGENAME'
                    scripts: [
                        'directory/module.js'
                        'main.js'
                    ]
                    app: get: (path, cb) ->


        it 'can generate an array of script tags for non production mode',

            ipso (DevelopmentCache, Packager) ->


                tags = (packager = new Packager).mount
                    src: __dirname + '../lib'
                    name: 'PACKAGENAME'
                    scripts: [
                        'directory/module.js'
                        'main.js'
                    ]
                    app: get: (path, cb) ->

                console.log tags.should.equal """
                <script src='/PACKAGENAME/directory/module.js' type='text/javascript'></script>
                <script src='/PACKAGENAME/main.js' type='text/javascript'></script>

                """


        it 'generates a single script tag for prodction along with the concatenated minified scripts'



        it 'puts the app version into the production script name'



        it 'sets cache headers appropriately'
