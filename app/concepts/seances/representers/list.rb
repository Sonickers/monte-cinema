module Seances
  module Representers
    class List
      attr_reader :seances

      def initialize(seances)
        @seances = seances
      end

      def basic
        seances.map do |seance|
          Single.new(seance).basic
        end
      end
    end
  end
end
