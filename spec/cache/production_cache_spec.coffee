### REALIZER 788435f0-f242-11e2-85ef-03366e5fcf9a ###

require('nez').realize 'ProductionCache', (ProductionCache, test, it, should) -> 

    it 'defines route()', (done) ->

        (new ProductionCache).route.should.be.an.instanceof Function
        test done

        