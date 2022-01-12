-- name: GetStory :one
SELECT * FROM stories
WHERE id = $1 LIMIT 1;

-- name: ListStories :many
SELECT * FROM stories
ORDER BY id;

-- name: CreateStory :one
INSERT INTO stories (
  "voteBalance", "pullRequest", type, merged, "companyId", balance
) VALUES (
  $1, $2, $3, $4, $5, $6
)
RETURNING *;

-- name: UpdateStory :exec
UPDATE stories 
SET "voteBalance"= $2, "pullRequest"= $3, type= $4, merged= $5, "companyId"= $6, balance= $7
WHERE id = $1;

-- name: DeleteStory :exec
DELETE FROM stories;
