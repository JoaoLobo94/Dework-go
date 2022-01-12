
-- name: GetUserContributions :one
SELECT * FROM userContributions
WHERE id = $1 LIMIT 1;

-- name: ListUserContributions :many
SELECT * FROM userContributions
ORDER BY id;

-- name: CreateUserContributions :one
INSERT INTO userContributions (
  "contributionId", "companyId", balance, "voteBalance"
) VALUES (
  $1, $2, $3, $4
)
RETURNING *;

-- name: UpdateUserContributions :exec
UPDATE userContributions 
SET "contributionId"= $2, "companyId"= $3, balance= $3, "voteBalance"= $4
WHERE id = $1;

-- name: DeleteUserContributions :exec
DELETE FROM userContributions;