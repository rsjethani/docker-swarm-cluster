provider "aws" {
#  access_key = "KIAJI4HSJXWER6DYHXQ"
#  secret_key = "DissEQd5zO6THgTrxeOaVc3J82RUxYSysGBMq2vM"  
  region = "us-west-2"
}

module networking {
    source = "./networking"

    cluster_name = "${var.cluster_name}"
}
