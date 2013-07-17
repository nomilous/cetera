
        #
        # SUBMARINE TEST
        # ==============
        #

require('nez').realize 'submarine test', 

    beforeAll: (done) -> 

        console.log 'before ALL'
        done()

    beforeEach: (done) -> 

        console.log 'before EACH'
        done()

    afterEach: (done) -> 

        console.log 'after EACH'
        done()

    afterAll: (done) -> 

        console.log 'after ALL'
        done()

    (can, test, ThePeriscope, should) -> 

        can 'run tests in sequence', (done) -> 

            test done

        can 'run nested hooks',

            beforeEach: (done) -> 

                console.log 'nested before each'
                done()

            (done) -> 

                test done

        can 'peek topside', (done) -> 

            test done

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

