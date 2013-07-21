### UUID 9301e140-f222-11e2-a21d-cde7396cabc2 ###

require('nez').realize 'ProductionCache', (ProductionCache, test, it, should) -> 

    it 'defines route()', (done) ->

        (new ProductionCache).route.should.be.an.instanceof Function
        test done

        