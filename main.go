package main

import (
	"database/sql"
	"log"
	"os"
	"github.com/joho/godotenv"
	"github.com/JoaoLobo94/dework-backend/db/sqlc"
	_ "github.com/lib/pq"
)

func main() {
	err := godotenv.Load(".env")

	if err != nil {
		log.Fatal("Error loading .env file")
	}
	var user, password, sslmode = os.Getenv("POSTGRES_USER"), os.Getenv("POSTGRES_PASSWORD"), os.Getenv("SSLMODE")
	conn, err := sql.Open("postgres", "postgresql://"+user+":"+password+"@localhost:5433/donut_db?sslmode="+sslmode)
	if err != nil {
		log.Fatal("cannot connect to db:", err)
	}
	
	db.New(conn)
}
