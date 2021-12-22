-- name: GetUserCompanies :one
SELECT * FROM userCompanies
WHERE id = $1 LIMIT 1;

-- name: ListUserCompanies :many
SELECT * FROM userCompanies
ORDER BY id;

-- name: CreateUserCompanies :one
INSERT INTO userCompanies (
  userId, companyId
) VALUES (
  $1, $2
)
RETURNING *;

-- name: UpdateUserCompanies :exec
UPDATE userCompanies 
SET userId= $2, companyId= $3
WHERE id = $1;

-- name: DeleteUserCompanies :exec
DELETE FROM userCompanies;