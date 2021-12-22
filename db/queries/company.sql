-- name: GetCompany :one
SELECT * FROM companies
WHERE id = $1 LIMIT 1;

-- name: ListCompanies :many
SELECT * FROM companies
ORDER BY id;

-- name: CreateCompany :one
INSERT INTO companies (
  name, github
) VALUES (
  $1, $2
)
RETURNING *;

-- name: UpdateCompany :exec
UPDATE companies 
SET name= $2, github= $3
WHERE id = $1;

-- name: DeleteCompany :exec
DELETE FROM companies;
