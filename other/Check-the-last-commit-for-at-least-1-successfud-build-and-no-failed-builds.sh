full_name=$1
branch=$2
if  [ "$branch" != "master" ] && [ "$branch" != "development"  ] && [[ $branch =~ ^([A-Z]+-[0-9]+) ]];
   then
      echo $branch
      curl -XPOST --user "${credential}" -H "Content-Type: application/json" -d '      {
               "kind":"require_passing_builds_to_merge",
               "users":[
                  
               ],
               "links":{
                  "self":{
                     "href":"https://api.bitbucket.org/2.0/repositories/'$full_name'/branch-restrictions"
                  }
               },
               "pattern":"'$branch'",
               "value":1,
               "branch_match_kind":"glob",
               "groups":[
                  
               ]
            }' https://api.bitbucket.org/2.0/repositories/$full_name/branch-restrictions
   fi