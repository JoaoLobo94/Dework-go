-- name: GetUsers :one
SELECT * FROM users
WHERE id = $1 LIMIT 1;

-- name: ListUsers :many
SELECT * FROM users
ORDER BY id;

-- name: CreateUser :one
INSERT INTO users (
  name, "publicKey", job
) VALUES (
  $1, $2, $3
)
RETURNING *;

-- name: UpdateUser :exec
UPDATE users 
SET name= $2, "publicKey"= $3, job= $4
WHERE id = $1;

-- name: DeleteUsers :exec
DELETE FROM users;