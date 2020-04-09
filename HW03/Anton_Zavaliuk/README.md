Hi there. My project is small implementation of system of checking, with database based on PostGreSQL.

Why? Because why not?)) It's experience, and it is useful in such projects.

Now, very fast tutorial:

FILES:
    
    app.rb - main application
    lib/mentor.rb - mentor class
    lib/student.rb - student class
    lib/postgres/api.rb - API to work with PostGres

Why in API is much more possibilities to work with classes, and I'm using only few of they --> because on 01:24 AM on Thursday, I've understood that I couldn't afford myself writing bigger program, that u can see now.

Way of work:

1. You can add some mentors or students, which are automaticly pushing to database.
2. When student is submitting his homework - observer takes it and pushes (like a log) some info in database.

I understand, that you can not run program on your local computer, so I'm giving you some screenshots below.

https://pasteboard.co/J1R1wsm.png

https://pasteboard.co/J1R220t.png

https://pasteboard.co/J1R2kkr.png

https://pasteboard.co/J1R2Qwg.png

Have a nice day!

Best wishes, Anton. 

