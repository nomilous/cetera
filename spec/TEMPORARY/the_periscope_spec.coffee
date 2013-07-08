
        #
        # SUBMARINE TEST
        # ==============
        #

require('nez').realize 'submarine test', (can, test, ThePeriscope, should) -> 

    # before.all (done) -> 

    #     console.log 'before all'
    #     done()

    # before.each (done) -> 

    #     console.log 'before each'
    #     done()


    can 'go deeper', (And) -> 

        And 'even deeper', (to) -> 

            to 'any depth', (done) ->

                test done


    can 'peek topside', (done) -> 

        # periscope = new ThePeriscope() 


        # #
        # # 1. Create expectations
        # #

        # periscope.must receive

        #     riseToTheSurface: (distance) ->

        #         distance.should.be.an.instanceof Number
        #         return true

        #     openTheEye: ->  

        #         return true


        # #
        # # 2. Perform action that should meet the expectations
        # #

        # periscope.peekTopside()


        #
        # 3. Evaluate extent of success
        #

        test done


        #
        # 4. Watch this very beautiful video 
        # 
        #    http://vimeo.com/68238929
        # 

