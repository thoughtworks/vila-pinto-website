require 'spec_helper'

describe Project do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :url }
  it { should allow_value('example_url').for :url }
  it { should_not allow_value('example_url part2').for :url }
  it { should validate_numericality_of :frequency_value }
  it { should validate_numericality_of :meals_quantity_value }
  it { should validate_numericality_of :available_spots }
  it { should_not allow_value(0).for :frequency_value }
  it { should_not allow_value(0).for :meals_quantity_value }
  it { should_not allow_value(0).for :available_spots }
  it { should allow_value(1).for :frequency_value }
  it { should allow_value(1).for :meals_quantity_value }
  it { should allow_value(1).for :available_spots }
  it { should allow_value(99).for :frequency_value }
  it { should allow_value(99999).for :meals_quantity_value }
  it { should allow_value(9999).for :available_spots }
  it { should_not allow_value(100).for :frequency_value }
  it { should_not allow_value(100000).for :meals_quantity_value }
  it { should_not allow_value(10000).for :available_spots }
  it { should ensure_inclusion_of(:category).in_array([:children_and_teenagers, :community]) }
  it { should ensure_inclusion_of(:frequency_unit).in_array([:week, :month]) }
  it { should ensure_inclusion_of(:meals_quantity_unit).in_array([:day, :month]) }

end
