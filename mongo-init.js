db.createUser(
  {
    user: "root",
    pwd: "root",
    roles: [
      {
        role: "readWrite",
        db: "elixir_google_forms_dev"
      }
    ]
  }
);