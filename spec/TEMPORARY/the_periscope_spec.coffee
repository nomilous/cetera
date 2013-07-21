### REALIZER 63e2d6b0-f242-11e2-85ef-03366e5fcf9a ###

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

            setTimeout (-> test done), 200

        can 'run hooks on phrases',

            beforeEach: (done) -> 

                console.log 'nested before each'
                done()

            afterAll: (done) -> 

                console.log 'nested after all'
                done()

            (that) -> 

                that 'are nested 1', (done) ->

                    setTimeout (-> test done), 200

                that 'are nested 2', (done) ->

                    setTimeout (-> test done), 200

        can 'timeout on missing done()', (done) -> 

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

            setTimeout (-> 

                #
                # verify flow control
                # 

                test done

            ), 200


            #
            # 4. Watch this very beautiful video 
            # 
            #    http://vimeo.com/68238929
            # 


