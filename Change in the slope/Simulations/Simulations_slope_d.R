library(IDetect)


# the results of (some) the combinations of: length_t = 1000, 500, 100, window_length = 500, step-ahead = 1, 3, 10


#signals - true cpts: 300, 1500

s1 <- c(seq(0,897,3), seq(898,2097,1), seq(2100,6599,3))
s2 <- c(seq(0,807.3,2.7), seq(808.3,2007.3,1), seq(2010,6058.3,2.7))
s3 <- c(seq(0,747.5,2.5), seq(748.5,1947.5,1), seq(1950,5697.5,2.5))
s4 <- c(seq(0,598,2), seq(599,1798,1), seq(1800,4798,2))
s5 <- c(seq(0,508.3,1.7), seq(509.3,1708.6,1), seq(1710.3,4258.6,1.7))
s6 <- c(seq(0,448.5,1.5), seq(449.5,1648.5,1), seq(1650,3899.5,1.5))
s7 <- c(seq(0,358.8,1.2), seq(359.8,1558.8,1), seq(1560,3359.8,1.2))


#table 1.10
result_s1_10 <- single_cpt_detect_sim_slope(s1,length_t = 1000, window_length = 500, step_ahead = 10,true_loc = 1500, sigma_noise = 20)
result_s2_10 <- single_cpt_detect_sim_slope(s2,length_t = 1000, window_length = 500, step_ahead = 10,true_loc = 1500, sigma_noise = 20)
result_s3_10 <- single_cpt_detect_sim_slope(s3,length_t = 1000, window_length = 500, step_ahead = 10,true_loc = 1500, sigma_noise = 20)
result_s4_10 <- single_cpt_detect_sim_slope(s4,length_t = 1000, window_length = 500, step_ahead = 10,true_loc = 1500, sigma_noise = 20)
result_s5_10 <- single_cpt_detect_sim_slope(s5,length_t = 1000, window_length = 500, step_ahead = 10,true_loc = 1500, sigma_noise = 20)
result_s6_10 <- single_cpt_detect_sim_slope(s6,length_t = 1000, window_length = 500, step_ahead = 10,true_loc = 1500, sigma_noise = 20)
result_s7_10 <- single_cpt_detect_sim_slope(s7,length_t = 1000, window_length = 500, step_ahead = 10,true_loc = 1500, sigma_noise = 20)


result_s1_10
result_s2_10
result_s3_10
result_s4_10
result_s5_10
result_s6_10
result_s7_10



#table 1.11
result_s1_11 <- single_cpt_detect_sim_slope(s1,length_t = 1000, window_length = 500, step_ahead = 3,true_loc = 1500, sigma_noise = 20)
result_s2_11 <- single_cpt_detect_sim_slope(s2,length_t = 1000, window_length = 500, step_ahead = 3,true_loc = 1500, sigma_noise = 20)
result_s3_11 <- single_cpt_detect_sim_slope(s3,length_t = 1000, window_length = 500, step_ahead = 3,true_loc = 1500, sigma_noise = 20)
result_s4_11 <- single_cpt_detect_sim_slope(s4,length_t = 1000, window_length = 500, step_ahead = 3,true_loc = 1500, sigma_noise = 20)
result_s5_11 <- single_cpt_detect_sim_slope(s5,length_t = 1000, window_length = 500, step_ahead = 3,true_loc = 1500, sigma_noise = 20)
result_s6_11 <- single_cpt_detect_sim_slope(s6,length_t = 1000, window_length = 500, step_ahead = 3,true_loc = 1500, sigma_noise = 20)
result_s7_11 <- single_cpt_detect_sim_slope(s7,length_t = 1000, window_length = 500, step_ahead = 3,true_loc = 1500, sigma_noise = 20)


result_s1_11
result_s2_11
result_s3_11
result_s4_11
result_s5_11
result_s6_11
result_s7_11

