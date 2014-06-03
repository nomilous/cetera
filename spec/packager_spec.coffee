{ipso} = require 'ipso'

describe 'Packager', ->

    context 'mount()', ->

        it 'requires conf.app as connect based app instance', ipso (done, Packager) ->

            try
                (new Packager).mount()
            catch error
                error.should.match /requires conf.app as express app instance/
                done()

        it 'requires a conf.name as package name', ipso (done, Packager) -> 

            try
                (new Packager).mount app: get: ->
            catch error
                error.should.match /requires conf.name as package name/
                done()

        it 'requires conf.src as path to package scripts', ipso (done, Packager) -> 

            try
                (new Packager).mount
                    app: get: ->
                    name: 'PACKAGENAME'
            catch error
                error.should.match /requires conf.src as path to package scripts/
                done()

        it 'defaults to development environment', ipso (done, DevelopmentCache, Packager) -> 

            DevelopmentCache.prototype.route = -> done()

            (new Packager).mount
                src: __dirname + '../lib'
                name: 'PACKAGENAME'
                scripts: [
                    'directory/module.js'
                    'main.js'
                ]
                app: get: (path, cb) ->
