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