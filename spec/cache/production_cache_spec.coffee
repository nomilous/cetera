{ipso} = require 'ipso'


describe 'ProductionCache', ->

    it 'defines route()', ipso (done, ProductionCache) ->

        (new ProductionCache).route.should.be.an.instanceof Function
        done()
