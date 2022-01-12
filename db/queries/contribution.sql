-- name: GetContribution :one
SELECT * FROM contributions
WHERE id = $1 LIMIT 1;

-- name: ListContributions :many
SELECT * FROM contributions
ORDER BY id;

-- name: CreateContribution :one
INSERT INTO contributions (
  "voteBalance", "pullRequest", type, merged, "storyId", balance
) VALUES (
  $1, $2, $3, $4, $5, $6
)
RETURNING *;

-- name: UpdateContribution :exec
UPDATE contributions 
SET "voteBalance"= $2, "pullRequest"= $3, type= $4, merged= $5, "storyId"= $6, balance= $7
WHERE id = $1;

-- name: DeleteContribution :exec
DELETE FROM contributions;
