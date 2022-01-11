-- name: GetContribution :one
SELECT * FROM contributions
WHERE id = $1 LIMIT 1;

-- name: ListContributions :many
SELECT * FROM contributions
ORDER BY id;

-- name: CreateContribution :one
INSERT INTO contributions (
  "voteBalance", "pullRequest", type, "privateKey", merged, "storyId", balance
) VALUES (
  $1, $2, $3, $4, $5, $6, $7
)
RETURNING *;

-- name: UpdateContribution :exec
UPDATE contributions 
SET "voteBalance"= $2, "pullRequest"= $3, type= $4, "privateKey"= $5, merged= $6, "storyId"= $7, balance= $8
WHERE id = $1;

-- name: DeleteContribution :exec
DELETE FROM contributions;
