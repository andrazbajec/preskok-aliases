alias market-study="cd $PROJECT_PATH/market-study"
alias market-study-push="market-study && gpfl"
alias ms-mapping="market-study && bash codedeploy/scripts/createElasticMapping.sh"
alias ms-search="market-study && bash codedeploy/scripts/createElasticSearchIndex.sh"
alias ms-tsc="market-study && tsc -w"
alias ms-push="market-study-push"