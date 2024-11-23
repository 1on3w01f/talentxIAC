terraform {
  backend "s3" {
    bucket          = "talentxiacstatebackend"
    key             = "state"
    region          = "us-east-1"
    #dynamodb_table  = "backend-lock-table"
    #encrypt         = true
  }
}
