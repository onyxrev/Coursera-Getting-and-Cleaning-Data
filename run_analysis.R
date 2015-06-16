library('data.table')

load_uci_set <- function(uci_set_file_location){
  # helper that return a factor of the specified table column
  read_table_as_factor <- function(file_location, column, ...){
    factor( read.table(file_location, comment.char = "", ...)[[column]] )
  }
  
  # takes a set name and returns a descriptively labeled frame that joins 
  # the activities, subjects, and samples from the set
  load_set_descriptively <- function(set_name){
    set_directory <- paste(uci_set_file_location, set_name, sep = "/")
    
    set <- read.table(
      paste(set_directory, "/X_", set_name, ".txt", sep = ""), 
      col.names    = labels, 
      check.names  = FALSE,
      colClasses   = "numeric", 
      comment.char = ""
    )
    
    activities <- read_table_as_factor(
      paste(set_directory, "/y_", set_name, ".txt", sep = ""), 
      1
    )
    
    subjects <- read_table_as_factor(
      paste(set_directory, "/subject_", set_name, ".txt", sep = ""),
      1
    )

    # use descriptive levels based on the activity enumerables
    levels(activities) <- activity_enums
    
    set["activity"] <- activities
    set["subject"]  <- subjects
    
    # extract only the measurements on the mean and standard deviation 
    # for each measurement (while maintaining activity and subject, of course)
    labels_to_keep <- c(mean_and_std_deviation_labels(labels), c("activity", "subject"))
    subset(set, select = labels_to_keep)
  }
  
  # returns the standard deviation and mean labels in a label list
  mean_and_std_deviation_labels <- function(labels){
    grep("(std|mean)\\(\\)-[A-Z]$", labels, value=TRUE)
  }
  
  # takes a set and returns a data table with the average of each 
  # variable for each activity and each subject
  summarize_set_by_mean <- function(set, labels){
    cols <- which(names(set) %in% labels)
    
    data.table(set)[, lapply(.SD, mean), by = c("subject", "activity"), .SDcols = cols]
  }
  
  activity_enums <- read_table_as_factor(
    paste(uci_set_file_location, "activity_labels.txt", sep = "/"), 
    2
  )
  
  labels <- read_table_as_factor(
    paste(uci_set_file_location, "features.txt", sep = "/"), 
    2
  )
  
  full_dataset <- rbind(
    load_set_descriptively("train"),
    load_set_descriptively("test")
  )
    
  summarize_set_by_mean(full_dataset, labels)
}