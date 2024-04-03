# General 

This is a REST API app for managing courses schedule.

# API

App run on https://pomodorizer-f6ab6d5f16aa.herokuapp.com
No auth so far, single user.  

## Endpoints

### GET /courses

Returns a list of all courses.

Responses:

- `200 OK` on success

### GET /courses/{id}

Returns a specific course.

Parameters:

- `id` (path, required) - ID of the course

Responses:

- `200 OK` on success
- `404 Not Found` if the course does not exist

### POST /courses

Creates a new course.

Parameters:

- `name` (body, required, uniq) - Name of the course
- `url` (body, required, uniq) - URL of the course
- `description` (body, optional) - Description of the course
- `duration` (body, required) - Duration of the course
- `start_date` (body, required) - Start date of the course
- `exipre_date` (body, optional) - Expire date of the course'
- `priority` (body, required, uniq) - Priority of the course

Responses:

- `200 OK` on success
- `422 Bad Request` if the request body is invalid.
  - Response format: `{ "errors": { "field_name": ["error message"] } }` 


### PUT /courses/{id}

Updates a specific course.

Parameters:

- `id` (path, required) - ID of the course
- `name` (body, optional, uniq) - Name of the course
- `url` (body, optional, uniq) - URL of the course
- `description` (body, optional) - Description of the course
- `duration` (body, optional) - Duration of the course
- `start_date` (body, optional) - Start date of the course
- `exipre_date` (body, optional) - Expire date of the course'
- `priority` (body, optional, uniq) - Priority of the course

Responses:

- `200 OK` on success
- `422 Bad Request` if the request body is invalid
    - Response format: `{ "errors": { "field_name": ["error message"] } }`
- `404 Not Found` if the course does not exist

### DELETE /courses/{id}

Deletes a specific course.

Parameters:

- `id` (path, required) - ID of the course

Responses:

- `200 OK` on success
- `404 Not Found` if the course does not exist