### back-end for trivia quiz
 
### Usage
    $ git clone https://github.com/AlexPurhalo/quiz-back.git
    $ cd quiz-back
    $ bundle install
    $ sequel -m db/migrations/ sqlite://db/database.db
    $ foreman start
    
### Testing
    $ sequel -m db/migrations/ sqlite://db/test.db
    $ rspec
    

#### CI (Continuous Integration)
[link to travis](https://travis-ci.org/AlexPurhalo/quiz-back)
    