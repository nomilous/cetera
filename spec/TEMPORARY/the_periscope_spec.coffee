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

        before all: => 

            # 
            # TODO
            # ----
            # 
            # * alternative hook declaration
            # * optional async (done)
            # * timeout on async
            # * make hooks not need => to stare common scope with phrases
            # 

            console.log outer_before_all: 1
            @periscope = {}


        # before each: -> console.log before_each: 1


        after all: -> console.log outer_after_all: 1

        can 'for testing nested hooks', (nested) -> 

            before all: -> console.log inner_before_all: 1
            after all: (done) -> 

                console.log inner_after_all: 'start'

                setTimeout (->

                    console.log inner_after_all: 'finish'
                    done()

                ), 200

            nested 'nested 1', (done) -> test done
            nested 'nested 2', (done) -> test done

        can 'wait for nsted after all in preceding phrase',  (done) ->

            console.log BUG: 1

            test done

        can 'peek topside', (done) -> 

            #
            # 1. Create expectations
            #

            console.log @periscope
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

            test done

        

            #
            # 4. Watch this very beautiful video 
            # 
            #    http://vimeo.com/68238929
            # 


