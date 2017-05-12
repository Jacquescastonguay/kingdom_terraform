# I think using s3 buckets for state might be better
#state_file=${PWD##*/}-state/terraform.tfstate

init:
	mkdir -p keys/ && ssh-keygen -t RSA -b 4096 -N '' -f `pwd`/keys/personal-aws_rsa

plan:
	terraform plan \
  -var 'access_key=${HOBBY_AWS_ACCESS_KEY_ID}' \
  -var 'secret_key=${HOBBY_AWS_SECRET_ACCESS_KEY}'

  #-target=aws_instance.webishthing

  #-var-file=blah -state=blah -target=aws_instance.www-alpha

apply:
	terraform apply \
  -var 'access_key=${HOBBY_AWS_ACCESS_KEY_ID}' \
  -var 'secret_key=${HOBBY_AWS_SECRET_ACCESS_KEY}'


.PHONY: deploy-stage
