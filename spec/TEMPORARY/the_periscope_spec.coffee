title: 'submarine test'
uuid:  '63e2d6b0-f242-11e2-85ef-03366e5fcf9a'

#
# TEMPORARY
# 
# ./objective
# ./node_modules/nez/bin/realize -c spec/TEMPORARY/the_periscope_spec.coffee
#


realize: (it, ThePeriscope, should ) -> 

    before each: (done) ->
        
        @periscope = new ThePeriscope
        done()

    it 'can peek topside', (done) -> 



        #
        # 1. Create expectations
        # 

        @periscope.should.eql fails: 'this'

                    #
                    # throws [AssertionError]
                    # 
                    # TODO: fix 'it still waited for timeout' 
                    #


        # console.log @periscope
        # @periscope.must receive

        #     riseToTheSurface: (distance) ->

        #         distance.should.be.an.instanceof Number
        #         return true

        #     openTheEye: ->  

        #         return true


        #
        # 2. Perform action that should meet the expectations
        #

        #@periscope.peekTopside()


        #
        # 3. Evaluate extent of success
        #

        done()

    

        #
        # 4. Watch this very beautiful video 
        # 
        #    http://vimeo.com/68238929
        # 


