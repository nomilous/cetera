
        #
        # SUBMARINE TEST
        # ==============
        #

require('nez').realize 'submarine test', 

    beforeAll: (done) -> 

        console.log 'BEFORE ALL'
        done()

    beforeEach: (done) -> 

        console.log 'BEFORE EACH'
        done()

    afterEach: (done) -> 

        console.log 'AFTER EACH'
        done()

    afterAll: (done) -> 

        console.log 'AFTER ALL'
        done()

    (can, test, ThePeriscope, should) -> 

        can 'run tests in sequence', (done) -> 
    
        can 'peek topside', (done) -> 

            #periscope = new ThePeriscope() 


            #
            # 1. Create expectations
            #

            # periscope.must receive

            #     riseToTheSurface: (distance) ->

            #         distance.should.be.an.instanceof Number
            #         return true

            #     openTheEye: ->  

            #         return true


            #
            # 2. Perform action that should meet the expectations
            #

            #periscope.peekTopside()


            #
            # 3. Evaluate extent of success
            #

            # setTimeout (-> 

            #     #
            #     # verify flow control
            #     # 

            #     test done

            # ), 1000


            #
            # 4. Watch this very beautiful video 
            # 
            #    http://vimeo.com/68238929
            # 

