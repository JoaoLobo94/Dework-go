
-- name: GetUserContributions :one
SELECT * FROM userContributions
WHERE id = $1 LIMIT 1;

-- name: ListUserContributions :many
SELECT * FROM userContributions
ORDER BY id;

-- name: CreateUserContributions :one
INSERT INTO userContributions (
  contributionId, companyId
) VALUES (
  $1, $2
)
RETURNING *;

-- name: UpdateUserContributions :exec
UPDATE userContributions 
SET contributionId= $2, companyId= $3
WHERE id = $1;

-- name: DeleteUserContributions :exec
DELETE FROM userContributions;