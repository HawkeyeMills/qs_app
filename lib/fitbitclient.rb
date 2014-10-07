module Fitbitclient
  class Fitbitclient

  def upsert_metric_data(startDate, endDate, metricKey)
    Rails.logger.info("-----> startDate = #{startDate}")
    Rails.logger.info("-----> endDate = #{endDate}")
    Rails.logger.info("-----> metricKey = #{metricKey}")
    # Load the existing yml config
    config = begin
      Fitgem::Client.symbolize_keys(YAML.load(File.open("config/.fitgem.yml")))
    rescue ArgumentError => e
      puts "Could not parse YAML: #{e.message}"
      exit
    end
   
    @client = Fitgem::Client.new(config[:oauth])
    begin
      access_token = @client.reconnect(config[:oauth][:token], config[:oauth][:secret])
        @hashToIterate = @client.data_by_time_range(metricKey, {:base_date => startDate, :end_date => endDate})
        #@measurements = @client.body_measurements_on_date('today')
        #@userinfo = @client.user_info['user']
      rescue Exception => e
        puts "Error: Could not reconnect Fitgem::Client due to invalid keys in .fitgem.yml"
        exit
    end

    Upsert.batch(Metric.connection, :metrics) do |upsert|
      table_name = :metrics
      @hashToIterate.each do |key, val|
        val.each do|p|
          @dateToUpsert = p['dateTime']
          @valueToUpsert = p['value']
          Rails.logger.info "-------key = #{key}"
          @metricConfigIDs = MetricConfig.find_by fbvalue: key
          @metricConfigID = @metricConfigIDs.id
          upsert.row({:metricdate => @dateToUpsert, :metric_config_id => @metricConfigID}, :value => @valueToUpsert, :created_at => Time.now, :updated_at => Time.now)
        end
      end
    end
  end
      
  def upsert_heart_data(dt_date)
    #refactor to reuse most of this code eventually
    config = begin
    Fitgem::Client.symbolize_keys(YAML.load(File.open("config/.fitgem.yml")))
    rescue ArgumentError => e
      puts "Could not parse YAML: #{e.message}"
      exit
    end

    @client = Fitgem::Client.new(config[:oauth])
    begin
      access_token = @client.reconnect(config[:oauth][:token], config[:oauth][:secret])
      @hashToIterate = @client.heart_rate_on_date(dt_date)
    rescue Exception => e
      puts "Error: Could not reconnect Fitgem::Client due to invalid keys in .fitgem.yml"
      exit
    end
    Upsert.batch(Metric.connection, :metrics) do |upsert|
      table_name = :metrics
      @hashToIterate.each do |key, val|
        val.each do|p|
          #get rid of all the "average" in the hash
          if key == 'heart'
            Rails.logger.info "-------------------> key = #{key} and val = #{val}"
            Rails.logger.info "-------------------> p = #{p}"
            @ary_rhr = p.assoc("heartRate")
              @ary_rhr.each do |rhr|
                @valueToUpsert = rhr
              end
            @metricConfigIDs = MetricConfig.find_by metricname: 'RHR'
            @metricConfigID = @metricConfigIDs.id
            Rails.logger.info @metricConfigsID
            upsert.row({:metricdate => dt_date, :metric_config_id => @metricConfigID}, :value => @valueToUpsert, :created_at => Time.now, :updated_at => Time.now)
          end
        end
      end
    end
  end
  
  def upsert_food_data(dt_date)
      #refactor to reuse most of this code eventually
      config = begin
        Fitgem::Client.symbolize_keys(YAML.load(File.open("config/.fitgem.yml")))
      rescue ArgumentError => e
        puts "Could not parse YAML: #{e.message}"
        exit
      end

      @client = Fitgem::Client.new(config[:oauth])
      begin
        access_token = @client.reconnect(config[:oauth][:token], config[:oauth][:secret])
        @hashToIterate = @client.foods_on_date(dt_date)
      rescue Exception => e
        puts "Error: Could not reconnect Fitgem::Client due to invalid keys in .fitgem.yml"
        exit
      end
      Upsert.batch(Metric.connection, :metrics) do |upsert|
        table_name = :metrics
        @hashToIterate.each do |key, val|
        #val.each do|p|
          if key == 'summary'
            Rails.logger.info "key = #{key} and val = #{val}"
            Rails.logger.info "p = #{p}"
  
            @carbs = val["carbs"]
            @fat = val["fat"]
            @protein = val["protein"]
            @sodium = val["sodium"]
            @water = val["water"]
            
            @metricConfigIDsCarb = MetricConfig.find_by metricname: 'Carbs'
            @metricConfigIDCarb = @metricConfigIDsCarb.id
            upsert.row({:metricdate => dt_date, :metric_config_id => @metricConfigIDCarb}, :value => @carbs, :created_at => Time.now, :updated_at => Time.now)

            @metricConfigIDsFat = MetricConfig.find_by metricname: 'Fat'
            @metricConfigIDFat = @metricConfigIDsFat.id
            upsert.row({:metricdate => dt_date, :metric_config_id => @metricConfigIDFat}, :value => @fat, :created_at => Time.now, :updated_at => Time.now)
            
            @metricConfigIDsProtein = MetricConfig.find_by metricname: 'Protein'
            @metricConfigIDProtein = @metricConfigIDsProtein.id
            upsert.row({:metricdate => dt_date, :metric_config_id => @metricConfigIDProtein}, :value => @protein, :created_at => Time.now, :updated_at => Time.now)

            @metricConfigIDsSodium = MetricConfig.find_by metricname: 'Sodium'
            @metricConfigIDSodium = @metricConfigIDsSodium.id
            upsert.row({:metricdate => dt_date, :metric_config_id => @metricConfigIDSodium}, :value => @sodium, :created_at => Time.now, :updated_at => Time.now) 

            @metricConfigIDsSodium = MetricConfig.find_by metricname: 'Fiber'
            @metricConfigIDSodium = @metricConfigIDsSodium.id
            upsert.row({:metricdate => dt_date, :metric_config_id => @metricConfigIDSodium}, :value => @sodium, :created_at => Time.now, :updated_at => Time.now) 
                    
            @metricConfigIDsWater = MetricConfig.find_by metricname: 'Water'
            @metricConfigIDWater = @metricConfigIDsWater.id
            upsert.row({:metricdate => dt_date, :metric_config_id => @metricConfigIDWater}, :value => @water, :created_at => Time.now, :updated_at => Time.now)
          end
        end
      end
    end    
    
  def upsert_blood_pressure_data(dt_date)
    #refactor to reuse most of this code eventually
    config = begin
    Fitgem::Client.symbolize_keys(YAML.load(File.open("config/.fitgem.yml")))
    rescue ArgumentError => e
      puts "Could not parse YAML: #{e.message}"
      exit
    end

  @client = Fitgem::Client.new(config[:oauth])
  begin
    access_token = @client.reconnect(config[:oauth][:token], config[:oauth][:secret])
    @hashToIterate = @client.blood_pressure_on_date(dt_date)
  rescue Exception => e
    puts "Error: Could not reconnect Fitgem::Client due to invalid keys in .fitgem.yml"
    exit
  end
  Upsert.batch(Metric.connection, :metrics) do |upsert|
    table_name = :metrics
    @hashToIterate.each do |key, val|
        val.each do|p|
          if key == 'bp'
            Rails.logger.info "key = #{key} and val = #{val}"
            Rails.logger.info "p = #{p}"
            @diastolic = p['diastolic']
            @systolic = p['systolic']

            @metricConfigIDsDiastolic = MetricConfig.find_by metricname: 'Diastolic'
            @metricConfigIDDiastolic = @metricConfigIDsDiastolic.id
            upsert.row({:metricdate => dt_date, :metric_config_id => @metricConfigIDDiastolic}, :value => @diastolic, :created_at => Time.now, :updated_at => Time.now) 
                    
            @metricConfigIDsSystolic = MetricConfig.find_by metricname: 'Systolic'
            @metricConfigIDSystolic = @metricConfigIDsSystolic.id
            upsert.row({:metricdate => dt_date, :metric_config_id => @metricConfigIDSystolic}, :value => @systolic, :created_at => Time.now, :updated_at => Time.now)
           end
        end
      end
    end
  end
