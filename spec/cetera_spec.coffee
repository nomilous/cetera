require('nez').realize 'Cetera', (Cetera, test, it, Packager) -> 

    it 'exports Packager', (done) ->

        Cetera.Packager.should.equal Packager
        test done
