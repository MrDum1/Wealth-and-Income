install.packages("usethis")
usethis::create_github_token()
gitcreds::gitcreds_set()

use_git_config(user.name = "TJanel", user.email = "misswoah.nelly@gmail.com")
git_sitrep()
