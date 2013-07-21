### REALIZER 6bfe56d0-f242-11e2-85ef-03366e5fcf9a ###

require('nez').realize 'Cetera', (Cetera, test, it, Packager) -> 

    it 'exports Packager', (done) ->

        Cetera.Packager.should.equal Packager
        test done
