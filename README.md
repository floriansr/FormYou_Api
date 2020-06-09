### Endpoints

prod base url: https://form-you-back.herokuapp.com

##### Public, without token

**POST /users.json** => sign up

```
{"user": {
	"email": "something@yopmail.com",
	"password": "111111",
	"username": "something"
}}
```

can get a token if success

**POST /users/sign_in.json** => sign in
```
{"user": {
	"email": "something@yopmail.com",
	"password": "111111"
}}
```

can get a token if success

##### Private, token mandatory

**GET /api/v1/users/id.json** => view full profile of any user

**GET /api/v1/users/id.json** => view full profile of all users

**PATCH /api/v1/users/id.json** => update profile of any user

**DELETE /api/v1/users/id.json** => delete any user

**DELETE /users.json** => sign self out

* * *
### Requests on courses

For the moment, no auth required for the following requests

**GET /api/v1/courses.json**

view all courses

**POST /api/v1/courses.json**   

create a new course

data-form body
```
{"course":{
  "title": "something", <= need to be unique, case insensitive
	"instructor_id":"n" <= Id needs to be in quotes
}}
```

**GET /api/v1/courses/:id.json**

view a specified course

**PATCH or PUT /api/v1/courses/:id.json**

update a specified course

data-form body
```
{"course":{
  "title": "something",
	"instructor_id":"n"
}}
```

**DELETE /api/v1/courses/:id.json**

delete a specified course
