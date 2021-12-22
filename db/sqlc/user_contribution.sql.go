// Code generated by sqlc. DO NOT EDIT.
// source: user_contribution.sql

package db

import (
	"context"
)

const createUserContributions = `-- name: CreateUserContributions :one
INSERT INTO userContributions (
  contributionId, companyId
) VALUES (
  $1, $2
)
RETURNING id, companyid, contributionid
`

type CreateUserContributionsParams struct {
	Contributionid int32
	Companyid      int32
}

func (q *Queries) CreateUserContributions(ctx context.Context, arg CreateUserContributionsParams) (Usercontribution, error) {
	row := q.db.QueryRowContext(ctx, createUserContributions, arg.Contributionid, arg.Companyid)
	var i Usercontribution
	err := row.Scan(&i.ID, &i.Companyid, &i.Contributionid)
	return i, err
}

const deleteUserContributions = `-- name: DeleteUserContributions :exec
DELETE FROM userContributions
`

func (q *Queries) DeleteUserContributions(ctx context.Context) error {
	_, err := q.db.ExecContext(ctx, deleteUserContributions)
	return err
}

const getUserContributions = `-- name: GetUserContributions :one
SELECT id, companyid, contributionid FROM userContributions
WHERE id = $1 LIMIT 1
`

func (q *Queries) GetUserContributions(ctx context.Context, id int32) (Usercontribution, error) {
	row := q.db.QueryRowContext(ctx, getUserContributions, id)
	var i Usercontribution
	err := row.Scan(&i.ID, &i.Companyid, &i.Contributionid)
	return i, err
}

const listUserContributions = `-- name: ListUserContributions :many
SELECT id, companyid, contributionid FROM userContributions
ORDER BY id
`

func (q *Queries) ListUserContributions(ctx context.Context) ([]Usercontribution, error) {
	rows, err := q.db.QueryContext(ctx, listUserContributions)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var items []Usercontribution
	for rows.Next() {
		var i Usercontribution
		if err := rows.Scan(&i.ID, &i.Companyid, &i.Contributionid); err != nil {
			return nil, err
		}
		items = append(items, i)
	}
	if err := rows.Close(); err != nil {
		return nil, err
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return items, nil
}

const updateUserContributions = `-- name: UpdateUserContributions :exec
UPDATE userContributions 
SET contributionId= $2, companyId= $3
WHERE id = $1
`

type UpdateUserContributionsParams struct {
	ID             int32
	Contributionid int32
	Companyid      int32
}

func (q *Queries) UpdateUserContributions(ctx context.Context, arg UpdateUserContributionsParams) error {
	_, err := q.db.ExecContext(ctx, updateUserContributions, arg.ID, arg.Contributionid, arg.Companyid)
	return err
}