# Clean up all brand names
#gsub('^.*i.*lips$', 'philips', refine_original$company, ignore.case = TRUE)
#refine_original$company <- 'philips'
#gsub('^ak.*z.*$', 'akzo', refine_original$company, ignore.case = TRUE)
#refine_original$company <- 'akzo'
#gsub('^van//s.*houten$', 'van houten', refine_original$company, ignore.case = TRUE)
#refine_original$company <- 'van houten'
#gsub('^uni.*ever$', 'unilever', refine_original$company, ignore.case = TRUE)
#refine_original$company <- 'unilever'

# Separate product code and number
refine_original$product_code = 'p'
srefine_original$product_number = '43'
#refine_original$product_code <- strsplit(refine_original$`Product code / number`, "-")
#refine_original$product_number <- strsplit(refine_original$`Product code / number`, "-")

# Add product categories
if (refine_original$product_code == "p") {
  refine_original$product_category = 'Smartphone'
} else if (refine_original$product_code == "v") {
  refine_original$product_category = 'TV'
} else if (refine_original$product_code == "x") {
  refine_original$product_category = 'Laptop'
} else if (refine_original$product_code == "q") {
  refine_original$product_category = 'Tablet' 
}

# Add full address for geocoding
refine_original$full_address = refine_original$address
#+ ', ' +
#                               refine_original$city + ', ' +
#                               refine_original$country

# Create dummy variables for company and product category