#table 1.12
result_s1_12 <- single_cpt_detect_sim_slope(s1,length_t = 1000, window_length = 500, step_ahead = 1,true_loc = 1500, sigma_noise = 20)
result_s2_12 <- single_cpt_detect_sim_slope(s2,length_t = 1000, window_length = 500, step_ahead = 1,true_loc = 1500, sigma_noise = 20)
result_s3_12 <- single_cpt_detect_sim_slope(s3,length_t = 1000, window_length = 500, step_ahead = 1,true_loc = 1500, sigma_noise = 20)
result_s4_12 <- single_cpt_detect_sim_slope(s4,length_t = 1000, window_length = 500, step_ahead = 1,true_loc = 1500, sigma_noise = 20)
result_s5_12 <- single_cpt_detect_sim_slope(s5,length_t = 1000, window_length = 500, step_ahead = 1,true_loc = 1500, sigma_noise = 20)
result_s6_12 <- single_cpt_detect_sim_slope(s6,length_t = 1000, window_length = 500, step_ahead = 1,true_loc = 1500, sigma_noise = 20)
result_s7_12 <- single_cpt_detect_sim_slope(s7,length_t = 1000, window_length = 500, step_ahead = 1,true_loc = 1500, sigma_noise = 20)



result_s1_12
result_s2_12
result_s3_12
result_s4_12
result_s5_12
result_s6_12
result_s7_12



#table 1.13
result_s1_13 <- single_cpt_detect_sim_slope(s1,length_t = 500, window_length = 500, step_ahead = 10,true_loc = 1500, sigma_noise = 20)
result_s2_13 <- single_cpt_detect_sim_slope(s2,length_t = 500, window_length = 500, step_ahead = 10,true_loc = 1500, sigma_noise = 20)
result_s3_13 <- single_cpt_detect_sim_slope(s3,length_t = 500, window_length = 500, step_ahead = 10,true_loc = 1500, sigma_noise = 20)
result_s4_13 <- single_cpt_detect_sim_slope(s4,length_t = 500, window_length = 500, step_ahead = 10,true_loc = 1500, sigma_noise = 20)
result_s5_13 <- single_cpt_detect_sim_slope(s5,length_t = 500, window_length = 500, step_ahead = 10,true_loc = 1500, sigma_noise = 20)
result_s6_13 <- single_cpt_detect_sim_slope(s6,length_t = 500, window_length = 500, step_ahead = 10,true_loc = 1500, sigma_noise = 20)
result_s7_13 <- single_cpt_detect_sim_slope(s7,length_t = 500, window_length = 500, step_ahead = 10,true_loc = 1500, sigma_noise = 20)


result_s1_13
result_s2_13
result_s3_13
result_s4_13
result_s5_13
result_s6_13
result_s7_13


##################################################################################################################################################
##################################################################################################################################################

#signals - true cpts: 900, 1050

s11 <- c(seq(0,2697,3), seq(2698,2847,1), seq(2850,8697,3))
s22 <- c(seq(0,2427.3,2.7), seq(2428.3,2577.3,1), seq(2580,7844.5,2.7))
s33 <- c(seq(0,2247.5,2.5), seq(2248.5,2397.5,1), seq(2400,7272.5,2.5))
s44 <- c(seq(0,1798,2), seq(1799,1948,1), seq(1950,5848,2))
s55 <- c(seq(0,1528.3,1.7), seq(1529.3,1678.3,1), seq(1680,4994.7,1.7))
s66 <- c(seq(0,1348.5,1.5), seq(1349.5,1498.5,1), seq(1500,4424.5,1.5))
s77 <- c(seq(0,1078.8,1.2), seq(1079.8,1228.8,1), seq(1230,3569,1.2))


#table 2.10
result_s11_10 <- single_cpt_detect_sim_slope(s11,length_t = 1000, window_length = 500, step_ahead = 10,true_loc = 1050, sigma_noise = 20)
result_s22_10 <- single_cpt_detect_sim_slope(s22,length_t = 1000, window_length = 500, step_ahead = 10,true_loc = 1050, sigma_noise = 20)
result_s33_10 <- single_cpt_detect_sim_slope(s33,length_t = 1000, window_length = 500, step_ahead = 10,true_loc = 1050, sigma_noise = 20)
result_s44_10 <- single_cpt_detect_sim_slope(s44,length_t = 1000, window_length = 500, step_ahead = 10,true_loc = 1050, sigma_noise = 20)
result_s55_10 <- single_cpt_detect_sim_slope(s55,length_t = 1000, window_length = 500, step_ahead = 10,true_loc = 1050, sigma_noise = 20)
result_s66_10 <- single_cpt_detect_sim_slope(s66,length_t = 1000, window_length = 500, step_ahead = 10,true_loc = 1050, sigma_noise = 20)
result_s77_10 <- single_cpt_detect_sim_slope(s77,length_t = 1000, window_length = 500, step_ahead = 10,true_loc = 1050, sigma_noise = 20)


