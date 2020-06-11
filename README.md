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

---

### Requests on courses

For the moment, no auth required for the following requests

**GET /api/v1/courses.json**

view all courses, with category, instructor and sessions

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

view a specified course, with category, instructor and sessions

**GET /api/v1/courses/:id/sessions.json**

view the list of sessions for specified course, same info as in as sessions index

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

---

### Requests on courses

For the moment, no auth required for the following requests

**GET /api/v1/sessions.json**

view all sessions on all courses, with availability info

**POST /api/v1/sessions.json**

create a new session

data-form body

```
{
	"session":{
  "course_id": "n",
	"room_id":"m",
	"session_date": "20200623" <= Can take this format or any other comment date format string
	"session_time": "10:30:00" <= so far we only knows it takes this format of string
}}
```

**The `session_time` in response comes with a date, which is quite early, the Front will need to parse only the hours/minutes/second part from this "time" object**s

**GET /api/v1/sessions/:id.json**

view specified session, with availability info

**PATCH or PUT /api/v1/sessions/:id.json**

same body as post

**DELETE /api/v1/sessions/:id.json**

delete specified session
