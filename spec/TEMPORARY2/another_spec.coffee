title: 'another spec'
uuid: '00000000-0000-0000-0000-000000000001'
timeout: 10

realize: (context) -> 

    # console.log "walking --> #{__filename}"
    console.log "walking --> another_spec.coffee"

    console.log """

        TODO: only the first boundry was walked

    """
    

    context 'context A', (it) -> 

        it 'does something A1', (done) -> 
        it 'does something A2', (done) -> 

    context 'context B', (it) -> 

        it 'does something B1', (done) -> 
        it 'does something B2', (done) -> 
