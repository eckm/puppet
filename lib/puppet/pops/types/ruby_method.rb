module Puppet::Pops
module Types
  class RubyMethod < Annotation
    # Register the Annotation type. This is the type that all custom Annotations will inherit from.
    def self.register_ptype(loader, ir)
      @type = Pcore::create_object_type(loader, ir, self, 'RubyMethod', 'Annotation',
        'body' => PStringType::DEFAULT,
        'parameters' => {
          KEY_TYPE => POptionalType.new(PStringType::NON_EMPTY),
          KEY_VALUE => nil
        }
      )
    end

    def self.from_hash(i12n)
      from_asserted_hash(Types::TypeAsserter.assert_instance_of('RubyMethod initializer', _ptype.i12n_type, i12n))
    end

    def self.from_asserted_hash(i12n_hash)
      new(i12n_hash['body'], i12n_hash['parameters'])
    end

    attr_reader :body, :parameters

    def initialize(body, parameters = nil)
      @body = body
      @parameters = parameters
    end
  end
end
end
