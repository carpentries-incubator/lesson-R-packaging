```r
make_groups <- function(people, group_size = 2, padding = '') {
  n_people <- length(people)
  
  # Define the number of groups and number of slots in these groups
  n_groups <- n_people %/% group_size # %/% does integer division
  n_slots <- n_groups * (group_size + 1) # + 1 because of the extra spot we may need
  
  # Shuffle the list of people and pad the ungrouped ones with an empty name at the end
  shuffled <- c(sample(people), rep(padding, n_slots - n_people))
  
  # Arrange as a matrix / table
  arranged <- matrix(shuffled, nrow = n_groups)
  
  return(arranged)
}
```
