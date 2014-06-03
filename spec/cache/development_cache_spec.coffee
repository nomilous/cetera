ipso = require 'ipso'

describe 'DevelopmentCache', -># (DevelopmentCache, test, it, should) -> 

    it 'defines route()', ipso (done, DevelopmentCache) ->

        (new DevelopmentCache).route.should.be.an.instanceof Function
        done()

            
    it 'assigns routes for specified scripts if app defines get()', ipso (done, DevelopmentCache) -> 

        paths = []

        (new DevelopmentCache).route
            src: __dirname + '../lib'
            name: 'PACKAGENAME'
            scripts: [
                'directory/module.js'
                'main.js'
            ]
            app: get: (path, cb) -> 
                paths.push path

        paths[0].should.equal '/PACKAGENAME/directory/module.js'
        paths[1].should.equal '/PACKAGENAME/main.js'
        done()


