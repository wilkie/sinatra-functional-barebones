require_relative '../test_helper'
require_relative '../../models/user'

describe User do
  include TestHelper

  describe "name" do
    it "must not be empty" do
      u = Fabricate.build(:user, :name => nil)
      refute u.save, "We saved a blank name."
    end
  end
end
