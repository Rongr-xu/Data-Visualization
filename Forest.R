#森林图
library(forestplot)
#创建模拟数据
base_data <- tibble::tibble(mean  = c(0.578, 0.165, 0.246, 0.700, 0.348, 0.139, 1.017),
                            lower = c(0.372, 0.018, 0.072, 0.333, 0.083, 0.016, 0.365),
                            upper = c(0.898, 1.517, 0.833, 1.474, 1.455, 1.209, 2.831),
                            study = c("Auckland", "Block", "Doran", "Gamsu",
                                      "Morrison", "Papageorgiou", "Tauesch"),
                            deaths_steroid = c("36", "1", "4", "14", "3", "1", "8"),
                            deaths_placebo = c("60", "5", "11", "20", "7", "7", "10"),
                            OR = c("0.58", "0.16", "0.25", "0.70", "0.35", "0.14", "1.02"))


#画出常规森林图
#估计值，可信区间的上下限的变量名称需要为mean,lower,upper
base_data |>
  forestplot(labeltext = c(study, deaths_steroid, deaths_placebo, OR),
             clip = c(0.1, 2.5),
             xlog = TRUE,boxsize=0.2,lwd.ci=2) |>
  fp_set_style(box = "royalblue",
               line = "darkblue",
               summary = "royalblue") |> 
  fp_add_header(study = c("", "Study"),
                deaths_steroid = c("Deaths", "(steroid)"),
                deaths_placebo = c("Deaths", "(placebo)"),
                OR = c("", "OR")) |>
  fp_append_row(mean  = 0.531,
                lower = 0.386,
                upper = 0.731,
                study = "Summary",
                OR = "0.53",
                is.summary = TRUE) |> 
  fp_set_zebra_style("#EFEFEF")
