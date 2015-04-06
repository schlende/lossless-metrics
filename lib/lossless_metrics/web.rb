require 'erb'
require 'yaml'
require 'sinatra/base'
require 'lossless_metrics/web_helpers'
require 'lossless_metrics/activity'
require 'json'

module LosslessMetrics
  class Web < Sinatra::Base

    set :root, File.expand_path(File.dirname(__FILE__) + "/../../web")
    set :public_folder, Proc.new { "#{root}/assets" }
    set :views, Proc.new { "#{root}/views" }
    set :locales, ["#{root}/locales"]

    helpers WebHelpers

    get "/" do
      @counts = {}
      @distinct = params["activity"]["distinct"] == 'Distinct' if params["activity"] || false

      if params["activity"]
        @current_selection = params["activity"]["the_type"].split(",")

        @current_selection.each do | activity |

          @counts[activity] = ActiveRecord::Base.connection.execute("
            with activities_by_day as(select id
              , activity_type
              , actor_id
              , to_char(date_trunc('day', created_at)
              , 'YYYY-MM-DD') as date
            from activities)
            select date, activity_type, count(distinct #{@distinct ? 'actor_id' : 'id'})
            from activities_by_day
            where activity_type = '#{activity}'
            group by 1, 2
            order by date
          ")

        end
      end

      erb :the_charts
    end

    get "/type_search" do
      content_type :json
      response = []
      Activity.uniq.pluck(:activity_type).each do |type|
        response << { id: type, name: type }
      end
      response.to_json
    end
  end
end
