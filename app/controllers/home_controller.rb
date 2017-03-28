class HomeController < ApplicationController
  def index
    my_lotto_num = [*1..45].sample(6).sort
    
    @lotto_num0_src = my_lotto_num[0].to_s+".jpg"
    @lotto_num1_src = my_lotto_num[1].to_s+".jpg"
    @lotto_num2_src = my_lotto_num[2].to_s+".jpg"
    @lotto_num3_src = my_lotto_num[3].to_s+".jpg"
    @lotto_num4_src = my_lotto_num[4].to_s+".jpg"
    @lotto_num5_src = my_lotto_num[5].to_s+".jpg"
  end
end