result_s11_10
result_s22_10
result_s33_10
result_s44_10
result_s55_10
result_s66_10
result_s77_10


#table 2.11
result_s11_11 <- single_cpt_detect_sim_slope(s11,length_t = 1000, window_length = 500, step_ahead = 3,true_loc = 1050, sigma_noise = 20)
result_s22_11 <- single_cpt_detect_sim_slope(s22,length_t = 1000, window_length = 500, step_ahead = 3,true_loc = 1050, sigma_noise = 20)
result_s33_11 <- single_cpt_detect_sim_slope(s33,length_t = 1000, window_length = 500, step_ahead = 3,true_loc = 1050, sigma_noise = 20)
result_s44_11 <- single_cpt_detect_sim_slope(s44,length_t = 1000, window_length = 500, step_ahead = 3,true_loc = 1050, sigma_noise = 20)
result_s55_11 <- single_cpt_detect_sim_slope(s55,length_t = 1000, window_length = 500, step_ahead = 3,true_loc = 1050, sigma_noise = 20)
result_s66_11 <- single_cpt_detect_sim_slope(s66,length_t = 1000, window_length = 500, step_ahead = 3,true_loc = 1050, sigma_noise = 20)
result_s77_11 <- single_cpt_detect_sim_slope(s77,length_t = 1000, window_length = 500, step_ahead = 3,true_loc = 1050, sigma_noise = 20)


result_s11_11
result_s22_11
result_s33_11
result_s44_11
result_s55_11
result_s66_11
result_s77_11


#table 2.12
result_s11_12 <- single_cpt_detect_sim_slope(s11,length_t = 1000, window_length = 500, step_ahead = 1,true_loc = 1050, sigma_noise = 20)
result_s22_12 <- single_cpt_detect_sim_slope(s22,length_t = 1000, window_length = 500, step_ahead = 1,true_loc = 1050, sigma_noise = 20)
result_s33_12 <- single_cpt_detect_sim_slope(s33,length_t = 1000, window_length = 500, step_ahead = 1,true_loc = 1050, sigma_noise = 20)
result_s44_12 <- single_cpt_detect_sim_slope(s44,length_t = 1000, window_length = 500, step_ahead = 1,true_loc = 1050, sigma_noise = 20)
result_s55_12 <- single_cpt_detect_sim_slope(s55,length_t = 1000, window_length = 500, step_ahead = 1,true_loc = 1050, sigma_noise = 20)
result_s66_12 <- single_cpt_detect_sim_slope(s66,length_t = 1000, window_length = 500, step_ahead = 1,true_loc = 1050, sigma_noise = 20)
result_s77_12 <- single_cpt_detect_sim_slope(s77,length_t = 1000, window_length = 500, step_ahead = 1,true_loc = 1050, sigma_noise = 20)



result_s11_12
result_s22_12
result_s33_12
result_s44_12
result_s55_12
result_s66_12
result_s77_12


#table 2.13
result_s11_13 <- single_cpt_detect_sim_slope(s11,length_t = 500, window_length = 500, step_ahead = 10,true_loc = 1050, sigma_noise = 20)
result_s22_13 <- single_cpt_detect_sim_slope(s22,length_t = 500, window_length = 500, step_ahead = 10,true_loc = 1050, sigma_noise = 20)
result_s33_13 <- single_cpt_detect_sim_slope(s33,length_t = 500, window_length = 500, step_ahead = 10,true_loc = 1050, sigma_noise = 20)
result_s44_13 <- single_cpt_detect_sim_slope(s44,length_t = 500, window_length = 500, step_ahead = 10,true_loc = 1050, sigma_noise = 20)
result_s55_13 <- single_cpt_detect_sim_slope(s55,length_t = 500, window_length = 500, step_ahead = 10,true_loc = 1050, sigma_noise = 20)
result_s66_13 <- single_cpt_detect_sim_slope(s66,length_t = 500, window_length = 500, step_ahead = 10,true_loc = 1050, sigma_noise = 20)
result_s77_13 <- single_cpt_detect_sim_slope(s77,length_t = 500, window_length = 500, step_ahead = 10,true_loc = 1050, sigma_noise = 20)


result_s11_13
result_s22_13
result_s33_13
result_s44_13
result_s55_13
result_s66_13
result_s77_13


