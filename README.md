## Steps to deploy Project

```sh
Clone the repository
Use Git to clone project's source code to your local machine.
$ heroku git:clone -a project_name
$ cd project_name

Deploy your changes
Make some changes to the code you just cloned deploy them to Heroku using Git.
$ git add .
$ git commit -am "make it better"
$ git push heroku master
After logging in, execute
• Heroku run bash
Now you will be entering the heroku’s console where you can execute your scripts.
Run 
$ ruby nuvi.rb
```
## Project Details
```sh
I have executed two cases in the assignment.  First case is i am running for a small volume of data 
and the second case is i am running for the entire dataset. Reason being it takes long time for the 
entire dataset to populate.
In both the cases i am returning the entire list and the length of the list.
```


