class GettemphumiController < ApplicationController
  
  def index
    t=Time.now
    date_str = t.strftime("%Y-%m-%d")
    @date=date_str
  end


  def getdata#Ajax刷新的
  	t=Time.current
  	date_str = t.strftime("%Y-%m-%d")
  	th= Curth.where("date= ?",date_str).last
  	@temp=th.temp
  	@humi=th.humi
    @location=th.location
  end

  def getdaydata
      @maxtemp=[] 
      @mintemp =[]
      @maxhumi =[]
      @minhumi=[]
    t=Time.now
    date_str = t.strftime("%Y-%m-%d")
    @date=date_str
    for i in 0..t.hour
      #第i小时的temp以升序排列
      i_T_record = Curth.where("date= ? and hour= ?",date_str,i).order("temp")#.last
      #第i小时的humi以升序排列
      i_H_record = Curth.where("date= ? and hour= ?",date_str,i).order("humi")
      if i_T_record.last
        @maxtemp[i] = i_T_record.last.temp.to_f
        @mintemp[i] = i_T_record.first.temp.to_f
        @maxhumi[i] = i_H_record.last.humi.to_f
        @minhumi[i] = i_H_record.first.humi.to_f
      else
        @maxtemp[i] = nil
        @mintemp[i] = nil
        @maxhumi[i] = nil
        @minhumi[i] = nil
      end
    end
  end

  def getmonthdata
      @maxtemp=[] 
      @mintemp =[]
      @maxhumi =[]
      @minhumi=[]
      @date = []
      t=Time.now
      
    for i in (-29)..0
       j = 30 + i
      date_str=(t+i*60*60*24).strftime("%Y-%m-%d")
      #date_str1=(t+i*60*60*24).strftime("%Y-%m-%d")
      @date[j] = date_str

      i_T_record = Curth.where("date= ? ",date_str).order("temp")
      i_H_record = Curth.where("date= ? ",date_str).order("humi")

     
      if i_T_record.last
        @maxtemp[j] = i_T_record.last.temp.to_f
        @mintemp[j] = i_T_record.first.temp.to_f
        @maxhumi[j] = i_H_record.last.humi.to_f
        @minhumi[j] = i_H_record.first.humi.to_f
      else
        @maxtemp[j] = nil
        @mintemp[j] = nil
        @maxhumi[j] = nil
        @minhumi[j] = nil
      end
      #@date = JSON.parse(date)
    end
   
  end

end
