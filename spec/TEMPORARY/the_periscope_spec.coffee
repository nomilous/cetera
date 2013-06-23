        
        #
        # SUBMARINE TEST
        # ==============
        #

require('nez').realize "how're things topside?", 

    secret: '∫'
    
    uplink: 
        transport: 'https'
        address: 'localhost'
        port: 10001

    (it, tests, ThePeriscope, should) ->


        it 'can sneak a peek', (ok) -> 


            periscope = new ThePeriscope()


            #
            # 1. Create expectations
            #

            periscope.must receive

                riseToTheSurface: (distance) ->

                    distance.should.be.an.instanceof Number
                    return true

                openTheEye: ->  

                    return true


            #
            # 2. Perform action that should meet the expectations
            #

            periscope.peekTopside()


            #
            # 3. Evaluate extent of success
            #

            tests ok


            #
            # 4. Watch this very beautiful video 
            # 
            #    http://vimeo.com/68238929
            # 
