=begin
페이지 이동 방식(get방식)route : 처음 Run돌릴 때 바로 실행하기(cgrl+E => route => (get '/' => 'home#index') 로 바꿔주기  
rails g controller home index : home#index라는 경로로 controller생성
=end
  class HomeController < ApplicationController
  def index
    require('open-uri')
    require('json')
    
    open_page = open('http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=')
    lotto_info = open_page.read
    lotto_hash = JSON.parse(lotto_info) #hash형식으로 바꿔줌
    
    @real_lotto_num = []
    
    lotto_hash.each do |k, v|
      if k.include? 'drwtNo'
        @real_lotto_num << v #<<: 기입한다. 배열이 계속 이어지도록 real_lotto_num 배열뒤에 v 추가
      end
    end
    
    @real_lotto_num.sort!
    
    @bonus_num = lotto_hash["bnusNo"]
    
    @my_lotto_num = [*1..45].sample(6).sort! #*1..45: 숫자를 배열형식으로 바꿔줌
    
    @match_lotto_num = @real_lotto_num & @my_lotto_num
    
    @match_num = @match_lotto_num.count
    
    
    if ( @match_num == 6)
      @result = '1등'
    elsif ( @match_num == 5 && (@match_lotto_num.include? @bonus_num) ) #include 사용시 괄호 사용
      @result = '2등'
    elsif ( @match_num == 5 )
      @result = '3등'
    elsif ( @match_num == 4 )
      @result = '4등'
    elsif ( @match_num == 3 )
      @result = '5등'
    else
      @result = '꽝'
    end
    
  end
end
