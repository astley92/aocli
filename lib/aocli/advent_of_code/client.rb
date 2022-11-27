require("faraday")

module Aocli
  module AdventOfCode

    Response = Struct.new(:status, :should_retry, :body, keyword_init: true) do
      def should_retry?
        self.should_retry
      end

      def ok?
        status == :ok
      end
    end

    class Client
      attr_reader :conn
      def initialize
        @conn = initialise_conn_object
      end

      def get_problem_description(year:, day:)
        res = conn.get("/#{year}/day/#{day}")
        case res.status
        when 200
          Response.new(status: :ok, body: res.body, should_retry: false)
        when 404
          Response.new(
            status: :not_found,
            body: res.body,
            should_retry: res.body.include?("Please don't repeatedly request this endpoint before it unlocks!"),
          )
        else
          Response.new(
            status: :unknown,
            body: res.body,
            should_retry: false,
          )
        end
      end

      private

      def initialise_conn_object
        Faraday.new(
          url: "https://adventofcode.com/",
          headers: {'Cookie' => cookie },
        )
      end
    end
  end
end
