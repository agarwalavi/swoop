dataSource {
  pooled = true
  dbCreate = "update"
  url = "jdbc:mysql://localhost/swoop"
  driverClassName = "com.mysql.jdbc.Driver"
  username = "swoop"
  password = "swoop"
}
hibernate {
  cache.use_second_level_cache = true
  cache.use_query_cache = true
  cache.provider_class = 'com.opensymphony.oscache.hibernate.OSCacheProvider'
}
// environment specific settings
environments {
  newdata {
    dataSource {
      dbCreate = "create-drop" // one of 'create', 'create-drop','update'
      url = "jdbc:mysql://localhost/swoop"
      dialect = 'org.hibernate.dialect.MySQL5InnoDBDialect'
    }
  }
  development {
    dataSource {
      dbCreate = "update" // one of 'create', 'create-drop','update'
      url = "jdbc:mysql://localhost/swoop"
      dialect = 'org.hibernate.dialect.MySQL5InnoDBDialect'
    }
  }
  test {
    dataSource {
      dbCreate = "update"
      jndiName = "java:comp/env/jdbc/swoopDS"
      dialect = 'org.hibernate.dialect.MySQL5InnoDBDialect'
    }
  }
  production {
    dataSource {
      dbCreate = "update"
      jndiName = "java:comp/env/jdbc/swoopDS"
      dialect = 'org.hibernate.dialect.MySQL5InnoDBDialect'
    }
  }
}