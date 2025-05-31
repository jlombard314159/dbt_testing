library(DBI)
library(dplyr)


# con <- DBI::dbConnect(RSQLite::SQLite(),
#                       dbname = 'C:/Users/jlomb/Documents/PersonalProjects/Test.db')
# 
# tot_size <- 10000
# 
# made_up_data <- data.frame('index_num' = seq(1,tot_size,1),
#                            'state' = sample(c('CO','WY','CA','NY'), tot_size,
#                                             replace = TRUE),
#                            'measurement' = sample(c('Height(m)','JumpHeight(m)'),
#                                                   tot_size, replace = TRUE),
#                            'value' = abs(rnorm(tot_size,500,500)))
# 
# dplyr::copy_to(con, made_up_data, overwrite = TRUE, temporary = FALSE,
#                name = 'SurveyData')
# 
# DBI::dbDisconnect(con)

#-------------------------------------------------------------------------------
# If needed, add in some more complex data?
big_data_size <- 100000
made_up_part <- unlist(lapply(1:1000, function(x) paste(sample(LETTERS, 10),
                                                        collapse = '')))

url <- c('@gmail','@earthscape','@aol')
domain <- c('.gov','.net','.com','.us')

addresses <- expand.grid(made_up_part, url, domain)
addresses$complete <- paste(addresses$Var1, addresses$Var2, addresses$Var3, sep = '')

parent_data <- data.frame('respondent_id' = seq(1, big_data_size, 1),
                          'contact_info' = sample(addresses$complete, big_data_size,
                                                  replace = TRUE),
                          'survey_type' = sample(c('Survey1','Survey2','Survey3'),
                                                 big_data_size, replace = TRUE))

# Fake survey data
survey_data <- expand.grid(parent_data$respondent_id,
                           c(1,2))

colnames(survey_data) <- c('respondent_id', 'year_id')

survey_data$measurement <- sample(c('height','armspan',
                                    'teeth_num','jump_height'),
                                  nrow(survey_data),
                                  replace = TRUE)

survey_data$value <- abs(rnorm(nrow(survey_data), 200,20))

# geography
geography <- expand.grid(parent_data$respondent_id,
                         c(1,2,3,4))

colnames(geography) <- c('respondent_id','spatial_id')

geography$x_coord <- rnorm(nrow(geography), 40, 4)
geography$y_coord <- rnorm(nrow(geography), -85, 4)
geography$spatial_proj <- 'wgs84'

con <- DBI::dbConnect(RSQLite::SQLite(),
                      dbname = 'C:/Users/jlomb/Documents/PersonalProjects/SurveyData.db')

dplyr::copy_to(con, parent_data, overwrite = TRUE, temporary = FALSE,
               name = 'ParentData')

dplyr::copy_to(con, survey_data, overwrite = TRUE, temporary = FALSE,
               name = 'SurveyData')

dplyr::copy_to(con, geography, overwrite = TRUE, temporary = FALSE,
               name = 'GeographicData')

DBI::dbDisconnect(con)
