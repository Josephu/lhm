#
#  Copyright (c) 2011, SoundCloud Ltd., Rany Keddo, Tobias Bielohlawek, Tobias
#  Schmidt
#

require File.expand_path(File.dirname(__FILE__)) + '/integration_helper'

require 'lhm'
require 'lhm/table'
require 'lhm/migration'

describe Lhm::Chunker do
  include IntegrationHelper

  before(:each) { connect! }

  describe "copying" do
    before(:each) do
      @origin = table_create(:origin)
      @destination = table_create(:destination)
      @migration = Lhm::Migration.new(@origin, @destination)
    end

    it "should copy 23 rows from origin to destination" do
      23.times { |n| execute("insert into origin set common = '#{ n }'") }
      Lhm::Chunker.new(@migration, limit = 23, connection).run
      count_all(@destination.name).must_equal(23)
    end
  end
end

