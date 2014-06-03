{ipso} = require 'ipso'

describe 'Cetera', ->

    it 'exports Packager', ipso (done, Cetera, Packager) ->

        Cetera.Packager.should.equal Packager
        done()
