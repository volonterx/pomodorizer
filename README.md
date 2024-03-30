# General 

This is a REST API app for managing courses schedule.

# API

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

- `name` (body, required) - Name of the course
- `url` (body, required) - URL of the course
- `duration` (body, required) - Duration of the course
- `start_date` (body, required) - Start date of the course
- `priority` (body, required) - Priority of the course

Responses:

- `200 OK` on success
- `400 Bad Request` if the request body is invalid

### PUT /courses/{id}

Updates a specific course.

Parameters:

- `id` (path, required) - ID of the course
- `name` (body, optional) - Name of the course
- `url` (body, optional) - URL of the course
- `duration` (body, optional) - Duration of the course
- `start_date` (body, optional) - Start date of the course
- `priority` (body, optional) - Priority of the course

Responses:

- `200 OK` on success
- `400 Bad Request` if the request body is invalid
- `404 Not Found` if the course does not exist

### DELETE /courses/{id}

Deletes a specific course.

Parameters:

- `id` (path, required) - ID of the course

Responses:

- `200 OK` on success
- `404 Not Found` if the course does not exist