end
=begin    
        def getFBDataCheckOAuth
          #@fbdata = Fitbitclient.new
          # Load the existing yml config
          config = begin
            Fitgem::Client.symbolize_keys(YAML.load(File.open("config/.fitgem.yml")))
          rescue ArgumentError => e
            puts "Could not parse YAML: #{e.message}"
            exit
          end
         
          @client = Fitgem::Client.new(config[:oauth])
         
          # With the token and secret, we will try to use them
          # to reconstitute a usable Fitgem::Client
          if config[:oauth][:token] && config[:oauth][:secret]
            begin
              access_token = @client.reconnect(config[:oauth][:token], config[:oauth][:secret])
                @activities = @client.activities_on_date 'today'
                #@activities = @client.activity_on_date_range("/summary/activityCalories", {:base_date => "2014-09-01", :end_date => "2014-09-07"})
                #@userinfo = @client.user_info['user']
                #@measurements = @client.body_measurements_on_date('today')
                #@weight = @client.data_by_time_range("/body/weight", {:base_date => "2013-03-07", :end_date => "2014-08-21"})
                #@weight = @client.data_by_time_range("/body/weight", {:base_date => "2014-09-03", :end_date => "2014-09-03"})
            rescue Exception => e
              puts "Error: Could not reconnect Fitgem::Client due to invalid keys in .fitgem.yml"
              exit
            end
          # Without the secret and token, initialize the Fitgem::Client and send the user to login and get a verifier token
          else
            request_token = @client.request_token
            token = request_token.token
            secret = request_token.secret
           
            puts "Go to http://www.fitbit.com/oauth/authorize?oauth_token=#{token} and then enter the verifier code below"
            verifier = gets.chomp
           
            begin
              access_token = @client.authorize(token, secret, { :oauth_verifier => verifier })
            rescue Exception => e
              puts "Error: Could not authorize Fitgem::Client with supplied oauth verifier"
              exit
            end
           
            puts 'Verifier is: '+verifier
            puts "Token is:    "+access_token.token
            puts "Secret is:   "+access_token.secret
           
            user_id = @client.user_info['user']['encodedId']
            puts "Current User is: "+user_id
           
            config[:oauth].merge!(:token => access_token.token, :secret => access_token.secret, :user_id => user_id)
           
            # Write the whole oauth token set back to the config file
            File.open(".fitgem.yml", "w") {|f| f.write(config.to_yaml) }
        end
=end
end