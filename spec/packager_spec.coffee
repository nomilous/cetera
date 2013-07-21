### UUID 9f27c610-f222-11e2-a21d-cde7396cabc2 ###

require('nez').realize 'Packager', (Packager, test, context, DevelopmentCache) -> 

    context 'mount()', (it) ->

        it 'requires conf.app as connect based app instance', (done) ->

            try
                (new Packager).mount()
            catch error
                error.should.match /requires conf.app as express app instance/
                test done

        it 'requires a conf.name as package name', (done) -> 

            try
                (new Packager).mount app: get: ->
            catch error
                error.should.match /requires conf.name as package name/
                test done

        it 'requires conf.src as path to package scripts', (done) -> 

            try
                (new Packager).mount
                    app: get: ->
                    name: 'PACKAGENAME'
            catch error
                error.should.match /requires conf.src as path to package scripts/
                test done

        it 'defaults to development environment', (done) -> 

            DevelopmentCache.prototype.route = -> test done

            (new Packager).mount
                src: __dirname + '../lib'
                name: 'PACKAGENAME'
                scripts: [
                    'directory/module.js'
                    'main.js'
                ]
                app: get: (path, cb) -> 