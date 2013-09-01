title: 'User Stories'
uuid:  'fry day, satay day, run day'

realize: (requirement) -> 

    before each: (done) -> 

        @before_each_REQUIREMENT = 1
        done()

    after all: (done) -> 

        @after_all_REQUIREMENT = 1
        done()

    console.log 'walking story'

    #
    # the exact shape and size of this is still a tad 'blurred of design' 
    #

    requirement 'A Requirement',

        as: 'A Role'
        to: 'Do a Thing'

        (need) -> 

            console.log 'walking need'

            need 'A Feature', (spec) -> 

                #
                # link to all specs that determine the
                # functingnality of this feature
                #
                spec.link directory: './spec/TEMPORARY'

