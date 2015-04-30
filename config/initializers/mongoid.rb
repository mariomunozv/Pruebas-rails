# http://stackoverflow.com/questions/18646223/ruby-model-output-id-as-object-oid
module BSON
  class ObjectId
    def to_json(*args)
      to_s.to_json
    end

    def as_json(*args)
      to_s.as_json
    end
  end
end