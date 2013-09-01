title: 'another spec'
uuid: '00000000-0000-0000-0000-000000000001'
timeout: 100

# 
# ./objective
#


realize: (context) -> 

    after all: (done) -> 

        console.log @
        done()

    console.log WALK: 'another spec'
    
    context 'these take longer to timeout', timeout: 1000, (it) -> 

        it 'does something A1', (done) -> 

            console.log running: 'does something A1'
            @A1 = 1
            #done()

        it 'does something A2', (done) -> 

            console.log running: 'does something A2'
            @A2 = 1
            #done()


    context 'context B', (it) -> 

        it 'does something B1', (done) -> 

            console.log running: 'does something B1'
            @B1 = 1
            #done()

        it 'does something B2', (done) -> 

            console.log running: 'does something B2'
            @B2 = 1
            #done()
