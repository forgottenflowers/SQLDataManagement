begin transaction

       update alias
              set alias.Environment = 'TestEnvironmentPath'
              output inserted.*
              from DataEnvironmentTable alias
              where alias.Id = 1234

commit transaction
