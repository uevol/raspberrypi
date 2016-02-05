require 'active_record'

class Curth< ActiveRecord::Base
end

def connect_db

	rtn = ActiveRecord::Base.establish_connection(
	adapter: "sqlite3",
	host: "localhost",
	#username: "",
	#password: "",
	database: "/home/pi/raspberrypi/temphumi/db/development.sqlite3"
	)

	return rtn
end

def save_db temp,humi
	 p "begin save_db"
	 t = Time.current #time value
	 #today_str = t.strftime("%Y-%m-%d")
	 date_str = t.strftime("%Y-%m-%d")
	 time_str = t.strftime("%H:%M:%S")

	 #oth = Curtemphumi.where("date= ?",date_str).last
	 #oth = Curtemphumi.last
	 
	 thn = Curth.new
	 
	 if thn#.date == date_str #如果是新开始的一天，重新对maxtemp mintemp maxhumi minhumi赋值
		# 	if (oth.maxtemp <= temp)
		# 		thn.maxtemp=temp
		# 		thn.mintemp=oth.mintemp
		# 	elsif (oth.mintemp >= temp)
		# 		thn.mintemp=temp
		# 		thn.maxtemp=oth.maxtemp
		# 	else
		# 		thn.mintemp=oth.mintemp
		# 		thn.maxtemp=oth.maxtemp
		# 	end

		# 	if (oth.maxhumi <= humi)
		# 	 	thn.maxhumi=humi
		# 	 	thn.minhumi=oth.minhumi
		# 	elsif (oth.minhumi >= humi)
		# 	 	thn.minhumi=humi
		# 	 	thn.maxhumi=oth.maxhumi
		# 	else
		# 		thn.minhumi=oth.minhumi
		# 		thn.maxhumi=oth.maxhumi
		# 	end
	 # else
		#  	thn.maxtemp=temp
		#  	thn.mintemp=temp
		#  	thn.maxhumi=humi
		#  	thn.minhumi=humi
	 # end

		thn.temp = temp
		thn.humi = humi
		thn.time = time_str
		thn.date = date_str
		thn.hour = t.hour
		thn.location = "ENG-OFFICE"
		thn.save
	end
	 	p "save_db thn: ", thn
	    	
		#if (othm.cur_temp > othc.hi_temp) or (othm.cur_temp < othc.low_temp) or (othm.cur_humi > othc.hi_humi) or (othm.cur_humi < othc.low_humi)
			#othm.abnormal = true
		#else
			#othm.abnormal = false
		#end
		#othm.save
end# save db

while(1) do

	rtn = connect_db

	output = false
	(0..10).each do |icnt|
		p "try times: ", icnt
		output = `sudo ./dht 22 4`
		p output
		if output.include?("Temp")
			temp = ((/Temp =\s+([0-9.]+)/.match(output))[1]).to_f
			humi = ((/Hum =\s+([0-9.]+)/.match(output))[1]).to_f
    		p temp,humi
    	
		    begin
				save_db temp,humi
				p "after save db"
			rescue
				p "save failure!==="
				p "An error occurred: ",$!, "\n"
			end
			break
		end
		#sleep(1)
	end


	#output = `sudo ./dht 22 4`
	#temperature = /Temp =\s+([0-9.]+)/.match(output)

	#humidity = /Hum =\s+([0-9.]+)/.match(output)
    #temp = /Temp =\s+([0-9.]+)/.match(output)
    #humi = /Hum =\s+([0-9.]+)/.match(output)
    #p output,temperature,humidity
	#store to ruby DB
	#begin
		#save_db temp,humi
		#p "after save db"
	#rescue
		#p "save failure!==="
		#p "An error occurred: ",$!, "\n"
	#end
						

	sleep(9)

end #while