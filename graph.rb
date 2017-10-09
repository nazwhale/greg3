require_relative 'analyser'
require 'gchart'

class DataObtainer

  MONTHS = [1,2,3,4,5,6,7,8,9,10,11,12]
  DAYS   = [0,1,2,3,4,5,6]

  def initialize
    @analyser = Analyser.new
  end

  def get_average_users_per_month
    all_months = []
    MONTHS.each do |month|
      month_data =  @analyser.get_mnth(month)
      mean_users = @analyser.mean_users(month_data)
      all_months << mean_users
    end
    all_months
  end

end

obtainer = DataObtainer.new
data = obtainer.get_average_users_per_month
p data

average_users_bar_chart = Gchart.new(
            :filename => 'images/average_users_bar_chart.png',
            :data => [data],
            :type => 'bar',
            :stacked => false,

            :title => "Average users per month",
            :legend => ['first data set label'],
            :legend_position => 'bottom',
            :axis_with_labels => [['x'], ['y']],
            :axis_labels => [["Jan|Feb|March|April|May|June|July|Aug|Sept|Oct|Nov|Dec"]],

            :size => '600x400',
            :max_value => 7000,
            :min_value => 0,
            :bar_colors => ['0088FF'],
            :bg => 'EFEFEF',
            )

average_users_bar_chart.file
