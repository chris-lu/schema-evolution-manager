module SchemaEvolutionManager

  class ScriptError < Exception

    attr_reader :filename, :error

    def initialize(db, filename, error)
      @db = Preconditions.assert_class(db, Db)
      @filename = Preconditions.assert_class(filename, String)
      @error = Preconditions.assert_class(error, CommandError)
    end

    def dml
      sql_command = "insert into %s.%s (filename) values ('%s')" % [Db.schema_name, Scripts::SCRIPTS, filename]
      "psql --command \"%s\" %s" % [sql_command, @db.url]
    end

  end

end
