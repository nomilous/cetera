### REALIZER 63e2d6b0-f242-11e2-85ef-03366e5fcf9a ###

require('nez').realize 'submarine test', (can, test, ThePeriscope, should) -> 

                                                        #
                                                        # TODO
                                                        # ----
                                                        # 
                                                        # * camelcase means inject from local lib, 
                                                        #   search for module filename the_periscope
                                                        # 
                                                        # * noncamel injects node_module
                                                        #   

        before each: => 

            # 
            # TODO
            # ----
            # 
            # * alternative hook declaration
            # * optional async (done)
            # * timeout on async
            # 

            @periscope = new ThePeriscope()


        after 

            each: (done) -> 

                console.log 'AFTER EACH'
                done()

            all: (done) -> 

                console.log 'AFTER ALL'
                done()


        can 'peek topside', (done) -> 

            #
            # 1. Create expectations
            #

            # @periscope.must_receive
            @periscope.must receive

                riseToTheSurface: (distance) ->

                    distance.should.be.an.instanceof Number
                    return true

                openTheEye: ->  

                    return true


            #
            # 2. Perform action that should meet the expectations
            #

            @periscope.peekTopside()


            #
            # 3. Evaluate extent of success
            #

            test done

        

            #
            # 4. Watch this very beautiful video 
            # 
            #    http://vimeo.com/68238929
            # 

