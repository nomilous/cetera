### UUID 9b2884f0-f222-11e2-a21d-cde7396cabc2 ###

require('nez').realize 'Cetera', (Cetera, test, it, Packager) -> 

    it 'exports Packager', (done) ->

        Cetera.Packager.should.equal Packager
        test done
