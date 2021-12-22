-- name: GetContribution :one
SELECT * FROM contributions
WHERE id = $1 LIMIT 1;

-- name: ListContributions :many
SELECT * FROM contributions
ORDER BY id;

-- name: CreateContribution :one
INSERT INTO contributions (
  value, pullRequest, type, key, merged, companyId
) VALUES (
  $1, $2, $3, $4, $5, $6
)
RETURNING *;

-- name: UpdateContribution :exec
UPDATE contributions 
SET value= $2, pullRequest= $3, type= $4, key= $5, merged= $6, companyId= $7
WHERE id = $1;

-- name: DeleteContribution :exec
DELETE FROM contributions;
