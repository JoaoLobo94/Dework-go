-- name: GetCompany :one
SELECT * FROM companies
WHERE id = $1 LIMIT 1;

-- name: ListCompanies :many
SELECT * FROM companies
ORDER BY id;

-- name: CreateCompany :one
INSERT INTO companies (
  name, github, balance, "privateKey"
) VALUES (
  $1, $2, $3, $4
)
RETURNING *;

-- name: UpdateCompany :exec
UPDATE companies 
SET name= $2, github= $3, balance= $4, "privateKey"= $5
WHERE id = $1;

-- name: DeleteCompany :exec
DELETE FROM companies;
