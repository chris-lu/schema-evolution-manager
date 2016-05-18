module SchemaEvolutionManager

  class CommandError < Exception

    attr_reader :command, :status, :output

    def initialize(command, status, output)
      @command = Preconditions.assert_class(command, String)
      @status = status.to_i
      @output = Preconditions.assert_class(output, String)
    end

  end

end
