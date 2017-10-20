# cleaning up brand name
# philips
# akzo
# van houten
# unilever
#sapply(refine_original$company, tolower)
#gsub(" ", "", refine_original$company, fixed = TRUE)
refine_original$company <- gsub("^ph[a-z]+s", "philips", refine_original$company, ignore.case = TRUE)
refine_original$company <- gsub("^f[a-z]+s", "philips", refine_original$company, ignore.case = TRUE)
refine_original$company <- gsub("^ak[ ]*z[o0]", "akzo", refine_original$company, ignore.case = TRUE)
refine_original$company <- gsub("^uni[a-z]+r", "unilever", refine_original$company, ignore.case = TRUE)
refine_original$company <- gsub("^van\\s[a-z]+ten", "van houten", refine_original$company, ignore.case = TRUE)

# new column product code
refine_original$product_code <- substr(refine_original$`Product code / number`, start = 1, stop = 1)
# new column product number
refine_original$product_number <- substr(refine_original$`Product code / number`, start = 3, stop = 4)

# new column product category
refine_original$product_category <- refine_original$product_code
#q = Tablet
refine_original$product_category <- sub("q", "Tablet", refine_original$product_category, fixed = FALSE)
#v = TV
refine_original$product_category <- sub("v", "TV", refine_original$product_category, fixed = FALSE)
#p = Smartphone
refine_original$product_category <- sub("p", "Smartphone", refine_original$product_category, fixed = FALSE)
#x = Laptop
refine_original$product_category <- sub("x", "Laptop", refine_original$product_category, fixed = FALSE)

# four binary columns for company
#company_philips
company_philips<-factor(1*(refine_original$company=="philips"))
#company_akzo
company_akzo<-factor(1*(refine_original$company=="akzo"))
#company_van_houten
company_van_houten<-factor(1*(refine_original$company=="van houten"))
#company_unilever
company_unilever<-factor(1*(refine_original$company=="unilever"))
# four binary columns for product
product_smartphone<-factor(1*(refine_original$product_code=="p"))
product_tv<-factor(1*(refine_original$product_code=="v"))
product_laptop<-factor(1*(refine_original$product_code=="x"))
product_tablet<-factor(1*(refine_original$product_code=="q"))

#adding columns back to refine_original
refine_original$company_philips<-company_philips
refine_original$company_akzo<-company_akzo
refine_original$company_van_houten<-company_van_houten
refine_original$company_unilever<-company_unilever

refine_original$product_smartphone<-product_smartphone
refine_original$product_laptop<-product_laptop
refine_original$product_tv<-product_tv
refine_original$product_tablet<-product_tablet

# create new column full_address
refine_original$full_address <- paste(refine_original$address, refine_original$city, refine_original$country, sep = " ")

  