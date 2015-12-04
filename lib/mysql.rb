def self.mysqlClient(db_host,db_user,db_pass,db_name)
  $mysqlClient = Mysql2::Client.new(
    host: db_host, username: db_user, password: db_pass, database: db_name
  )
end
