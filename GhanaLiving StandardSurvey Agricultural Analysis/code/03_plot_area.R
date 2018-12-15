# creating new data frame for conversion plot areas
plot_area_conversion <- data.frame(matrix(ncol = 3, nrow = 0))
x <- c("unit_name", "unit_of_measurement", "conversion_acres")
colnames(plot_area_conversion) <- x

# adding rows to dataframe
plot_area_conversion <- rbind(plot_area_conversion, data.frame("unit_name" = "Acres",
                                                              "unit_of_measurement" = 1,
                                                              "conversion_acres"= 01))
plot_area_conversion <- rbind(plot_area_conversion, data.frame("unit_name" = "Poles",
                                                               "unit_of_measurement" = 2,
                                                                "conversion_acres"= 01))
plot_area_conversion <- rbind(plot_area_conversion, data.frame("unit_name" = "Ropes",
                                                               "unit_of_measurement" = 3,
                                                               "conversion_acres"= 0.111))