require_relative '../test_helper'
require_relative '../../models/github_info'

describe GithubInfo do
  include TestHelper

  describe "create" do
    it "must not create without a uid" do
      github_info = GithubInfo.create
      refute github_info.save, "Created a GithubInfo without a uid"
    end
  end
end
